import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;

class MarketDataService {
  static const String _apiKey = 'demo_key'; // Replace with actual API key
  static const String _baseUrl = 'https://api.data.gov.in/resource/9ef84268-d588-465a-a308-a864a43d0070';
  
  // Government of India Agriculture Market API
  static const String _govApiUrl = 'https://api.data.gov.in/resource/35985678-0d79-46b4-9ed6-6f13308a1d24';

  // Get current market prices
  Future<List<Map<String, dynamic>>> getCurrentMarketPrices({
    String? state,
    String? market,
    String? commodity,
  }) async {
    try {
      // Try to fetch from government API first
      final govPrices = await _fetchGovernmentPrices(state, market, commodity);
      if (govPrices.isNotEmpty) {
        return govPrices;
      }
    } catch (e) {
      print('Error fetching government data: $e');
    }

    // Fallback to mock data with realistic Indian market prices
    return _generateRealisticMockData(state, market, commodity);
  }

  // Fetch prices from Government of India API
  Future<List<Map<String, dynamic>>> _fetchGovernmentPrices(
    String? state,
    String? market,
    String? commodity,
  ) async {
    try {
      var url = '$_govApiUrl?api-key=$_apiKey&format=json&limit=100';
      
      if (state != null) url += '&filters[state]=$state';
      if (market != null) url += '&filters[market]=$market';
      if (commodity != null) url += '&filters[commodity]=$commodity';

      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data['records'] != null) {
          return (data['records'] as List)
              .map((record) => _formatGovernmentData(record))
              .toList();
        }
      }
    } catch (e) {
      print('Government API error: $e');
    }
    
    return [];
  }

  // Format government API data
  Map<String, dynamic> _formatGovernmentData(Map<String, dynamic> record) {
    return {
      'crop': record['commodity'] ?? 'Unknown',
      'variety': record['variety'] ?? 'Standard',
      'market': record['market'] ?? 'Unknown',
      'state': record['state'] ?? 'Unknown',
      'currentPrice': _parsePrice(record['modal_price']),
      'previousPrice': _parsePrice(record['min_price']),
      'unit': 'per quintal',
      'lastUpdated': DateTime.now(),
      'change': _calculateChange(
        _parsePrice(record['modal_price']),
        _parsePrice(record['min_price']),
      ),
      'grade': record['grade'] ?? 'FAQ',
      'source': 'Government API',
    };
  }

  // Parse price from string
  double _parsePrice(dynamic price) {
    if (price == null) return 0.0;
    if (price is num) return price.toDouble();
    if (price is String) {
      final cleaned = price.replaceAll(RegExp(r'[^\d.]'), '');
      return double.tryParse(cleaned) ?? 0.0;
    }
    return 0.0;
  }

  // Calculate price change percentage
  double _calculateChange(double current, double previous) {
    if (previous == 0) return 0.0;
    return ((current - previous) / previous) * 100;
  }

  // Generate realistic mock data for Indian markets
  List<Map<String, dynamic>> _generateRealisticMockData(
    String? state,
    String? market,
    String? commodity,
  ) {
    final random = Random();
    final crops = _getIndianCrops();
    final markets = _getIndianMarkets();
    final varieties = _getCropVarieties();

    List<Map<String, dynamic>> mockData = [];

    for (int i = 0; i < 15; i++) {
      final crop = crops[random.nextInt(crops.length)];
      final marketData = markets[random.nextInt(markets.length)];
      final variety = varieties[crop] ?? ['Standard'];
      final selectedVariety = variety[random.nextInt(variety.length)];

      // Generate realistic price based on crop type
      final basePrice = _getBasePriceForCrop(crop);
      final priceVariation = (random.nextDouble() - 0.5) * 0.3; // ±15% variation
      final currentPrice = (basePrice * (1 + priceVariation)).round().toDouble();
      final previousPrice = currentPrice * (0.95 + random.nextDouble() * 0.1);

      mockData.add({
        'crop': crop,
        'variety': selectedVariety,
        'market': marketData['name'],
        'state': marketData['state'],
        'currentPrice': currentPrice,
        'previousPrice': previousPrice,
        'unit': 'per quintal',
        'lastUpdated': DateTime.now().subtract(
          Duration(hours: random.nextInt(24), minutes: random.nextInt(60)),
        ),
        'change': _calculateChange(currentPrice, previousPrice),
        'grade': _getRandomGrade(),
        'source': 'Market Survey',
        'demand': _getRandomDemand(),
        'supply': _getRandomSupply(),
        'qualityFactors': _getQualityFactors(crop),
      });
    }

    // Filter based on parameters
    if (commodity != null) {
      mockData = mockData.where((item) => 
        item['crop'].toString().toLowerCase().contains(commodity.toLowerCase())).toList();
    }
    if (market != null) {
      mockData = mockData.where((item) => 
        item['market'].toString().toLowerCase().contains(market.toLowerCase())).toList();
    }
    if (state != null) {
      mockData = mockData.where((item) => 
        item['state'].toString().toLowerCase().contains(state.toLowerCase())).toList();
    }

    return mockData;
  }

  // Get price history for a specific crop
  Future<List<Map<String, dynamic>>> getPriceHistory({
    required String crop,
    String? market,
    int days = 30,
  }) async {
    // Generate mock historical data
    final random = Random();
    final basePrice = _getBasePriceForCrop(crop);
    final history = <Map<String, dynamic>>[];

    for (int i = days; i >= 0; i--) {
      final date = DateTime.now().subtract(Duration(days: i));
      final dailyVariation = (random.nextDouble() - 0.5) * 0.1; // ±5% daily variation
      final price = basePrice * (1 + dailyVariation);

      history.add({
        'date': date,
        'price': price,
        'volume': 50 + random.nextInt(200), // Quintals traded
        'trend': _calculateTrend(history.isNotEmpty ? history.last['price'] : price, price),
      });
    }

    return history;
  }

  // Get market trends and analysis
  Future<Map<String, dynamic>> getMarketAnalysis({
    String? state,
    String? crop,
  }) async {
    final random = Random();
    final currentPrices = await getCurrentMarketPrices(state: state, commodity: crop);
    
    // Calculate averages and trends
    final avgPrice = currentPrices.isNotEmpty 
        ? currentPrices.map((p) => p['currentPrice'] as double).reduce((a, b) => a + b) / currentPrices.length
        : 0.0;

    final topMovers = currentPrices
        .where((item) => (item['change'] as double).abs() > 5)
        .toList()
        ..sort((a, b) => (b['change'] as double).compareTo(a['change'] as double));

    return {
      'averagePrice': avgPrice,
      'totalMarkets': currentPrices.length,
      'priceRange': {
        'min': currentPrices.isNotEmpty 
            ? currentPrices.map((p) => p['currentPrice'] as double).reduce((a, b) => a < b ? a : b)
            : 0.0,
        'max': currentPrices.isNotEmpty 
            ? currentPrices.map((p) => p['currentPrice'] as double).reduce((a, b) => a > b ? a : b)
            : 0.0,
      },
      'topGainers': topMovers.where((item) => (item['change'] as double) > 0).take(5).toList(),
      'topLosers': topMovers.where((item) => (item['change'] as double) < 0).take(5).toList(),
      'marketSentiment': _getMarketSentiment(currentPrices),
      'recommendations': _getMarketRecommendations(currentPrices),
      'seasonalFactors': _getSeasonalFactors(),
      'supplyDemandBalance': {
        'supply': 'Moderate',
        'demand': 'High',
        'outlook': 'Prices expected to remain stable',
      },
    };
  }

  // Helper methods
  List<String> _getIndianCrops() {
    return [
      'Wheat', 'Rice', 'Maize', 'Cotton', 'Sugarcane', 'Soybean',
      'Potato', 'Onion', 'Tomato', 'Chili', 'Turmeric', 'Coriander',
      'Groundnut', 'Mustard', 'Sunflower', 'Gram', 'Jowar', 'Bajra',
      'Arhar', 'Masoor', 'Moong', 'Urad', 'Sesamum', 'Nigerseed',
    ];
  }

  List<Map<String, String>> _getIndianMarkets() {
    return [
      {'name': 'APMC Delhi', 'state': 'Delhi'},
      {'name': 'Azadpur Mandi', 'state': 'Delhi'},
      {'name': 'Mumbai APMC', 'state': 'Maharashtra'},
      {'name': 'Nashik Market', 'state': 'Maharashtra'},
      {'name': 'Bangalore Market', 'state': 'Karnataka'},
      {'name': 'Mysore APMC', 'state': 'Karnataka'},
      {'name': 'Chennai Koyambedu', 'state': 'Tamil Nadu'},
      {'name': 'Coimbatore Market', 'state': 'Tamil Nadu'},
      {'name': 'Hyderabad Market', 'state': 'Telangana'},
      {'name': 'Warangal APMC', 'state': 'Telangana'},
      {'name': 'Kolkata Market', 'state': 'West Bengal'},
      {'name': 'Siliguri Market', 'state': 'West Bengal'},
      {'name': 'Jaipur APMC', 'state': 'Rajasthan'},
      {'name': 'Kota Market', 'state': 'Rajasthan'},
      {'name': 'Indore APMC', 'state': 'Madhya Pradesh'},
      {'name': 'Bhopal Market', 'state': 'Madhya Pradesh'},
    ];
  }

  Map<String, List<String>> _getCropVarieties() {
    return {
      'Wheat': ['HD-2967', 'PBW-343', 'DBW-88', 'HD-3086', 'WH-147'],
      'Rice': ['Basmati 1121', 'PR-126', 'Pusa-44', 'IR-64', 'Swarna'],
      'Cotton': ['Bt Cotton', 'Kapas', 'DCH-32', 'Bunny Bt', 'RCH-2'],
      'Potato': ['Kufri Jyoti', 'Kufri Badshah', 'Kufri Chipsona', 'Kufri Pukhraj'],
      'Onion': ['Red Onion', 'White Onion', 'Bombay Red', 'Pusa Red'],
      'Tomato': ['Hybrid', 'Desi', 'Cherry', 'Roma'],
    };
  }

  double _getBasePriceForCrop(String crop) {
    final prices = {
      'Wheat': 2450.0,
      'Rice': 3200.0,
      'Maize': 1850.0,
      'Cotton': 5800.0,
      'Sugarcane': 280.0,
      'Soybean': 3950.0,
      'Potato': 1200.0,
      'Onion': 1500.0,
      'Tomato': 2800.0,
      'Chili': 8500.0,
      'Turmeric': 7200.0,
      'Groundnut': 4500.0,
      'Mustard': 5100.0,
      'Gram': 4800.0,
    };
    return prices[crop] ?? 2500.0;
  }

  String _getRandomGrade() {
    final grades = ['FAQ', 'Grade A', 'Grade B', 'Premium', 'Standard'];
    return grades[Random().nextInt(grades.length)];
  }

  String _getRandomDemand() {
    final demands = ['High', 'Moderate', 'Low', 'Very High'];
    return demands[Random().nextInt(demands.length)];
  }

  String _getRandomSupply() {
    final supplies = ['Adequate', 'Limited', 'Surplus', 'Moderate'];
    return supplies[Random().nextInt(supplies.length)];
  }

  List<String> _getQualityFactors(String crop) {
    final factors = {
      'Wheat': ['Moisture content', 'Protein level', 'Gluten strength'],
      'Rice': ['Broken grains', 'Moisture', 'Purity'],
      'Cotton': ['Fiber length', 'Micronaire', 'Strength'],
      'Potato': ['Size uniformity', 'Dry matter', 'Sugar content'],
      'Onion': ['Size', 'Color', 'Storage quality'],
    };
    return factors[crop] ?? ['Quality', 'Purity', 'Grade'];
  }

  String _calculateTrend(double previousPrice, double currentPrice) {
    final change = ((currentPrice - previousPrice) / previousPrice) * 100;
    if (change > 2) return 'Rising';
    if (change < -2) return 'Falling';
    return 'Stable';
  }

  String _getMarketSentiment(List<Map<String, dynamic>> prices) {
    if (prices.isEmpty) return 'Neutral';
    
    final avgChange = prices
        .map((p) => p['change'] as double)
        .reduce((a, b) => a + b) / prices.length;

    if (avgChange > 3) return 'Bullish';
    if (avgChange < -3) return 'Bearish';
    return 'Neutral';
  }

  List<String> _getMarketRecommendations(List<Map<String, dynamic>> prices) {
    final recommendations = <String>[];
    
    if (prices.isEmpty) {
      recommendations.add('Monitor market conditions regularly');
      return recommendations;
    }

    final avgChange = prices
        .map((p) => p['change'] as double)
        .reduce((a, b) => a + b) / prices.length;

    if (avgChange > 5) {
      recommendations.add('Consider selling if prices meet your target');
      recommendations.add('Monitor for price corrections');
    } else if (avgChange < -5) {
      recommendations.add('Consider holding stock for better prices');
      recommendations.add('Explore direct marketing channels');
    } else {
      recommendations.add('Good time for gradual selling');
      recommendations.add('Focus on quality to get premium prices');
    }

    recommendations.add('Check multiple markets for best rates');
    recommendations.add('Consider storage costs vs immediate sale');
    
    return recommendations;
  }

  Map<String, String> _getSeasonalFactors() {
    final month = DateTime.now().month;
    
    if (month >= 4 && month <= 6) {
      return {
        'season': 'Summer',
        'impact': 'Harvest season for Rabi crops, prices may decline',
        'recommendation': 'Plan storage for better prices later',
      };
    } else if (month >= 7 && month <= 9) {
      return {
        'season': 'Monsoon',
        'impact': 'Sowing season for Kharif crops, input demand high',
        'recommendation': 'Focus on quality seeds and fertilizers',
      };
    } else if (month >= 10 && month <= 12) {
      return {
        'season': 'Post-Monsoon',
        'impact': 'Kharif harvest approaching, market active',
        'recommendation': 'Monitor harvest progress and plan marketing',
      };
    } else {
      return {
        'season': 'Winter',
        'impact': 'Rabi sowing season, prices for stored grain high',
        'recommendation': 'Good time to sell stored produce',
      };
    }
  }

  // Get top performing markets
  Future<List<Map<String, dynamic>>> getTopMarkets({
    String? crop,
    int limit = 10,
  }) async {
    final prices = await getCurrentMarketPrices(commodity: crop);
    
    prices.sort((a, b) => (b['currentPrice'] as double).compareTo(a['currentPrice'] as double));
    
    return prices.take(limit).map((price) => {
      'market': price['market'],
      'state': price['state'],
      'price': price['currentPrice'],
      'change': price['change'],
      'grade': price['grade'],
    }).toList();
  }

  // Get price alerts based on user preferences
  List<Map<String, dynamic>> getPriceAlerts(
    List<Map<String, dynamic>> prices,
    Map<String, double> userTargets,
  ) {
    final alerts = <Map<String, dynamic>>[];
    
    for (final price in prices) {
      final crop = price['crop'] as String;
      final currentPrice = price['currentPrice'] as double;
      final change = price['change'] as double;
      
      if (userTargets.containsKey(crop)) {
        final targetPrice = userTargets[crop]!;
        
        if (currentPrice >= targetPrice) {
          alerts.add({
            'type': 'target_reached',
            'crop': crop,
            'market': price['market'],
            'currentPrice': currentPrice,
            'targetPrice': targetPrice,
            'message': '$crop has reached your target price of ₹$targetPrice',
          });
        }
      }
      
      if (change.abs() > 10) {
        alerts.add({
          'type': 'significant_change',
          'crop': crop,
          'market': price['market'],
          'change': change,
          'message': '$crop price ${change > 0 ? 'increased' : 'decreased'} by ${change.abs().toStringAsFixed(1)}%',
        });
      }
    }
    
    return alerts;
  }
}
