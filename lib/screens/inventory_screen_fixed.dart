import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/animated_widgets.dart';
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
final inventoryItemsProvider = StateProvider<List<InventoryItem>>((ref) => [
  InventoryItem(
    id: '1',
    name: 'Fertilizer NPK',
    category: 'Fertilizers',
    quantity: 25.5,
    unit: 'kg',
    minThreshold: 10.0,
    lastUpdated: DateTime.now().subtract(const Duration(days: 2)),
    description: 'High-quality nitrogen, phosphorus, potassium fertilizer',
  ),
  InventoryItem(
    id: '2',
    name: 'Wheat Seeds',
    category: 'Seeds',
    quantity: 8.0,
    unit: 'kg',
    minThreshold: 15.0,
    lastUpdated: DateTime.now().subtract(const Duration(days: 1)),
    description: 'Premium quality wheat seeds for planting',
  ),
  InventoryItem(
    id: '3',
    name: 'Pesticide Spray',
    category: 'Pesticides',
    quantity: 3.5,
    unit: 'liters',
    minThreshold: 5.0,
    lastUpdated: DateTime.now().subtract(const Duration(hours: 12)),
    description: 'Organic pesticide for crop protection',
  ),
  InventoryItem(
    id: '4',
    name: 'Irrigation Pipes',
    category: 'Equipment',
    quantity: 45.0,
    unit: 'meters',
    minThreshold: 20.0,
    lastUpdated: DateTime.now().subtract(const Duration(days: 5)),
    description: 'PVC pipes for irrigation system',
  ),
  InventoryItem(
    id: '5',
    name: 'Tomato Seeds',
    category: 'Seeds',
    quantity: 2.2,
    unit: 'kg',
    minThreshold: 3.0,
    lastUpdated: DateTime.now().subtract(const Duration(days: 3)),
    description: 'Hybrid tomato seeds for greenhouse cultivation',
  ),
]);

final selectedCategoryProvider = StateProvider<String>((ref) => 'All');
final searchQueryProvider = StateProvider<String>((ref) => '');
final sortByProvider = StateProvider<String>((ref) => 'name');

class InventoryScreen extends ConsumerStatefulWidget {
  const InventoryScreen({super.key});

  @override
  ConsumerState<InventoryScreen> createState() => _InventoryScreenState();
}

