import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/expense_model.dart';
import '../models/field_model.dart';
import '../providers/app_provider.dart';

class ExpenseFormScreen extends StatefulWidget {
  final ExpenseModel? expense;
  final Function(ExpenseModel) onSave;

  const ExpenseFormScreen({
    Key? key,
    this.expense,
    required this.onSave,
  }) : super(key: key);

  @override
  State<ExpenseFormScreen> createState() => _ExpenseFormScreenState();
}

class _ExpenseFormScreenState extends State<ExpenseFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _descriptionController = TextEditingController();
  final _amountController = TextEditingController();
  final _notesController = TextEditingController();
  
  DateTime? _selectedDate;
  String _selectedCategory = 'Seeds';
  FieldModel? _selectedField;
  bool _isLoading = false;
  
  final List<String> _categories = [
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
    if (widget.expense != null) {
      _descriptionController.text = widget.expense!.description;
      _amountController.text = widget.expense!.amount.toString();
      _notesController.text = widget.expense!.notes;
      _selectedDate = widget.expense!.date;
      _selectedCategory = widget.expense!.category;
      
      // Find the selected field
      if (widget.expense!.fieldId != null) {
        final provider = Provider.of<AppProvider>(context, listen: false);
        _selectedField = provider.fields.firstWhere(
          (f) => f.id == widget.expense!.fieldId,
          orElse: () => null,
        );
      }
    } else {
      _selectedDate = DateTime.now();
    }
  }

  @override
  void dispose() {
    _descriptionController.dispose();
    _amountController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isEditing = widget.expense != null;
    
    return Scaffold(
      appBar: AppBar(
        title: Text(
          isEditing ? 'Edit Expense' : 'Add Expense',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.orange.shade700,
        foregroundColor: Colors.white,
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(24)),
        ),
        actions: isEditing ? [
          IconButton(
            icon: Icon(Icons.delete, color: Colors.white),
            onPressed: _deleteExpense,
          ),
        ] : null,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.orange.shade400, Colors.red.shade200],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  elevation: 8,
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          isEditing ? 'Update Expense' : 'Record New Expense',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.orange.shade700,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 32),
                        
                        // Description
                        TextFormField(
                          controller: _descriptionController,
                          decoration: InputDecoration(
                            labelText: 'Description *',
                            hintText: 'e.g., Wheat seeds, NPK fertilizer',
                            prefixIcon: Icon(Icons.description),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            filled: true,
                            fillColor: Colors.grey[50],
                          ),
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Description is required';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20),
                        
                        Row(
                          children: [
                            // Amount
                            Expanded(
                              flex: 2,
                              child: TextFormField(
                                controller: _amountController,
                                decoration: InputDecoration(
                                  labelText: 'Amount *',
                                  hintText: '0.00',
                                  prefixIcon: Icon(Icons.currency_rupee),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  filled: true,
                                  fillColor: Colors.grey[50],
                                ),
                                keyboardType: TextInputType.numberWithOptions(decimal: true),
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return 'Amount is required';
                                  }
                                  final amount = double.tryParse(value);
                                  if (amount == null || amount <= 0) {
                                    return 'Enter valid amount';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            SizedBox(width: 16),
                            
                            // Category
                            Expanded(
                              flex: 2,
                              child: DropdownButtonFormField<String>(
                                value: _selectedCategory,
                                decoration: InputDecoration(
                                  labelText: 'Category *',
                                  prefixIcon: Icon(Icons.category),
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
                          ],
                        ),
                        SizedBox(height: 20),
                        
                        // Date
                        InkWell(
                          onTap: _selectDate,
                          child: InputDecorator(
                            decoration: InputDecoration(
                              labelText: 'Date *',
                              prefixIcon: Icon(Icons.calendar_today),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              filled: true,
                              fillColor: Colors.grey[50],
                            ),
                            child: Text(
                              _selectedDate != null
                                  ? '${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}'
                                  : 'Select date',
                              style: TextStyle(
                                color: _selectedDate != null ? Colors.black : Colors.grey[600],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        
                        // Field (Optional)
                        Consumer<AppProvider>(
                          builder: (context, provider, child) {
                            return DropdownButtonFormField<FieldModel>(
                              value: _selectedField,
                              decoration: InputDecoration(
                                labelText: 'Field (Optional)',
                                hintText: 'Select field if applicable',
                                prefixIcon: Icon(Icons.landscape),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                filled: true,
                                fillColor: Colors.grey[50],
                              ),
                              items: [
                                DropdownMenuItem<FieldModel>(
                                  value: null,
                                  child: Text('None'),
                                ),
                                ...provider.fields.map((field) => DropdownMenuItem(
                                  value: field,
                                  child: Text('${field.name} (${field.sizeHectares} ha)'),
                                )).toList(),
                              ],
                              onChanged: (value) => setState(() => _selectedField = value),
                            );
                          },
                        ),
                        SizedBox(height: 20),
                        
                        // Notes
                        TextFormField(
                          controller: _notesController,
                          decoration: InputDecoration(
                            labelText: 'Notes (Optional)',
                            hintText: 'Additional details...',
                            prefixIcon: Icon(Icons.note),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            filled: true,
                            fillColor: Colors.grey[50],
                          ),
                          maxLines: 3,
                        ),
                        SizedBox(height: 32),
                        
                        // Action Buttons
                        Row(
                          children: [
                            Expanded(
                              child: OutlinedButton(
                                onPressed: _isLoading ? null : () => Navigator.pop(context),
                                style: OutlinedButton.styleFrom(
                                  padding: EdgeInsets.symmetric(vertical: 16),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                ),
                                child: Text('Cancel'),
                              ),
                            ),
                            SizedBox(width: 16),
                            Expanded(
                              child: ElevatedButton(
                                onPressed: _isLoading ? null : _saveExpense,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.orange.shade700,
                                  foregroundColor: Colors.white,
                                  padding: EdgeInsets.symmetric(vertical: 16),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                ),
                                child: _isLoading
                                    ? SizedBox(
                                        height: 20,
                                        width: 20,
                                        child: CircularProgressIndicator(
                                          strokeWidth: 2,
                                          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                                        ),
                                      )
                                    : Text(isEditing ? 'Update' : 'Save'),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                
                // Danger Zone for editing
                if (isEditing) ...[
                  SizedBox(height: 24),
                  Card(
                    color: Colors.red.shade50,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.warning, color: Colors.red.shade700),
                              SizedBox(width: 8),
                              Text(
                                'Danger Zone',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red.shade700,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 12),
                          Text(
                            'Deleting this expense will permanently remove it from your records.',
                            style: TextStyle(color: Colors.red.shade600),
                          ),
                          SizedBox(height: 16),
                          SizedBox(
                            width: double.infinity,
                            child: OutlinedButton.icon(
                              onPressed: _deleteExpense,
                              icon: Icon(Icons.delete_forever, color: Colors.red.shade700),
                              label: Text(
                                'Delete Expense',
                                style: TextStyle(color: Colors.red.shade700),
                              ),
                              style: OutlinedButton.styleFrom(
                                side: BorderSide(color: Colors.red.shade700),
                                padding: EdgeInsets.symmetric(vertical: 12),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _selectDate() async {
    final date = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    );
    if (date != null) {
      setState(() => _selectedDate = date);
    }
  }

  Future<void> _saveExpense() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    if (_selectedDate == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please select a date'),
          backgroundColor: Colors.orange,
        ),
      );
      return;
    }

    setState(() => _isLoading = true);

    try {
      final expense = ExpenseModel(
        id: widget.expense?.id ?? DateTime.now().millisecondsSinceEpoch.toString(),
        description: _descriptionController.text.trim(),
        amount: double.parse(_amountController.text.trim()),
        category: _selectedCategory,
        date: _selectedDate!,
        fieldId: _selectedField?.id,
        notes: _notesController.text.trim(),
      );

      await widget.onSave(expense);
      Navigator.pop(context);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error saving expense: $e'),
          backgroundColor: Colors.red,
        ),
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }

  Future<void> _deleteExpense() async {
    if (widget.expense == null) return;

    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Delete Expense'),
        content: Text('Are you sure you want to delete this expense? This action cannot be undone.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context, true),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            child: Text('Delete', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      try {
        setState(() => _isLoading = true);
        final provider = Provider.of<AppProvider>(context, listen: false);
        await provider.deleteExpense(widget.expense!.id);
        Navigator.pop(context);
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error deleting expense: $e'),
            backgroundColor: Colors.red,
          ),
        );
      } finally {
        setState(() => _isLoading = false);
      }
    }
  }
}
