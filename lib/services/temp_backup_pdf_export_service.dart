import 'dart:io';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import '../models/field.dart';
import '../models/crop.dart';
import '../models/expense.dart';
import '../models/inventory_item.dart';
import '../models/task.dart';

class PDFExportService {
  static final PDFExportService _instance = PDFExportService._internal();
  factory PDFExportService() => _instance;
  PDFExportService._internal();

  Future<String> generateFarmReport({
    required List<Field> fields,
    required List<Crop> crops,
    required List<Expense> expenses,
    required List<InventoryItem> inventory,
    required List<Task> tasks,
    required DateTimeRange dateRange,
  }) async {
    final pdf = pw.Document();

    // Add cover page
    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return _buildCoverPage();
        },
      ),
    );

    // Add executive summary
    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return _buildExecutiveSummary(fields, crops, expenses, inventory, tasks);
        },
      ),
    );

    // Add fields and crops report
    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return _buildFieldsAndCropsReport(fields, crops);
        },
      ),
    );

    // Add financial report
    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return _buildFinancialReport(expenses, dateRange);
        },
      ),
    );

    // Save the PDF
    final output = await getTemporaryDirectory();
    final fileName = 'farm_report_${DateTime.now().millisecondsSinceEpoch}.pdf';
    final file = File('${output.path}/$fileName');
    await file.writeAsBytes(await pdf.save());

    return file.path;
  }

  Future<String> generateExpenseReport(List<Expense> expenses, DateTimeRange dateRange) async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return _buildExpenseReportPage(expenses, dateRange);
        },
      ),
    );

    final output = await getTemporaryDirectory();
    final fileName = 'expense_report_${DateTime.now().millisecondsSinceEpoch}.pdf';
    final file = File('${output.path}/$fileName');
    await file.writeAsBytes(await pdf.save());

    return file.path;
  }

  Future<void> shareReport(String filePath) async {
    await Share.shareXFiles([XFile(filePath)]);
  }

  pw.Widget _buildCoverPage() {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.center,
      mainAxisAlignment: pw.MainAxisAlignment.center,
      children: [
        pw.Container(
          width: 100,
          height: 100,
          decoration: pw.BoxDecoration(
            color: PdfColors.green,
            borderRadius: pw.BorderRadius.circular(50),
          ),
          child: pw.Center(
            child: pw.Text(
              '🌾',
              style: pw.TextStyle(fontSize: 60),
            ),
          ),
        ),
        pw.SizedBox(height: 30),
        pw.Text(
          'Farm Management Report',
          style: pw.TextStyle(
            fontSize: 28,
            fontWeight: pw.FontWeight.bold,
            color: PdfColors.green800,
          ),
        ),
        pw.SizedBox(height: 20),
        pw.Text(
          'Comprehensive Farm Analysis',
          style: pw.TextStyle(
            fontSize: 16,
            color: PdfColors.grey700,
          ),
        ),
        pw.SizedBox(height: 40),
        pw.Text(
          'Generated on: ${_formatDate(DateTime.now())}',
          style: pw.TextStyle(
            fontSize: 14,
            color: PdfColors.grey600,
          ),
        ),
      ],
    );
  }

  pw.Widget _buildExecutiveSummary(
    List<Field> fields,
    List<Crop> crops,
    List<Expense> expenses,
    List<InventoryItem> inventory,
    List<Task> tasks,
  ) {
    final totalExpenses = expenses.fold<double>(0, (sum, expense) => sum + expense.amount);
    final completedTasks = tasks.where((task) => task.status == TaskStatus.completed).length;
    final lowStockItems = inventory.where((item) => item.currentStock <= item.reorderLevel).length;

    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        _buildSectionHeader('Executive Summary'),
        pw.SizedBox(height: 20),
        pw.Row(
          mainAxisAlignment: pw.MainAxisAlignment.spaceAround,
          children: [
            _buildSummaryCard('Total Fields', '${fields.length}', PdfColors.blue),
            _buildSummaryCard('Active Crops', '${crops.length}', PdfColors.green),
            _buildSummaryCard('Total Expenses', '\$${totalExpenses.toStringAsFixed(2)}', PdfColors.orange),
          ],
        ),
        pw.SizedBox(height: 20),
        pw.Row(
          mainAxisAlignment: pw.MainAxisAlignment.spaceAround,
          children: [
            _buildSummaryCard('Completed Tasks', '$completedTasks/${tasks.length}', PdfColors.purple),
            _buildSummaryCard('Inventory Items', '${inventory.length}', PdfColors.teal),
            _buildSummaryCard('Low Stock Alerts', '$lowStockItems', PdfColors.red),
          ],
        ),
        pw.SizedBox(height: 30),
        pw.Text(
          'Farm Performance Overview',
          style: pw.TextStyle(fontSize: 16, fontWeight: pw.FontWeight.bold),
        ),
        pw.SizedBox(height: 10),
        pw.Text(
          'Your farm is currently managing ${fields.length} fields with ${crops.length} different crop varieties. '
          'Task completion rate stands at ${tasks.isNotEmpty ? ((completedTasks / tasks.length) * 100).toStringAsFixed(1) : '0'}%. '
          '${lowStockItems > 0 ? 'Attention needed for $lowStockItems inventory items with low stock levels.' : 'All inventory levels are adequate.'}',
          style: const pw.TextStyle(fontSize: 12),
        ),
      ],
    );
  }

  pw.Widget _buildFieldsAndCropsReport(List<Field> fields, List<Crop> crops) {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        _buildSectionHeader('Fields & Crops Analysis'),
        pw.SizedBox(height: 20),
        pw.Text(
          'Field Summary',
          style: pw.TextStyle(fontSize: 16, fontWeight: pw.FontWeight.bold),
        ),
        pw.SizedBox(height: 10),
        _buildFieldsTable(fields),
        pw.SizedBox(height: 30),
        pw.Text(
          'Crop Overview',
          style: pw.TextStyle(fontSize: 16, fontWeight: pw.FontWeight.bold),
        ),
        pw.SizedBox(height: 10),
        _buildCropsTable(crops),
      ],
    );
  }

  pw.Widget _buildFinancialReport(List<Expense> expenses, DateTimeRange dateRange) {
    final filteredExpenses = expenses.where((expense) =>
        expense.date.isAfter(dateRange.start.subtract(const Duration(days: 1))) &&
        expense.date.isBefore(dateRange.end.add(const Duration(days: 1)))).toList();

    final totalAmount = filteredExpenses.fold<double>(0, (sum, expense) => sum + expense.amount);

    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        _buildSectionHeader('Financial Report'),
        pw.SizedBox(height: 20),
        pw.Row(
          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
          children: [
            pw.Text('Period: ${_formatDate(dateRange.start)} - ${_formatDate(dateRange.end)}'),
            pw.Text('Total Expenses: \$${totalAmount.toStringAsFixed(2)}',
                style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
          ],
        ),
        pw.SizedBox(height: 20),
        _buildExpensesTable(filteredExpenses),
      ],
    );
  }

  pw.Widget _buildSectionHeader(String title) {
    return pw.Container(
      width: double.infinity,
      padding: const pw.EdgeInsets.all(15),
      decoration: pw.BoxDecoration(
        color: PdfColors.green50,
        borderRadius: pw.BorderRadius.circular(8),
      ),
      child: pw.Text(
        title,
        style: pw.TextStyle(
          fontSize: 20,
          fontWeight: pw.FontWeight.bold,
          color: PdfColors.green800,
        ),
      ),
    );
  }

  pw.Widget _buildSummaryCard(String title, String value, PdfColor color) {
    return pw.Container(
      width: 120,
      padding: const pw.EdgeInsets.all(15),
      decoration: pw.BoxDecoration(
        color: PdfColors.grey100,
        borderRadius: pw.BorderRadius.circular(8),
        border: pw.Border.all(color: color, width: 1),
      ),
      child: pw.Column(
        children: [
          pw.Text(
            value,
            style: pw.TextStyle(
              fontSize: 18,
              fontWeight: pw.FontWeight.bold,
              color: color,
            ),
          ),
          pw.SizedBox(height: 5),
          pw.Text(
            title,
            style: pw.TextStyle(fontSize: 10, color: PdfColors.grey700),
            textAlign: pw.TextAlign.center,
          ),
        ],
      ),
    );
  }

  pw.Widget _buildFieldsTable(List<Field> fields) {
    if (fields.isEmpty) {
      return pw.Text('No fields registered yet.');
    }

    return pw.Table(
      border: pw.TableBorder.all(),
      children: [
        pw.TableRow(
          decoration: const pw.BoxDecoration(color: PdfColors.grey200),
          children: [
            _buildTableCell('Field Name', isHeader: true),
            _buildTableCell('Size (acres)', isHeader: true),
            _buildTableCell('Location', isHeader: true),
            _buildTableCell('Soil Type', isHeader: true),
          ],
        ),
        ...fields.map((field) => pw.TableRow(children: [
              _buildTableCell(field.name),
              _buildTableCell('${field.sizeInAcres.toStringAsFixed(1)}'),
              _buildTableCell(field.location),
              _buildTableCell(field.soilType),
            ])).toList(),
      ],
    );
  }

  pw.Widget _buildCropsTable(List<Crop> crops) {
    if (crops.isEmpty) {
      return pw.Text('No crops planted yet.');
    }

    return pw.Table(
      border: pw.TableBorder.all(),
      children: [
        pw.TableRow(
          decoration: const pw.BoxDecoration(color: PdfColors.grey200),
          children: [
            _buildTableCell('Crop Name', isHeader: true),
            _buildTableCell('Variety', isHeader: true),
            _buildTableCell('Plant Date', isHeader: true),
            _buildTableCell('Expected Harvest', isHeader: true),
          ],
        ),
        ...crops.map((crop) => pw.TableRow(children: [
              _buildTableCell(crop.name),
              _buildTableCell(crop.variety),
              _buildTableCell(_formatDate(crop.plantingDate)),
              _buildTableCell(_formatDate(crop.expectedHarvestDate)),
            ])).toList(),
      ],
    );
  }

  pw.Widget _buildExpensesTable(List<Expense> expenses) {
    if (expenses.isEmpty) {
      return pw.Text('No expenses recorded for this period.');
    }

    return pw.Table(
      border: pw.TableBorder.all(),
      children: [
        pw.TableRow(
          decoration: const pw.BoxDecoration(color: PdfColors.grey200),
          children: [
            _buildTableCell('Date', isHeader: true),
            _buildTableCell('Description', isHeader: true),
            _buildTableCell('Category', isHeader: true),
            _buildTableCell('Amount', isHeader: true),
          ],
        ),
        ...expenses.take(20).map((expense) => pw.TableRow(children: [
              _buildTableCell(_formatDate(expense.date)),
              _buildTableCell(expense.description),
              _buildTableCell(expense.category),
              _buildTableCell('\$${expense.amount.toStringAsFixed(2)}'),
            ])).toList(),
      ],
    );
  }

  pw.Widget _buildTableCell(String text, {bool isHeader = false}) {
    return pw.Container(
      padding: const pw.EdgeInsets.all(8),
      child: pw.Text(
        text,
        style: pw.TextStyle(
          fontSize: isHeader ? 10 : 9,
          fontWeight: isHeader ? pw.FontWeight.bold : pw.FontWeight.normal,
        ),
      ),
    );
  }

  pw.Widget _buildExpenseReportPage(List<Expense> expenses, DateTimeRange dateRange) {
    final totalAmount = expenses.fold<double>(0, (sum, expense) => sum + expense.amount);

    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        _buildSectionHeader('Expense Report'),
        pw.SizedBox(height: 20),
        pw.Row(
          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
          children: [
            pw.Text('Period: ${_formatDate(dateRange.start)} - ${_formatDate(dateRange.end)}'),
            pw.Text('Total: \$${totalAmount.toStringAsFixed(2)}',
                style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
          ],
        ),
        pw.SizedBox(height: 20),
        pw.Expanded(child: _buildExpensesTable(expenses)),
      ],
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}';
  }
}

class DateTimeRange {
  final DateTime start;
  final DateTime end;

  DateTimeRange({required this.start, required this.end});
}
