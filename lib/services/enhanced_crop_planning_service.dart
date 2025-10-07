/// Enhanced Crop Planning Service with comprehensive agriculture tools
class EnhancedCropPlanningService {
  static final EnhancedCropPlanningService _instance =
      EnhancedCropPlanningService._internal();
  factory EnhancedCropPlanningService() => _instance;
  EnhancedCropPlanningService._internal();

  // Crop data from Agricultural Research
  final Map<String, CropProfile> _cropDatabase = {
    'wheat': CropProfile(
      name: 'Wheat',
      category: CropCategory.cereal,
      seasons: ['Rabi'],
      sowingMonths: [10, 11, 12],
      harvestMonths: [3, 4, 5],
      duration: 120,
      waterRequirement: WaterRequirement.medium,
      soilTypes: ['loamy', 'clay-loam', 'sandy-loam'],
      optimalTemperature: TemperatureRange(15, 25),
      fertilizers: ['Urea', 'DAP', 'Potash'],
      diseases: ['Rust', 'Smut', 'Blight'],
      pests: ['Aphid', 'Termite', 'Army worm'],
      yieldPerHectare: 3500,
      marketPrice: 2300,
      profitMargin: 0.35,
    ),
    'rice': CropProfile(
      name: 'Rice',
      category: CropCategory.cereal,
      seasons: ['Kharif', 'Rabi'],
      sowingMonths: [6, 7, 8, 11, 12],
      harvestMonths: [10, 11, 3, 4],
      duration: 110,
      waterRequirement: WaterRequirement.high,
      soilTypes: ['clay', 'clay-loam'],
      optimalTemperature: TemperatureRange(20, 35),
      fertilizers: ['Urea', 'DAP', 'Zinc Sulphate'],
      diseases: ['Blast', 'Blight', 'Sheath rot'],
      pests: ['Stem borer', 'Brown plant hopper', 'Gall midge'],
      yieldPerHectare: 4000,
      marketPrice: 2800,
      profitMargin: 0.32,
    ),
    'maize': CropProfile(
      name: 'Maize',
      category: CropCategory.cereal,
      seasons: ['Kharif', 'Rabi'],
      sowingMonths: [6, 7, 11, 12],
      harvestMonths: [10, 11, 3, 4],
      duration: 90,
      waterRequirement: WaterRequirement.medium,
      soilTypes: ['sandy-loam', 'loamy', 'clay-loam'],
      optimalTemperature: TemperatureRange(21, 27),
      fertilizers: ['Urea', 'DAP', 'Potash'],
      diseases: ['Rust', 'Blight', 'Downy mildew'],
      pests: ['Fall army worm', 'Stem borer', 'Aphid'],
      yieldPerHectare: 5500,
      marketPrice: 2000,
      profitMargin: 0.40,
    ),
    'sugarcane': CropProfile(
      name: 'Sugarcane',
      category: CropCategory.cash,
      seasons: ['Annual'],
      sowingMonths: [2, 3, 10, 11],
      harvestMonths: [12, 1, 2, 3],
      duration: 365,
      waterRequirement: WaterRequirement.high,
      soilTypes: ['clay-loam', 'loamy'],
      optimalTemperature: TemperatureRange(26, 32),
      fertilizers: ['Urea', 'DAP', 'Potash', 'Organic manure'],
      diseases: ['Red rot', 'Wilt', 'Smut'],
      pests: ['Shoot borer', 'Root borer', 'Scale insect'],
      yieldPerHectare: 75000,
      marketPrice: 350,
      profitMargin: 0.25,
    ),
    'cotton': CropProfile(
      name: 'Cotton',
      category: CropCategory.cash,
      seasons: ['Kharif'],
      sowingMonths: [5, 6, 7],
      harvestMonths: [10, 11, 12, 1],
      duration: 180,
      waterRequirement: WaterRequirement.medium,
      soilTypes: ['sandy-loam', 'clay-loam'],
      optimalTemperature: TemperatureRange(21, 30),
      fertilizers: ['Urea', 'DAP', 'Potash'],
      diseases: ['Wilt', 'Blight', 'Leaf curl'],
      pests: ['Bollworm', 'Aphid', 'Thrips'],
      yieldPerHectare: 1800,
      marketPrice: 6500,
      profitMargin: 0.28,
    ),
    'soybean': CropProfile(
      name: 'Soybean',
      category: CropCategory.oilseed,
      seasons: ['Kharif'],
      sowingMonths: [6, 7],
      harvestMonths: [10, 11],
      duration: 100,
      waterRequirement: WaterRequirement.medium,
      soilTypes: ['sandy-loam', 'loamy'],
      optimalTemperature: TemperatureRange(20, 30),
      fertilizers: ['DAP', 'Potash', 'Rhizobium'],
      diseases: ['Rust', 'Blight', 'Mosaic'],
      pests: ['Pod borer', 'Stem fly', 'Aphid'],
      yieldPerHectare: 1800,
      marketPrice: 4500,
      profitMargin: 0.45,
    ),
    'tomato': CropProfile(
      name: 'Tomato',
      category: CropCategory.vegetable,
      seasons: ['Rabi', 'Summer'],
      sowingMonths: [10, 11, 2, 3],
      harvestMonths: [1, 2, 5, 6],
      duration: 75,
      waterRequirement: WaterRequirement.high,
      soilTypes: ['sandy-loam', 'loamy'],
      optimalTemperature: TemperatureRange(18, 27),
      fertilizers: ['Urea', 'DAP', 'Potash', 'Organic manure'],
      diseases: ['Blight', 'Wilt', 'Leaf curl'],
      pests: ['Fruit borer', 'Aphid', 'Whitefly'],
      yieldPerHectare: 25000,
      marketPrice: 15,
      profitMargin: 0.50,
    ),
    'onion': CropProfile(
      name: 'Onion',
      category: CropCategory.vegetable,
      seasons: ['Rabi', 'Kharif'],
      sowingMonths: [6, 7, 11, 12],
      harvestMonths: [3, 4, 10, 11],
      duration: 120,
      waterRequirement: WaterRequirement.medium,
      soilTypes: ['sandy-loam', 'loamy'],
      optimalTemperature: TemperatureRange(15, 25),
      fertilizers: ['Urea', 'DAP', 'Potash'],
      diseases: ['Purple blotch', 'Downy mildew', 'Smut'],
      pests: ['Thrips', 'Cut worm', 'Root maggot'],
      yieldPerHectare: 20000,
      marketPrice: 25,
      profitMargin: 0.55,
    ),
  };

