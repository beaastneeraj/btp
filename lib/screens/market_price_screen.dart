import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math';
import '../widgets/animated_widgets.dart';
import '../providers/theme_provider.dart';
import '../services/crop_database.dart';

// Market data provider
final marketDataProvider = StateProvider<List<Map<String, dynamic>>>((ref) {
  final crops = CropDatabase.getAllCrops();
  final random = Random();
  
  return crops.map((crop) {
    final info = CropDatabase.getCropInfo(crop)!;
    final basePrice = (info['price']['min'] + info['price']['max']) / 2;
    final variation = random.nextDouble() * 0.4 - 0.2; // ±20% variation
    final currentPrice = basePrice * (1 + variation);
    final change = random.nextDouble() * 10 - 5; // ±5% daily change
    
    return {
      'crop': crop,
      'name': info['name'],
      'currentPrice': currentPrice.round(),
      'previousPrice': (currentPrice / (1 + change / 100)).round(),
      'change': change,
      'volume': random.nextInt(1000) + 100,
      'market': ['Delhi', 'Mumbai', 'Kolkata', 'Chennai'][random.nextInt(4)],
      'unit': crop == 'sugarcane' ? 'per tonne' : 'per quintal',
    };
  }).toList();
});

final selectedCategoryProvider = StateProvider<String>((ref) => 'All');
final searchQueryProvider = StateProvider<String>((ref) => '');

class MarketPriceScreen extends ConsumerStatefulWidget {
  const MarketPriceScreen({super.key});

  @override
  ConsumerState<MarketPriceScreen> createState() => _MarketPriceScreenState();
}

