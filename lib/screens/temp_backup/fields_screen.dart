import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/app_provider.dart';
import '../repositories/field_repository.dart';
import '../models/field_model.dart';
import '../widgets/loading_widget.dart';
import '../widgets/error_widget.dart';
import 'field_form_screen.dart';

class FieldsScreen extends StatefulWidget {
  @override
  State<FieldsScreen> createState() => _FieldsScreenState();
}

class _FieldsScreenState extends State<FieldsScreen> {
  final FieldRepository _fieldRepository = FieldRepository();
  String _searchQuery = '';
  String _sortBy = 'name';

  @override
  void initState() {
    super.initState();
    _loadFields();
  }

  Future<void> _loadFields() async {
    final provider = Provider.of<AppProvider>(context, listen: false);
    try {
      provider.setLoading(true);
      final userId = provider.currentUser?.id ?? 'demo_user';
      final fields = await _fieldRepository.getFields(userId);
      provider.setFields(fields);
    } catch (e) {
      provider.setError('Failed to load fields: $e');
    } finally {
      provider.setLoading(false);
    }
  }

  List<FieldModel> get _filteredFields {
    final provider = Provider.of<AppProvider>(context);
    var fields = provider.fields.where((field) {
      return field.name.toLowerCase().contains(_searchQuery.toLowerCase()) ||
             field.soilType.toLowerCase().contains(_searchQuery.toLowerCase());
    }).toList();

    // Sort fields
    switch (_sortBy) {
      case 'name':
        fields.sort((a, b) => a.name.compareTo(b.name));
        break;
      case 'size':
        fields.sort((a, b) => b.sizeHectares.compareTo(a.sizeHectares));
        break;
      case 'date':
        fields.sort((a, b) => b.createdAt.compareTo(a.createdAt));
        break;
    }

    return fields;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fields Management', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.green.shade700,
        foregroundColor: Colors.white,
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(24)),
        ),
        actions: [
          PopupMenuButton<String>(
            icon: Icon(Icons.sort),
            onSelected: (value) => setState(() => _sortBy = value),
            itemBuilder: (context) => [
              PopupMenuItem(value: 'name', child: Text('Sort by Name')),
              PopupMenuItem(value: 'size', child: Text('Sort by Size')),
              PopupMenuItem(value: 'date', child: Text('Sort by Date')),
            ],
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.green.shade400, Colors.blue.shade200],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          children: [
            // Search Bar
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search fields...',
                  prefixIcon: Icon(Icons.search),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide.none,
                  ),
                ),
                onChanged: (value) => setState(() => _searchQuery = value),
              ),
            ),
            // Fields List
            Expanded(
              child: Consumer<AppProvider>(
                builder: (context, provider, child) {
                  if (provider.isLoading) {
                    return LoadingWidget(message: 'Loading fields...');
                  }

                  if (provider.error != null) {
                    return ErrorWidgetCustom(error: provider.error!);
                  }

                  final filteredFields = _filteredFields;

                  if (filteredFields.isEmpty) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.grass, size: 64, color: Colors.grey),
                          SizedBox(height: 16),
                          Text(
                            _searchQuery.isEmpty 
                                ? 'No fields added yet'
                                : 'No fields found matching "$_searchQuery"',
                            style: TextStyle(fontSize: 18, color: Colors.grey[600]),
                          ),
                          SizedBox(height: 16),
                          if (_searchQuery.isEmpty)
                            ElevatedButton.icon(
                              onPressed: () => _navigateToAddField(),
                              icon: Icon(Icons.add),
                              label: Text('Add Your First Field'),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green.shade700,
                                foregroundColor: Colors.white,
                              ),
                            ),
                        ],
                      ),
                    );
                  }

                  return RefreshIndicator(
                    onRefresh: _loadFields,
                    child: ListView.builder(
                      padding: EdgeInsets.all(16),
                      itemCount: filteredFields.length,
                      itemBuilder: (context, index) {
                        final field = filteredFields[index];
                        return _buildFieldCard(field);
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _navigateToAddField,
        icon: Icon(Icons.add),
        label: Text('Add Field'),
        backgroundColor: Colors.green.shade700,
        foregroundColor: Colors.white,
      ),
    );
  }

  Widget _buildFieldCard(FieldModel field) {
    return Card(
      margin: EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 6,
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () => _navigateToEditField(field),
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.green.shade100,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(Icons.grass, color: Colors.green.shade700, size: 24),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          field.name,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          '${field.sizeHectares} hectares',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ),
                  PopupMenuButton<String>(
                    onSelected: (value) {
                      if (value == 'edit') {
                        _navigateToEditField(field);
                      } else if (value == 'delete') {
                        _showDeleteDialog(field);
                      }
                    },
                    itemBuilder: (context) => [
                      PopupMenuItem(value: 'edit', child: Text('Edit')),
                      PopupMenuItem(value: 'delete', child: Text('Delete')),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 12),
              Divider(),
              SizedBox(height: 8),
              Row(
                children: [
                  _buildInfoChip(Icons.terrain, field.soilType),
                  SizedBox(width: 8),
                  _buildInfoChip(Icons.location_on, 'GPS: ${field.gpsCoordinates}'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoChip(IconData icon, String label) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: Colors.grey[600]),
          SizedBox(width: 4),
          Text(
            label,
            style: TextStyle(fontSize: 12, color: Colors.grey[600]),
          ),
        ],
      ),
    );
  }

  void _navigateToAddField() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FieldFormScreen(
          onSave: _handleFieldSave,
        ),
      ),
    );
  }

  void _navigateToEditField(FieldModel field) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FieldFormScreen(
          field: field,
          onSave: _handleFieldSave,
        ),
      ),
    );
  }

  Future<void> _handleFieldSave(FieldModel field) async {
    final provider = Provider.of<AppProvider>(context, listen: false);
    try {
      provider.setLoading(true);
      
      if (provider.fields.any((f) => f.id == field.id)) {
        await _fieldRepository.updateField(field);
        provider.updateField(field);
      } else {
        await _fieldRepository.addField(field);
        provider.addField(field);
      }
      
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Field saved successfully'),
          backgroundColor: Colors.green,
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to save field: $e'),
          backgroundColor: Colors.red,
        ),
      );
    } finally {
      provider.setLoading(false);
    }
  }

  void _showDeleteDialog(FieldModel field) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Delete Field'),
        content: Text('Are you sure you want to delete "${field.name}"? This action cannot be undone.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              _deleteField(field);
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            child: Text('Delete'),
          ),
        ],
      ),
    );
  }

  Future<void> _deleteField(FieldModel field) async {
    final provider = Provider.of<AppProvider>(context, listen: false);
    try {
      provider.setLoading(true);
      await _fieldRepository.deleteField(field.id);
      provider.removeField(field.id);
      
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Field deleted successfully'),
          backgroundColor: Colors.orange,
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to delete field: $e'),
          backgroundColor: Colors.red,
        ),
      );
    } finally {
      provider.setLoading(false);
    }
  }
}
