import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/field_model.dart';
import '../providers/app_provider.dart';

class FieldFormScreen extends StatefulWidget {
  final FieldModel? field;
  final Function(FieldModel) onSave;

  const FieldFormScreen({
    Key? key,
    this.field,
    required this.onSave,
  }) : super(key: key);

  @override
  State<FieldFormScreen> createState() => _FieldFormScreenState();
}

class _FieldFormScreenState extends State<FieldFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _sizeController = TextEditingController();
  final _soilTypeController = TextEditingController();
  final _gpsController = TextEditingController();
  final _descriptionController = TextEditingController();
  
  bool _isLoading = false;
  
  final List<String> _soilTypes = [
    'Loamy',
    'Sandy',
    'Clay',
    'Silty',
    'Peaty',
    'Chalky',
  ];

  @override
  void initState() {
    super.initState();
    if (widget.field != null) {
      _nameController.text = widget.field!.name;
      _sizeController.text = widget.field!.sizeHectares.toString();
      _soilTypeController.text = widget.field!.soilType;
      _gpsController.text = widget.field!.gpsCoordinates;
      _descriptionController.text = widget.field!.description ?? '';
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _sizeController.dispose();
    _soilTypeController.dispose();
    _gpsController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isEditing = widget.field != null;
    
    return Scaffold(
      appBar: AppBar(
        title: Text(
          isEditing ? 'Edit Field' : 'Add Field',
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
                          isEditing ? 'Update Field Information' : 'Add New Field',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.green.shade700,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 32),
                        
                        // Field Name
                        TextFormField(
                          controller: _nameController,
                          decoration: InputDecoration(
                            labelText: 'Field Name *',
                            hintText: 'Enter field name',
                            prefixIcon: Icon(Icons.grass),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            filled: true,
                            fillColor: Colors.grey[50],
                          ),
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Field name is required';
                            }
                            if (value.trim().length < 2) {
                              return 'Field name must be at least 2 characters';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20),
                        
                        // Field Size
                        TextFormField(
                          controller: _sizeController,
                          decoration: InputDecoration(
                            labelText: 'Size (Hectares) *',
                            hintText: 'Enter size in hectares',
                            prefixIcon: Icon(Icons.straighten),
                            suffixText: 'ha',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            filled: true,
                            fillColor: Colors.grey[50],
                          ),
                          keyboardType: TextInputType.numberWithOptions(decimal: true),
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Field size is required';
                            }
                            final size = double.tryParse(value.trim());
                            if (size == null || size <= 0) {
                              return 'Please enter a valid size greater than 0';
                            }
                            if (size > 10000) {
                              return 'Size seems too large, please verify';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20),
                        
                        // Soil Type Dropdown
                        DropdownButtonFormField<String>(
                          value: _soilTypeController.text.isEmpty ? null : _soilTypeController.text,
                          decoration: InputDecoration(
                            labelText: 'Soil Type *',
                            prefixIcon: Icon(Icons.terrain),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            filled: true,
                            fillColor: Colors.grey[50],
                          ),
                          items: _soilTypes.map((type) => DropdownMenuItem(
                            value: type,
                            child: Text(type),
                          )).toList(),
                          onChanged: (value) {
                            setState(() {
                              _soilTypeController.text = value ?? '';
                            });
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please select a soil type';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20),
                        
                        // GPS Coordinates
                        TextFormField(
                          controller: _gpsController,
                          decoration: InputDecoration(
                            labelText: 'GPS Coordinates',
                            hintText: 'e.g., 26.9124, 75.7873',
                            prefixIcon: Icon(Icons.location_on),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            filled: true,
                            fillColor: Colors.grey[50],
                            suffixIcon: IconButton(
                              icon: Icon(Icons.my_location),
                              onPressed: _getCurrentLocation,
                            ),
                          ),
                          validator: (value) {
                            if (value != null && value.isNotEmpty) {
                              // Basic GPS coordinate validation
                              final coords = value.split(',');
                              if (coords.length != 2) {
                                return 'Invalid format. Use: latitude, longitude';
                              }
                              final lat = double.tryParse(coords[0].trim());
                              final lng = double.tryParse(coords[1].trim());
                              if (lat == null || lng == null) {
                                return 'Invalid coordinates';
                              }
                              if (lat < -90 || lat > 90 || lng < -180 || lng > 180) {
                                return 'Coordinates out of valid range';
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
                            hintText: 'Add field description, notes, etc.',
                            prefixIcon: Icon(Icons.description),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            filled: true,
                            fillColor: Colors.grey[50],
                          ),
                          maxLines: 3,
                          maxLength: 500,
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
                                onPressed: _isLoading ? null : _saveField,
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
                                    : Text(isEditing ? 'Update Field' : 'Add Field'),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                
                if (isEditing) ...[
                  SizedBox(height: 20),
                  Card(
                    color: Colors.red.shade50,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            'Danger Zone',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.red.shade700,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Deleting a field will also remove all associated crops, tasks, and expenses.',
                            style: TextStyle(color: Colors.red.shade600),
                          ),
                          SizedBox(height: 16),
                          OutlinedButton.icon(
                            onPressed: _isLoading ? null : _showDeleteConfirmation,
                            icon: Icon(Icons.delete_forever),
                            label: Text('Delete Field'),
                            style: OutlinedButton.styleFrom(
                              foregroundColor: Colors.red,
                              side: BorderSide(color: Colors.red),
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

  void _getCurrentLocation() {
    // TODO: Implement GPS location retrieval
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('GPS location feature coming soon!'),
        backgroundColor: Colors.blue,
      ),
    );
  }

  Future<void> _saveField() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() => _isLoading = true);

    try {
      final provider = Provider.of<AppProvider>(context, listen: false);
      final userId = provider.currentUser?.id ?? 'demo_user';
      
      final field = FieldModel(
        id: widget.field?.id ?? DateTime.now().millisecondsSinceEpoch.toString(),
        userId: userId,
        name: _nameController.text.trim(),
        sizeHectares: double.parse(_sizeController.text.trim()),
        soilType: _soilTypeController.text,
        gpsCoordinates: _gpsController.text.trim(),
        createdAt: widget.field?.createdAt ?? DateTime.now(),
        lastUpdated: DateTime.now(),
        description: _descriptionController.text.trim().isEmpty 
            ? null 
            : _descriptionController.text.trim(),
      );

      await widget.onSave(field);
      Navigator.pop(context);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error saving field: $e'),
          backgroundColor: Colors.red,
        ),
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }

  void _showDeleteConfirmation() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Delete Field'),
        content: Text(
          'Are you sure you want to delete "${widget.field?.name}"? '
          'This will also delete all associated crops, tasks, and expenses. '
          'This action cannot be undone.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context); // Close dialog
              Navigator.pop(context); // Close form
              // TODO: Implement delete functionality
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            child: Text('Delete'),
          ),
        ],
      ),
    );
  }
}