  // Regional soil and climate data
  final Map<String, RegionalData> _regionalDatabase = {
    'punjab': RegionalData(
      state: 'Punjab',
      soilTypes: ['alluvial', 'sandy-loam'],
      avgRainfall: 650,
      seasons: {
        'kharif': SeasonInfo(
          startMonth: 6,
          endMonth: 10,
          avgTemp: 30,
          rainfall: 400,
        ),
        'rabi': SeasonInfo(
          startMonth: 11,
          endMonth: 4,
          avgTemp: 18,
          rainfall: 250,
        ),
      },
      majorCrops: ['wheat', 'rice', 'cotton', 'sugarcane'],
      marketPrices: {
        'wheat': 2400,
        'rice': 2900,
        'cotton': 6800,
        'sugarcane': 380,
      },
    ),
    'uttar pradesh': RegionalData(
      state: 'Uttar Pradesh',
      soilTypes: ['alluvial', 'loamy', 'clay-loam'],
      avgRainfall: 1050,
      seasons: {
        'kharif': SeasonInfo(
          startMonth: 6,
          endMonth: 10,
          avgTemp: 28,
          rainfall: 750,
        ),
        'rabi': SeasonInfo(
          startMonth: 11,
          endMonth: 4,
          avgTemp: 16,
          rainfall: 300,
        ),
      },
      majorCrops: ['wheat', 'rice', 'sugarcane', 'maize'],
      marketPrices: {
        'wheat': 2350,
        'rice': 2850,
        'sugarcane': 360,
        'maize': 2050,
      },
    ),
    // Add more states as needed
  };

