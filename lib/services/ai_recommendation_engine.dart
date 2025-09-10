import 'dart:math';
import '../models/soil_data_model.dart';
import '../models/crop_calendar_model.dart';
import '../models/regional_data_models.dart';
import 'regional_data_service.dart';

class AIRecommendationEngine {
  static AIRecommendationEngine? _instance;
  static AIRecommendationEngine get instance => _instance ??= AIRecommendationEngine._internal();
  
  AIRecommendationEngine._internal();

  final RegionalDataService _dataService = RegionalDataService.instance;

  // Comprehensive crop recommendation based on multiple factors
  Future<Map<String, dynamic>> getAICropRecommendations({
    required String state,
    required String district,
    required double farmSize, // in hectares
    required double budget, // in INR
    required String experienceLevel, // 'beginner', 'intermediate', 'expert'
    required List<String> previousCrops,
    String? marketPreference, // 'local', 'export', 'processing'
  }) async {
    
    // Ensure data is loaded
    if (!_dataService.isInitialized) {
      await _dataService.initializeData();
    }

    // Get regional data
    final soilData = _dataService.getSoilDataByRegion(state, district);
    final cropCalendar = _dataService.getCropCalendarByRegion(state, district);
    final regionalConfig = _dataService.getRegionalConfig(state);
    final regionId = soilData?.regionId ?? 1;
    
    // Analyze soil suitability
    final soilSuitability = _analyzeSoilSuitability(soilData);
    
    // Analyze seasonal timing
    final seasonalSuitability = _analyzeSeasonalSuitability(cropCalendar);
    
    // Analyze economic factors
    final economicAnalysis = _analyzeEconomicFactors(regionId, budget, farmSize);
    
    // Weather-based recommendations
    final weatherRecommendations = _dataService.getWeatherBasedCropRecommendations(regionId);
    
    // Generate crop scores
    final cropScores = _calculateCropScores(
      soilData: soilData,
      cropCalendar: cropCalendar,
      budget: budget,
      farmSize: farmSize,
      experienceLevel: experienceLevel,
      previousCrops: previousCrops,
      regionId: regionId,
    );

    // Risk assessment
    final riskAssessment = _assessRisks(state, district, regionId);
    
    // Diversification recommendations
    final diversificationPlan = _generateDiversificationPlan(cropScores, farmSize);

    return {
      'recommended_crops': cropScores.take(5).toList(),
      'soil_analysis': soilSuitability,
      'seasonal_timing': seasonalSuitability,
      'economic_analysis': economicAnalysis,
      'weather_suitability': weatherRecommendations,
      'risk_assessment': riskAssessment,
      'diversification_plan': diversificationPlan,
      'success_probability': _calculateSuccessProbability(cropScores.first),
      'recommended_practices': _getRecommendedPractices(experienceLevel),
      'timeline': _generateFarmingTimeline(cropScores.take(3).toList()),
    };
  }

  // Analyze soil suitability for different crops
  Map<String, dynamic> _analyzeSoilSuitability(SoilData? soilData) {
    if (soilData == null) {
      return {
        'status': 'data_unavailable',
        'message': 'Soil data not available for this region',
      };
    }

    return {
      'soil_type': soilData.soilType,
      'ph_analysis': {
        'value': soilData.phLevel,
        'status': soilData.phCategory,
        'recommendation': _getPhRecommendation(soilData.phLevel),
      },
      'nutrients': {
        'nitrogen': {
          'value': soilData.nitrogenKgPerHectare,
          'status': soilData.nitrogenStatus,
        },
        'phosphorus': {
          'value': soilData.phosphorusKgPerHectare,
          'status': soilData.phosphorusStatus,
        },
        'potassium': {
          'value': soilData.potassiumKgPerHectare,
          'status': soilData.potassiumStatus,
        },
      },
      'organic_matter': {
        'value': soilData.organicCarbonPercent,
        'status': soilData.organicMatterStatus,
      },
      'drainage': soilData.drainageCapacity,
      'suitable_crops': soilData.getSuitableCrops(),
      'fertilizer_recommendations': soilData.getFertilizerRecommendations(),
    };
  }

