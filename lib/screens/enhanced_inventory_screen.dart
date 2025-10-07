import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../themes/material3_theme.dart';

// Material 3 Enhanced Inventory Screen
class EnhancedInventoryScreen extends ConsumerStatefulWidget {
  const EnhancedInventoryScreen({super.key});

  @override
  ConsumerState<EnhancedInventoryScreen> createState() => _EnhancedInventoryScreenState();
}

class _EnhancedInventoryScreenState extends ConsumerState<EnhancedInventoryScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;
  late AnimationController _animationController;
  late Animation<double> _slideAnimation;
  
  String _searchQuery = '';
  String _selectedCategory = 'All';
  bool _showOnlyLowStock = false;
  
  final List<String> _categories = [
    'All', 'Seeds', 'Fertilizers', 'Pesticides', 'Tools', 'Equipment'
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _animationController = AnimationController(
      duration: Duration(milliseconds: 600),
      vsync: this,
    );
    _slideAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOutCubic),
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _tabController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final filteredItems = _getFilteredItems();

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: _buildAppBar(colorScheme),
      body: Column(
        children: [
          _buildSearchAndFilters(colorScheme),
          _buildTabBar(colorScheme),
          Expanded(
            child: SlideTransition(
              position: Tween<Offset>(
                begin: Offset(0, 0.1),
                end: Offset.zero,
              ).animate(_slideAnimation),
              child: FadeTransition(
                opacity: _slideAnimation,
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    _buildInventoryTab(filteredItems, colorScheme),
                    _buildAnalyticsTab(colorScheme),
                    _buildOrdersTab(colorScheme),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: _buildFAB(colorScheme),
    );
  }

  PreferredSizeWidget _buildAppBar(ColorScheme colorScheme) {
    return AppBar(
      title: Text(
        'Farm Inventory',
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
          fontWeight: FontWeight.w600,
        ),
      ),
      backgroundColor: colorScheme.surface,
      elevation: 0,
      actions: [
        IconButton(
          onPressed: () => _showSortOptions(colorScheme),
          icon: Icon(Icons.sort),
          tooltip: 'Sort options',
        ),
        IconButton(
          onPressed: () => _showFilterOptions(colorScheme),
          icon: Icon(Icons.filter_list),
          tooltip: 'Filter options',
        ),
      ],
    );
  }

  Widget _buildSearchAndFilters(ColorScheme colorScheme) {
    return M3Card(
      margin: EdgeInsets.all(16),
      child: Column(
        children: [
          // Search Field
          TextField(
            onChanged: (value) => setState(() => _searchQuery = value),
            decoration: InputDecoration(
              hintText: 'Search inventory...',
              prefixIcon: Icon(Icons.search),
              filled: true,
              fillColor: colorScheme.surfaceContainerHighest,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          SizedBox(height: 12),
          
          // Category Filter
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: _categories.map((category) {
                final isSelected = _selectedCategory == category;
                return Padding(
                  padding: EdgeInsets.only(right: 8),
                  child: M3Chip(
                    label: category,
                    selected: isSelected,
                    onTap: () => setState(() => _selectedCategory = category),
                  ),
                );
              }).toList(),
            ),
          ),
          SizedBox(height: 8),
          
          // Low Stock Toggle
          Row(
            children: [
              Switch(
                value: _showOnlyLowStock,
                onChanged: (value) => setState(() => _showOnlyLowStock = value),
              ),
              SizedBox(width: 8),
              Text(
                'Show only low stock items',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTabBar(ColorScheme colorScheme) {
    return TabBar(
      controller: _tabController,
      labelColor: colorScheme.primary,
      unselectedLabelColor: colorScheme.onSurfaceVariant,
      indicatorColor: colorScheme.primary,
      tabs: [
        Tab(text: 'Inventory', icon: Icon(Icons.inventory)),
        Tab(text: 'Analytics', icon: Icon(Icons.analytics)),
        Tab(text: 'Orders', icon: Icon(Icons.shopping_cart)),
      ],
    );
  }

  Widget _buildInventoryTab(List<InventoryItem> items, ColorScheme colorScheme) {
    if (items.isEmpty) {
      return _buildEmptyState(colorScheme);
    }

    return ListView.builder(
      padding: EdgeInsets.all(16),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return _buildInventoryCard(item, colorScheme, index);
      },
    );
  }

  Widget _buildInventoryCard(InventoryItem item, ColorScheme colorScheme, int index) {
    return TweenAnimationBuilder<double>(
      duration: Duration(milliseconds: 300 + (index * 50)),
      tween: Tween(begin: 0, end: 1),
      builder: (context, value, child) {
        return Transform.translate(
          offset: Offset(0, 20 * (1 - value)),
          child: Opacity(
            opacity: value,
            child: M3Card(
              margin: EdgeInsets.only(bottom: 12),
              child: InkWell(
                onTap: () => _showItemDetails(item, colorScheme),
                borderRadius: BorderRadius.circular(12),
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Row(
                    children: [
                      // Item Image/Icon
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          color: colorScheme.primaryContainer,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Icon(
                          _getCategoryIcon(item.category),
                          color: colorScheme.onPrimaryContainer,
                          size: 30,
                        ),
                      ),
                      SizedBox(width: 16),
                      
                      // Item Details
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    item.name,
                                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                if (item.isLowStock)
                                  Container(
                                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                    decoration: BoxDecoration(
                                      color: colorScheme.errorContainer,
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(Icons.warning, size: 12, color: colorScheme.onErrorContainer),
                                        SizedBox(width: 4),
                                        Text(
                                          'Low Stock',
                                          style: Theme.of(context).textTheme.labelSmall?.copyWith(
                                            color: colorScheme.onErrorContainer,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                              ],
                            ),
                            SizedBox(height: 4),
                            Text(
                              item.category,
                              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                color: colorScheme.onSurfaceVariant,
                              ),
                            ),
                            SizedBox(height: 8),
                            Row(
                              children: [
                                Expanded(
                                  child: _buildMetricChip(
                                    '${item.quantity.toStringAsFixed(0)} ${item.unit}',
                                    Icons.inventory_2,
                                    colorScheme,
                                  ),
                                ),
                                SizedBox(width: 8),
                                Expanded(
                                  child: _buildMetricChip(
                                    'Min: ${item.minThreshold.toStringAsFixed(0)}',
                                    Icons.warning_amber,
                                    colorScheme,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      
                      // Actions
                      PopupMenuButton<String>(
                        onSelected: (action) => _handleItemAction(action, item),
                        itemBuilder: (context) => [
                          PopupMenuItem(value: 'edit', child: Text('Edit')),
                          PopupMenuItem(value: 'reorder', child: Text('Reorder')),
                          PopupMenuItem(value: 'delete', child: Text('Delete')),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildMetricChip(String text, IconData icon, ColorScheme colorScheme) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: colorScheme.onSurfaceVariant),
          SizedBox(width: 4),
          Flexible(
            child: Text(
              text,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState(ColorScheme colorScheme) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.inventory_2_outlined,
            size: 80,
            color: colorScheme.onSurfaceVariant,
          ),
          SizedBox(height: 16),
          Text(
            'No items found',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Add items to your inventory to get started',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAnalyticsTab(ColorScheme colorScheme) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          M3Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Inventory Analytics',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                SizedBox(height: 16),
                // Analytics content placeholder
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                    color: colorScheme.surfaceContainerHighest,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Text(
                      'Analytics charts will be displayed here',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOrdersTab(ColorScheme colorScheme) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          M3Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Purchase Orders',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                SizedBox(height: 16),
                Text(
                  'No pending orders',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFAB(ColorScheme colorScheme) {
    return FloatingActionButton.extended(
      onPressed: () => _showAddItemDialog(colorScheme),
      label: Text('Add Item'),
      icon: Icon(Icons.add),
      backgroundColor: colorScheme.primary,
      foregroundColor: colorScheme.onPrimary,
    );
  }

  List<InventoryItem> _getFilteredItems() {
    List<InventoryItem> items = _sampleInventoryItems;
    
    // Apply category filter
    if (_selectedCategory != 'All') {
      items = items.where((item) => item.category == _selectedCategory).toList();
    }
    
    // Apply search filter
    if (_searchQuery.isNotEmpty) {
      items = items.where((item) => 
        item.name.toLowerCase().contains(_searchQuery.toLowerCase()) ||
        item.category.toLowerCase().contains(_searchQuery.toLowerCase())
      ).toList();
    }
    
    // Apply low stock filter
    if (_showOnlyLowStock) {
      items = items.where((item) => item.isLowStock).toList();
    }
    
    return items;
  }

  IconData _getCategoryIcon(String category) {
    switch (category) {
      case 'Seeds':
        return Icons.eco;
      case 'Fertilizers':
        return Icons.agriculture;
      case 'Pesticides':
        return Icons.bug_report;
      case 'Tools':
        return Icons.build;
      case 'Equipment':
        return Icons.precision_manufacturing;
      default:
        return Icons.inventory;
    }
  }

  void _showSortOptions(ColorScheme colorScheme) {
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Sort by', style: Theme.of(context).textTheme.titleMedium),
            SizedBox(height: 16),
            ListTile(
              leading: Icon(Icons.abc),
              title: Text('Name'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: Icon(Icons.category),
              title: Text('Category'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: Icon(Icons.inventory_2),
              title: Text('Quantity'),
              onTap: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
    );
  }

  void _showFilterOptions(ColorScheme colorScheme) {
    // Filter options implementation
  }

  void _showItemDetails(InventoryItem item, ColorScheme colorScheme) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(item.name),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Category: ${item.category}'),
            Text('Quantity: ${item.quantity} ${item.unit}'),
            Text('Minimum: ${item.minThreshold} ${item.unit}'),
            Text('Last Updated: ${DateFormat.yMd().format(item.lastUpdated)}'),
            if (item.description != null)
              Text('Description: ${item.description}'),
          ],
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

  void _showAddItemDialog(ColorScheme colorScheme) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Add New Item'),
        content: Text('Item creation form will be implemented here'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Add'),
          ),
        ],
      ),
    );
  }

  void _handleItemAction(String action, InventoryItem item) {
    switch (action) {
      case 'edit':
        // Edit item implementation
        break;
      case 'reorder':
        // Reorder item implementation
        break;
      case 'delete':
        // Delete item implementation
        break;
    }
  }
}

// Sample data model
class InventoryItem {
  final String id;
  final String name;
  final String category;
  final double quantity;
  final String unit;
  final double minThreshold;
  final DateTime lastUpdated;
  final String? description;

  InventoryItem({
    required this.id,
    required this.name,
    required this.category,
    required this.quantity,
    required this.unit,
    required this.minThreshold,
    required this.lastUpdated,
    this.description,
  });

  bool get isLowStock => quantity <= minThreshold;
}

// Sample inventory data
final List<InventoryItem> _sampleInventoryItems = [
  InventoryItem(
    id: '1',
    name: 'Wheat Seeds',
    category: 'Seeds',
    quantity: 250,
    unit: 'kg',
    minThreshold: 50,
    lastUpdated: DateTime.now().subtract(Duration(days: 2)),
    description: 'High-quality wheat seeds for winter crop',
  ),
  InventoryItem(
    id: '2',
    name: 'NPK Fertilizer',
    category: 'Fertilizers',
    quantity: 15,
    unit: 'bags',
    minThreshold: 20,
    lastUpdated: DateTime.now().subtract(Duration(days: 5)),
    description: 'Nitrogen-Phosphorus-Potassium fertilizer',
  ),
  InventoryItem(
    id: '3',
    name: 'Pesticide Spray',
    category: 'Pesticides',
    quantity: 8,
    unit: 'bottles',
    minThreshold: 10,
    lastUpdated: DateTime.now().subtract(Duration(days: 1)),
    description: 'Organic pesticide for crop protection',
  ),
  InventoryItem(
    id: '4',
    name: 'Hand Cultivator',
    category: 'Tools',
    quantity: 5,
    unit: 'pieces',
    minThreshold: 2,
    lastUpdated: DateTime.now().subtract(Duration(days: 10)),
    description: 'Manual hand tool for soil cultivation',
  ),
  InventoryItem(
    id: '5',
    name: 'Water Pump',
    category: 'Equipment',
    quantity: 2,
    unit: 'units',
    minThreshold: 1,
    lastUpdated: DateTime.now().subtract(Duration(days: 7)),
    description: 'Electric water pump for irrigation',
  ),
];