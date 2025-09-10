import 'dart:convert';
import 'dart:io';
import 'package:flutter/services.dart';
import '../models/soil_data_model.dart';
import '../models/crop_calendar_model.dart';
import '../models/regional_data_models.dart';

class RegionalDataService {
  static RegionalDataService? _instance;
  static RegionalDataService get instance => _instance ??= RegionalDataService._internal();
  
  RegionalDataService._internal();

  List<SoilData> _soilData = [];
  List<CropCalendar> _cropCalendar = [];
  List<HistoricalWeatherData> _weatherData = [];
  List<InputCostData> _inputCosts = [];
  Map<String, RegionalConfiguration> _regionalConfigs = {};
  
  bool _isInitialized = false;

  // Getters
  List<SoilData> get soilData => _soilData;
  List<CropCalendar> get cropCalendar => _cropCalendar;
  List<HistoricalWeatherData> get weatherData => _weatherData;
  List<InputCostData> get inputCosts => _inputCosts;
  Map<String, RegionalConfiguration> get regionalConfigs => _regionalConfigs;
  bool get isInitialized => _isInitialized;

  // Initialize all data from CSV files
  Future<void> initializeData() async {
    if (_isInitialized) return;

    try {
      await Future.wait([
        _loadSoilData(),
        _loadCropCalendar(),
        _loadWeatherData(),
        _loadInputCosts(),
        _loadRegionalConfiguration(),
      ]);
      
      _isInitialized = true;
      print('Regional data service initialized successfully');
    } catch (e) {
      print('Error initializing regional data: $e');
      throw Exception('Failed to initialize regional data: $e');
    }
  }

  // Load soil data from CSV
  Future<void> _loadSoilData() async {
    try {
      final csvData = await rootBundle.loadString('CSV Data/soil_data_by_region.csv');
      final lines = csvData.split('\n');
      
      // Skip header row
      for (int i = 1; i < lines.length; i++) {
        if (lines[i].trim().isNotEmpty) {
          final values = _parseCsvLine(lines[i]);
          if (values.length >= 11) {
            _soilData.add(SoilData.fromCsv(values));
          }
        }
      }
      print('Loaded ${_soilData.length} soil data records');
    } catch (e) {
      print('Error loading soil data: $e');
    }
  }

  // Load crop calendar from CSV
  Future<void> _loadCropCalendar() async {
    try {
      final csvData = await rootBundle.loadString('CSV Data/regional_crop_calendar.csv');
      final lines = csvData.split('\n');
      
      // Skip header row
      for (int i = 1; i < lines.length; i++) {
        if (lines[i].trim().isNotEmpty) {
          final values = _parseCsvLine(lines[i]);
          if (values.length >= 10) {
            _cropCalendar.add(CropCalendar.fromCsv(values));
          }
        }
      }
      print('Loaded ${_cropCalendar.length} crop calendar records');
    } catch (e) {
      print('Error loading crop calendar: $e');
    }
  }

  // Load weather data from CSV
  Future<void> _loadWeatherData() async {
    try {
      final csvData = await rootBundle.loadString('CSV Data/historical_weather_data.csv');
      final lines = csvData.split('\n');
      
      // Skip header row
      for (int i = 1; i < lines.length; i++) {
        if (lines[i].trim().isNotEmpty) {
          final values = _parseCsvLine(lines[i]);
          if (values.length >= 9) {
            _weatherData.add(HistoricalWeatherData.fromCsv(values));
          }
        }
      }
      print('Loaded ${_weatherData.length} weather data records');
    } catch (e) {
      print('Error loading weather data: $e');
    }
  }

  // Load input costs from CSV
  Future<void> _loadInputCosts() async {
    try {
      final csvData = await rootBundle.loadString('CSV Data/input_costs_regional.csv');
      final lines = csvData.split('\n');
      
      // Skip header row
      for (int i = 1; i < lines.length; i++) {
        if (lines[i].trim().isNotEmpty) {
          final values = _parseCsvLine(lines[i]);
          if (values.length >= 8) {
            _inputCosts.add(InputCostData.fromCsv(values));
          }
        }
      }
      print('Loaded ${_inputCosts.length} input cost records');
    } catch (e) {
      print('Error loading input costs: $e');
    }
  }

  // Load regional configuration from JSON
  Future<void> _loadRegionalConfiguration() async {
    try {
      final jsonData = await rootBundle.loadString('CSV Data/regional_configuration.json');
      final configMap = json.decode(jsonData);
      
      final regions = configMap['regions'] as Map<String, dynamic>;
      for (final entry in regions.entries) {
        _regionalConfigs[entry.key] = RegionalConfiguration.fromJson(
          entry.key,
          entry.value,
        );
      }
      print('Loaded ${_regionalConfigs.length} regional configurations');
    } catch (e) {
      print('Error loading regional configuration: $e');
    }
  }

  // Helper method to parse CSV lines properly
  List<String> _parseCsvLine(String line) {
    List<String> result = [];
    bool inQuotes = false;
    String currentField = '';
    
    for (int i = 0; i < line.length; i++) {
      String char = line[i];
      
      if (char == '"') {
        inQuotes = !inQuotes;
      } else if (char == ',' && !inQuotes) {
        result.add(currentField.trim());
        currentField = '';
      } else {
        currentField += char;
      }
    }
    
    if (currentField.isNotEmpty) {
      result.add(currentField.trim());
    }
    
    return result;
  }