  // Crop recommendation algorithm
  Future<CropRecommendation> getCropRecommendations({
    required String state,
    required String soilType,
    required double fieldSize,
    required double budget,
    required int currentMonth,
    String? previousCrop,
    WaterAvailability? waterAvailability,
  }) async {
    // Simulate API delay
    await Future.delayed(Duration(milliseconds: 800));

    final regional = _regionalDatabase[state.toLowerCase()];
    if (regional == null) {
      throw Exception('Regional data not available for $state');
    }

    // Determine current season
    String currentSeason = _getCurrentSeason(currentMonth);

    // Filter suitable crops
    List<CropSuitability> suitableCrops = [];

    for (var crop in _cropDatabase.values) {
      if (crop.seasons.contains(currentSeason) ||
          crop.seasons.contains('Annual')) {
        if (crop.soilTypes.contains(soilType.toLowerCase())) {
          if (crop.sowingMonths.contains(currentMonth) ||
              crop.sowingMonths.contains(currentMonth + 1)) {
            double suitabilityScore = _calculateSuitabilityScore(
              crop,
              regional,
              soilType,
              fieldSize,
              budget,
              waterAvailability,
            );

            if (suitabilityScore > 0.3) {
              // Minimum threshold
              suitableCrops.add(CropSuitability(
                crop: crop,
                suitabilityScore: suitabilityScore,
                expectedYield: crop.yieldPerHectare * fieldSize,
                expectedRevenue:
                    crop.yieldPerHectare * fieldSize * crop.marketPrice,
                expectedProfit: crop.yieldPerHectare *
                    fieldSize *
                    crop.marketPrice *
                    crop.profitMargin,
                investmentRequired: _calculateInvestment(crop, fieldSize),
                riskLevel: _calculateRiskLevel(crop, regional),
              ));
            }
          }
        }
      }
    }

    // Sort by suitability score
    suitableCrops
        .sort((a, b) => b.suitabilityScore.compareTo(a.suitabilityScore));

    return CropRecommendation(
      recommendations: suitableCrops.take(5).toList(),
      season: currentSeason,
      region: regional,
      bestCrop: suitableCrops.isNotEmpty ? suitableCrops.first : null,
      alternativeCrops: suitableCrops.skip(1).take(3).toList(),
    );
  }

  // Get crop calendar for planning
  Future<CropCalendar> getCropCalendar({
    required String cropName,
    required String state,
    required int sowingMonth,
  }) async {
    await Future.delayed(Duration(milliseconds: 500));

    final crop = _cropDatabase[cropName.toLowerCase()];
    if (crop == null) {
      throw Exception('Crop data not available for $cropName');
    }

    final regional = _regionalDatabase[state.toLowerCase()];
    if (regional == null) {
      throw Exception('Regional data not available for $state');
    }

    List<CropActivity> activities = _generateCropActivities(crop, sowingMonth);

    return CropCalendar(
      crop: crop,
      sowingDate: DateTime(DateTime.now().year, sowingMonth, 15),
      harvestDate: DateTime(DateTime.now().year, sowingMonth, 15)
          .add(Duration(days: crop.duration)),
      activities: activities,
      criticalPeriods: _getCriticalPeriods(crop, sowingMonth),
      weatherRequirements: _getWeatherRequirements(crop),
    );
  }

  // Get input cost analysis
  Future<InputCostAnalysis> getInputCostAnalysis({
    required String cropName,
    required double fieldSize,
    required String state,
  }) async {
    await Future.delayed(Duration(milliseconds: 400));

    final crop = _cropDatabase[cropName.toLowerCase()];
    if (crop == null) {
      throw Exception('Crop data not available for $cropName');
    }

    return InputCostAnalysis(
      cropName: cropName,
      fieldSize: fieldSize,
      seedCost: _calculateSeedCost(crop, fieldSize),
      fertilizerCost: _calculateFertilizerCost(crop, fieldSize),
      pesticideCost: _calculatePesticideCost(crop, fieldSize),
      laborCost: _calculateLaborCost(crop, fieldSize),
      irrigationCost: _calculateIrrigationCost(crop, fieldSize),
      machineryRent: _calculateMachineryCost(crop, fieldSize),
      totalCost: 0, // Will be calculated
      profitProjection: ProfitProjection(
        expectedRevenue: crop.yieldPerHectare * fieldSize * crop.marketPrice,
        totalCosts: 0, // Will be calculated
        grossProfit: 0, // Will be calculated
        profitMargin: crop.profitMargin,
        breakEvenYield: 0, // Will be calculated
      ),
    );
  }

