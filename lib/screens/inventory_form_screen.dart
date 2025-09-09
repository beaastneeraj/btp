import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/inventory_model.dart';
import '../providers/app_provider.dart';

class InventoryFormScreen extends StatefulWidget {
  final InventoryModel? item;
  final Function(InventoryModel) onSave;

  const InventoryFormScreen({
    Key? key,
    this.item,
    required this.onSave,
  }) : super(key: key);

  @override
  State<InventoryFormScreen> createState() => _InventoryFormScreenState();
}

class _InventoryFormScreenState extends State<InventoryFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _quantityController = TextEditingController();
  final _locationController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _lowStockController = TextEditingController();
  
  String _selectedCategory = 'Seeds';
  String _selectedUnit = 'kg';
  bool _isLoading = false;
  
  final List<String> _categories = [
    'Seeds',
    'Fertilizers',
    'Pesticides',
    'Tools',
    'Equipment',
    'Machinery',
    'Irrigation Supplies',
    'Other'
  ];

  final List<String> _units = [
    'kg',
    'grams',
    'liters',
    'ml',
    'pieces',
    'bags',
    'boxes',
    'bottles',
    'packets',
    'meters',
    'tons'
  ];

  @override
  void initState() {
    super.initState();
    if (widget.item != null) {
      _nameController.text = widget.item!.name;
      _quantityController.text = widget.item!.quantity.toString();
      _locationController.text = widget.item!.location;
      _descriptionController.text = widget.item!.description;
      _lowStockController.text = widget.item!.lowStockThreshold.toString();
      _selectedCategory = widget.item!.category;
      _selectedUnit = widget.item!.unit;
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _quantityController.dispose();
    _locationController.dispose();
    _descriptionController.dispose();
    _lowStockController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isEditing = widget.item != null;
    
    return Scaffold(
      appBar: AppBar(
        title: Text(
          isEditing ? 'Edit Item' : 'Add Item',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.purple.shade700,
        foregroundColor: Colors.white,
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(24)),
        ),
        actions: isEditing ? [
          IconButton(
            icon: Icon(Icons.delete, color: Colors.white),
            onPressed: _deleteItem,
          ),
        ] : null,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.purple.shade400, Colors.pink.shade200],
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
                          isEditing ? 'Update Inventory Item' : 'Add New Item',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.purple.shade700,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 32),
                        
                        // Item Name
                        TextFormField(
                          controller: _nameController,
                          decoration: InputDecoration(
                            labelText: 'Item Name *',
                            hintText: 'e.g., Wheat Seeds, NPK Fertilizer',
                            prefixIcon: Icon(Icons.label),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            filled: true,
                            fillColor: Colors.grey[50],
                          ),
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Item name is required';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20),
                        
                        Row(
                          children: [
                            // Quantity
                            Expanded(
                              flex: 2,
                              child: TextFormField(
                                controller: _quantityController,
                                decoration: InputDecoration(
                                  labelText: 'Quantity *',
                                  hintText: '0.0',
                                  prefixIcon: Icon(Icons.inventory),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  filled: true,
                                  fillColor: Colors.grey[50],
                                ),
                                keyboardType: TextInputType.numberWithOptions(decimal: true),
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return 'Quantity is required';
                                  }
                                  final quantity = double.tryParse(value);
                                  if (quantity == null || quantity < 0) {
                                    return 'Enter valid quantity';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            SizedBox(width: 16),
                            
                            // Unit
                            Expanded(
                              flex: 1,
                              child: DropdownButtonFormField<String>(
                                value: _selectedUnit,
                                decoration: InputDecoration(
                                  labelText: 'Unit *',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  filled: true,
                                  fillColor: Colors.grey[50],
                                ),
                                items: _units.map((unit) => DropdownMenuItem(
                                  value: unit,
                                  child: Text(unit),
                                )).toList(),
                                onChanged: (value) => setState(() => _selectedUnit = value!),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        
                        // Category
                        DropdownButtonFormField<String>(
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
                        SizedBox(height: 20),
                        
                        // Location
                        TextFormField(
                          controller: _locationController,
                          decoration: InputDecoration(
                            labelText: 'Location (Optional)',
                            hintText: 'e.g., Warehouse A, Shelf 2',
                            prefixIcon: Icon(Icons.location_on),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            filled: true,
                            fillColor: Colors.grey[50],
                          ),
                        ),
                        SizedBox(height: 20),
                        
                        // Low Stock Threshold
                        TextFormField(
                          controller: _lowStockController,
                          decoration: InputDecoration(
                            labelText: 'Low Stock Threshold (Optional)',
                            hintText: 'Alert when quantity is below this',
                            prefixIcon: Icon(Icons.warning),
                            suffixText: _selectedUnit,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            filled: true,
                            fillColor: Colors.grey[50],
                          ),
                          keyboardType: TextInputType.numberWithOptions(decimal: true),
                          validator: (value) {
                            if (value != null && value.isNotEmpty) {
                              final threshold = double.tryParse(value);
                              if (threshold == null || threshold < 0) {
                                return 'Enter valid threshold';
                              }
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20),
                        
                        // Description
                        TextFormField(
                          controller: _descriptionController,
                          decoration: InputDecoration(
                            labelText: 'Description (Optional)',
                            hintText: 'Additional details about the item',
                            prefixIcon: Icon(Icons.description),
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
                                onPressed: _isLoading ? null : _saveItem,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.purple.shade700,
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
                                    : Text(isEditing ? 'Update' : 'Add Item'),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                
                // Stock Actions Card (for editing)
                if (isEditing) ...[
                  SizedBox(height: 24),
                  Card(
                    color: Colors.blue.shade50,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Quick Stock Actions',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue.shade700,
                            ),
                          ),
                          SizedBox(height: 16),
                          Row(
                            children: [
                              Expanded(
                                child: ElevatedButton.icon(
                                  onPressed: _addStock,
                                  icon: Icon(Icons.add),
                                  label: Text('Add Stock'),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.green,
                                    foregroundColor: Colors.white,
                                    padding: EdgeInsets.symmetric(vertical: 12),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 12),
                              Expanded(
                                child: ElevatedButton.icon(
                                  onPressed: _removeStock,
                                  icon: Icon(Icons.remove),
                                  label: Text('Use Stock'),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.orange,
                                    foregroundColor: Colors.white,
                                    padding: EdgeInsets.symmetric(vertical: 12),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  
                  // Danger Zone
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
                            'Deleting this item will permanently remove it from your inventory.',
                            style: TextStyle(color: Colors.red.shade600),
                          ),
                          SizedBox(height: 16),
                          SizedBox(
                            width: double.infinity,
                            child: OutlinedButton.icon(
                              onPressed: _deleteItem,
                              icon: Icon(Icons.delete_forever, color: Colors.red.shade700),
                              label: Text(
                                'Delete Item',
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

  Future<void> _saveItem() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() => _isLoading = true);

    try {
      final item = InventoryModel(
        id: widget.item?.id ?? DateTime.now().millisecondsSinceEpoch.toString(),
        name: _nameController.text.trim(),
        category: _selectedCategory,
        quantity: double.parse(_quantityController.text.trim()),
        unit: _selectedUnit,
        location: _locationController.text.trim(),
        description: _descriptionController.text.trim(),
        lowStockThreshold: _lowStockController.text.trim().isNotEmpty 
            ? double.parse(_lowStockController.text.trim())
            : 0,
      );

      await widget.onSave(item);
      Navigator.pop(context);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error saving item: $e'),
          backgroundColor: Colors.red,
        ),
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }

  void _addStock() {
    _showStockDialog(true);
  }

  void _removeStock() {
    _showStockDialog(false);
  }

  void _showStockDialog(bool isAdding) {
    final controller = TextEditingController();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(isAdding ? 'Add Stock' : 'Use Stock'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Current quantity: ${_quantityController.text} $_selectedUnit',
              style: TextStyle(color: Colors.grey[600]),
            ),
            SizedBox(height: 16),
            TextField(
              controller: controller,
              decoration: InputDecoration(
                labelText: isAdding ? 'Quantity to add' : 'Quantity to use',
                suffixText: _selectedUnit,
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              autofocus: true,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              final amount = double.tryParse(controller.text);
              if (amount != null && amount > 0) {
                final currentQuantity = double.tryParse(_quantityController.text) ?? 0;
                final newQuantity = isAdding 
                    ? currentQuantity + amount
                    : (currentQuantity - amount).clamp(0, double.infinity);
                
                _quantityController.text = newQuantity.toString();
                Navigator.pop(context);
                
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      isAdding 
                          ? 'Added $amount $_selectedUnit to stock'
                          : 'Used $amount $_selectedUnit from stock'
                    ),
                    backgroundColor: isAdding ? Colors.green : Colors.orange,
                  ),
                );
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: isAdding ? Colors.green : Colors.orange,
            ),
            child: Text(isAdding ? 'Add' : 'Use'),
          ),
        ],
      ),
    );
  }

  Future<void> _deleteItem() async {
    if (widget.item == null) return;

    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Delete Item'),
        content: Text('Are you sure you want to delete this inventory item? This action cannot be undone.'),
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
        await provider.deleteInventoryItem(widget.item!.id);
        Navigator.pop(context);
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error deleting item: $e'),
            backgroundColor: Colors.red,
          ),
        );
      } finally {
        setState(() => _isLoading = false);
      }
    }
  }
}
