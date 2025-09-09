import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/khatabook_models.dart';

class KhatabookCropFormScreen extends StatefulWidget {
  final Crop? crop; // For editing existing crops

  const KhatabookCropFormScreen({Key? key, this.crop}) : super(key: key);

  @override
  State<KhatabookCropFormScreen> createState() => _KhatabookCropFormScreenState();
}

class _KhatabookCropFormScreenState extends State<KhatabookCropFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _varietyController = TextEditingController();
  final _areaController = TextEditingController();
  final _expectedYieldController = TextEditingController();
  final _actualYieldController = TextEditingController();
  final _notesController = TextEditingController();

  CropType _selectedCropType = CropType.wheat;
  DateTime _plantingDate = DateTime.now();
  DateTime? _harvestDate;

  @override
  void initState() {
    super.initState();
    if (widget.crop != null) {
      _loadCropData();
    }
  }

  void _loadCropData() {
    final crop = widget.crop!;
    _nameController.text = crop.name;
    _varietyController.text = crop.variety;
    _areaController.text = crop.areaInAcres.toString();
    _expectedYieldController.text = crop.expectedYield?.toString() ?? '';
    _actualYieldController.text = crop.actualYield?.toString() ?? '';
    _notesController.text = crop.notes ?? '';
    _selectedCropType = crop.type;
    _plantingDate = crop.plantingDate;
    _harvestDate = crop.harvestDate;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _varietyController.dispose();
    _areaController.dispose();
    _expectedYieldController.dispose();
    _actualYieldController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      appBar: AppBar(
        title: Text(
          widget.crop != null ? 'Edit Crop' : 'Add New Crop',
        ),
        backgroundColor: Colors.green.shade600,
        foregroundColor: Colors.white,
        actions: [
          if (widget.crop != null)
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
              // Header Card
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.green.shade50,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.green.shade200),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.agriculture,
                      color: Colors.green.shade600,
                      size: 32,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Crop Information',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.green.shade800,
                            ),
                          ),
                          Text(
                            'Track your crop details for better management',
                            style: TextStyle(
                              color: Colors.grey.shade600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // Crop Name
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Crop Name',
                  hintText: 'e.g., Winter Wheat, Basmati Rice',
                  prefixIcon: Icon(Icons.label),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter crop name';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 16),

              // Crop Type
              DropdownButtonFormField<CropType>(
                value: _selectedCropType,
                decoration: const InputDecoration(
                  labelText: 'Crop Type',
                  prefixIcon: Icon(Icons.category),
                  border: OutlineInputBorder(),
                ),
                items: CropType.values.map((type) => DropdownMenuItem(
                  value: type,
                  child: Text(_getCropTypeName(type)),
                )).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedCropType = value!;
                  });
                },
              ),

              const SizedBox(height: 16),

              // Variety
              TextFormField(
                controller: _varietyController,
                decoration: const InputDecoration(
                  labelText: 'Variety',
                  hintText: 'e.g., HD-2967, Pusa Basmati 1121',
                  prefixIcon: Icon(Icons.local_florist),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter variety';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 16),

              // Area in Acres
              TextFormField(
                controller: _areaController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Area (Acres)',
                  hintText: 'Enter area in acres',
                  prefixIcon: Icon(Icons.square_foot),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter area';
                  }
                  if (double.tryParse(value) == null) {
                    return 'Please enter valid area';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 16),

              // Planting Date
              InkWell(
                onTap: _selectPlantingDate,
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
                        'Planting Date: ${DateFormat('MMM dd, yyyy').format(_plantingDate)}',
                        style: const TextStyle(fontSize: 16),
                      ),
                      const Spacer(),
                      const Icon(Icons.arrow_drop_down),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // Harvest Date (Optional)
              InkWell(
                onTap: _selectHarvestDate,
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
                        _harvestDate != null
                            ? 'Harvest Date: ${DateFormat('MMM dd, yyyy').format(_harvestDate!)}'
                            : 'Harvest Date: Not yet harvested',
                        style: TextStyle(
                          fontSize: 16,
                          color: _harvestDate != null ? Colors.black : Colors.grey.shade600,
                        ),
                      ),
                      const Spacer(),
                      if (_harvestDate != null)
                        IconButton(
                          icon: const Icon(Icons.clear),
                          onPressed: () {
                            setState(() {
                              _harvestDate = null;
                            });
                          },
                        ),
                      const Icon(Icons.arrow_drop_down),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // Expected Yield
              TextFormField(
                controller: _expectedYieldController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Expected Yield (kg)',
                  hintText: 'Expected total yield',
                  prefixIcon: Icon(Icons.trending_up),
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 16),

              // Actual Yield (if harvested)
              if (_harvestDate != null)
                TextFormField(
                  controller: _actualYieldController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Actual Yield (kg)',
                    hintText: 'Actual harvested yield',
                    prefixIcon: Icon(Icons.agriculture),
                    border: OutlineInputBorder(),
                  ),
                ),

              if (_harvestDate != null) const SizedBox(height: 16),

              // Notes
              TextFormField(
                controller: _notesController,
                maxLines: 3,
                decoration: const InputDecoration(
                  labelText: 'Notes (Optional)',
                  hintText: 'Additional information about this crop...',
                  prefixIcon: Icon(Icons.notes),
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 24),

              // Yield Comparison (if both expected and actual are provided)
              if (_expectedYieldController.text.isNotEmpty && _actualYieldController.text.isNotEmpty)
                _buildYieldComparison(),

              const SizedBox(height: 16),

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
                      onPressed: _saveCrop,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green.shade600,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                      child: Text(
                        widget.crop != null ? 'Update Crop' : 'Save Crop',
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
                          'Crop Management Tips',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blue.shade800,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text('• Keep detailed records for better crop planning next season',
                        style: TextStyle(color: Colors.blue.shade700)),
                    Text('• Track both expected and actual yields to improve accuracy',
                        style: TextStyle(color: Colors.blue.shade700)),
                    Text('• Note variety performance for future variety selection',
                        style: TextStyle(color: Colors.blue.shade700)),
                    Text('• Record harvest dates to plan crop rotation effectively',
                        style: TextStyle(color: Colors.blue.shade700)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildYieldComparison() {
    final expected = double.tryParse(_expectedYieldController.text) ?? 0;
    final actual = double.tryParse(_actualYieldController.text) ?? 0;
    final difference = actual - expected;
    final percentage = expected > 0 ? (difference / expected) * 100 : 0;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: difference >= 0 ? Colors.green.shade50 : Colors.orange.shade50,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: difference >= 0 ? Colors.green.shade200 : Colors.orange.shade200,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Yield Comparison',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: difference >= 0 ? Colors.green.shade800 : Colors.orange.shade800,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Expected: ${expected.toStringAsFixed(0)} kg'),
              Text('Actual: ${actual.toStringAsFixed(0)} kg'),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            'Difference: ${difference >= 0 ? '+' : ''}${difference.toStringAsFixed(0)} kg (${percentage >= 0 ? '+' : ''}${percentage.toStringAsFixed(1)}%)',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: difference >= 0 ? Colors.green.shade700 : Colors.orange.shade700,
            ),
          ),
        ],
      ),
    );
  }

  String _getCropTypeName(CropType type) {
    switch (type) {
      case CropType.wheat:
        return 'Wheat';
      case CropType.rice:
        return 'Rice';
      case CropType.corn:
        return 'Corn';
      case CropType.cotton:
        return 'Cotton';
      case CropType.sugarcane:
        return 'Sugarcane';
      case CropType.potato:
        return 'Potato';
      case CropType.tomato:
        return 'Tomato';
      case CropType.onion:
        return 'Onion';
      case CropType.other:
        return 'Other';
    }
  }

  Future<void> _selectPlantingDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _plantingDate,
      firstDate: DateTime(2020),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (picked != null && picked != _plantingDate) {
      setState(() {
        _plantingDate = picked;
      });
    }
  }

  Future<void> _selectHarvestDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _harvestDate ?? DateTime.now(),
      firstDate: _plantingDate,
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (picked != null) {
      setState(() {
        _harvestDate = picked;
      });
    }
  }

  void _saveCrop() {
    if (_formKey.currentState!.validate()) {
      // Create crop object
      final crop = Crop(
        id: widget.crop?.id ?? DateTime.now().millisecondsSinceEpoch.toString(),
        name: _nameController.text,
        type: _selectedCropType,
        areaInAcres: double.parse(_areaController.text),
        plantingDate: _plantingDate,
        harvestDate: _harvestDate,
        variety: _varietyController.text,
        expectedYield: _expectedYieldController.text.isEmpty 
            ? null 
            : double.parse(_expectedYieldController.text),
        actualYield: _actualYieldController.text.isEmpty 
            ? null 
            : double.parse(_actualYieldController.text),
        notes: _notesController.text.isEmpty ? null : _notesController.text,
      );

      // Show success message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            widget.crop != null 
                ? 'Crop updated successfully!'
                : 'Crop saved successfully!',
          ),
          backgroundColor: Colors.green,
        ),
      );

      // Return to previous screen
      Navigator.pop(context, crop);
    }
  }

  void _showDeleteConfirmation() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Crop'),
        content: const Text('Are you sure you want to delete this crop? This will also affect related transactions.'),
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
                  content: Text('Crop deleted successfully!'),
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
