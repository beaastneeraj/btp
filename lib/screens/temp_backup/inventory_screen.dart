import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/inventory_model.dart';
import '../providers/app_provider.dart';
import 'inventory_form_screen.dart';

class InventoryScreen extends StatefulWidget {
  @override
  State<InventoryScreen> createState() => _InventoryScreenState();
}

class _InventoryScreenState extends State<InventoryScreen> {
  final _searchController = TextEditingController();
  String _selectedCategory = 'All';
  String _selectedStatus = 'All';
  String _sortBy = 'name';
  bool _sortAscending = true;
  
  final List<String> _categories = [
    'All',
    'Seeds',
    'Fertilizers',
    'Pesticides',
    'Tools',
    'Equipment',
    'Machinery',
    'Irrigation Supplies',
    'Other'
  ];

  final List<String> _statusOptions = [
    'All',
    'In Stock',
    'Low Stock',
    'Out of Stock'
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<AppProvider>(context, listen: false).loadInventory();
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
          'Inventory',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.purple.shade700,
        foregroundColor: Colors.white,
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(24)),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.qr_code_scanner),
            onPressed: () {
              // TODO: Implement barcode scanning
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Barcode scanning coming soon!')),
              );
            },
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.purple.shade400, Colors.pink.shade200],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          children: [
            _buildFiltersCard(),
            Expanded(child: _buildInventoryList()),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addInventoryItem,
        backgroundColor: Colors.purple.shade700,
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
                hintText: 'Search inventory...',
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
                SizedBox(width: 8),
                
                // Status Filter
                Expanded(
                  child: DropdownButtonFormField<String>(
                    value: _selectedStatus,
                    decoration: InputDecoration(
                      labelText: 'Status',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      filled: true,
                      fillColor: Colors.grey[50],
                    ),
                    items: _statusOptions.map((status) => DropdownMenuItem(
                      value: status,
                      child: Text(status),
                    )).toList(),
                    onChanged: (value) => setState(() => _selectedStatus = value!),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            
            Row(
              children: [
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
                      DropdownMenuItem(value: 'name', child: Text('Name')),
                      DropdownMenuItem(value: 'quantity', child: Text('Quantity')),
                      DropdownMenuItem(value: 'category', child: Text('Category')),
                      DropdownMenuItem(value: 'location', child: Text('Location')),
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

  Widget _buildInventoryList() {
    return Consumer<AppProvider>(
      builder: (context, provider, child) {
        if (provider.isLoading) {
          return Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.purple.shade700),
            ),
          );
        }

        if (provider.inventory.isEmpty) {
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
                      Icons.inventory_2,
                      size: 64,
                      color: Colors.purple.shade300,
                    ),
                    SizedBox(height: 16),
                    Text(
                      'No Inventory Items',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.purple.shade700,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Start managing your farm inventory',
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  ],
                ),
              ),
            ),
          );
        }

        final filteredInventory = _getFilteredInventory(provider.inventory);

        return ListView.builder(
          padding: EdgeInsets.all(16),
          itemCount: filteredInventory.length,
          itemBuilder: (context, index) {
            final item = filteredInventory[index];
            return _buildInventoryCard(item);
          },
        );
      },
    );
  }

  Widget _buildInventoryCard(InventoryModel item) {
    final categoryColor = _getCategoryColor(item.category);
    final statusInfo = _getStatusInfo(item.quantity, item.lowStockThreshold);
    
    return Card(
      margin: EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 4,
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: () => _editInventoryItem(item),
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
                        item.name,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: statusInfo['color'].withOpacity(0.1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        statusInfo['text'],
                        style: TextStyle(
                          color: statusInfo['color'],
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12),
                
                Row(
                  children: [
                    // Quantity
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: Colors.blue.shade50,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.inventory, size: 16, color: Colors.blue.shade700),
                          SizedBox(width: 4),
                          Text(
                            '${item.quantity.toInt()} ${item.unit}',
                            style: TextStyle(
                              color: Colors.blue.shade700,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 12),
                    
                    // Category
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: categoryColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        item.category,
                        style: TextStyle(
                          color: categoryColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
                
                if (item.location.isNotEmpty) ...[
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.location_on, size: 16, color: Colors.grey[600]),
                      SizedBox(width: 4),
                      Text(
                        'Location: ${item.location}',
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ],
                
                if (item.description.isNotEmpty) ...[
                  SizedBox(height: 8),
                  Text(
                    item.description,
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 14,
                    ),
                  ),
                ],
                
                if (item.lowStockThreshold > 0 && item.quantity <= item.lowStockThreshold) ...[
                  SizedBox(height: 12),
                  Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.orange.shade50,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.orange.shade200),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.warning, color: Colors.orange.shade700, size: 20),
                        SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            'Low stock alert! Threshold: ${item.lowStockThreshold.toInt()} ${item.unit}',
                            style: TextStyle(
                              color: Colors.orange.shade700,
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
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

  Color _getCategoryColor(String category) {
    switch (category.toLowerCase()) {
      case 'seeds': return Colors.green;
      case 'fertilizers': return Colors.brown;
      case 'pesticides': return Colors.red;
      case 'tools': return Colors.grey;
      case 'equipment': return Colors.blue;
      case 'machinery': return Colors.indigo;
      case 'irrigation supplies': return Colors.cyan;
      default: return Colors.purple;
    }
  }

  Map<String, dynamic> _getStatusInfo(double quantity, double threshold) {
    if (quantity <= 0) {
      return {'text': 'Out of Stock', 'color': Colors.red};
    } else if (threshold > 0 && quantity <= threshold) {
      return {'text': 'Low Stock', 'color': Colors.orange};
    } else {
      return {'text': 'In Stock', 'color': Colors.green};
    }
  }

  List<InventoryModel> _getFilteredInventory(List<InventoryModel> inventory) {
    var filtered = inventory.where((item) {
      // Search filter
      final searchLower = _searchController.text.toLowerCase();
      final matchesSearch = searchLower.isEmpty ||
          item.name.toLowerCase().contains(searchLower) ||
          item.category.toLowerCase().contains(searchLower) ||
          item.location.toLowerCase().contains(searchLower) ||
          item.description.toLowerCase().contains(searchLower);

      // Category filter
      final matchesCategory = _selectedCategory == 'All' || 
          item.category == _selectedCategory;

      // Status filter
      bool matchesStatus = true;
      if (_selectedStatus != 'All') {
        final statusInfo = _getStatusInfo(item.quantity, item.lowStockThreshold);
        matchesStatus = statusInfo['text'] == _selectedStatus;
      }

      return matchesSearch && matchesCategory && matchesStatus;
    }).toList();

    // Sort
    filtered.sort((a, b) {
      int comparison;
      switch (_sortBy) {
        case 'quantity':
          comparison = a.quantity.compareTo(b.quantity);
          break;
        case 'category':
          comparison = a.category.compareTo(b.category);
          break;
        case 'location':
          comparison = a.location.compareTo(b.location);
          break;
        case 'name':
        default:
          comparison = a.name.compareTo(b.name);
          break;
      }
      return _sortAscending ? comparison : -comparison;
    });

    return filtered;
  }

  void _addInventoryItem() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => InventoryFormScreen(
          onSave: (item) async {
            final provider = Provider.of<AppProvider>(context, listen: false);
            await provider.addInventoryItem(item);
          },
        ),
      ),
    );
  }

  void _editInventoryItem(InventoryModel item) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => InventoryFormScreen(
          item: item,
          onSave: (updatedItem) async {
            final provider = Provider.of<AppProvider>(context, listen: false);
            await provider.updateInventoryItem(updatedItem);
          },
        ),
      ),
    );
  }
}
