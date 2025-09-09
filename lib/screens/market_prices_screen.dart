import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:intl/intl.dart';
import '../providers/theme_provider.dart';
import '../services/localization_service.dart';

// Market data providers
final marketDataProvider = StateProvider<List<MarketPrice>>((ref) => []);
final selectedCropProvider = StateProvider<String>((ref) => 'All');
final selectedMarketProvider = StateProvider<String>((ref) => 'All Markets');
final priceHistoryProvider = StateProvider<List<PriceHistory>>((ref) => []);

class MarketPrice {
  final String crop;
  final String variety;
  final String market;
  final double currentPrice;
  final double previousPrice;
  final String unit;
  final DateTime lastUpdated;
  final double change;
  final String grade;

  MarketPrice({
    required this.crop,
    required this.variety,
    required this.market,
    required this.currentPrice,
    required this.previousPrice,
    required this.unit,
    required this.lastUpdated,
    required this.change,
    required this.grade,
  });
}

class PriceHistory {
  final DateTime date;
  final double price;

  PriceHistory({required this.date, required this.price});
}

class MarketPricesScreen extends ConsumerStatefulWidget {
  const MarketPricesScreen({super.key});

  @override
  ConsumerState<MarketPricesScreen> createState() => _MarketPricesScreenState();
}

class _MarketPricesScreenState extends ConsumerState<MarketPricesScreen> {
  bool _isLoading = false;
  bool _mounted = true;
  final List<String> _crops = ['All', 'Wheat', 'Rice', 'Maize', 'Cotton', 'Sugarcane', 'Soybean', 'Onion', 'Potato', 'Tomato'];
  final List<String> _markets = ['All Markets', 'Delhi', 'Mumbai', 'Bangalore', 'Chennai', 'Kolkata', 'Hyderabad'];

  @override
  void initState() {
    super.initState();
    _loadMarketData();
  }

  @override
  void dispose() {
    _mounted = false;
    super.dispose();
  }

