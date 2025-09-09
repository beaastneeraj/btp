import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'dart:io';

class PDFExportService {
  Future<File> exportReport(String title, List<Map<String, dynamic>> data) async {
    final pdf = pw.Document();
    pdf.addPage(
      pw.Page(
        build: (pw.Context context) => pw.Column(
          children: [
            pw.Text(title, style: pw.TextStyle(fontSize: 24, fontWeight: pw.FontWeight.bold)),
            pw.SizedBox(height: 16),
            pw.Table.fromTextArray(
              data: [data.first.keys.toList()] + data.map((row) => row.values.toList()).toList(),
            ),
          ],
        ),
      ),
    );
    final file = File('/tmp/$title.pdf');
    await file.writeAsBytes(await pdf.save());
    return file;
  }
}