  // Analyze seasonal timing for crops
  Map<String, dynamic> _analyzeSeasonalSuitability(List<CropCalendar> cropCalendar) {
    final currentDate = DateTime.now();
    final currentSeasonCrops = cropCalendar.where((c) => c.isCurrentlyInSowingWindow).toList();
    final upcomingCrops = cropCalendar.where((c) => 
      c.sowingStartDate.isAfter(currentDate) && 
      c.sowingStartDate.difference(currentDate).inDays <= 60
    ).toList();

    return {
      'current_season': currentSeasonCrops.isNotEmpty ? currentSeasonCrops.first.season : 'off_season',
      'immediate_opportunities': currentSeasonCrops.map((c) => {
        'crop_id': c.cropId,
        'variety': c.varietyRecommended,
        'days_remaining': c.sowingEndDate.difference(currentDate).inDays,
        'duration': c.cropDurationDays,
        'seed_rate': c.seedRateKgPerHectare,
      }).toList(),
      'upcoming_opportunities': upcomingCrops.map((c) => {
        'crop_id': c.cropId,
        'variety': c.varietyRecommended,
        'days_to_start': c.sowingStartDate.difference(currentDate).inDays,
        'duration': c.cropDurationDays,
      }).toList(),
    };
  }

  // Analyze economic factors
  Map<String, dynamic> _analyzeEconomicFactors(int regionId, double budget, double farmSize) {
    final inputTypes = ['Seed', 'Fertilizer', 'Pesticide', 'Labor', 'Machinery'];
    final costAnalysis = _dataService.getCostAnalysis(regionId, inputTypes);
    
    final costPerHectare = costAnalysis['cost_per_hectare'] as double;
    final maxAffordableArea = budget > 0 ? budget / costPerHectare : farmSize;
    
    return {
      'cost_analysis': costAnalysis,
      'budget_utilization': min(farmSize, maxAffordableArea) / farmSize * 100,
      'cost_per_hectare': costPerHectare,
      'recommended_area': min(farmSize, maxAffordableArea),
      'budget_status': budget >= (costPerHectare * farmSize) ? 'sufficient' : 'insufficient',
      'financing_options': _getFinancingOptions(budget, costPerHectare * farmSize),
    };
  }

  // Calculate crop scores based on multiple factors
  List<Map<String, dynamic>> _calculateCropScores({
    required SoilData? soilData,
    required List<CropCalendar> cropCalendar,
    required double budget,
    required double farmSize,
    required String experienceLevel,
    required List<String> previousCrops,
    required int regionId,
  }) {
    
    final crops = [
      {'name': 'Rice', 'id': 1, 'base_score': 70},
      {'name': 'Wheat', 'id': 2, 'base_score': 65},
      {'name': 'Maize', 'id': 3, 'base_score': 75},
      {'name': 'Cotton', 'id': 4, 'base_score': 60},
      {'name': 'Sugarcane', 'id': 5, 'base_score': 55},
      {'name': 'Soybean', 'id': 6, 'base_score': 70},
      {'name': 'Groundnut', 'id': 7, 'base_score': 65},
      {'name': 'Millet', 'id': 8, 'base_score': 80},
    ];

    List<Map<String, dynamic>> scoredCrops = [];

    for (final crop in crops) {
      double score = (crop['base_score'] as num).toDouble();
      final cropName = crop['name'] as String;
      final cropId = crop['id'] as int;
      
      // Soil suitability scoring
      if (soilData != null) {
        final suitableCrops = soilData.getSuitableCrops();
        if (suitableCrops.contains(cropName)) {
          score += 15;
        }
        
        // pH suitability
        score += _getPhSuitabilityScore(cropName, soilData.phLevel);
        
        // Nutrient suitability
        score += _getNutrientSuitabilityScore(cropName, soilData);
      }

      // Seasonal timing scoring
      final cropCalendarEntry = cropCalendar.firstWhere(
        (c) => c.cropId == cropId,
        orElse: () => cropCalendar.first,
      );
      
      if (cropCalendarEntry.isCurrentlyInSowingWindow) {
        score += 20;
      } else if (cropCalendarEntry.sowingStartDate.difference(DateTime.now()).inDays <= 30) {
        score += 10;
      }

      // Experience level adjustment
      score += _getExperienceBonus(cropName, experienceLevel);
      
      // Previous crop diversity bonus
      if (!previousCrops.contains(cropName)) {
        score += 5;
      }

      // Economic viability
      final inputCosts = _dataService.getInputCostsByRegion(regionId);
      final cropSpecificCosts = inputCosts.where((c) => 
        c.inputName.toLowerCase().contains(cropName.toLowerCase())).toList();
      
      if (cropSpecificCosts.isNotEmpty) {
        final avgCost = cropSpecificCosts.fold(0.0, (sum, cost) => sum + cost.costPerUnit) / cropSpecificCosts.length;
        if (avgCost <= budget / farmSize) {
          score += 10;
        }
      }

      // Weather suitability
      final weatherCrops = _dataService.getWeatherBasedCropRecommendations(regionId);
      if (weatherCrops.contains(cropName)) {
        score += 10;
      }

      // Market demand (simulated - would be real data in production)
      score += _getMarketDemandScore(cropName);

      scoredCrops.add({
        'crop_name': cropName,
        'crop_id': cropId,
        'score': score.round(),
        'confidence_level': _getConfidenceLevel(score),
        'estimated_yield': _getEstimatedYield(cropName, soilData),
        'estimated_profit': _getEstimatedProfit(cropName, regionId, farmSize),
        'risk_level': _getRiskLevel(cropName),
        'growing_tips': _getGrowingTips(cropName),
      });
    }

    // Sort by score
    scoredCrops.sort((a, b) => b['score'].compareTo(a['score']));
    
    return scoredCrops;
  }