  // Helper methods
  String _getCurrentSeason(int month) {
    if (month >= 6 && month <= 10) return 'Kharif';
    if (month >= 11 || month <= 4) return 'Rabi';
    return 'Summer';
  }

  double _calculateSuitabilityScore(
    CropProfile crop,
    RegionalData regional,
    String soilType,
    double fieldSize,
    double budget,
    WaterAvailability? waterAvailability,
  ) {
    double score = 0.0;

    // Soil suitability (30%)
    if (crop.soilTypes.contains(soilType.toLowerCase())) score += 0.3;

    // Climate suitability (25%)
    if (regional.majorCrops.contains(crop.name.toLowerCase())) score += 0.25;

    // Water requirement vs availability (20%)
    if (waterAvailability != null) {
      switch (crop.waterRequirement) {
        case WaterRequirement.low:
          score += 0.20;
          break;
        case WaterRequirement.medium:
          if (waterAvailability == WaterAvailability.adequate ||
              waterAvailability == WaterAvailability.high)
            score += 0.20;
          else
            score += 0.10;
          break;
        case WaterRequirement.high:
          if (waterAvailability == WaterAvailability.high)
            score += 0.20;
          else
            score += 0.05;
          break;
      }
    } else {
      score += 0.15; // Default if not specified
    }

    // Economic viability (15%)
    double investmentRequired = _calculateInvestment(crop, fieldSize);
    if (investmentRequired <= budget)
      score += 0.15;
    else if (investmentRequired <= budget * 1.2) score += 0.10;

    // Market demand (10%)
    if (crop.profitMargin > 0.3)
      score += 0.10;
    else if (crop.profitMargin > 0.2) score += 0.05;

    return score.clamp(0.0, 1.0);
  }

  double _calculateInvestment(CropProfile crop, double fieldSize) {
    // Base investment calculation per hectare
    double baseInvestment = 50000; // Base cost per hectare

    switch (crop.category) {
      case CropCategory.cereal:
        baseInvestment = 40000;
        break;
      case CropCategory.cash:
        baseInvestment = 80000;
        break;
      case CropCategory.oilseed:
        baseInvestment = 45000;
        break;
      case CropCategory.vegetable:
        baseInvestment = 120000;
        break;
      case CropCategory.pulse:
        baseInvestment = 35000;
        break;
      case CropCategory.spice:
        baseInvestment = 60000;
        break;
    }

    return baseInvestment * fieldSize;
  }

  RiskLevel _calculateRiskLevel(CropProfile crop, RegionalData regional) {
    int riskFactors = 0;

    if (crop.waterRequirement == WaterRequirement.high) riskFactors++;
    if (crop.diseases.length > 3) riskFactors++;
    if (crop.pests.length > 3) riskFactors++;
    if (crop.profitMargin < 0.25) riskFactors++;
    if (crop.duration > 120) riskFactors++;

    if (riskFactors <= 1) return RiskLevel.low;
    if (riskFactors <= 3) return RiskLevel.medium;
    return RiskLevel.high;
  }

