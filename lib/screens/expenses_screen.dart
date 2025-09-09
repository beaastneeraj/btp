import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/expense_model.dart';
import '../providers/app_provider.dart';
import 'expense_form_screen.dart';

class ExpensesScreen extends StatefulWidget {
  @override
  State<ExpensesScreen> createState() => _ExpensesScreenState();
}

class _ExpensesScreenState extends State<ExpensesScreen> {
  final _searchController = TextEditingController();
  String _selectedCategory = 'All';
  String _sortBy = 'date';
  bool _sortAscending = false;
  
  final List<String> _categories = [
    'All',
    'Seeds',
    'Fertilizers',
    'Pesticides',
    'Equipment',
    'Labor',
    'Irrigation',
    'Transport',
    'Marketing',
    'Other'
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<AppProvider>(context, listen: false).loadExpenses();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Expenses',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.orange.shade700,
        foregroundColor: Colors.white,
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(24)),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.analytics),
            onPressed: _showExpenseAnalytics,
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.orange.shade400, Colors.red.shade200],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          children: [
            _buildFiltersCard(),
            Expanded(child: _buildExpensesList()),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addExpense,
        backgroundColor: Colors.orange.shade700,
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  Widget _buildFiltersCard() {
    return Card(
      margin: EdgeInsets.all(16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 8,
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            // Search Bar
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search expenses...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                filled: true,
                fillColor: Colors.grey[50],
              ),
              onChanged: (value) => setState(() {}),
            ),
            SizedBox(height: 16),
            
            Row(
              children: [
                // Category Filter
                Expanded(
                  child: DropdownButtonFormField<String>(
                    value: _selectedCategory,
                    decoration: InputDecoration(
                      labelText: 'Category',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      filled: true,
                      fillColor: Colors.grey[50],
                    ),
                    items: _categories.map((category) => DropdownMenuItem(
                      value: category,
                      child: Text(category),
                    )).toList(),
                    onChanged: (value) => setState(() => _selectedCategory = value!),
                  ),
                ),
                SizedBox(width: 16),
                
                // Sort Dropdown
                Expanded(
                  child: DropdownButtonFormField<String>(
                    value: _sortBy,
                    decoration: InputDecoration(
                      labelText: 'Sort by',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      filled: true,
                      fillColor: Colors.grey[50],
                    ),
                    items: [
                      DropdownMenuItem(value: 'date', child: Text('Date')),
                      DropdownMenuItem(value: 'amount', child: Text('Amount')),
                      DropdownMenuItem(value: 'category', child: Text('Category')),
                    ],
                    onChanged: (value) => setState(() => _sortBy = value!),
                  ),
                ),
                
                // Sort Direction
                IconButton(
                  icon: Icon(_sortAscending ? Icons.arrow_upward : Icons.arrow_downward),
                  onPressed: () => setState(() => _sortAscending = !_sortAscending),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildExpensesList() {
    return Consumer<AppProvider>(
      builder: (context, provider, child) {
        if (provider.isLoading) {
          return Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.orange.shade700),
            ),
          );
        }

        if (provider.expenses.isEmpty) {
          return Center(
            child: Card(
              margin: EdgeInsets.all(32),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: EdgeInsets.all(32),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.receipt_long,
                      size: 64,
                      color: Colors.orange.shade300,
                    ),
                    SizedBox(height: 16),
                    Text(
                      'No Expenses Yet',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.orange.shade700,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Start tracking your farm expenses',
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  ],
                ),
              ),
            ),
          );
        }

        final filteredExpenses = _getFilteredExpenses(provider.expenses);

        return ListView.builder(
          padding: EdgeInsets.all(16),
          itemCount: filteredExpenses.length,
          itemBuilder: (context, index) {
            final expense = filteredExpenses[index];
            return _buildExpenseCard(expense);
          },
        );
      },
    );
  }

  Widget _buildExpenseCard(ExpenseModel expense) {
    final categoryColor = _getCategoryColor(expense.category);
    
    return Card(
      margin: EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 4,
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: () => _editExpense(expense),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border(
              left: BorderSide(color: categoryColor, width: 6),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        expense.description,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Text(
                      '₹${expense.amount.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.red.shade600,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12),
                
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: categoryColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        expense.category,
                        style: TextStyle(
                          color: categoryColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    SizedBox(width: 12),
                    Icon(Icons.calendar_today, size: 16, color: Colors.grey[600]),
                    SizedBox(width: 4),
                    Text(
                      '${expense.date.day}/${expense.date.month}/${expense.date.year}',
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                
                if (expense.notes.isNotEmpty) ...[
                  SizedBox(height: 8),
                  Text(
                    expense.notes,
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 14,
                    ),
                  ),
                ],
                
                if (expense.fieldId != null) ...[
                  SizedBox(height: 8),
                  Consumer<AppProvider>(
                    builder: (context, provider, child) {
                      final field = provider.fields.firstWhere(
                        (f) => f.id == expense.fieldId,
                        orElse: () => provider.fields.isNotEmpty ? provider.fields.first : null,
                      );
                      if (field != null) {
                        return Row(
                          children: [
                            Icon(Icons.landscape, size: 16, color: Colors.green[600]),
                            SizedBox(width: 4),
                            Text(
                              'Field: ${field.name}',
                              style: TextStyle(
                                color: Colors.green[600],
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        );
                      }
                      return SizedBox.shrink();
                    },
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }

  Color _getCategoryColor(String category) {
    switch (category.toLowerCase()) {
      case 'seeds': return Colors.green;
      case 'fertilizers': return Colors.brown;
      case 'pesticides': return Colors.red;
      case 'equipment': return Colors.blue;
      case 'labor': return Colors.purple;
      case 'irrigation': return Colors.cyan;
      case 'transport': return Colors.orange;
      case 'marketing': return Colors.pink;
      default: return Colors.grey;
    }
  }

  List<ExpenseModel> _getFilteredExpenses(List<ExpenseModel> expenses) {
    var filtered = expenses.where((expense) {
      // Search filter
      final searchLower = _searchController.text.toLowerCase();
      final matchesSearch = searchLower.isEmpty ||
          expense.description.toLowerCase().contains(searchLower) ||
          expense.category.toLowerCase().contains(searchLower) ||
          expense.notes.toLowerCase().contains(searchLower);

      // Category filter
      final matchesCategory = _selectedCategory == 'All' || 
          expense.category == _selectedCategory;

      return matchesSearch && matchesCategory;
    }).toList();

    // Sort
    filtered.sort((a, b) {
      int comparison;
      switch (_sortBy) {
        case 'amount':
          comparison = a.amount.compareTo(b.amount);
          break;
        case 'category':
          comparison = a.category.compareTo(b.category);
          break;
        case 'date':
        default:
          comparison = a.date.compareTo(b.date);
          break;
      }
      return _sortAscending ? comparison : -comparison;
    });

    return filtered;
  }

  void _addExpense() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ExpenseFormScreen(
          onSave: (expense) async {
            final provider = Provider.of<AppProvider>(context, listen: false);
            await provider.addExpense(expense);
          },
        ),
      ),
    );
  }

  void _editExpense(ExpenseModel expense) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ExpenseFormScreen(
          expense: expense,
          onSave: (updatedExpense) async {
            final provider = Provider.of<AppProvider>(context, listen: false);
            await provider.updateExpense(updatedExpense);
          },
        ),
      ),
    );
  }

  void _showExpenseAnalytics() {
    final provider = Provider.of<AppProvider>(context, listen: false);
    
    // Calculate analytics
    final totalExpenses = provider.expenses.fold<double>(
      0, (sum, expense) => sum + expense.amount);
    
    final categoryTotals = <String, double>{};
    for (final expense in provider.expenses) {
      categoryTotals[expense.category] = 
          (categoryTotals[expense.category] ?? 0) + expense.amount;
    }
    
    final currentMonth = DateTime.now().month;
    final currentYear = DateTime.now().year;
    final monthlyExpenses = provider.expenses
        .where((e) => e.date.month == currentMonth && e.date.year == currentYear)
        .fold<double>(0, (sum, expense) => sum + expense.amount);

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Expense Analytics'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                color: Colors.orange.shade50,
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Total Expenses',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '₹${totalExpenses.toStringAsFixed(2)}',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.orange.shade700,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 8),
              Card(
                color: Colors.blue.shade50,
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'This Month',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '₹${monthlyExpenses.toStringAsFixed(2)}',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue.shade700,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Category Breakdown:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              ...categoryTotals.entries.map((entry) => Padding(
                padding: EdgeInsets.symmetric(vertical: 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(entry.key),
                    Text(
                      '₹${entry.value.toStringAsFixed(2)}',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              )).toList(),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Close'),
          ),
        ],
      ),
    );
  }
}