  // Risk assessment
  Map<String, dynamic> _assessRisks(String state, String district, int regionId) {
    final weatherData = _dataService.getCurrentMonthWeather(regionId);
    
    return {
      'weather_risks': {
        'drought_risk': (weatherData?.rainfallMm ?? 0) < 50 ? 'high' : 'low',
        'flood_risk': (weatherData?.rainfallMm ?? 0) > 200 ? 'high' : 'low',
        'temperature_stress': (weatherData?.maxTemperature ?? 0) > 40 ? 'high' : 'low',
      },
      'market_risks': {
        'price_volatility': 'medium', // Would be calculated from historical data
        'demand_fluctuation': 'low',
      },
      'pest_disease_risks': _getPestDiseaseRisks(regionId),
      'mitigation_strategies': _getMitigationStrategies(),
    };
  }

  // Generate diversification plan
  Map<String, dynamic> _generateDiversificationPlan(List<Map<String, dynamic>> cropScores, double farmSize) {
    final topCrops = cropScores.take(3).toList();
    
    return {
      'recommended_allocation': {
        'primary_crop': {
          'name': topCrops[0]['crop_name'],
          'area_percentage': 60,
          'area_hectares': farmSize * 0.6,
        },
        'secondary_crop': {
          'name': topCrops[1]['crop_name'],
          'area_percentage': 25,
          'area_hectares': farmSize * 0.25,
        },
        'experimental_crop': {
          'name': topCrops[2]['crop_name'],
          'area_percentage': 15,
          'area_hectares': farmSize * 0.15,
        },
      },
      'benefits': [
        'Risk reduction through diversification',
        'Multiple income streams',
        'Soil health improvement through rotation',
        'Market flexibility',
      ],
    };
  }

  // Helper methods
  String _getPhRecommendation(double phLevel) {
    if (phLevel < 6.5) return 'Apply lime to reduce acidity';
    if (phLevel > 7.5) return 'Apply gypsum to reduce alkalinity';
    return 'pH level is optimal for most crops';
  }

  double _getPhSuitabilityScore(String cropName, double phLevel) {
    final Map<String, Map<String, double>> cropPhPreferences = {
      'Rice': {'min': 5.5, 'max': 7.0},
      'Wheat': {'min': 6.0, 'max': 7.5},
      'Maize': {'min': 6.0, 'max': 7.5},
      'Cotton': {'min': 5.8, 'max': 8.0},
      'Sugarcane': {'min': 6.0, 'max': 7.5},
      'Soybean': {'min': 6.0, 'max': 7.0},
      'Groundnut': {'min': 6.0, 'max': 7.0},
      'Millet': {'min': 5.5, 'max': 8.5},
    };

    final preferences = cropPhPreferences[cropName];
    if (preferences == null) return 0;

    if (phLevel >= preferences['min']! && phLevel <= preferences['max']!) {
      return 10;
    } else if (phLevel >= preferences['min']! - 0.5 && phLevel <= preferences['max']! + 0.5) {
      return 5;
    }
    return 0;
  }

