import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fl_chart/fl_chart.dart';

class MarketPricesScreen extends StatefulWidget {
  const MarketPricesScreen({super.key});

  @override
  State<MarketPricesScreen> createState() => _MarketPricesScreenState();
}

class _MarketPricesScreenState extends State<MarketPricesScreen> 
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  String selectedMarket = 'दिल्ली';
  String selectedTimeframe = '7 दिन';
  
  final Map<String, List<Map<String, dynamic>>> marketData = {
    'दिल्ली': [
      {
        'name': 'गेहूं',
        'price': 2150,
        'change': 50,
        'unit': 'क्विंटल',
        'icon': '🌾',
        'color': Color(0xFFD4AF37),
        'history': [2100, 2120, 2110, 2130, 2140, 2160, 2150],
      },
      {
        'name': 'धान',
        'price': 1950,
        'change': -30,
        'unit': 'क्विंटल',
        'icon': '🌾',
        'color': Color(0xFF4CAF50),
        'history': [1980, 1970, 1960, 1965, 1955, 1945, 1950],
      },
      {
        'name': 'मक्का',
        'price': 1750,
        'change': 75,
        'unit': 'क्विंटल',
        'icon': '🌽',
        'color': Color(0xFFFFB74D),
        'history': [1675, 1690, 1710, 1720, 1730, 1740, 1750],
      },
      {
        'name': 'सरसों',
        'price': 4500,
        'change': 100,
        'unit': 'क्विंटल',
        'icon': '🌻',
        'color': Color(0xFFFF9800),
        'history': [4400, 4420, 4440, 4460, 4480, 4490, 4500],
      },
    ],
    'मुंबई': [
      {
        'name': 'गेहूं',
        'price': 2200,
        'change': 25,
        'unit': 'क्विंटल',
        'icon': '🌾',
        'color': Color(0xFFD4AF37),
        'history': [2175, 2180, 2185, 2190, 2195, 2200, 2200],
      },
      {
        'name': 'धान',
        'price': 2000,
        'change': 40,
        'unit': 'क्विंटल',
        'icon': '🌾',
        'color': Color(0xFF4CAF50),
        'history': [1960, 1970, 1980, 1985, 1990, 1995, 2000],
      },
    ],
  };

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final currentData = marketData[selectedMarket] ?? [];
    
    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: CustomScrollView(
        slivers: [
          // Modern SliverAppBar
          SliverAppBar.large(
            backgroundColor: colorScheme.primary,
            foregroundColor: colorScheme.onPrimary,
            title: Text(
              'बाजार भाव',
              style: GoogleFonts.roboto(
                fontSize: 28,
                fontWeight: FontWeight.w400,
                letterSpacing: 0,
              ),
            ),
            expandedHeight: 180,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      colorScheme.primary,
                      colorScheme.primaryContainer,
                    ],
                  ),
                ),
                child: const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 60),
                      Text(
                        '📈',
                        style: TextStyle(fontSize: 64),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          
          // Content
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: [
                  // Market and Time Selector
                  _buildSelectors(colorScheme),
                  const SizedBox(height: 24),
                  
                  // Market Summary Card
                  _buildSummaryCard(currentData, colorScheme),
                  const SizedBox(height: 24),
                  
                  // Price List
                  _buildPriceList(currentData, colorScheme),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSelectors(ColorScheme colorScheme) {
    return Column(
      children: [
        // Market Selector
        Card(
          elevation: 0,
          color: colorScheme.surfaceContainerHighest,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'मंडी चुनें',
                  style: GoogleFonts.roboto(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: colorScheme.onSurface,
                  ),
                ),
                const SizedBox(height: 16),
                Wrap(
                  spacing: 12,
                  children: marketData.keys.map((market) {
                    final isSelected = market == selectedMarket;
                    
                    return FilterChip(
                      selected: isSelected,
                      label: Text(
                        '📍 $market',
                        style: GoogleFonts.roboto(
                          fontWeight: FontWeight.w500,
                          color: isSelected ? colorScheme.onPrimary : colorScheme.onSurface,
                        ),
                      ),
                      backgroundColor: colorScheme.surfaceContainerHigh,
                      selectedColor: colorScheme.primary,
                      checkmarkColor: colorScheme.onPrimary,
                      side: BorderSide.none,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      onSelected: (selected) {
                        if (selected) {
                          setState(() {
                            selectedMarket = market;
                          });
                        }
                      },
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
        
        // Time Selector
        Card(
          elevation: 0,
          color: colorScheme.surfaceContainerHighest,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'समय अवधि',
                  style: GoogleFonts.roboto(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: colorScheme.onSurface,
                  ),
                ),
                const SizedBox(height: 16),
                Wrap(
                  spacing: 12,
                  children: ['7 दिन', '1 महीना', '3 महीना'].map((timeframe) {
                    final isSelected = timeframe == selectedTimeframe;
                    
                    return FilterChip(
                      selected: isSelected,
                      label: Text(
                        timeframe,
                        style: GoogleFonts.roboto(
                          fontWeight: FontWeight.w500,
                          color: isSelected ? colorScheme.onPrimary : colorScheme.onSurface,
                        ),
                      ),
                      backgroundColor: colorScheme.surfaceContainerHigh,
                      selectedColor: colorScheme.primary,
                      checkmarkColor: colorScheme.onPrimary,
                      side: BorderSide.none,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      onSelected: (selected) {
                        if (selected) {
                          setState(() {
                            selectedTimeframe = timeframe;
                          });
                        }
                      },
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSummaryCard(List<Map<String, dynamic>> data, ColorScheme colorScheme) {
    final totalValue = data.fold(0.0, (sum, item) => sum + (item['price'] as int));
    final avgPrice = data.isNotEmpty ? (totalValue / data.length).round() : 0;
    final positiveChanges = data.where((item) => (item['change'] as int) > 0).length;
    
    return Card(
      elevation: 0,
      color: colorScheme.primaryContainer,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Row(
              children: [
                Icon(
                  Icons.analytics,
                  color: colorScheme.onPrimaryContainer,
                  size: 32,
                ),
                const SizedBox(width: 16),
                Text(
                  'बाजार सारांश',
                  style: GoogleFonts.roboto(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: colorScheme.onPrimaryContainer,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: _buildSummaryItem(
                    'औसत भाव',
                    '₹$avgPrice',
                    Icons.currency_rupee,
                    colorScheme,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _buildSummaryItem(
                    'बढ़ती कीमतें',
                    '$positiveChanges/${data.length}',
                    Icons.trending_up,
                    colorScheme,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryItem(String label, String value, IconData icon, ColorScheme colorScheme) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colorScheme.surface.withOpacity(0.5),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Icon(
            icon,
            color: colorScheme.onPrimaryContainer,
            size: 24,
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: GoogleFonts.roboto(
              fontSize: 12,
              color: colorScheme.onPrimaryContainer.withOpacity(0.7),
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: GoogleFonts.roboto(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: colorScheme.onPrimaryContainer,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPriceList(List<Map<String, dynamic>> data, ColorScheme colorScheme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'फसल की कीमतें',
          style: GoogleFonts.roboto(
            fontSize: 22,
            fontWeight: FontWeight.w600,
            color: colorScheme.onSurface,
          ),
        ),
        const SizedBox(height: 16),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: data.length,
          itemBuilder: (context, index) {
            final item = data[index];
            return Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: _buildPriceCard(item, colorScheme),
            );
          },
        ),
      ],
    );
  }

  Widget _buildPriceCard(Map<String, dynamic> item, ColorScheme colorScheme) {
    final isPositive = (item['change'] as int) > 0;
    final changeColor = isPositive ? Colors.green : Colors.red;
    final changeIcon = isPositive ? Icons.trending_up : Icons.trending_down;
    
    return Card(
      elevation: 0,
      color: colorScheme.surfaceContainerHigh,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              children: [
                // Crop Icon and Info
                Container(
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                    color: item['color'],
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Center(
                    child: Text(
                      item['icon'],
                      style: const TextStyle(fontSize: 28),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item['name'],
                        style: GoogleFonts.roboto(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: colorScheme.onSurface,
                        ),
                      ),
                      Text(
                        'प्रति ${item['unit']}',
                        style: GoogleFonts.roboto(
                          fontSize: 14,
                          color: colorScheme.onSurface.withOpacity(0.7),
                        ),
                      ),
                    ],
                  ),
                ),
                // Price and Change
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '₹${item['price']}',
                      style: GoogleFonts.roboto(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: colorScheme.onSurface,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: changeColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            changeIcon,
                            color: changeColor,
                            size: 16,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            '₹${item['change'].abs()}',
                            style: GoogleFonts.roboto(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: changeColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            
            // Price Chart
            SizedBox(
              height: 80,
              child: LineChart(
                LineChartData(
                  gridData: const FlGridData(show: false),
                  titlesData: const FlTitlesData(show: false),
                  borderData: FlBorderData(show: false),
                  lineBarsData: [
                    LineChartBarData(
                      spots: (item['history'] as List<int>)
                          .asMap()
                          .entries
                          .map((e) => FlSpot(e.key.toDouble(), e.value.toDouble()))
                          .toList(),
                      isCurved: true,
                      color: item['color'],
                      barWidth: 3,
                      dotData: const FlDotData(show: false),
                      belowBarData: BarAreaData(
                        show: true,
                        color: (item['color'] as Color).withOpacity(0.1),
                      ),
                    ),
                  ],
                  minY: (item['history'] as List<int>).reduce((a, b) => a < b ? a : b).toDouble() - 50,
                  maxY: (item['history'] as List<int>).reduce((a, b) => a > b ? a : b).toDouble() + 50,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
