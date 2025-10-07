import 'dart:convert';
import 'dart:async';
import 'dart:math' as math;
import 'package:http/http.dart' as http;

class IndianMarketPriceService {
  static IndianMarketPriceService? _instance;
  static IndianMarketPriceService get instance => _instance ??= IndianMarketPriceService._internal();
  IndianMarketPriceService._internal();

  // Government of India APIs
  final String _enamApiKey = 'YOUR_ENAM_API_KEY'; // Register at data.gov.in
  final String _agmarknetBaseUrl = 'https://api.data.gov.in/resource/9ef84268-d588-465a-a308-a864a43d0070';
  final String _directoryApiUrl = 'https://api.data.gov.in/resource/35985678-0d79-46b4-9ed6-6f13308a1d24';
  
  // Real-time market prices from multiple sources
  Future<MarketPriceData> getRealTimeMarketPrices(
    String state,
    String district,
    List<String> commodities,
  ) async {
    try {
      final List<CommodityPrice> prices = [];
      
      // Get prices from multiple sources for accuracy
      for (String commodity in commodities) {
        final price = await _getCommodityPrice(commodity, state, district);
        if (price != null) prices.add(price);
      }
      
      // Get nearest mandi information
      final nearestMandis = await _getNearestMandis(state, district);
      
      // Get historical price trends
      final priceHistory = await _getPriceHistory(commodities, state, 30);
      
      // Calculate price analytics
      final analytics = await _calculatePriceAnalytics(prices, priceHistory);
      
      return MarketPriceData(
        state: state,
        district: district,
        commodityPrices: prices,
        nearestMandis: nearestMandis,
        priceHistory: priceHistory,
        analytics: analytics,
        lastUpdated: DateTime.now(),
        dataSource: 'Government of India - eNAM & Agmarknet',
      );
    } catch (e) {
      throw Exception('Failed to fetch market prices: $e');
    }
  }

  // Get commodity price from Government APIs
  Future<CommodityPrice?> _getCommodityPrice(
    String commodity, 
    String state, 
    String district,
  ) async {
    try {
      // Primary: eNAM API
      final enamPrice = await _getEnamPrice(commodity, state, district);
      if (enamPrice != null) return enamPrice;
      
      // Fallback: Agmarknet API
      final agmarkPrice = await _getAgmarknetPrice(commodity, state, district);
      if (agmarkPrice != null) return agmarkPrice;
      
      // Fallback: Local mandi prices
      return await _getLocalMandiPrice(commodity, state, district);
    } catch (e) {
      print('Error fetching price for $commodity: $e');
      return null;
    }
  }