  List<CropActivity> _generateCropActivities(
      CropProfile crop, int sowingMonth) {
    List<CropActivity> activities = [];
    DateTime sowingDate = DateTime(DateTime.now().year, sowingMonth, 15);

    // Land preparation
    activities.add(CropActivity(
      name: 'Land Preparation',
      description: 'Plowing, harrowing, and field preparation',
      dueDate: sowingDate.subtract(Duration(days: 7)),
      category: ActivityCategory.cultivation,
      priority: ActivityPriority.high,
    ));

    // Sowing
    activities.add(CropActivity(
      name: 'Sowing',
      description: 'Seed sowing and initial fertilizer application',
      dueDate: sowingDate,
      category: ActivityCategory.cultivation,
      priority: ActivityPriority.critical,
    ));

    // Irrigation activities
    for (int i = 1; i <= (crop.duration / 15).ceil(); i++) {
      if (crop.waterRequirement != WaterRequirement.low || i <= 3) {
        activities.add(CropActivity(
          name: 'Irrigation ${i}',
          description: 'Regular irrigation for crop growth',
          dueDate: sowingDate.add(Duration(days: i * 15)),
          category: ActivityCategory.irrigation,
          priority: ActivityPriority.medium,
        ));
      }
    }

    // Fertilizer applications
    activities.add(CropActivity(
      name: 'First Fertilization',
      description: 'First dose of fertilizers',
      dueDate: sowingDate.add(Duration(days: 20)),
      category: ActivityCategory.fertilization,
      priority: ActivityPriority.high,
    ));

    activities.add(CropActivity(
      name: 'Second Fertilization',
      description: 'Second dose of fertilizers',
      dueDate: sowingDate.add(Duration(days: 45)),
      category: ActivityCategory.fertilization,
      priority: ActivityPriority.medium,
    ));

    // Pest and disease management
    activities.add(CropActivity(
      name: 'Pest Monitoring',
      description: 'Regular monitoring and pest control',
      dueDate: sowingDate.add(Duration(days: 30)),
      category: ActivityCategory.protection,
      priority: ActivityPriority.medium,
    ));

    // Harvesting
    activities.add(CropActivity(
      name: 'Harvesting',
      description: 'Crop harvesting and post-harvest handling',
      dueDate: sowingDate.add(Duration(days: crop.duration)),
      category: ActivityCategory.harvesting,
      priority: ActivityPriority.critical,
    ));

    return activities..sort((a, b) => a.dueDate.compareTo(b.dueDate));
  }

  List<CriticalPeriod> _getCriticalPeriods(CropProfile crop, int sowingMonth) {
    DateTime sowingDate = DateTime(DateTime.now().year, sowingMonth, 15);

    return [
      CriticalPeriod(
        name: 'Germination',
        description: 'Critical period for seed germination and establishment',
        startDate: sowingDate,
        endDate: sowingDate.add(Duration(days: 15)),
        requirements: [
          'Adequate moisture',
          'Optimal temperature',
          'Pest protection'
        ],
      ),
      CriticalPeriod(
        name: 'Flowering',
        description: 'Critical flowering and fruit set period',
        startDate: sowingDate.add(Duration(days: crop.duration ~/ 2)),
        endDate: sowingDate.add(Duration(days: (crop.duration * 0.7).round())),
        requirements: [
          'Regular irrigation',
          'Disease prevention',
          'Nutrient availability'
        ],
      ),
      CriticalPeriod(
        name: 'Maturity',
        description: 'Final maturation and harvest preparation',
        startDate:
            sowingDate.add(Duration(days: (crop.duration * 0.85).round())),
        endDate: sowingDate.add(Duration(days: crop.duration)),
        requirements: [
          'Reduced irrigation',
          'Weather protection',
          'Harvest timing'
        ],
      ),
    ];
  }

  WeatherRequirement _getWeatherRequirements(CropProfile crop) {
    return WeatherRequirement(
      optimalTemperature: crop.optimalTemperature,
      minRainfall: _getMinRainfall(crop.waterRequirement),
      maxRainfall: _getMaxRainfall(crop.waterRequirement),
      criticalWeatherEvents: _getCriticalWeatherEvents(crop),
    );
  }

  double _getMinRainfall(WaterRequirement waterReq) {
    switch (waterReq) {
      case WaterRequirement.low:
        return 300;
      case WaterRequirement.medium:
        return 600;
      case WaterRequirement.high:
        return 1000;
    }
  }

  double _getMaxRainfall(WaterRequirement waterReq) {
    switch (waterReq) {
      case WaterRequirement.low:
        return 800;
      case WaterRequirement.medium:
        return 1200;
      case WaterRequirement.high:
        return 2000;
    }
  }