  // Query methods for soil data
  SoilData? getSoilDataByRegion(String state, String district) {
    return _soilData.firstWhere(
      (soil) => soil.state.toLowerCase() == state.toLowerCase() &&
                soil.district.toLowerCase() == district.toLowerCase(),
      orElse: () => _soilData.first, // Return first as fallback
    );
  }

  List<SoilData> getSoilDataByState(String state) {
    return _soilData.where(
      (soil) => soil.state.toLowerCase() == state.toLowerCase(),
    ).toList();
  }

  // Query methods for crop calendar
  List<CropCalendar> getCropCalendarByRegion(String state, String district) {
    return _cropCalendar.where(
      (calendar) => calendar.state.toLowerCase() == state.toLowerCase() &&
                   calendar.district.toLowerCase() == district.toLowerCase(),
    ).toList();
  }

  List<CropCalendar> getCurrentSeasonCrops(String state, String district) {
    final now = DateTime.now();
    return getCropCalendarByRegion(state, district).where(
      (calendar) => calendar.isCurrentlyInSowingWindow || 
                   calendar.isCurrentlyInHarvestWindow,
    ).toList();
  }

  // Query methods for weather data
  List<HistoricalWeatherData> getWeatherDataByRegion(int regionId) {
    return _weatherData.where(
      (weather) => weather.regionId == regionId,
    ).toList();
  }

  HistoricalWeatherData? getCurrentMonthWeather(int regionId) {
    final currentMonth = DateTime.now().month;
    return _weatherData.firstWhere(
      (weather) => weather.regionId == regionId && weather.month == currentMonth,
      orElse: () => _weatherData.first,
    );
  }

  // Query methods for input costs
  List<InputCostData> getInputCostsByRegion(int regionId) {
    return _inputCosts.where(
      (cost) => cost.regionId == regionId,
    ).toList();
  }

  List<InputCostData> getInputCostsByType(String inputType, int regionId) {
    return _inputCosts.where(
      (cost) => cost.regionId == regionId && 
               cost.inputType.toLowerCase() == inputType.toLowerCase(),
    ).toList();
  }

  double? getAverageInputCost(String inputType, int regionId) {
    final costs = getInputCostsByType(inputType, regionId);
    if (costs.isEmpty) return null;
    
    final total = costs.fold<double>(0, (sum, cost) => sum + cost.costPerUnit);
    return total / costs.length;
  }

  // Regional configuration queries
  RegionalConfiguration? getRegionalConfig(String state) {
    for (final config in _regionalConfigs.values) {
      if (config.includesState(state)) {
        return config;
      }
    }
    return null;
  }

  String? getCurrentSeason(String state) {
    final config = getRegionalConfig(state);
    return config?.getCurrentSeason();
  }

  // Comprehensive farming recommendations
  Map<String, dynamic> getFarmingRecommendations(String state, String district) {
    final soilData = getSoilDataByRegion(state, district);
    final cropCalendar = getCropCalendarByRegion(state, district);
    final config = getRegionalConfig(state);
    
    return {
      'soil_recommendations': soilData?.getFertilizerRecommendations() ?? [],
      'suitable_crops': soilData?.getSuitableCrops() ?? [],
      'current_season': config?.getCurrentSeason() ?? 'unknown',
      'seasonal_crops': cropCalendar.where((c) => c.isCurrentlyInSowingWindow).toList(),
      'soil_health': {
        'ph_status': soilData?.phCategory ?? 'unknown',
        'organic_matter': soilData?.organicMatterStatus ?? 'unknown',
        'nitrogen': soilData?.nitrogenStatus ?? 'unknown',
        'phosphorus': soilData?.phosphorusStatus ?? 'unknown',
        'potassium': soilData?.potassiumStatus ?? 'unknown',
      },
      'regional_info': {
        'primary_crops': config?.primaryCrops ?? [],
        'soil_types': config?.soilTypes ?? [],
        'languages': config?.languages ?? [],
      }
    };
  }

  // Cost analysis for farming
  Map<String, dynamic> getCostAnalysis(int regionId, List<String> requiredInputs) {
    double totalCost = 0;
    Map<String, double> costBreakdown = {};
    List<String> unavailableInputs = [];
    
    for (final inputType in requiredInputs) {
      final costs = getInputCostsByType(inputType, regionId);
      if (costs.isNotEmpty) {
        final avgCost = getAverageInputCost(inputType, regionId) ?? 0;
        costBreakdown[inputType] = avgCost;
        totalCost += avgCost;
        
        // Check availability
        final availableInputs = costs.where((c) => c.isAvailable).toList();
        if (availableInputs.isEmpty) {
          unavailableInputs.add(inputType);
        }
      } else {
        unavailableInputs.add(inputType);
      }
    }
    
    return {
      'total_estimated_cost': totalCost,
      'cost_breakdown': costBreakdown,
      'unavailable_inputs': unavailableInputs,
      'cost_per_hectare': totalCost, // Assuming costs are per hectare
    };
  }

  // Weather-based crop recommendations
  List<String> getWeatherBasedCropRecommendations(int regionId) {
    final currentMonth = DateTime.now().month;
    final weatherData = getCurrentMonthWeather(regionId);
    
    if (weatherData == null) return [];
    
    return weatherData.getCropSuitability();
  }
}