  double _getNutrientSuitabilityScore(String cropName, SoilData soilData) {
    double score = 0;
    
    // Nitrogen requirements
    if ((cropName == 'Rice' || cropName == 'Wheat') && soilData.nitrogenStatus == 'High') {
      score += 5;
    }
    
    // Phosphorus requirements
    if ((cropName == 'Cotton' || cropName == 'Groundnut') && soilData.phosphorusStatus == 'High') {
      score += 5;
    }
    
    // Potassium requirements
    if ((cropName == 'Sugarcane' || cropName == 'Cotton') && soilData.potassiumStatus == 'High') {
      score += 5;
    }
    
    return score;
  }

  double _getExperienceBonus(String cropName, String experienceLevel) {
    final Map<String, List<String>> experienceCrops = {
      'beginner': ['Millet', 'Groundnut', 'Maize'],
      'intermediate': ['Rice', 'Wheat', 'Soybean'],
      'expert': ['Cotton', 'Sugarcane'],
    };

    final suitableCrops = experienceCrops[experienceLevel] ?? [];
    return suitableCrops.contains(cropName) ? 5 : 0;
  }

  double _getMarketDemandScore(String cropName) {
    // Simulated market demand scores
    final Map<String, double> marketDemand = {
      'Rice': 8,
      'Wheat': 7,
      'Maize': 6,
      'Cotton': 5,
      'Sugarcane': 4,
      'Soybean': 7,
      'Groundnut': 6,
      'Millet': 8,
    };
    
    return marketDemand[cropName] ?? 5;
  }

  String _getConfidenceLevel(double score) {
    if (score >= 90) return 'Very High';
    if (score >= 80) return 'High';
    if (score >= 70) return 'Medium';
    if (score >= 60) return 'Low';
    return 'Very Low';
  }

  Map<String, dynamic> _getEstimatedYield(String cropName, SoilData? soilData) {
    // Base yields in quintals per hectare
    final Map<String, Map<String, double>> baseYields = {
      'Rice': {'min': 30, 'max': 60},
      'Wheat': {'min': 25, 'max': 50},
      'Maize': {'min': 35, 'max': 70},
      'Cotton': {'min': 15, 'max': 25}, // in bales
      'Sugarcane': {'min': 800, 'max': 1200}, // in quintals
      'Soybean': {'min': 15, 'max': 30},
      'Groundnut': {'min': 20, 'max': 35},
      'Millet': {'min': 15, 'max': 25},
    };

    final yield = baseYields[cropName] ?? {'min': 20, 'max': 40};
    
    // Adjust based on soil quality
    if (soilData != null) {
      double multiplier = 1.0;
      
      if (soilData.organicMatterStatus == 'High') multiplier += 0.1;
      if (soilData.nitrogenStatus == 'High') multiplier += 0.1;
      if (soilData.drainageCapacity == 'Good') multiplier += 0.05;
      
      yield['min'] = yield['min']! * multiplier;
      yield['max'] = yield['max']! * multiplier;
    }
    
    return {
      'min_yield': yield['min']!.round(),
      'max_yield': yield['max']!.round(),
      'unit': cropName == 'Cotton' ? 'bales' : 'quintals',
    };
  }

  Map<String, dynamic> _getEstimatedProfit(String cropName, int regionId, double farmSize) {
    // This would calculate based on yield, market prices, and input costs
    // Simplified calculation for demonstration
    final random = Random();
    final baseProfit = 15000 + random.nextInt(35000); // Base profit per hectare
    
    return {
      'profit_per_hectare': baseProfit,
      'total_estimated_profit': (baseProfit * farmSize).round(),
      'profit_margin_percent': 25 + random.nextInt(20),
    };
  }