  List<String> _getCriticalWeatherEvents(CropProfile crop) {
    List<String> events = ['Heavy rainfall during flowering'];

    if (crop.waterRequirement == WaterRequirement.high) {
      events.add('Prolonged drought');
    }

    if (crop.category == CropCategory.vegetable) {
      events.addAll(['Hailstorm', 'Sudden temperature drop']);
    }

    return events;
  }

  // Cost calculation methods
  double _calculateSeedCost(CropProfile crop, double fieldSize) {
    Map<String, double> seedCostPerHectare = {
      'wheat': 3000,
      'rice': 2500,
      'maize': 4000,
      'cotton': 8000,
      'soybean': 3500,
      'sugarcane': 15000,
      'tomato': 5000,
      'onion': 4000,
    };

    return (seedCostPerHectare[crop.name.toLowerCase()] ?? 3000) * fieldSize;
  }

  double _calculateFertilizerCost(CropProfile crop, double fieldSize) {
    Map<String, double> fertilizerCostPerHectare = {
      'wheat': 8000,
      'rice': 9000,
      'maize': 7000,
      'cotton': 12000,
      'soybean': 5000,
      'sugarcane': 20000,
      'tomato': 15000,
      'onion': 10000,
    };

    return (fertilizerCostPerHectare[crop.name.toLowerCase()] ?? 8000) *
        fieldSize;
  }

  double _calculatePesticideCost(CropProfile crop, double fieldSize) {
    Map<String, double> pesticideCostPerHectare = {
      'wheat': 2000,
      'rice': 3000,
      'maize': 2500,
      'cotton': 8000,
      'soybean': 2000,
      'sugarcane': 5000,
      'tomato': 6000,
      'onion': 3000,
    };

    return (pesticideCostPerHectare[crop.name.toLowerCase()] ?? 3000) *
        fieldSize;
  }

  double _calculateLaborCost(CropProfile crop, double fieldSize) {
    Map<String, double> laborCostPerHectare = {
      'wheat': 15000,
      'rice': 20000,
      'maize': 12000,
      'cotton': 25000,
      'soybean': 10000,
      'sugarcane': 40000,
      'tomato': 35000,
      'onion': 30000,
    };

    return (laborCostPerHectare[crop.name.toLowerCase()] ?? 15000) * fieldSize;
  }

  double _calculateIrrigationCost(CropProfile crop, double fieldSize) {
    double baseCost = 0;
    switch (crop.waterRequirement) {
      case WaterRequirement.low:
        baseCost = 3000;
        break;
      case WaterRequirement.medium:
        baseCost = 6000;
        break;
      case WaterRequirement.high:
        baseCost = 12000;
        break;
    }
    return baseCost * fieldSize;
  }

  double _calculateMachineryCost(CropProfile crop, double fieldSize) {
    return 8000 * fieldSize; // Average machinery rental cost per hectare
  }
}

// Data Models
class CropProfile {
  final String name;
  final CropCategory category;
  final List<String> seasons;
  final List<int> sowingMonths;
  final List<int> harvestMonths;
  final int duration; // days
  final WaterRequirement waterRequirement;
  final List<String> soilTypes;
  final TemperatureRange optimalTemperature;
  final List<String> fertilizers;
  final List<String> diseases;
  final List<String> pests;
  final double yieldPerHectare;
  final double marketPrice; // per kg or per quintal
  final double profitMargin;

  CropProfile({
    required this.name,
    required this.category,
    required this.seasons,
    required this.sowingMonths,
    required this.harvestMonths,
    required this.duration,
    required this.waterRequirement,
    required this.soilTypes,
    required this.optimalTemperature,
    required this.fertilizers,
    required this.diseases,
    required this.pests,
    required this.yieldPerHectare,
    required this.marketPrice,
    required this.profitMargin,
  });
}

class RegionalData {
  final String state;
  final List<String> soilTypes;
  final double avgRainfall;
  final Map<String, SeasonInfo> seasons;
  final List<String> majorCrops;
  final Map<String, double> marketPrices;

  RegionalData({
    required this.state,
    required this.soilTypes,
    required this.avgRainfall,
    required this.seasons,
    required this.majorCrops,
    required this.marketPrices,
  });
}

class SeasonInfo {
  final int startMonth;
  final int endMonth;
  final double avgTemp;
  final double rainfall;

