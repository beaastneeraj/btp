import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/animated_widgets.dart';
import '../widgets/shared_components.dart';
import '../providers/theme_provider.dart';

// Inventory Item Model
class InventoryItem {
  final String id;
  final String name;
  final String category;
  final double quantity;
  final String unit;
  final double minThreshold;
  final DateTime lastUpdated;
  final String? description;
  final String? imageUrl;

  InventoryItem({
    required this.id,
    required this.name,
    required this.category,
    required this.quantity,
    required this.unit,
    required this.minThreshold,
    required this.lastUpdated,
    this.description,
    this.imageUrl,
  });

  bool get isLowStock => quantity <= minThreshold;

  InventoryItem copyWith({
    String? id,
    String? name,
    String? category,
    double? quantity,
    String? unit,
    double? minThreshold,
    DateTime? lastUpdated,
    String? description,
    String? imageUrl,
  }) {
    return InventoryItem(
      id: id ?? this.id,
      name: name ?? this.name,
      category: category ?? this.category,
      quantity: quantity ?? this.quantity,
      unit: unit ?? this.unit,
      minThreshold: minThreshold ?? this.minThreshold,
      lastUpdated: lastUpdated ?? this.lastUpdated,
      description: description ?? this.description,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }
}

// Providers
final inventoryItemsProvider = StateProvider<List<InventoryItem>>((ref) {
  final now = DateTime.now();
  return [
    InventoryItem(
      id: '1',
      name: 'Fertilizer NPK',
      category: 'Fertilizers',
      quantity: 25.5,
      unit: 'kg',
      minThreshold: 10.0,
      lastUpdated: now.subtract(const Duration(days: 2)),
      description: 'High-quality nitrogen, phosphorus, potassium fertilizer',
    ),
    InventoryItem(
      id: '2',
      name: 'Wheat Seeds',
      category: 'Seeds',
      quantity: 8.0,
      unit: 'kg',
      minThreshold: 15.0,
      lastUpdated: now.subtract(const Duration(days: 1)),
      description: 'Premium quality wheat seeds for planting',
    ),
    InventoryItem(
      id: '3',
      name: 'Pesticide Spray',
      category: 'Pesticides',
      quantity: 3.5,
      unit: 'liters',
      minThreshold: 5.0,
      lastUpdated: now.subtract(const Duration(hours: 12)),
      description: 'Organic pesticide for crop protection',
    ),
    InventoryItem(
      id: '4',
      name: 'Irrigation Pipes',
      category: 'Equipment',
      quantity: 45.0,
      unit: 'meters',
      minThreshold: 20.0,
      lastUpdated: now.subtract(const Duration(days: 5)),
      description: 'PVC pipes for irrigation system',
    ),
    InventoryItem(
      id: '5',
      name: 'Tomato Seeds',
      category: 'Seeds',
      quantity: 2.2,
      unit: 'kg',
      minThreshold: 3.0,
      lastUpdated: now.subtract(const Duration(days: 3)),
      description: 'Hybrid tomato seeds for greenhouse cultivation',
    ),
  ];
});

final selectedCategoryProvider = StateProvider<String>((ref) => 'All');
final searchQueryProvider = StateProvider<String>((ref) => '');
final sortByProvider = StateProvider<String>((ref) => 'name');

class InventoryScreen extends ConsumerStatefulWidget {
  const InventoryScreen({super.key});

  @override
  ConsumerState<InventoryScreen> createState() => _InventoryScreenState();
}

class _InventoryScreenState extends ConsumerState<InventoryScreen>
    with TickerProviderStateMixin, AppAnimationMixin {

  @override
  void initState() {
    super.initState();
    setupStandardAnimations();
    startStandardAnimations();
  }

  @override
  void dispose() {
    disposeStandardAnimations();
    super.dispose();
  }

  int _getCrossAxisCount(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth > 1200) return 4;
    if (screenWidth > 800) return 3;
    if (screenWidth > 600) return 2;
    return 1;
  }