  String _getRiskLevel(String cropName) {
    final Map<String, String> riskLevels = {
      'Rice': 'Medium',
      'Wheat': 'Low',
      'Maize': 'Low',
      'Cotton': 'High',
      'Sugarcane': 'Medium',
      'Soybean': 'Medium',
      'Groundnut': 'Medium',
      'Millet': 'Low',
    };
    
    return riskLevels[cropName] ?? 'Medium';
  }

  List<String> _getGrowingTips(String cropName) {
    final Map<String, List<String>> tips = {
      'Rice': [
        'Maintain proper water levels throughout growing period',
        'Use certified seeds for better yields',
        'Apply fertilizers in 3 split doses',
        'Monitor for blast and brown plant hopper',
      ],
      'Wheat': [
        'Sow at proper depth (3-5 cm)',
        'Ensure timely irrigation at critical stages',
        'Apply balanced NPK fertilizers',
        'Harvest at physiological maturity',
      ],
      'Maize': [
        'Maintain proper plant spacing',
        'Ensure adequate nutrition during tasseling',
        'Control weeds in early stages',
        'Watch for stem borer and fall armyworm',
      ],
      // Add more crops as needed
    };
    
    return tips[cropName] ?? ['Follow recommended agronomic practices', 'Monitor crop regularly'];
  }

  double _calculateSuccessProbability(Map<String, dynamic> topCrop) {
    final score = topCrop['score'] as int;
    return (score / 100.0 * 100).clamp(0, 95); // Max 95% probability
  }

  List<String> _getRecommendedPractices(String experienceLevel) {
    switch (experienceLevel) {
      case 'beginner':
        return [
          'Start with easy-to-grow crops',
          'Follow package of practices strictly',
          'Seek guidance from extension officers',
          'Join farmer groups for support',
          'Keep detailed records of activities',
        ];
      case 'intermediate':
        return [
          'Experiment with new varieties',
          'Implement integrated pest management',
          'Focus on soil health improvement',
          'Explore value addition opportunities',
          'Use technology for better monitoring',
        ];
      case 'expert':
        return [
          'Lead adoption of new technologies',
          'Diversify into high-value crops',
          'Implement precision agriculture',
          'Share knowledge with other farmers',
          'Explore contract farming opportunities',
        ];
      default:
        return ['Follow scientific farming practices'];
    }
  }

  Map<String, List<String>> _generateFarmingTimeline(List<Map<String, dynamic>> topCrops) {
    final timeline = <String, List<String>>{};
    
    for (int i = 0; i < topCrops.length && i < 3; i++) {
      final crop = topCrops[i];
      final cropName = crop['crop_name'] as String;
      
      timeline['Month ${i + 1}'] = [
        'Prepare field for $cropName',
        'Arrange certified seeds and inputs',
        'Apply pre-planting fertilizers',
        'Begin sowing operations',
      ];
      
      timeline['Month ${i + 2}'] = [
        'Complete sowing of $cropName',
        'Apply first irrigation if needed',
        'Monitor for pest and disease',
        'Apply first top dressing',
      ];
      
      timeline['Month ${i + 4}'] = [
        'Continue crop monitoring',
        'Apply second irrigation',
        'Pest and disease management',
        'Prepare for harvest',
      ];
    }
    
    return timeline;
  }

  List<String> _getFinancingOptions(double budget, double requiredAmount) {
    if (budget >= requiredAmount) {
      return ['Self-financing sufficient'];
    }
    
    return [
      'Kisan Credit Card (KCC) loan',
      'Bank crop loans at subsidized rates',
      'Government subsidy schemes',
      'Farmer Producer Organization (FPO) support',
      'Cooperative society loans',
      'Input dealer credit arrangements',
    ];
  }

  Map<String, String> _getPestDiseaseRisks(int regionId) {
    // This would be based on historical data and current conditions
    return {
      'fungal_diseases': 'medium',
      'insect_pests': 'low',
      'viral_diseases': 'low',
      'nematodes': 'medium',
    };
  }

  List<String> _getMitigationStrategies() {
    return [
      'Crop diversification to reduce risk',
      'Integrated Pest Management (IPM)',
      'Soil health improvement through organic matter',
      'Water conservation and efficient irrigation',
      'Weather-based advisory services',
      'Crop insurance to cover losses',
      'Market linkage for better prices',
    ];
  }
}