class _MarketPriceScreenState extends ConsumerState<MarketPriceScreen>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1200),
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

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  List<Map<String, dynamic>> _getFilteredData() {
    final marketData = ref.watch(marketDataProvider);
    final selectedCategory = ref.watch(selectedCategoryProvider);
    final searchQuery = ref.watch(searchQueryProvider).toLowerCase();

    return marketData.where((item) {
      final matchesSearch = item['name'].toString().toLowerCase().contains(searchQuery);
      
      if (selectedCategory == 'All') {
        return matchesSearch;
      }
      
      // Filter by category (you can extend this logic)
      final crop = item['crop'];
      final info = CropDatabase.getCropInfo(crop);
      final season = info?['season'] ?? '';
      
      bool matchesCategory = false;
      switch (selectedCategory) {
        case 'Cereals':
          matchesCategory = ['wheat', 'rice', 'maize'].contains(crop);
          break;
        case 'Vegetables':
          matchesCategory = ['tomato', 'onion', 'potato'].contains(crop);
          break;
        case 'Cash Crops':
          matchesCategory = ['cotton', 'sugarcane'].contains(crop);
          break;
        case 'Oilseeds':
          matchesCategory = ['soybean', 'mustard'].contains(crop);
          break;
        default:
          matchesCategory = true;
      }
      
      return matchesSearch && matchesCategory;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = ref.watch(appSettingsProvider).isDarkMode;
    final screenSize = MediaQuery.of(context).size;
    final isTablet = screenSize.width > 600;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: isDark
                ? [
                    const Color(0xFF1A1A2E),
                    const Color(0xFF16213E),
                    const Color(0xFF0F3460),
                  ]
                : [
                    const Color(0xFF2E7D32),
                    const Color(0xFF388E3C),
                    const Color(0xFF4CAF50),
                  ],
          ),
        ),
        child: SafeArea(
          child: FadeTransition(
            opacity: _fadeAnimation,
            child: SlideTransition(
              position: _slideAnimation,
              child: Column(
                children: [
                  _buildHeader(isDark, isTablet),
                  _buildSearchAndFilter(isDark, isTablet),
                  Expanded(
                    child: _buildMarketList(isDark, isTablet),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Refresh market data
          ref.invalidate(marketDataProvider);
        },
        backgroundColor: isDark ? Colors.blue : Colors.green,
        child: const Icon(Icons.refresh, color: Colors.white),
      ),
    );
  }

  Widget _buildHeader(bool isDark, bool isTablet) {
    return Padding(
      padding: EdgeInsets.all(isTablet ? 24.0 : 16.0),
      child: Row(
        children: [
          GradientIconButton(
            icon: Icons.arrow_back,
            onPressed: () => Navigator.of(context).pop(),
            tooltip: 'Back',
            gradientColors: isDark
                ? [Colors.blue.shade400, Colors.purple.shade400]
                : [Colors.white, Colors.green.shade100],
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    TechIconWidget(
                      icon: Icons.trending_up,
                      color: isDark ? Colors.green.shade400 : Colors.white,
                      size: isTablet ? 32 : 28,
                    ),
                    const SizedBox(width: 12),
                    Text(
                      'Market Prices',
                      style: GoogleFonts.poppins(
                        fontSize: isTablet ? 28 : 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  'Live commodity prices',
                  style: GoogleFonts.poppins(
                    fontSize: isTablet ? 16 : 14,
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchAndFilter(bool isDark, bool isTablet) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: isTablet ? 24.0 : 16.0),
      child: Column(
        children: [
          // Search bar
          Container(
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.9),
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: TextField(
              controller: _searchController,
              onChanged: (value) {
                ref.read(searchQueryProvider.notifier).state = value;
              },
              decoration: InputDecoration(
                hintText: 'Search crops...',
                prefixIcon: const Icon(Icons.search, color: Colors.green),
                suffixIcon: _searchController.text.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          _searchController.clear();
                          ref.read(searchQueryProvider.notifier).state = '';
                        },
                      )
                    : null,
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: isTablet ? 16 : 12,
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          // Category filter
          SizedBox(
            height: isTablet ? 50 : 40,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                'All',
                'Cereals',
                'Vegetables',
                'Cash Crops',
                'Oilseeds',
              ].map((category) {
                return Consumer(
                  builder: (context, ref, child) {
                    final selectedCategory = ref.watch(selectedCategoryProvider);
                    final isSelected = selectedCategory == category;
                    
                    return Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: FilterChip(
                        label: Text(
                          category,
                          style: GoogleFonts.poppins(
                            fontSize: isTablet ? 14 : 12,
                            fontWeight: FontWeight.w500,
                            color: isSelected
                                ? Colors.white
                                : isDark ? Colors.white70 : Colors.black87,
                          ),
                        ),
                        selected: isSelected,
                        onSelected: (selected) {
                          ref.read(selectedCategoryProvider.notifier).state = category;
                        },
                        selectedColor: isDark ? Colors.blue : Colors.green,
                        backgroundColor: Colors.white.withOpacity(0.9),
                        checkmarkColor: Colors.white,
                      ),
                    );
                  },
                );
              }).toList(),
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _buildMarketList(bool isDark, bool isTablet) {
    final filteredData = _getFilteredData();

    if (filteredData.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TechIconWidget(
              icon: Icons.search_off,
              color: isDark ? Colors.white54 : Colors.white70,
              size: isTablet ? 64 : 48,
            ),
            const SizedBox(height: 16),
            Text(
              'No crops found',
              style: GoogleFonts.poppins(
                fontSize: isTablet ? 18 : 16,
                color: isDark ? Colors.white54 : Colors.white70,
              ),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: EdgeInsets.all(isTablet ? 24.0 : 16.0),
      itemCount: filteredData.length,
      itemBuilder: (context, index) {
        final item = filteredData[index];
        return _buildMarketItem(item, isDark, isTablet, index);
      },
    );
  }

  Widget _buildMarketItem(Map<String, dynamic> item, bool isDark, bool isTablet, int index) {
    final change = item['change'] as double;
    final isPositive = change >= 0;

    return Container(
      margin: EdgeInsets.only(bottom: isTablet ? 16 : 12),
      padding: EdgeInsets.all(isTablet ? 20 : 16),
      decoration: BoxDecoration(
        color: isDark ? Colors.grey[900]?.withOpacity(0.8) : Colors.white.withOpacity(0.9),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          // Crop icon and name
          Expanded(
            flex: 3,
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(isTablet ? 12 : 8),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: isDark
                          ? [Colors.blue.shade400, Colors.purple.shade400]
                          : [Colors.green.shade400, Colors.green.shade600],
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    Icons.eco,
                    color: Colors.white,
                    size: isTablet ? 24 : 20,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item['name'],
                        style: GoogleFonts.poppins(
                          fontSize: isTablet ? 16 : 14,
                          fontWeight: FontWeight.bold,
                          color: isDark ? Colors.white : Colors.black87,
                        ),
                      ),
                      Text(
                        item['market'],
                        style: GoogleFonts.poppins(
                          fontSize: isTablet ? 12 : 10,
                          color: isDark ? Colors.white60 : Colors.black54,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Price info
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '₹${item['currentPrice']}',
                  style: GoogleFonts.poppins(
                    fontSize: isTablet ? 18 : 16,
                    fontWeight: FontWeight.bold,
                    color: isDark ? Colors.white : Colors.black87,
                  ),
                ),
                Text(
                  item['unit'],
                  style: GoogleFonts.poppins(
                    fontSize: isTablet ? 10 : 8,
                    color: isDark ? Colors.white60 : Colors.black54,
                  ),
                ),
              ],
            ),
          ),
          // Change indicator
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: isTablet ? 12 : 8,
              vertical: isTablet ? 8 : 4,
            ),
            decoration: BoxDecoration(
              color: isPositive
                  ? Colors.green.withOpacity(0.2)
                  : Colors.red.withOpacity(0.2),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  isPositive ? Icons.trending_up : Icons.trending_down,
                  color: isPositive ? Colors.green : Colors.red,
                  size: isTablet ? 16 : 14,
                ),
                const SizedBox(width: 4),
                Text(
                  '${change.abs().toStringAsFixed(1)}%',
                  style: GoogleFonts.poppins(
                    fontSize: isTablet ? 12 : 10,
                    fontWeight: FontWeight.w600,
                    color: isPositive ? Colors.green : Colors.red,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