  Future<void> _loadMarketData() async {
    if (!_mounted) return;
    
    setState(() {
      _isLoading = true;
    });

    // Simulate API call delay
    await Future.delayed(const Duration(seconds: 1));

    if (!_mounted) return;

    // Mock market data
    final marketData = [
      MarketPrice(
        crop: 'Wheat',
        variety: 'HD-2967',
        market: 'Delhi',
        currentPrice: 2450,
        previousPrice: 2380,
        unit: 'per quintal',
        lastUpdated: DateTime.now().subtract(const Duration(hours: 2)),
        change: 2.9,
        grade: 'Grade A',
      ),
      MarketPrice(
        crop: 'Rice',
        variety: 'Basmati 1121',
        market: 'Delhi',
        currentPrice: 4200,
        previousPrice: 4150,
        unit: 'per quintal',
        lastUpdated: DateTime.now().subtract(const Duration(hours: 1)),
        change: 1.2,
        grade: 'Premium',
      ),
      MarketPrice(
        crop: 'Maize',
        variety: 'Yellow Corn',
        market: 'Mumbai',
        currentPrice: 1850,
        previousPrice: 1920,
        unit: 'per quintal',
        lastUpdated: DateTime.now().subtract(const Duration(hours: 3)),
        change: -3.6,
        grade: 'Grade A',
      ),
      MarketPrice(
        crop: 'Cotton',
        variety: 'Kapas',
        market: 'Hyderabad',
        currentPrice: 5800,
        previousPrice: 5650,
        unit: 'per quintal',
        lastUpdated: DateTime.now().subtract(const Duration(minutes: 45)),
        change: 2.7,
        grade: 'FAQ',
      ),
      MarketPrice(
        crop: 'Sugarcane',
        variety: 'Co-0238',
        market: 'Chennai',
        currentPrice: 280,
        previousPrice: 275,
        unit: 'per quintal',
        lastUpdated: DateTime.now().subtract(const Duration(hours: 4)),
        change: 1.8,
        grade: 'Grade A',
      ),
      MarketPrice(
        crop: 'Soybean',
        variety: 'JS-335',
        market: 'Bangalore',
        currentPrice: 3950,
        previousPrice: 4100,
        unit: 'per quintal',
        lastUpdated: DateTime.now().subtract(const Duration(hours: 2)),
        change: -3.7,
        grade: 'Grade A',
      ),
      MarketPrice(
        crop: 'Onion',
        variety: 'Red Onion',
        market: 'Mumbai',
        currentPrice: 1200,
        previousPrice: 1350,
        unit: 'per quintal',
        lastUpdated: DateTime.now().subtract(const Duration(hours: 1)),
        change: -11.1,
        grade: 'Grade A',
      ),
      MarketPrice(
        crop: 'Potato',
        variety: 'Kufri Jyoti',
        market: 'Kolkata',
        currentPrice: 800,
        previousPrice: 820,
        unit: 'per quintal',
        lastUpdated: DateTime.now().subtract(const Duration(hours: 6)),
        change: -2.4,
        grade: 'Grade A',
      ),
    ];

    // Mock price history for chart
    final priceHistory = List.generate(30, (index) {
      final date = DateTime.now().subtract(Duration(days: 29 - index));
      final basePrice = 2400.0;
      final variation = (index % 7 - 3) * 50.0 + (index % 3 - 1) * 20.0;
      return PriceHistory(date: date, price: basePrice + variation);
    });

    ref.read(marketDataProvider.notifier).state = marketData;
    ref.read(priceHistoryProvider.notifier).state = priceHistory;
    
    if (_mounted) {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final appSettings = ref.watch(appSettingsProvider);
    final languageCode = appSettings.locale.languageCode;
    final colorScheme = Theme.of(context).colorScheme;
    final marketData = ref.watch(marketDataProvider);
    final selectedCrop = ref.watch(selectedCropProvider);
    final selectedMarket = ref.watch(selectedMarketProvider);

    final filteredData = _filterData(marketData, selectedCrop, selectedMarket);

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        title: Text('market'.tr(languageCode)),
        backgroundColor: colorScheme.surface,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.refresh, color: colorScheme.onSurface),
            onPressed: _loadMarketData,
          ),
          IconButton(
            icon: Icon(Icons.notifications_outlined, color: colorScheme.onSurface),
            onPressed: () => _showPriceAlerts(context, languageCode),
          ),
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : RefreshIndicator(
              onRefresh: _loadMarketData,
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Market Summary Card
                    _buildMarketSummaryCard(filteredData, colorScheme, languageCode),
                    
                    const SizedBox(height: 20),
                    
                    // Filters
                    _buildFiltersSection(colorScheme, languageCode),
                    
                    const SizedBox(height: 20),
                    
                    // Price Trend Chart
                    _buildPriceTrendChart(colorScheme, languageCode),
                    
                    const SizedBox(height: 20),
                    
                    // Top Gainers/Losers
                    _buildTopMoversSection(filteredData, colorScheme, languageCode),
                    
                    const SizedBox(height: 20),
                    
                    // Price List
                    _buildPriceList(filteredData, colorScheme, languageCode),
                  ],
                ),
              ),
            ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _showAddToWatchlist(context, languageCode),
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.onPrimary,
        icon: const Icon(Icons.add_alert),
        label: Text('Price Alert'),
      ),
    );
  }

  Widget _buildMarketSummaryCard(List<MarketPrice> data, ColorScheme colorScheme, String languageCode) {
    final gainers = data.where((item) => item.change > 0).length;
    final losers = data.where((item) => item.change < 0).length;
    final unchanged = data.where((item) => item.change == 0).length;
    final avgChange = data.isEmpty ? 0.0 : data.map((e) => e.change).reduce((a, b) => a + b) / data.length;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            colorScheme.primary,
            colorScheme.primary.withOpacity(0.8),
          ],
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: colorScheme.primary.withOpacity(0.3),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Icon(Icons.trending_up, color: Colors.white, size: 24),
              const SizedBox(width: 12),
              Text(
                'Market Overview',
                style: GoogleFonts.roboto(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          
          const SizedBox(height: 20),
          
          Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Text(
                      gainers.toString(),
                      style: GoogleFonts.roboto(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      'Gainers',
                      style: GoogleFonts.roboto(
                        color: Colors.white.withOpacity(0.8),
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Text(
                      losers.toString(),
                      style: GoogleFonts.roboto(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      'Losers',
                      style: GoogleFonts.roboto(
                        color: Colors.white.withOpacity(0.8),
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Text(
                      '${avgChange >= 0 ? '+' : ''}${avgChange.toStringAsFixed(1)}%',
                      style: GoogleFonts.roboto(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      'Avg Change',
                      style: GoogleFonts.roboto(
                        color: Colors.white.withOpacity(0.8),
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFiltersSection(ColorScheme colorScheme, String languageCode) {
    return Row(
      children: [
        Expanded(
          child: DropdownButtonFormField<String>(
            value: ref.watch(selectedCropProvider),
            decoration: InputDecoration(
              labelText: 'Select Crop',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            ),
            items: _crops.map((crop) => DropdownMenuItem(
              value: crop,
              child: Text(crop),
            )).toList(),
            onChanged: (value) {
              if (value != null) {
                ref.read(selectedCropProvider.notifier).state = value;
              }
            },
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: DropdownButtonFormField<String>(
            value: ref.watch(selectedMarketProvider),
            decoration: InputDecoration(
              labelText: 'Select Market',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            ),
            items: _markets.map((market) => DropdownMenuItem(
              value: market,
              child: Text(market),
            )).toList(),
            onChanged: (value) {
              if (value != null) {
                ref.read(selectedMarketProvider.notifier).state = value;
              }
            },
          ),
        ),
      ],
    );
  }

  Widget _buildPriceTrendChart(ColorScheme colorScheme, String languageCode) {
    final priceHistory = ref.watch(priceHistoryProvider);
    
    return Card(
      elevation: 0,
      color: colorScheme.surfaceContainerHigh,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Price Trend (Last 30 Days)',
              style: GoogleFonts.roboto(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: colorScheme.onSurface,
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 200,
              child: LineChart(
                LineChartData(
                  gridData: FlGridData(
                    show: true,
                    drawVerticalLine: false,
                    horizontalInterval: 100,
                    getDrawingHorizontalLine: (value) {
                      return FlLine(
                        color: colorScheme.outline.withOpacity(0.3),
                        strokeWidth: 1,
                      );
                    },
                  ),
                  titlesData: FlTitlesData(
                    show: true,
                    rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 30,
                        interval: 7,
                        getTitlesWidget: (double value, TitleMeta meta) {
                          if (value.toInt() < priceHistory.length) {
                            final date = priceHistory[value.toInt()].date;
                            return SideTitleWidget(
                              axisSide: meta.axisSide,
                              child: Text(
                                DateFormat('M/d').format(date),
                                style: GoogleFonts.roboto(
                                  color: colorScheme.onSurface.withOpacity(0.6),
                                  fontSize: 12,
                                ),
                              ),
                            );
                          }
                          return Container();
                        },
                      ),
                    ),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        interval: 100,
                        reservedSize: 60,
                        getTitlesWidget: (double value, TitleMeta meta) {
                          return SideTitleWidget(
                            axisSide: meta.axisSide,
                            child: Text(
                              '₹${value.toInt()}',
                              style: GoogleFonts.roboto(
                                color: colorScheme.onSurface.withOpacity(0.6),
                                fontSize: 12,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  borderData: FlBorderData(show: false),
                  minX: 0,
                  maxX: priceHistory.length.toDouble() - 1,
                  minY: priceHistory.map((e) => e.price).reduce((a, b) => a < b ? a : b) - 100,
                  maxY: priceHistory.map((e) => e.price).reduce((a, b) => a > b ? a : b) + 100,
                  lineBarsData: [
                    LineChartBarData(
                      spots: priceHistory.asMap().entries.map((entry) {
                        return FlSpot(entry.key.toDouble(), entry.value.price);
                      }).toList(),
                      isCurved: true,
                      color: colorScheme.primary,
                      barWidth: 3,
                      isStrokeCapRound: true,
                      dotData: FlDotData(show: false),
                      belowBarData: BarAreaData(
                        show: true,
                        color: colorScheme.primary.withOpacity(0.1),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTopMoversSection(List<MarketPrice> data, ColorScheme colorScheme, String languageCode) {
    final sortedByChange = List<MarketPrice>.from(data)
      ..sort((a, b) => b.change.compareTo(a.change));
    
    final topGainers = sortedByChange.where((item) => item.change > 0).take(3).toList();
    final topLosers = sortedByChange.where((item) => item.change < 0).toList().reversed.take(3).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Top Movers',
          style: GoogleFonts.roboto(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: colorScheme.onSurface,
          ),
        ),
        const SizedBox(height: 16),
        
        Row(
          children: [
            Expanded(
              child: Card(
                elevation: 0,
                color: colorScheme.surfaceContainerHigh,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.trending_up, color: Colors.green, size: 20),
                          const SizedBox(width: 8),
                          Text(
                            'Top Gainers',
                            style: GoogleFonts.roboto(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: colorScheme.onSurface,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      ...topGainers.map((item) => Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                item.crop,
                                style: GoogleFonts.roboto(fontSize: 14),
                              ),
                            ),
                            Text(
                              '+${item.change.toStringAsFixed(1)}%',
                              style: GoogleFonts.roboto(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Colors.green,
                              ),
                            ),
                          ],
                        ),
                      )).toList(),
                    ],
                  ),
                ),
              ),
            ),
            
            const SizedBox(width: 12),
            
            Expanded(
              child: Card(
                elevation: 0,
                color: colorScheme.surfaceContainerHigh,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.trending_down, color: Colors.red, size: 20),
                          const SizedBox(width: 8),
                          Text(
                            'Top Losers',
                            style: GoogleFonts.roboto(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: colorScheme.onSurface,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      ...topLosers.map((item) => Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                item.crop,
                                style: GoogleFonts.roboto(fontSize: 14),
                              ),
                            ),
                            Text(
                              '${item.change.toStringAsFixed(1)}%',
                              style: GoogleFonts.roboto(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Colors.red,
                              ),
                            ),
                          ],
                        ),
                      )).toList(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildPriceList(List<MarketPrice> data, ColorScheme colorScheme, String languageCode) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Current Prices',
          style: GoogleFonts.roboto(
            fontSize: 20,
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
            return _buildPriceCard(item, colorScheme);
          },
        ),
      ],
    );
  }

  Widget _buildPriceCard(MarketPrice item, ColorScheme colorScheme) {
    final appSettings = ref.watch(appSettingsProvider);
    
    return Card(
      elevation: 0,
      color: colorScheme.surfaceContainerHigh,
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${item.crop} (${item.variety})',
                        style: GoogleFonts.roboto(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: colorScheme.onSurface,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '${item.market} • ${item.grade}',
                        style: GoogleFonts.roboto(
                          fontSize: 14,
                          color: colorScheme.onSurface.withOpacity(0.7),
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '${appSettings.currency}${item.currentPrice.toStringAsFixed(0)}',
                      style: GoogleFonts.roboto(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: colorScheme.onSurface,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: item.change >= 0 
                            ? Colors.green.withOpacity(0.1)
                            : Colors.red.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        '${item.change >= 0 ? '+' : ''}${item.change.toStringAsFixed(1)}%',
                        style: GoogleFonts.roboto(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: item.change >= 0 ? Colors.green : Colors.red,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            
            const SizedBox(height: 12),
            
            Row(
              children: [
                Icon(
                  Icons.schedule,
                  size: 16,
                  color: colorScheme.onSurface.withOpacity(0.6),
                ),
                const SizedBox(width: 4),
                Text(
                  'Updated ${_formatTime(item.lastUpdated)}',
                  style: GoogleFonts.roboto(
                    fontSize: 12,
                    color: colorScheme.onSurface.withOpacity(0.6),
                  ),
                ),
                const Spacer(),
                Text(
                  item.unit,
                  style: GoogleFonts.roboto(
                    fontSize: 12,
                    color: colorScheme.onSurface.withOpacity(0.6),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  List<MarketPrice> _filterData(List<MarketPrice> data, String selectedCrop, String selectedMarket) {
    return data.where((item) {
      final cropMatch = selectedCrop == 'All' || item.crop == selectedCrop;
      final marketMatch = selectedMarket == 'All Markets' || item.market == selectedMarket;
      return cropMatch && marketMatch;
    }).toList();
  }

  String _formatTime(DateTime dateTime) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);
    
    if (difference.inMinutes < 60) {
      return '${difference.inMinutes}m ago';
    } else if (difference.inHours < 24) {
      return '${difference.inHours}h ago';
    } else {
      return DateFormat('MMM d, h:mm a').format(dateTime);
    }
  }

  void _showPriceAlerts(BuildContext context, String languageCode) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Price Alerts'),
        content: Text('Set price alerts for your crops to get notified when prices change.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('close'.tr(languageCode)),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              // Implement price alert functionality
            },
            child: Text('Set Alert'),
          ),
        ],
      ),
    );
  }

  void _showAddToWatchlist(BuildContext context, String languageCode) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Add Price Alert'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                labelText: 'Select Crop',
                border: OutlineInputBorder(),
              ),
              items: _crops.skip(1).map((crop) => DropdownMenuItem(
                value: crop,
                child: Text(crop),
              )).toList(),
              onChanged: (value) {},
            ),
            const SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: 'Target Price',
                border: OutlineInputBorder(),
                prefixText: '₹',
              ),
              keyboardType: TextInputType.number,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('cancel'.tr(languageCode)),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Price alert set successfully!')),
              );
            },
            child: Text('Set Alert'),
          ),
        ],
      ),
    );
  }
}
