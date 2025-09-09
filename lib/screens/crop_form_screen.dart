import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/crop_model.dart';
import '../models/field_model.dart';
import '../providers/app_provider.dart';

class CropFormScreen extends StatefulWidget {
  final CropModel? crop;
  final Function(CropModel) onSave;

  const CropFormScreen({
    Key? key,
    this.crop,
    required this.onSave,
  }) : super(key: key);

  @override
  State<CropFormScreen> createState() => _CropFormScreenState();
}

class _CropFormScreenState extends State<CropFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _cropNameController = TextEditingController();
  final _varietyController = TextEditingController();
  final _yieldController = TextEditingController();
  
  DateTime? _plantingDate;
  DateTime? _harvestDate;
  FieldModel? _selectedField;
  bool _isLoading = false;
  
  final List<String> _commonCrops = [
    'Wheat',
    'Rice',
    'Maize',
    'Barley',
    'Sugarcane',
    'Cotton',
    'Soybean',
    'Mustard',
    'Tomato',
    'Potato',
    'Onion',
    'Cabbage',
  ];

  @override
  void initState() {
    super.initState();
    if (widget.crop != null) {
      _cropNameController.text = widget.crop!.cropName;
      _varietyController.text = widget.crop!.variety;
      _plantingDate = widget.crop!.plantingDate;
      _harvestDate = widget.crop!.harvestDate;
      _yieldController.text = widget.crop!.yield?.toString() ?? '';
      
      // Find the selected field
      final provider = Provider.of<AppProvider>(context, listen: false);
      _selectedField = provider.fields.firstWhere(
        (f) => f.id == widget.crop!.fieldId,
        orElse: () => provider.fields.first,
      );
    }
  }

  @override
  void dispose() {
    _cropNameController.dispose();
    _varietyController.dispose();
    _yieldController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isEditing = widget.crop != null;
    
    return Scaffold(
      appBar: AppBar(
        title: Text(
          isEditing ? 'Edit Crop' : 'Plant Crop',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.green.shade700,
        foregroundColor: Colors.white,
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(24)),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.green.shade400, Colors.blue.shade200],
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
                          isEditing ? 'Update Crop Information' : 'Plant New Crop',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.green.shade700,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 32),
                        
                        // Field Selection
                        Consumer<AppProvider>(
                          builder: (context, provider, child) {
                            if (provider.fields.isEmpty) {
                              return Card(
                                color: Colors.orange.shade50,
                                child: Padding(
                                  padding: EdgeInsets.all(16),
                                  child: Text(
                                    'No fields available. Please add a field first.',
                                    style: TextStyle(color: Colors.orange.shade700),
                                  ),
                                ),
                              );
                            }
                            
                            return DropdownButtonFormField<FieldModel>(
                              value: _selectedField,
                              decoration: InputDecoration(
                                labelText: 'Select Field *',
                                prefixIcon: Icon(Icons.landscape),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                filled: true,
                                fillColor: Colors.grey[50],
                              ),
                              items: provider.fields.map((field) => DropdownMenuItem(
                                value: field,
                                child: Text('${field.name} (${field.sizeHectares} ha)'),
                              )).toList(),
                              onChanged: (value) {
                                setState(() {
                                  _selectedField = value;
                                });
                              },
                              validator: (value) {
                                if (value == null) {
                                  return 'Please select a field';
                                }
                                return null;
                              },
                            );
                          },
                        ),
                        SizedBox(height: 20),
                        
                        // Crop Name
                        DropdownButtonFormField<String>(
                          value: _cropNameController.text.isEmpty ? null : _cropNameController.text,
                          decoration: InputDecoration(
                            labelText: 'Crop Name *',
                            prefixIcon: Icon(Icons.eco),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            filled: true,
                            fillColor: Colors.grey[50],
                          ),
                          items: _commonCrops.map((crop) => DropdownMenuItem(
                            value: crop,
                            child: Text(crop),
                          )).toList()
                            ..add(DropdownMenuItem(
                              value: 'other',
                              child: Text('Other (Custom)'),
                            )),
                          onChanged: (value) {
                            setState(() {
                              if (value == 'other') {
                                _cropNameController.clear();
                                _showCustomCropDialog();
                              } else {
                                _cropNameController.text = value ?? '';
                              }
                            });
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please select a crop';
                            }
                            return null;
                          },
                        ),
                        
                        // Custom crop name field (shown when "Other" is selected)
                        if (_cropNameController.text.isNotEmpty && 
                            !_commonCrops.contains(_cropNameController.text)) ...[
                          SizedBox(height: 20),
                          TextFormField(
                            controller: _cropNameController,
                            decoration: InputDecoration(
                              labelText: 'Custom Crop Name *',
                              hintText: 'Enter crop name',
                              prefixIcon: Icon(Icons.eco),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              filled: true,
                              fillColor: Colors.grey[50],
                            ),
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return 'Crop name is required';
                              }
                              return null;
                            },
                          ),
                        ],
                        SizedBox(height: 20),
                        
                        // Variety
                        TextFormField(
                          controller: _varietyController,
                          decoration: InputDecoration(
                            labelText: 'Variety *',
                            hintText: 'e.g., Sharbati, Basmati',
                            prefixIcon: Icon(Icons.category),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            filled: true,
                            fillColor: Colors.grey[50],
                          ),
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Variety is required';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20),
                        
                        // Planting Date
                        InkWell(
                          onTap: _selectPlantingDate,
                          child: InputDecorator(
                            decoration: InputDecoration(
                              labelText: 'Planting Date *',
                              prefixIcon: Icon(Icons.calendar_today),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              filled: true,
                              fillColor: Colors.grey[50],
                            ),
                            child: Text(
                              _plantingDate != null
                                  ? '${_plantingDate!.day}/${_plantingDate!.month}/${_plantingDate!.year}'
                                  : 'Select planting date',
                              style: TextStyle(
                                color: _plantingDate != null ? Colors.black : Colors.grey[600],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        
                        // Harvest Date (Optional)
                        InkWell(
                          onTap: _selectHarvestDate,
                          child: InputDecorator(
                            decoration: InputDecoration(
                              labelText: 'Harvest Date (Optional)',
                              prefixIcon: Icon(Icons.agriculture),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              filled: true,
                              fillColor: Colors.grey[50],
                              suffixIcon: _harvestDate != null
                                  ? IconButton(
                                      icon: Icon(Icons.clear),
                                      onPressed: () => setState(() => _harvestDate = null),
                                    )
                                  : null,
                            ),
                            child: Text(
                              _harvestDate != null
                                  ? '${_harvestDate!.day}/${_harvestDate!.month}/${_harvestDate!.year}'
                                  : 'Select harvest date',
                              style: TextStyle(
                                color: _harvestDate != null ? Colors.black : Colors.grey[600],
                              ),
                            ),
                          ),
                        ),
                        
                        // Yield (shown only if harvest date is set)
                        if (_harvestDate != null) ...[
                          SizedBox(height: 20),
                          TextFormField(
                            controller: _yieldController,
                            decoration: InputDecoration(
                              labelText: 'Yield (kg/hectare)',
                              hintText: 'Enter yield per hectare',
                              prefixIcon: Icon(Icons.scale),
                              suffixText: 'kg/ha',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              filled: true,
                              fillColor: Colors.grey[50],
                            ),
                            keyboardType: TextInputType.numberWithOptions(decimal: true),
                            validator: (value) {
                              if (value != null && value.isNotEmpty) {
                                final yield = double.tryParse(value);
                                if (yield == null || yield < 0) {
                                  return 'Please enter a valid yield';
                                }
                              }
                              return null;
                            },
                          ),
                        ],
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
                                onPressed: _isLoading ? null : _saveCrop,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.green.shade700,
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
                                    : Text(isEditing ? 'Update Crop' : 'Plant Crop'),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showCustomCropDialog() {
    final customController = TextEditingController();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Enter Custom Crop'),
        content: TextField(
          controller: customController,
          decoration: InputDecoration(
            labelText: 'Crop Name',
            hintText: 'Enter custom crop name',
          ),
          autofocus: true,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              if (customController.text.trim().isNotEmpty) {
                setState(() {
                  _cropNameController.text = customController.text.trim();
                });
                Navigator.pop(context);
              }
            },
            child: Text('Add'),
          ),
        ],
      ),
    );
  }

  Future<void> _selectPlantingDate() async {
    final date = await showDatePicker(
      context: context,
      initialDate: _plantingDate ?? DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    );
    if (date != null) {
      setState(() => _plantingDate = date);
    }
  }

  Future<void> _selectHarvestDate() async {
    if (_plantingDate == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please select planting date first'),
          backgroundColor: Colors.orange,
        ),
      );
      return;
    }
    
    final date = await showDatePicker(
      context: context,
      initialDate: _harvestDate ?? DateTime.now(),
      firstDate: _plantingDate!,
      lastDate: DateTime.now().add(Duration(days: 365)),
    );
    if (date != null) {
      setState(() => _harvestDate = date);
    }
  }

  Future<void> _saveCrop() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    if (_plantingDate == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please select planting date'),
          backgroundColor: Colors.orange,
        ),
      );
      return;
    }

    setState(() => _isLoading = true);

    try {
      final crop = CropModel(
        id: widget.crop?.id ?? DateTime.now().millisecondsSinceEpoch.toString(),
        fieldId: _selectedField!.id,
        cropName: _cropNameController.text.trim(),
        variety: _varietyController.text.trim(),
        plantingDate: _plantingDate!,
        harvestDate: _harvestDate,
        yield: _yieldController.text.trim().isNotEmpty 
            ? double.tryParse(_yieldController.text.trim())
            : null,
      );

      await widget.onSave(crop);
      Navigator.pop(context);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error saving crop: $e'),
          backgroundColor: Colors.red,
        ),
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }
}
