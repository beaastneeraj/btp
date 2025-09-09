import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/khatabook_models.dart';

class TransactionFormScreen extends StatefulWidget {
  final TransactionType type;
  final Transaction? transaction; // For editing existing transactions

  const TransactionFormScreen({
    Key? key,
    required this.type,
    this.transaction,
  }) : super(key: key);

  @override
  State<TransactionFormScreen> createState() => _TransactionFormScreenState();
}

class _TransactionFormScreenState extends State<TransactionFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _amountController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _notesController = TextEditingController();
  
  DateTime _selectedDate = DateTime.now();
  String? _selectedCropId;
  ExpenseCategory? _selectedExpenseCategory;
  IncomeCategory? _selectedIncomeCategory;
  
  // Sample crop data
  final List<Crop> _crops = [
    Crop(
      id: 'crop1',
      name: 'Winter Wheat',
      type: CropType.wheat,
      areaInAcres: 5.0,
      plantingDate: DateTime.now().subtract(const Duration(days: 60)),
      variety: 'HD-2967',
    ),
    Crop(
      id: 'crop2',
      name: 'Basmati Rice',
      type: CropType.rice,
      areaInAcres: 3.0,
      plantingDate: DateTime.now().subtract(const Duration(days: 120)),
      variety: 'Pusa Basmati 1121',
    ),
    Crop(
      id: 'crop3',
      name: 'Sweet Corn',
      type: CropType.corn,
      areaInAcres: 2.0,
      plantingDate: DateTime.now().subtract(const Duration(days: 45)),
      variety: 'Sugar-75',
    ),
  ];

  @override
  void initState() {
    super.initState();
    if (widget.transaction != null) {
      _loadTransactionData();
    }
  }

  void _loadTransactionData() {
    final transaction = widget.transaction!;
    _amountController.text = transaction.amount.toString();
    _descriptionController.text = transaction.description;
    _notesController.text = transaction.notes ?? '';
    _selectedDate = transaction.date;
    _selectedCropId = transaction.cropId;
    _selectedExpenseCategory = transaction.expenseCategory;
    _selectedIncomeCategory = transaction.incomeCategory;
  }

  @override
  void dispose() {
    _amountController.dispose();
    _descriptionController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isIncome = widget.type == TransactionType.income;
    
    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      appBar: AppBar(
        title: Text(
          widget.transaction != null 
              ? 'Edit ${isIncome ? 'Income' : 'Expense'}'
              : 'Add ${isIncome ? 'Income' : 'Expense'}',
        ),
        backgroundColor: isIncome ? Colors.green.shade600 : Colors.red.shade600,
        foregroundColor: Colors.white,
        actions: [
          if (widget.transaction != null)
            IconButton(
              icon: const Icon(Icons.delete),
              onPressed: _showDeleteConfirmation,
            ),
        ],
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Transaction Type Header
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: isIncome ? Colors.green.shade50 : Colors.red.shade50,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: isIncome ? Colors.green.shade200 : Colors.red.shade200,
                  ),
                ),
                child: Row(
                  children: [
                    Icon(
                      isIncome ? Icons.trending_up : Icons.trending_down,
                      color: isIncome ? Colors.green.shade600 : Colors.red.shade600,
                      size: 32,
                    ),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          isIncome ? 'Farm Income' : 'Farm Expense',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: isIncome ? Colors.green.shade800 : Colors.red.shade800,
                          ),
                        ),
                        Text(
                          isIncome 
                              ? 'Record money earned from farming activities'
                              : 'Record money spent on farming activities',
                          style: TextStyle(
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              
              const SizedBox(height: 24),
              
              // Amount Field
              TextFormField(
                controller: _amountController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Amount (₹)',
                  hintText: 'Enter amount',
                  prefixIcon: Icon(
                    Icons.currency_rupee,
                    color: isIncome ? Colors.green.shade600 : Colors.red.shade600,
                  ),
                  border: const OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: isIncome ? Colors.green.shade600 : Colors.red.shade600,
                    ),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter amount';
                  }
                  if (double.tryParse(value) == null) {
                    return 'Please enter valid amount';
                  }
                  return null;
                },
              ),
              
              const SizedBox(height: 16),
              
              // Description Field
              TextFormField(
                controller: _descriptionController,
                decoration: const InputDecoration(
                  labelText: 'Description',
                  hintText: 'Enter description',
                  prefixIcon: Icon(Icons.description),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter description';
                  }
                  return null;
                },
              ),
              
              const SizedBox(height: 16),
              
              // Date Picker
              InkWell(
                onTap: _selectDate,
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade400),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.calendar_today),
                      const SizedBox(width: 12),
                      Text(
                        'Date: ${DateFormat('MMM dd, yyyy').format(_selectedDate)}',
                        style: const TextStyle(fontSize: 16),
                      ),
                      const Spacer(),
                      const Icon(Icons.arrow_drop_down),
                    ],
                  ),
                ),
              ),
              
              const SizedBox(height: 16),
              
              // Crop Selection
              DropdownButtonFormField<String>(
                value: _selectedCropId,
                decoration: const InputDecoration(
                  labelText: 'Related Crop (Optional)',
                  prefixIcon: Icon(Icons.agriculture),
                  border: OutlineInputBorder(),
                ),
                items: [
                  const DropdownMenuItem(
                    value: null,
                    child: Text('General / No specific crop'),
                  ),
                  ..._crops.map((crop) => DropdownMenuItem(
                    value: crop.id,
                    child: Text('${crop.name} (${crop.variety})'),
                  )),
                ],
                onChanged: (value) {
                  setState(() {
                    _selectedCropId = value;
                  });
                },
              ),
              
              const SizedBox(height: 16),
              
              // Category Selection
              if (isIncome) ...[
                DropdownButtonFormField<IncomeCategory>(
                  value: _selectedIncomeCategory,
                  decoration: const InputDecoration(
                    labelText: 'Income Category',
                    prefixIcon: Icon(Icons.category),
                    border: OutlineInputBorder(),
                  ),
                  items: IncomeCategory.values.map((category) => DropdownMenuItem(
                    value: category,
                    child: Text(_getIncomeCategoryName(category)),
                  )).toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedIncomeCategory = value;
                    });
                  },
                  validator: (value) {
                    if (value == null) {
                      return 'Please select income category';
                    }
                    return null;
                  },
                ),
              ] else ...[
                DropdownButtonFormField<ExpenseCategory>(
                  value: _selectedExpenseCategory,
                  decoration: const InputDecoration(
                    labelText: 'Expense Category',
                    prefixIcon: Icon(Icons.category),
                    border: OutlineInputBorder(),
                  ),
                  items: ExpenseCategory.values.map((category) => DropdownMenuItem(
                    value: category,
                    child: Text(_getExpenseCategoryName(category)),
                  )).toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedExpenseCategory = value;
                    });
                  },
                  validator: (value) {
                    if (value == null) {
                      return 'Please select expense category';
                    }
                    return null;
                  },
                ),
              ],
              
              const SizedBox(height: 16),
              
              // Notes Field
              TextFormField(
                controller: _notesController,
                maxLines: 3,
                decoration: const InputDecoration(
                  labelText: 'Notes (Optional)',
                  hintText: 'Additional details...',
                  prefixIcon: Icon(Icons.notes),
                  border: OutlineInputBorder(),
                ),
              ),
              
              const SizedBox(height: 24),
              
              // Quick Amount Buttons (for expenses)
              if (!isIncome) ...[
                const Text(
                  'Quick Amount Selection',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  children: [500, 1000, 2000, 5000, 10000].map((amount) =>
                    OutlinedButton(
                      onPressed: () {
                        _amountController.text = amount.toString();
                      },
                      child: Text('₹$amount'),
                    ),
                  ).toList(),
                ),
                const SizedBox(height: 24),
              ],
              
              // Action Buttons
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Cancel'),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: _saveTransaction,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: isIncome ? Colors.green.shade600 : Colors.red.shade600,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                      child: Text(
                        widget.transaction != null ? 'Update' : 'Save',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              
              const SizedBox(height: 16),
              
              // Tips Section
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.blue.shade200),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.lightbulb, color: Colors.blue.shade600),
                        const SizedBox(width: 8),
                        Text(
                          'Tips for Better Record Keeping',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blue.shade800,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    if (isIncome) ...[
                      const Text('• Record sales immediately after transactions'),
                      const Text('• Include buyer details in notes for reference'),
                      const Text('• Attach photos of receipts when possible'),
                    ] else ...[
                      const Text('• Keep all purchase receipts for tax purposes'),
                      const Text('• Record exact quantities bought'),
                      const Text('• Note supplier details for future reference'),
                    ],
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _selectDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  String _getExpenseCategoryName(ExpenseCategory category) {
    switch (category) {
      case ExpenseCategory.seeds:
        return 'Seeds & Planting';
      case ExpenseCategory.fertilizer:
        return 'Fertilizers';
      case ExpenseCategory.pesticide:
        return 'Pesticides & Chemicals';
      case ExpenseCategory.labor:
        return 'Labor & Wages';
      case ExpenseCategory.equipment:
        return 'Equipment & Machinery';
      case ExpenseCategory.irrigation:
        return 'Irrigation & Water';
      case ExpenseCategory.transport:
        return 'Transportation';
      case ExpenseCategory.storage:
        return 'Storage & Warehousing';
      case ExpenseCategory.marketing:
        return 'Marketing & Sales';
      case ExpenseCategory.fuel:
        return 'Fuel & Energy';
      case ExpenseCategory.other:
        return 'Other Expenses';
    }
  }

  String _getIncomeCategoryName(IncomeCategory category) {
    switch (category) {
      case IncomeCategory.cropSale:
        return 'Crop Sales';
      case IncomeCategory.livestockSale:
        return 'Livestock Sales';
      case IncomeCategory.equipmentRental:
        return 'Equipment Rental';
      case IncomeCategory.subsidy:
        return 'Government Subsidy';
      case IncomeCategory.other:
        return 'Other Income';
    }
  }

  void _saveTransaction() {
    if (_formKey.currentState!.validate()) {
      // Create transaction object
      final transaction = Transaction(
        id: widget.transaction?.id ?? DateTime.now().millisecondsSinceEpoch.toString(),
        type: widget.type,
        amount: double.parse(_amountController.text),
        description: _descriptionController.text,
        date: _selectedDate,
        cropId: _selectedCropId,
        expenseCategory: _selectedExpenseCategory,
        incomeCategory: _selectedIncomeCategory,
        notes: _notesController.text.isEmpty ? null : _notesController.text,
      );

      // Show success message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            widget.transaction != null 
                ? 'Transaction updated successfully!'
                : 'Transaction saved successfully!',
          ),
          backgroundColor: Colors.green,
        ),
      );

      // Return to previous screen
      Navigator.pop(context, transaction);
    }
  }

  void _showDeleteConfirmation() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Transaction'),
        content: const Text('Are you sure you want to delete this transaction? This action cannot be undone.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context); // Close dialog
              Navigator.pop(context, 'deleted'); // Return to previous screen
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Transaction deleted successfully!'),
                  backgroundColor: Colors.red,
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
            ),
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }
}