  // eNAM (National Agriculture Market) API integration
  Future<CommodityPrice?> _getEnamPrice(
    String commodity, 
    String state, 
    String district,
  ) async {
    try {
      final url = '$_agmarknetBaseUrl'
          '?api-key=$_enamApiKey'
          '&format=json'
          '&filters[state]=$state'
          '&filters[district]=$district'
          '&filters[commodity]=${_mapCommodityToEnam(commodity)}'
          '&limit=1';

      final response = await http.get(Uri.parse(url));
      
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        
        if (data['records'] != null && data['records'].isNotEmpty) {
          final record = data['records'][0];
          
          return CommodityPrice(
            commodity: commodity,
            variety: record['variety'] ?? 'Common',
            minPrice: double.tryParse(record['min_price']?.toString() ?? '0') ?? 0.0,
            maxPrice: double.tryParse(record['max_price']?.toString() ?? '0') ?? 0.0,
            modalPrice: double.tryParse(record['modal_price']?.toString() ?? '0') ?? 0.0,
            unit: record['unit'] ?? 'Quintal',
            marketName: record['market'] ?? 'Unknown',
            arrivals: double.tryParse(record['arrivals']?.toString() ?? '0') ?? 0.0,
            date: DateTime.tryParse(record['date'] ?? '') ?? DateTime.now(),
            priceChange: await _calculatePriceChange(commodity, 
                double.tryParse(record['modal_price']?.toString() ?? '0') ?? 0.0),
            priceChangePercentage: 0.0,
          );
        }
      }
    } catch (e) {
      print('eNAM API error: $e');
    }
    return null;
  }

  // Agmarknet API for wholesale prices
  Future<CommodityPrice?> _getAgmarknetPrice(
    String commodity, 
    String state, 
    String district,
  ) async {
    try {
      final url = '$_directoryApiUrl'
          '?api-key=$_enamApiKey'
          '&format=json'
          '&filters[state]=$state'
          '&filters[district]=$district'
          '&filters[commodity]=${_mapCommodityToAgmarknet(commodity)}'
          '&sort[date]=desc'
          '&limit=1';

      final response = await http.get(Uri.parse(url));
      
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        
        if (data['records'] != null && data['records'].isNotEmpty) {
          final record = data['records'][0];
          
          return CommodityPrice(
            commodity: commodity,
            variety: record['variety'] ?? 'Grade A',
            minPrice: double.tryParse(record['min_price']?.toString() ?? '0') ?? 0.0,
            maxPrice: double.tryParse(record['max_price']?.toString() ?? '0') ?? 0.0,
            modalPrice: double.tryParse(record['modal_price']?.toString() ?? '0') ?? 0.0,
            unit: record['unit'] ?? 'Quintal',
            marketName: record['market'] ?? district,
            arrivals: double.tryParse(record['arrivals']?.toString() ?? '0') ?? 0.0,
            date: DateTime.tryParse(record['date'] ?? '') ?? DateTime.now(),
            priceChange: await _calculatePriceChange(commodity, 
                double.tryParse(record['modal_price']?.toString() ?? '0') ?? 0.0),
            priceChangePercentage: 0.0,
          );
        }
      }
    } catch (e) {
      print('Agmarknet API error: $e');
    }
    return null;
  }

  // Get nearest mandis based on location
  Future<List<MandiInfo>> _getNearestMandis(String state, String district) async {
    try {
      final url = 'https://api.data.gov.in/resource/35985678-0d79-46b4-9ed6-6f13308a1d24'
          '?api-key=$_enamApiKey'
          '&format=json'
          '&filters[state]=$state'
          '&filters[district]=$district'
          '&limit=10';

      final response = await http.get(Uri.parse(url));
      
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final List<MandiInfo> mandis = [];
        
        for (var record in data['records'] ?? []) {
          mandis.add(MandiInfo(
            name: record['market'] ?? 'Unknown Mandi',
            district: record['district'] ?? district,
            state: record['state'] ?? state,
            type: record['market_type'] ?? 'APMC',
            facilities: List<String>.from(record['facilities']?.split(',') ?? []),
            contactNumber: record['phone'] ?? '',
            address: record['address'] ?? '',
            operatingHours: record['timing'] ?? '6:00 AM - 6:00 PM',
            majorCommodities: List<String>.from(record['commodities']?.split(',') ?? []),
          ));
        }
        
        return mandis;
      }
    } catch (e) {
      print('Error fetching mandis: $e');
    }
    return [];
  }

  // Historical price analysis
  Future<List<PriceHistoryPoint>> _getPriceHistory(
    List<String> commodities, 
    String state, 
    int days,
  ) async {
    try {
      final List<PriceHistoryPoint> history = [];
      final endDate = DateTime.now();
      final startDate = endDate.subtract(Duration(days: days));
      
      for (String commodity in commodities) {
        DateTime currentDate = startDate;
        
        while (currentDate.isBefore(endDate)) {
          final dateStr = currentDate.toIso8601String().split('T')[0];
          
          final url = '$_agmarknetBaseUrl'
              '?api-key=$_enamApiKey'
              '&format=json'
              '&filters[state]=$state'
              '&filters[commodity]=${_mapCommodityToEnam(commodity)}'
              '&filters[date]=$dateStr'
              '&limit=1';

          try {
            final response = await http.get(Uri.parse(url));
            
            if (response.statusCode == 200) {
              final data = json.decode(response.body);
              
              if (data['records'] != null && data['records'].isNotEmpty) {
                final record = data['records'][0];
                
                history.add(PriceHistoryPoint(
                  commodity: commodity,
                  date: currentDate,
                  price: double.tryParse(record['modal_price']?.toString() ?? '0') ?? 0.0,
                  volume: double.tryParse(record['arrivals']?.toString() ?? '0') ?? 0.0,
                ));
              }
            }
          } catch (e) {
            // Skip failed requests
          }
          
          currentDate = currentDate.add(Duration(days: 1));
        }
      }
      
      return history;
    } catch (e) {
      print('Error fetching price history: $e');
      return [];
    }
  }

  // Price analytics and predictions
  Future<PriceAnalytics> _calculatePriceAnalytics(
    List<CommodityPrice> currentPrices,
    List<PriceHistoryPoint> history,
  ) async {
    try {
      final Map<String, List<double>> commodityPrices = {};
      final Map<String, double> averagePrices = {};
      final Map<String, double> volatility = {};
      final Map<String, String> trends = {};
      final Map<String, double> predictions = {};

      // Group historical data by commodity
      for (var point in history) {
        if (!commodityPrices.containsKey(point.commodity)) {
          commodityPrices[point.commodity] = [];
        }
        commodityPrices[point.commodity]!.add(point.price);
      }

      // Calculate analytics for each commodity
      for (var commodity in commodityPrices.keys) {
        final prices = commodityPrices[commodity]!;
        
        if (prices.isNotEmpty) {
          // Average price
          averagePrices[commodity] = prices.reduce((a, b) => a + b) / prices.length;
          
          // Volatility (standard deviation)
          final mean = averagePrices[commodity]!;
          final variance = prices.map((price) => (price - mean) * (price - mean))
              .reduce((a, b) => a + b) / prices.length;
          volatility[commodity] = math.sqrt(variance);
          
          // Trend analysis
          if (prices.length >= 7) {
            final recentPrices = prices.take(7).toList();
            final olderPrices = prices.skip(prices.length - 7).toList();
            final recentAvg = recentPrices.reduce((a, b) => a + b) / recentPrices.length;
            final olderAvg = olderPrices.reduce((a, b) => a + b) / olderPrices.length;
            
            if (recentAvg > olderAvg * 1.05) {
              trends[commodity] = 'Rising';
            } else if (recentAvg < olderAvg * 0.95) {
              trends[commodity] = 'Falling';
            } else {
              trends[commodity] = 'Stable';
            }
          }
          
          // Simple price prediction (linear regression)
          predictions[commodity] = _predictNextWeekPrice(prices);
        }
      }

      return PriceAnalytics(
        averagePrices: averagePrices,
        volatility: volatility,
        trends: trends,
        predictions: predictions,
        analysisDate: DateTime.now(),
      );
    } catch (e) {
      print('Error calculating price analytics: $e');
      return PriceAnalytics(
        averagePrices: {},
        volatility: {},
        trends: {},
        predictions: {},
        analysisDate: DateTime.now(),
      );
    }
  }

  // Simple linear regression for price prediction
  double _predictNextWeekPrice(List<double> prices) {
    if (prices.length < 7) return prices.last;
    
    final recentPrices = prices.take(14).toList();
    double sumX = 0, sumY = 0, sumXY = 0, sumX2 = 0;
    
    for (int i = 0; i < recentPrices.length; i++) {
      sumX += i;
      sumY += recentPrices[i];
      sumXY += i * recentPrices[i];
      sumX2 += i * i;
    }
    
    final n = recentPrices.length;
    final slope = (n * sumXY - sumX * sumY) / (n * sumX2 - sumX * sumX);
    final intercept = (sumY - slope * sumX) / n;
    
    return slope * (n + 7) + intercept; // Predict 7 days ahead
  }

  // Commodity mapping functions
  String _mapCommodityToEnam(String commodity) {
    final mapping = {
      'wheat': 'Wheat',
      'rice': 'Rice',
      'maize': 'Maize',
      'bajra': 'Bajra(Pearl Millet/Cumbu)',
      'jowar': 'Jowar(Sorghum)',
      'barley': 'Barley',
      'gram': 'Gram(Chana)',
      'masoor': 'Masoor(Lentil)',
      'moong': 'Moong(Green Gram)',
      'urad': 'Urad(Black Gram)',
      'arhar': 'Arhar(Tur/Red Gram)',
      'groundnut': 'Ground Nut',
      'sunflower': 'Sunflower Seed',
      'safflower': 'Safflower',
      'niger': 'Niger Seed',
      'sesamum': 'Sesamum',
      'mustard': 'Mustard',
      'linseed': 'Linseed',
      'castor': 'Castor Seed',
      'cotton': 'Cotton',
      'sugarcane': 'Sugarcane',
      'jute': 'Jute',
      'onion': 'Onion',
      'potato': 'Potato',
      'tomato': 'Tomato',
    };
    
    return mapping[commodity.toLowerCase()] ?? commodity;
  }

  String _mapCommodityToAgmarknet(String commodity) {
    return _mapCommodityToEnam(commodity); // Same mapping for now
  }

  Future<double> _calculatePriceChange(String commodity, double currentPrice) async {
    // Implementation for calculating price change from yesterday
    return 0.0; // Placeholder
  }

  // Get local mandi prices as fallback
  Future<CommodityPrice?> _getLocalMandiPrice(
    String commodity, 
    String state, 
    String district,
  ) async {
    // Implementation for local mandi price scraping or API
    return null;
  }
}