  SeasonInfo({
    required this.startMonth,
    required this.endMonth,
    required this.avgTemp,
    required this.rainfall,
  });
}

class CropRecommendation {
  final List<CropSuitability> recommendations;
  final String season;
  final RegionalData region;
  final CropSuitability? bestCrop;
  final List<CropSuitability> alternativeCrops;

  CropRecommendation({
    required this.recommendations,
    required this.season,
    required this.region,
    this.bestCrop,
    required this.alternativeCrops,
  });
}

class CropSuitability {
  final CropProfile crop;
  final double suitabilityScore;
  final double expectedYield;
  final double expectedRevenue;
  final double expectedProfit;
  final double investmentRequired;
  final RiskLevel riskLevel;

  CropSuitability({
    required this.crop,
    required this.suitabilityScore,
    required this.expectedYield,
    required this.expectedRevenue,
    required this.expectedProfit,
    required this.investmentRequired,
    required this.riskLevel,
  });
}

class CropCalendar {
  final CropProfile crop;
  final DateTime sowingDate;
  final DateTime harvestDate;
  final List<CropActivity> activities;
  final List<CriticalPeriod> criticalPeriods;
  final WeatherRequirement weatherRequirements;

  CropCalendar({
    required this.crop,
    required this.sowingDate,
    required this.harvestDate,
    required this.activities,
    required this.criticalPeriods,
    required this.weatherRequirements,
  });
}

class CropActivity {
  final String name;
  final String description;
  final DateTime dueDate;
  final ActivityCategory category;
  final ActivityPriority priority;
  bool isCompleted;

  CropActivity({
    required this.name,
    required this.description,
    required this.dueDate,
    required this.category,
    required this.priority,
    this.isCompleted = false,
  });
}

class CriticalPeriod {
  final String name;
  final String description;
  final DateTime startDate;
  final DateTime endDate;
  final List<String> requirements;

  CriticalPeriod({
    required this.name,
    required this.description,
    required this.startDate,
    required this.endDate,
    required this.requirements,
  });
}

class WeatherRequirement {
  final TemperatureRange optimalTemperature;
  final double minRainfall;
  final double maxRainfall;
  final List<String> criticalWeatherEvents;

  WeatherRequirement({
    required this.optimalTemperature,
    required this.minRainfall,
    required this.maxRainfall,
    required this.criticalWeatherEvents,
  });
}

class TemperatureRange {
  final double min;
  final double max;

  TemperatureRange(this.min, this.max);
}

class InputCostAnalysis {
  final String cropName;
  final double fieldSize;
  final double seedCost;
  final double fertilizerCost;
  final double pesticideCost;
  final double laborCost;
  final double irrigationCost;
  final double machineryRent;
  final double totalCost;
  final ProfitProjection profitProjection;

  InputCostAnalysis({
    required this.cropName,
    required this.fieldSize,
    required this.seedCost,
    required this.fertilizerCost,
    required this.pesticideCost,
    required this.laborCost,
    required this.irrigationCost,
    required this.machineryRent,
    required this.totalCost,
    required this.profitProjection,
  });

  double get calculatedTotalCost =>
      seedCost +
      fertilizerCost +
      pesticideCost +
      laborCost +
      irrigationCost +
      machineryRent;
}

class ProfitProjection {
  final double expectedRevenue;
  final double totalCosts;
  final double grossProfit;
  final double profitMargin;
  final double breakEvenYield;

  ProfitProjection({
    required this.expectedRevenue,
    required this.totalCosts,
    required this.grossProfit,
    required this.profitMargin,
    required this.breakEvenYield,
  });
}

// Enums
enum CropCategory {
  cereal,
  cash,
  oilseed,
  vegetable,
  pulse,
  spice,
}

enum WaterRequirement {
  low,
  medium,
  high,
}

enum WaterAvailability {
  scarce,
  adequate,
  high,
}

enum RiskLevel {
  low,
  medium,
  high,
}

enum ActivityCategory {
  cultivation,
  irrigation,
  fertilization,
  protection,
  harvesting,
}

enum ActivityPriority {
  low,
  medium,
  high,
  critical,
}
