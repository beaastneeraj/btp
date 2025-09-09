import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/app_provider.dart';
import '../repositories/crop_repository.dart';
import '../models/crop_model.dart';
import '../widgets/loading_widget.dart';
import '../widgets/error_widget.dart';
import 'crop_form_screen.dart';

class CropsScreen extends StatefulWidget {
  @override
  State<CropsScreen> createState() => _CropsScreenState();
}

class _CropsScreenState extends State<CropsScreen> {
  final CropRepository _cropRepository = CropRepository();
  String _searchQuery = '';
  String _sortBy = 'name';
  String _filterBy = 'all';

  @override
  void initState() {
    super.initState();
    _loadCrops();
  }

  Future<void> _loadCrops() async {
    final provider = Provider.of<AppProvider>(context, listen: false);
    try {
      provider.setLoading(true);
      
      // Load crops for all user's fields
      List<CropModel> allCrops = [];
      for (final field in provider.fields) {
        final fieldCrops = await _cropRepository.getCrops(field.id);
        allCrops.addAll(fieldCrops);
      }
      
      provider.setCrops(allCrops);
    } catch (e) {
      provider.setError('Failed to load crops: $e');
    } finally {
      provider.setLoading(false);
    }
  }

  List<CropModel> get _filteredCrops {
    final provider = Provider.of<AppProvider>(context);
    var crops = provider.crops.where((crop) {
      final matchesSearch = crop.cropName.toLowerCase().contains(_searchQuery.toLowerCase()) ||
                           crop.variety.toLowerCase().contains(_searchQuery.toLowerCase());
      
      final matchesFilter = _filterBy == 'all' || 
                           (_filterBy == 'harvested' && crop.harvestDate != null) ||
                           (_filterBy == 'growing' && crop.harvestDate == null);
      
      return matchesSearch && matchesFilter;
    }).toList();

    // Sort crops
    switch (_sortBy) {
      case 'name':
        crops.sort((a, b) => a.cropName.compareTo(b.cropName));
        break;
      case 'planting_date':
        crops.sort((a, b) => b.plantingDate.compareTo(a.plantingDate));
        break;
      case 'harvest_date':
        crops.sort((a, b) {
          if (a.harvestDate == null && b.harvestDate == null) return 0;
          if (a.harvestDate == null) return 1;
          if (b.harvestDate == null) return -1;
          return b.harvestDate!.compareTo(a.harvestDate!);
        });
        break;
    }

    return crops;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crops Management', style: TextStyle(fontWeight: FontWeight.bold)),
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
              PopupMenuItem(value: 'planting_date', child: Text('Sort by Planting Date')),
              PopupMenuItem(value: 'harvest_date', child: Text('Sort by Harvest Date')),
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
            // Search and Filter Bar
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Search crops...',
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
                  SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        child: _buildFilterChip('All', 'all'),
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        child: _buildFilterChip('Growing', 'growing'),
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        child: _buildFilterChip('Harvested', 'harvested'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            
            // Crops List
            Expanded(
              child: Consumer<AppProvider>(
                builder: (context, provider, child) {
                  if (provider.isLoading) {
                    return LoadingWidget(message: 'Loading crops...');
                  }

                  if (provider.error != null) {
                    return ErrorWidgetCustom(error: provider.error!);
                  }

                  final filteredCrops = _filteredCrops;

                  if (filteredCrops.isEmpty) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.eco, size: 64, color: Colors.grey),
                          SizedBox(height: 16),
                          Text(
                            _searchQuery.isEmpty && _filterBy == 'all'
                                ? 'No crops planted yet'
                                : 'No crops found',
                            style: TextStyle(fontSize: 18, color: Colors.grey[600]),
                          ),
                          SizedBox(height: 16),
                          if (_searchQuery.isEmpty && _filterBy == 'all')
                            ElevatedButton.icon(
                              onPressed: () => _navigateToAddCrop(),
                              icon: Icon(Icons.add),
                              label: Text('Plant Your First Crop'),
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
                    onRefresh: _loadCrops,
                    child: ListView.builder(
                      padding: EdgeInsets.all(16),
                      itemCount: filteredCrops.length,
                      itemBuilder: (context, index) {
                        final crop = filteredCrops[index];
                        return _buildCropCard(crop);
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
        onPressed: _navigateToAddCrop,
        icon: Icon(Icons.add),
        label: Text('Plant Crop'),
        backgroundColor: Colors.green.shade700,
        foregroundColor: Colors.white,
      ),
    );
  }

  Widget _buildFilterChip(String label, String value) {
    final isSelected = _filterBy == value;
    return FilterChip(
      label: Text(label),
      selected: isSelected,
      onSelected: (selected) => setState(() => _filterBy = value),
      selectedColor: Colors.green.shade200,
      backgroundColor: Colors.white,
      checkmarkColor: Colors.green.shade700,
    );
  }

  Widget _buildCropCard(CropModel crop) {
    final provider = Provider.of<AppProvider>(context, listen: false);
    final field = provider.fields.firstWhere(
      (f) => f.id == crop.fieldId,
      orElse: () => provider.fields.first,
    );
    
    final isHarvested = crop.harvestDate != null;
    final daysSincePlanting = DateTime.now().difference(crop.plantingDate).inDays;
    
    return Card(
      margin: EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 6,
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () => _navigateToEditCrop(crop),
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
                      color: isHarvested ? Colors.orange.shade100 : Colors.green.shade100,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(
                      isHarvested ? Icons.agriculture : Icons.eco,
                      color: isHarvested ? Colors.orange.shade700 : Colors.green.shade700,
                      size: 24,
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          crop.cropName,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Variety: ${crop.variety}',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: isHarvested ? Colors.orange.shade200 : Colors.green.shade200,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      isHarvested ? 'Harvested' : 'Growing',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: isHarvested ? Colors.orange.shade800 : Colors.green.shade800,
                      ),
                    ),
                  ),
                  PopupMenuButton<String>(
                    onSelected: (value) {
                      if (value == 'edit') {
                        _navigateToEditCrop(crop);
                      } else if (value == 'harvest') {
                        _markAsHarvested(crop);
                      } else if (value == 'delete') {
                        _showDeleteDialog(crop);
                      }
                    },
                    itemBuilder: (context) => [
                      PopupMenuItem(value: 'edit', child: Text('Edit')),
                      if (!isHarvested)
                        PopupMenuItem(value: 'harvest', child: Text('Mark as Harvested')),
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
                  _buildInfoChip(Icons.landscape, field.name),
                  SizedBox(width: 8),
                  _buildInfoChip(
                    Icons.calendar_today, 
                    'Planted: ${_formatDate(crop.plantingDate)}'
                  ),
                ],
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  _buildInfoChip(Icons.timer, '$daysSincePlanting days ago'),
                  if (isHarvested) ...[
                    SizedBox(width: 8),
                    _buildInfoChip(
                      Icons.agriculture, 
                      'Harvested: ${_formatDate(crop.harvestDate!)}'
                    ),
                  ],
                  if (crop.yield != null) ...[
                    SizedBox(width: 8),
                    _buildInfoChip(Icons.scale, '${crop.yield} kg/ha'),
                  ],
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

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }

  void _navigateToAddCrop() {
    final provider = Provider.of<AppProvider>(context, listen: false);
    if (provider.fields.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please add a field first before planting crops'),
          backgroundColor: Colors.orange,
        ),
      );
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CropFormScreen(
          onSave: _handleCropSave,
        ),
      ),
    );
  }

  void _navigateToEditCrop(CropModel crop) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CropFormScreen(
          crop: crop,
          onSave: _handleCropSave,
        ),
      ),
    );
  }

  Future<void> _handleCropSave(CropModel crop) async {
    final provider = Provider.of<AppProvider>(context, listen: false);
    try {
      provider.setLoading(true);
      
      if (provider.crops.any((c) => c.id == crop.id)) {
        await _cropRepository.updateCrop(crop);
        provider.updateCrop(crop);
      } else {
        await _cropRepository.addCrop(crop);
        provider.addCrop(crop);
      }
      
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Crop saved successfully'),
          backgroundColor: Colors.green,
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to save crop: $e'),
          backgroundColor: Colors.red,
        ),
      );
    } finally {
      provider.setLoading(false);
    }
  }

  Future<void> _markAsHarvested(CropModel crop) async {
    final harvestedCrop = crop.copyWith(harvestDate: DateTime.now());
    await _handleCropSave(harvestedCrop);
  }

  void _showDeleteDialog(CropModel crop) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Delete Crop'),
        content: Text('Are you sure you want to delete "${crop.cropName}"? This action cannot be undone.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              _deleteCrop(crop);
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            child: Text('Delete'),
          ),
        ],
      ),
    );
  }

  Future<void> _deleteCrop(CropModel crop) async {
    final provider = Provider.of<AppProvider>(context, listen: false);
    try {
      provider.setLoading(true);
      await _cropRepository.deleteCrop(crop.id);
      provider.removeCrop(crop.id);
      
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Crop deleted successfully'),
          backgroundColor: Colors.orange,
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to delete crop: $e'),
          backgroundColor: Colors.red,
        ),
      );
    } finally {
      provider.setLoading(false);
    }
  }
}