class _InventoryScreenState extends ConsumerState<InventoryScreen>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late AnimationController _fabAnimationController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );

    _fabAnimationController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: const Interval(0.0, 0.6, curve: Curves.easeOut),
    ));

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.5),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: const Interval(0.2, 0.8, curve: Curves.elasticOut),
    ));

    _scaleAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: const Interval(0.4, 1.0, curve: Curves.elasticOut),
    ));

    _animationController.forward();
    _fabAnimationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _fabAnimationController.dispose();
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

    // Sort items
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
    final inventoryItems = ref.watch(inventoryItemsProvider);
    final filteredItems = _getFilteredItems();
    final categories = ['All', ...inventoryItems.map((e) => e.category).toSet().toList()];
    final lowStockCount = inventoryItems.where((item) => item.isLowStock).length;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: FadeTransition(
        opacity: _fadeAnimation,
        child: SlideTransition(
          position: _slideAnimation,
          child: CustomScrollView(
            slivers: [
              // App Bar with gradient
              SliverAppBar(
                expandedHeight: 120,
                floating: false,
                pinned: true,
                backgroundColor: colorScheme.surface,
                flexibleSpace: FlexibleSpaceBar(
                  title: ScaleTransition(
                    scale: _scaleAnimation,
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [colorScheme.primary, colorScheme.secondary],
                            ),
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: colorScheme.primary.withOpacity(0.3),
                                blurRadius: 8,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Icon(
                            Icons.inventory_2,
                            color: colorScheme.onPrimary,
                            size: 24,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            'Smart Inventory',
                            style: GoogleFonts.roboto(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: colorScheme.onSurface,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                actions: [
                  if (lowStockCount > 0)
                    ScaleTransition(
                      scale: _scaleAnimation,
                      child: Container(
                        margin: const EdgeInsets.only(right: 16),
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: Colors.orange.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.orange.withOpacity(0.3)),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.warning,
                              color: Colors.orange,
                              size: 16,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              '$lowStockCount Low',
                              style: GoogleFonts.roboto(
                                color: Colors.orange,
                                fontWeight: FontWeight.w600,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                ],
              ),

              // Search and Filters
              SliverToBoxAdapter(
                child: ScaleTransition(
                  scale: _scaleAnimation,
                  child: Container(
                    margin: const EdgeInsets.all(16),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: colorScheme.surfaceVariant.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: colorScheme.outline.withOpacity(0.2),
                      ),
                    ),
                    child: Column(
                      children: [
                        // Search Bar
                        Container(
                          decoration: BoxDecoration(
                            color: colorScheme.surface,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: TextField(
                            onChanged: (value) {
                              ref.read(searchQueryProvider.notifier).state = value;
                            },
                            decoration: InputDecoration(
                              hintText: 'Search inventory...',
                              hintStyle: GoogleFonts.roboto(
                                color: colorScheme.onSurface.withOpacity(0.6),
                              ),
                              prefixIcon: Icon(
                                Icons.search,
                                color: colorScheme.primary,
                              ),
                              border: InputBorder.none,
                              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),

                        // Category Filter
                        SizedBox(
                          height: 40,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: categories.length,
                            itemBuilder: (context, index) {
                              final category = categories[index];
                              final isSelected = ref.watch(selectedCategoryProvider) == category;
                              
                              return AnimatedContainer(
                                duration: const Duration(milliseconds: 300),
                                margin: const EdgeInsets.only(right: 8),
                                child: FilterChip(
                                  label: Text(
                                    category,
                                    style: GoogleFonts.roboto(
                                      fontWeight: FontWeight.w500,
                                      color: isSelected
                                          ? colorScheme.onPrimary
                                          : colorScheme.onSurface,
                                    ),
                                  ),
                                  selected: isSelected,
                                  backgroundColor: colorScheme.surfaceVariant,
                                  selectedColor: colorScheme.primary,
                                  onSelected: (selected) {
                                    if (selected) {
                                      ref.read(selectedCategoryProvider.notifier).state = category;
                                      HapticFeedback.lightImpact();
                                    }
                                  },
                                ),
                              );
                            },
                          ),
                        ),
                        const SizedBox(height: 16),

                        // Sort Options
                        Row(
                          children: [
                            Icon(
                              Icons.sort,
                              color: colorScheme.primary,
                              size: 20,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              'Sort by:',
                              style: GoogleFonts.roboto(
                                fontWeight: FontWeight.w600,
                                color: colorScheme.onSurface,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: [
                                    _buildSortChip('name', 'Name', Icons.sort_by_alpha_rounded),
                                    _buildSortChip('quantity', 'Quantity', Icons.numbers_rounded),
                                    _buildSortChip('category', 'Category', Icons.category_rounded),
                                    _buildSortChip('lowStock', 'Low Stock', Icons.warning_rounded),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              // Inventory Grid
              SliverPadding(
                padding: const EdgeInsets.all(16),
                sliver: SliverGrid(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: _getCrossAxisCount(context),
                    childAspectRatio: 0.8,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                  ),
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final item = filteredItems[index];
                      return AnimatedContainer(
                        duration: Duration(milliseconds: 300 + (index * 100)),
                        child: _buildInventoryCard(item, colorScheme),
                      );
                    },
                    childCount: filteredItems.length,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: ScaleTransition(
        scale: _fabAnimationController,
        child: FloatingActionButton.extended(
          onPressed: () => _showAddItemDialog(context),
          backgroundColor: colorScheme.primary,
          foregroundColor: colorScheme.onPrimary,
          elevation: 8,
          icon: const Icon(Icons.add),
          label: Text(
            'Add Item',
            style: GoogleFonts.roboto(fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }

  Widget _buildSortChip(String value, String label, IconData icon) {
    final colorScheme = Theme.of(context).colorScheme;
    final sortBy = ref.watch(sortByProvider);
    final isSelected = sortBy == value;

    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: FilterChip(
        avatar: Icon(
          icon,
          size: 16,
          color: isSelected ? colorScheme.onPrimary : colorScheme.primary,
        ),
        label: Text(
          label,
          style: GoogleFonts.roboto(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: isSelected ? colorScheme.onPrimary : colorScheme.onSurface,
          ),
        ),
        selected: isSelected,
        backgroundColor: colorScheme.surfaceVariant,
        selectedColor: colorScheme.primary,
        onSelected: (selected) {
          if (selected) {
            ref.read(sortByProvider.notifier).state = value;
            HapticFeedback.lightImpact();
          }
        },
      ),
    );
  }

  Widget _buildInventoryCard(InventoryItem item, ColorScheme colorScheme) {
    return Container(
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: item.isLowStock ? Colors.orange : colorScheme.outline.withOpacity(0.2),
          width: item.isLowStock ? 2 : 1,
        ),
        boxShadow: [
          BoxShadow(
            color: colorScheme.shadow.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: () => _showItemDetails(item),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header with category
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: colorScheme.primary.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        item.category,
                        style: GoogleFonts.roboto(
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                          color: colorScheme.primary,
                        ),
                      ),
                    ),
                    const Spacer(),
                    if (item.isLowStock)
                      Icon(
                        Icons.warning,
                        color: Colors.orange,
                        size: 16,
                      ),
                  ],
                ),
                const SizedBox(height: 12),

                // Item name
                Text(
                  item.name,
                  style: GoogleFonts.roboto(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: colorScheme.onSurface,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),

                // Quantity
                Row(
                  children: [
                    Icon(
                      Icons.inventory,
                      color: colorScheme.primary,
                      size: 16,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '${item.quantity} ${item.unit}',
                      style: GoogleFonts.roboto(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: item.isLowStock ? Colors.orange : colorScheme.onSurface,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),

                // Threshold
                Text(
                  'Min: ${item.minThreshold} ${item.unit}',
                  style: GoogleFonts.roboto(
                    fontSize: 12,
                    color: colorScheme.onSurface.withOpacity(0.6),
                  ),
                ),
                const Spacer(),

                // Action buttons
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: () => _showEditDialog(item),
                        icon: const Icon(Icons.edit, size: 16),
                        label: Text(
                          'Edit',
                          style: GoogleFonts.roboto(fontSize: 12),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: colorScheme.primary,
                          foregroundColor: colorScheme.onPrimary,
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
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
      ),
    );
  }

  void _showItemDetails(InventoryItem item) {
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
            Text('Min Threshold: ${item.minThreshold} ${item.unit}'),
            if (item.description != null)
              Text('Description: ${item.description}'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  void _showEditDialog(InventoryItem item) {
    final quantityController = TextEditingController(text: item.quantity.toString());
    
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Edit ${item.name}'),
        content: TextField(
          controller: quantityController,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            labelText: 'Quantity (${item.unit})',
            border: const OutlineInputBorder(),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              final newQuantity = double.tryParse(quantityController.text);
              if (newQuantity != null) {
                _updateItemQuantity(item, newQuantity);
                Navigator.pop(context);
              }
            },
            child: const Text('Update'),
          ),
        ],
      ),
    );
  }

  void _updateItemQuantity(InventoryItem item, double newQuantity) {
    final inventoryItems = ref.read(inventoryItemsProvider);
    final updatedItems = inventoryItems.map((i) {
      if (i.id == item.id) {
        return i.copyWith(
          quantity: newQuantity,
          lastUpdated: DateTime.now(),
        );
      }
      return i;
    }).toList();
    
    ref.read(inventoryItemsProvider.notifier).state = updatedItems;
  }

  void _showAddItemDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => const AddItemDialog(),
    );
  }
}

class AddItemDialog extends StatefulWidget {
  const AddItemDialog({super.key});

  @override
  State<AddItemDialog> createState() => _AddItemDialogState();
}

class _AddItemDialogState extends State<AddItemDialog> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _quantityController = TextEditingController();
  final _unitController = TextEditingController();
  final _thresholdController = TextEditingController();
  final _descriptionController = TextEditingController();
  String _selectedCategory = 'Seeds';

  final List<String> _categories = [
    'Seeds',
    'Fertilizers',
    'Pesticides',
    'Equipment',
    'Tools',
    'Other',
  ];

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add New Item'),
      content: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Item Name',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter item name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: _selectedCategory,
                decoration: const InputDecoration(
                  labelText: 'Category',
                  border: OutlineInputBorder(),
                ),
                items: _categories.map((category) {
                  return DropdownMenuItem(
                    value: category,
                    child: Text(category),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedCategory = value!;
                  });
                },
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: TextFormField(
                      controller: _quantityController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: 'Quantity',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter quantity';
                        }
                        if (double.tryParse(value) == null) {
                          return 'Please enter valid number';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: TextFormField(
                      controller: _unitController,
                      decoration: const InputDecoration(
                        labelText: 'Unit',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter unit';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _thresholdController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Minimum Threshold',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter threshold';
                  }
                  if (double.tryParse(value) == null) {
                    return 'Please enter valid number';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _descriptionController,
                decoration: const InputDecoration(
                  labelText: 'Description (Optional)',
                  border: OutlineInputBorder(),
                ),
                maxLines: 3,
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        Consumer(
          builder: (context, ref, child) {
            return ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  final newItem = InventoryItem(
                    id: DateTime.now().millisecondsSinceEpoch.toString(),
                    name: _nameController.text,
                    category: _selectedCategory,
                    quantity: double.parse(_quantityController.text),
                    unit: _unitController.text,
                    minThreshold: double.parse(_thresholdController.text),
                    lastUpdated: DateTime.now(),
                    description: _descriptionController.text.isEmpty
                        ? null
                        : _descriptionController.text,
                  );

                  final currentItems = ref.read(inventoryItemsProvider);
                  ref.read(inventoryItemsProvider.notifier).state = [
                    ...currentItems,
                    newItem,
                  ];

                  Navigator.pop(context);
                }
              },
              child: const Text('Add Item'),
            );
          },
        ),
      ],
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _quantityController.dispose();
    _unitController.dispose();
    _thresholdController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }
}