// Data models for market prices
class MarketPriceData {
  final String state;
  final String district;
  final List<CommodityPrice> commodityPrices;
  final List<MandiInfo> nearestMandis;
  final List<PriceHistoryPoint> priceHistory;
  final PriceAnalytics analytics;
  final DateTime lastUpdated;
  final String dataSource;

  MarketPriceData({
    required this.state,
    required this.district,
    required this.commodityPrices,
    required this.nearestMandis,
    required this.priceHistory,
    required this.analytics,
    required this.lastUpdated,
    required this.dataSource,
  });
}

class CommodityPrice {
  final String commodity;
  final String variety;
  final double minPrice;
  final double maxPrice;
  final double modalPrice;
  final String unit;
  final String marketName;
  final double arrivals;
  final DateTime date;
  final double priceChange;
  final double priceChangePercentage;

  CommodityPrice({
    required this.commodity,
    required this.variety,
    required this.minPrice,
    required this.maxPrice,
    required this.modalPrice,
    required this.unit,
    required this.marketName,
    required this.arrivals,
    required this.date,
    required this.priceChange,
    required this.priceChangePercentage,
  });
}

class MandiInfo {
  final String name;
  final String district;
  final String state;
  final String type;
  final List<String> facilities;
  final String contactNumber;
  final String address;
  final String operatingHours;
  final List<String> majorCommodities;

  MandiInfo({
    required this.name,
    required this.district,
    required this.state,
    required this.type,
    required this.facilities,
    required this.contactNumber,
    required this.address,
    required this.operatingHours,
    required this.majorCommodities,
  });
}

class PriceHistoryPoint {
  final String commodity;
  final DateTime date;
  final double price;
  final double volume;

  PriceHistoryPoint({
    required this.commodity,
    required this.date,
    required this.price,
    required this.volume,
  });
}

class PriceAnalytics {
  final Map<String, double> averagePrices;
  final Map<String, double> volatility;
  final Map<String, String> trends;
  final Map<String, double> predictions;
  final DateTime analysisDate;

  PriceAnalytics({
    required this.averagePrices,
    required this.volatility,
    required this.trends,
    required this.predictions,
    required this.analysisDate,
  });
}