  List<InventoryItem> _getFilteredItems() {
    final inventoryItems = ref.watch(inventoryItemsProvider);
    final selectedCategory = ref.watch(selectedCategoryProvider);
    final searchQuery = ref.watch(searchQueryProvider);
    final sortBy = ref.watch(sortByProvider);

    List<InventoryItem> filteredItems = inventoryItems.where((item) {
      final matchesCategory = selectedCategory == 'All' || item.category == selectedCategory;
      final matchesSearch = searchQuery.isEmpty || 
          item.name.toLowerCase().contains(searchQuery.toLowerCase()) ||
          item.category.toLowerCase().contains(searchQuery.toLowerCase());
      
      return matchesCategory && matchesSearch;
    }).toList();

    switch (sortBy) {
      case 'name':
        filteredItems.sort((a, b) => a.name.compareTo(b.name));
        break;
      case 'quantity':
        filteredItems.sort((a, b) => b.quantity.compareTo(a.quantity));
        break;
      case 'category':
        filteredItems.sort((a, b) => a.category.compareTo(b.category));
        break;
      case 'lowStock':
        filteredItems.sort((a, b) => a.isLowStock ? -1 : 1);
        break;
    }

    return filteredItems;
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final filteredItems = _getFilteredItems();
    final lowStockCount = filteredItems.where((item) => item.isLowStock).length;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: RefreshIndicator(
        onRefresh: () async {
          await Future.delayed(Duration(seconds: 1));
        },
        child: CustomScrollView(
          slivers: [
            StandardAppBar(
              title: 'Smart Inventory',
              subtitle: 'Track & Manage Farm Supplies',
              icon: Icons.inventory_2,
              statusChips: [
                StandardStatusChip(
                  label: '${filteredItems.length} Items',
                  icon: Icons.inventory,
                  color: Colors.blue,
                ),
                StandardStatusChip(
                  label: '$lowStockCount Low',
                  icon: Icons.warning,
                  color: lowStockCount > 0 ? Colors.orange : Colors.green,
                ),
                StandardStatusChip(
                  label: 'Updated',
                  icon: Icons.check_circle,
                  color: Colors.green,
                ),
              ],
              slideAnimation: headerSlideAnimation,
              fadeAnimation: headerFadeAnimation,
              colorScheme: colorScheme,
            ),
            SliverPadding(
              padding: const EdgeInsets.all(16),
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  _buildSearchAndFilters(colorScheme),
                  const SizedBox(height: 20),
                  _buildInventoryGrid(filteredItems, colorScheme),
                  const SizedBox(height: 100), // Space for FAB
                ]),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: StandardFloatingActionButton(
        label: 'Add Item',
        icon: Icons.add,
        onPressed: () => _showAddItemDialog(context),
        animation: floatingAnimation,
        colorScheme: colorScheme,
      ),
    );
  }

  Widget _buildSearchAndFilters(ColorScheme colorScheme) {
    return AnimatedCard(
      animation: cardStaggerAnimation,
      child: Card(
        elevation: 2,
        color: colorScheme.surfaceContainerHighest,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              // Search Bar
              Container(
                decoration: BoxDecoration(
                  color: colorScheme.surface,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TextField(
                  onChanged: (value) => ref.read(searchQueryProvider.notifier).state = value,
                  decoration: InputDecoration(
                    hintText: 'Search inventory...',
                    prefixIcon: Icon(Icons.search, color: colorScheme.onSurfaceVariant),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                    hintStyle: GoogleFonts.roboto(
                      color: colorScheme.onSurfaceVariant,
                      fontSize: 16,
                    ),
                  ),
                  style: GoogleFonts.roboto(
                    color: colorScheme.onSurface,
                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              
              // Filter Chips
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: ['All', 'Fertilizers', 'Seeds', 'Pesticides', 'Equipment']
                    .map((category) => _buildFilterChip(category, colorScheme))
                    .toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInventoryGrid(List<InventoryItem> items, ColorScheme colorScheme) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: _getCrossAxisCount(context),
        childAspectRatio: 0.85,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: items.length,
      itemBuilder: (context, index) {
        return AnimatedCard(
          animation: cardStaggerAnimation,
          delay: index,
          child: _buildInventoryCard(items[index], colorScheme),
        );
      },
    );
  }

  Widget _buildFilterChip(String category, ColorScheme colorScheme) {
    final selectedCategory = ref.watch(selectedCategoryProvider);
    final isSelected = category == selectedCategory;
    
    return FilterChip(
      label: Text(category),
      selected: isSelected,
      onSelected: (selected) {
        ref.read(selectedCategoryProvider.notifier).state = category;
      },
      backgroundColor: colorScheme.surface,
      selectedColor: colorScheme.primary.withOpacity(0.2),
      labelStyle: TextStyle(
        color: isSelected ? colorScheme.primary : colorScheme.onSurface,
        fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
      ),
    );
  }

  Widget _buildInventoryCard(InventoryItem item, ColorScheme colorScheme) {
    return Card(
      elevation: 4,
      color: colorScheme.surface,
      child: InkWell(
        onTap: () => _showItemDetails(item),
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header with icon and low stock indicator
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: _getCategoryColor(item.category).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      _getCategoryIcon(item.category),
                      color: _getCategoryColor(item.category),
                      size: 24,
                    ),
                  ),
                  const Spacer(),
                  if (item.isLowStock)
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.orange.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.warning, color: Colors.orange, size: 12),
                          const SizedBox(width: 4),
                          Text(
                            'Low',
                            style: TextStyle(
                              color: Colors.orange,
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 12),
              
              // Item name and category
              Text(
                item.name,
                style: GoogleFonts.roboto(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: colorScheme.onSurface,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 4),
              Text(
                item.category,
                style: GoogleFonts.roboto(
                  fontSize: 12,
                  color: colorScheme.onSurface.withOpacity(0.7),
                ),
              ),
              const SizedBox(height: 12),
              
              // Quantity with progress bar
              Row(
                children: [
                  Text(
                    'Quantity',
                    style: GoogleFonts.roboto(
                      fontSize: 12,
                      color: colorScheme.onSurface.withOpacity(0.7),
                    ),
                  ),
                  const Spacer(),
                  Text(
                    '${item.quantity} ${item.unit}',
                    style: GoogleFonts.roboto(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: colorScheme.onSurface,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              
              // Progress bar
              Container(
                height: 6,
                decoration: BoxDecoration(
                  color: colorScheme.surfaceContainerHighest,
                  borderRadius: BorderRadius.circular(3),
                ),
                child: FractionallySizedBox(
                  alignment: Alignment.centerLeft,
                  widthFactor: (item.quantity / (item.minThreshold * 2)).clamp(0.0, 1.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: item.isLowStock ? Colors.orange : Colors.green,
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              
              // Last updated
              Text(
                'Updated ${_formatLastUpdated(item.lastUpdated)}',
                style: GoogleFonts.roboto(
                  fontSize: 10,
                  color: colorScheme.onSurface.withOpacity(0.5),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color _getCategoryColor(String category) {
    switch (category) {
      case 'Fertilizers':
        return Colors.green;
      case 'Seeds':
        return Colors.orange;
      case 'Pesticides':
        return Colors.red;
      case 'Equipment':
        return Colors.blue;
      default:
        return Colors.grey;
    }
  }

  IconData _getCategoryIcon(String category) {
    switch (category) {
      case 'Fertilizers':
        return Icons.scatter_plot;
      case 'Seeds':
        return Icons.eco;
      case 'Pesticides':
        return Icons.bug_report;
      case 'Equipment':
        return Icons.build;
      default:
        return Icons.inventory;
    }
  }

  String _formatLastUpdated(DateTime dateTime) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);
    
    if (difference.inMinutes < 1) return 'now';
    if (difference.inMinutes < 60) return '${difference.inMinutes}m ago';
    if (difference.inHours < 24) return '${difference.inHours}h ago';
    return '${difference.inDays}d ago';
  }

  void _showItemDetails(InventoryItem item) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.7,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          children: [
            Container(
              width: 40,
              height: 4,
              margin: EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.3),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                item.name,
                style: AppThemeStyles.getSectionTitle(Theme.of(context).colorScheme),
              ),
            ),
            // Add more item details here
          ],
        ),
      ),
    );
  }

  void _showAddItemDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Add New Item'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Item Name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: 'Quantity',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
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
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Item added successfully!')),
              );
            },
            child: Text('Add'),
          ),
        ],
      ),
    );
  }
}
