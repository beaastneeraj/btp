class CropDatabase {
  static final Map<String, Map<String, dynamic>> _crops = {
    'wheat': {
      'name': 'Wheat',
      'season': 'Rabi',
      'plantingMonths': [11, 12, 1], // Nov, Dec, Jan
      'harvestMonths': [4, 5], // Apr, May
      'duration': 120, // days
      'waterRequirement': 'Medium',
      'soilType': ['Loamy', 'Clay'],
      'temperature': {'min': 15, 'max': 25},
      'rainfall': {'min': 300, 'max': 750}, // mm
      'yield': {'min': 25, 'max': 50}, // quintals per hectare
      'price': {'min': 1800, 'max': 2200}, // per quintal
      'description': 'Major cereal crop, staple food grain',
      'tips': [
        'Ensure proper seed treatment before sowing',
        'Apply balanced fertilizers',
        'Monitor for rust diseases',
        'Harvest at proper maturity'
      ],
    },
    'rice': {
      'name': 'Rice',
      'season': 'Kharif',
      'plantingMonths': [6, 7, 8], // Jun, Jul, Aug
      'harvestMonths': [10, 11], // Oct, Nov
      'duration': 110,
      'waterRequirement': 'High',
      'soilType': ['Clay', 'Loamy'],
      'temperature': {'min': 20, 'max': 35},
      'rainfall': {'min': 1000, 'max': 2000},
      'yield': {'min': 30, 'max': 60},
      'price': {'min': 1500, 'max': 1900},
      'description': 'Primary food crop, requires flooded conditions',
      'tips': [
        'Maintain proper water levels',
        'Use certified seeds',
        'Apply nitrogen in splits',
        'Control weeds early'
      ],
    },
    'maize': {
      'name': 'Maize',
      'season': 'Kharif',
      'plantingMonths': [6, 7], // Jun, Jul
      'harvestMonths': [10, 11], // Oct, Nov
      'duration': 100,
      'waterRequirement': 'Medium',
      'soilType': ['Loamy', 'Sandy Loam'],
      'temperature': {'min': 18, 'max': 32},
      'rainfall': {'min': 500, 'max': 1200},
      'yield': {'min': 20, 'max': 40},
      'price': {'min': 1200, 'max': 1600},
      'description': 'Versatile crop used for food, feed, and industry',
      'tips': [
        'Ensure good drainage',
        'Plant at optimal depth',
        'Side dress with nitrogen',
        'Watch for stem borer'
      ],
    },
    'sugarcane': {
      'name': 'Sugarcane',
      'season': 'Annual',
      'plantingMonths': [2, 3, 10, 11], // Feb, Mar, Oct, Nov
      'harvestMonths': [12, 1, 2, 3], // Dec, Jan, Feb, Mar
      'duration': 365,
      'waterRequirement': 'High',
      'soilType': ['Loamy', 'Clay'],
      'temperature': {'min': 20, 'max': 35},
      'rainfall': {'min': 750, 'max': 1500},
      'yield': {'min': 300, 'max': 800},
      'price': {'min': 280, 'max': 350},
      'description': 'Industrial crop for sugar production',
      'tips': [
        'Use healthy seed cane',
        'Ensure proper spacing',
        'Regular irrigation needed',
        'Harvest at proper maturity'
      ],
    },
    'cotton': {
      'name': 'Cotton',
      'season': 'Kharif',
      'plantingMonths': [5, 6], // May, Jun
      'harvestMonths': [10, 11, 12], // Oct, Nov, Dec
      'duration': 180,
      'waterRequirement': 'Medium',
      'soilType': ['Black Cotton', 'Loamy'],
      'temperature': {'min': 20, 'max': 35},
      'rainfall': {'min': 500, 'max': 1000},
      'yield': {'min': 8, 'max': 20},
      'price': {'min': 4500, 'max': 6000},
      'description': 'Major fiber crop for textile industry',
      'tips': [
        'Use Bt cotton varieties',
        'Monitor for bollworm',
        'Proper plant protection',
        'Timely picking of bolls'
      ],
    },
    'soybean': {
      'name': 'Soybean',
      'season': 'Kharif',
      'plantingMonths': [6, 7], // Jun, Jul
      'harvestMonths': [10, 11], // Oct, Nov
      'duration': 95,
      'waterRequirement': 'Medium',
      'soilType': ['Loamy', 'Sandy Loam'],
      'temperature': {'min': 20, 'max': 30},
      'rainfall': {'min': 500, 'max': 900},
      'yield': {'min': 12, 'max': 25},
      'price': {'min': 3000, 'max': 4000},
      'description': 'Oilseed crop rich in protein',
      'tips': [
        'Inoculate seeds with rhizobium',
        'Avoid water logging',
        'Monitor for yellow mosaic',
        'Harvest when pods are dry'
      ],
    },
    'mustard': {
      'name': 'Mustard',
      'season': 'Rabi',
      'plantingMonths': [10, 11], // Oct, Nov
      'harvestMonths': [3, 4], // Mar, Apr
      'duration': 120,
      'waterRequirement': 'Low',
      'soilType': ['Loamy', 'Sandy Loam'],
      'temperature': {'min': 10, 'max': 25},
      'rainfall': {'min': 200, 'max': 400},
      'yield': {'min': 8, 'max': 15},
      'price': {'min': 4000, 'max': 5500},
      'description': 'Oilseed crop, drought tolerant',
      'tips': [
        'Sow at right time',
        'Use recommended varieties',
        'Control aphids timely',
        'Harvest when pods turn brown'
      ],
    },
    'tomato': {
      'name': 'Tomato',
      'season': 'Rabi/Summer',
      'plantingMonths': [10, 11, 12, 1], // Oct-Jan
      'harvestMonths': [1, 2, 3, 4, 5], // Jan-May
      'duration': 120,
      'waterRequirement': 'Medium',
      'soilType': ['Loamy', 'Sandy Loam'],
      'temperature': {'min': 15, 'max': 30},
      'rainfall': {'min': 300, 'max': 600},
      'yield': {'min': 200, 'max': 500},
      'price': {'min': 800, 'max': 2000},
      'description': 'High value vegetable crop',
      'tips': [
        'Use disease-resistant varieties',
        'Provide proper support',
        'Regular pruning needed',
        'Control fruit flies'
      ],
    },
    'onion': {
      'name': 'Onion',
      'season': 'Rabi',
      'plantingMonths': [11, 12, 1], // Nov-Jan
      'harvestMonths': [3, 4, 5], // Mar-May
      'duration': 130,
      'waterRequirement': 'Medium',
      'soilType': ['Loamy', 'Sandy Loam'],
      'temperature': {'min': 15, 'max': 25},
      'rainfall': {'min': 300, 'max': 500},
      'yield': {'min': 150, 'max': 400},
      'price': {'min': 1000, 'max': 3000},
      'description': 'Important spice and vegetable crop',
      'tips': [
        'Use good quality seedlings',
        'Maintain proper spacing',
        'Avoid over-watering',
        'Cure properly after harvest'
      ],
    },
    'potato': {
      'name': 'Potato',
      'season': 'Rabi',
      'plantingMonths': [10, 11, 12], // Oct-Dec
      'harvestMonths': [2, 3, 4], // Feb-Apr
      'duration': 90,
      'waterRequirement': 'Medium',
      'soilType': ['Loamy', 'Sandy Loam'],
      'temperature': {'min': 15, 'max': 25},
      'rainfall': {'min': 300, 'max': 500},
      'yield': {'min': 150, 'max': 350},
      'price': {'min': 800, 'max': 1500},
      'description': 'Important food and cash crop',
      'tips': [
        'Use certified seed tubers',
        'Proper earthing up needed',
        'Control late blight',
        'Harvest at right maturity'
      ],
    },
  };

  static List<String> getAllCrops() {
    return _crops.keys.toList();
  }

  static Map<String, dynamic>? getCropInfo(String cropName) {
    return _crops[cropName.toLowerCase()];
  }

  static List<String> getCropsBySeason(String season) {
    return _crops.entries
        .where((entry) => entry.value['season'] == season)
        .map((entry) => entry.key)
        .toList();
  }

  static List<String> getCropsForMonth(int month) {
    return _crops.entries
        .where((entry) =>
            (entry.value['plantingMonths'] as List).contains(month))
        .map((entry) => entry.key)
        .toList();
  }

  static List<String> getCropsBySoilType(String soilType) {
    return _crops.entries
        .where((entry) =>
            (entry.value['soilType'] as List).contains(soilType))
        .map((entry) => entry.key)
        .toList();
  }

  static List<String> getCropsByWaterRequirement(String waterReq) {
    return _crops.entries
        .where((entry) => entry.value['waterRequirement'] == waterReq)
        .map((entry) => entry.key)
        .toList();
  }

  static List<Map<String, dynamic>> getRecommendations({
    String? season,
    int? month,
    String? soilType,
    String? waterAvailability,
  }) {
    List<String> candidates = _crops.keys.toList();

    if (season != null) {
      candidates = candidates
          .where((crop) => _crops[crop]!['season'] == season)
          .toList();
    }

    if (month != null) {
      candidates = candidates
          .where((crop) =>
              (_crops[crop]!['plantingMonths'] as List).contains(month))
          .toList();
    }

    if (soilType != null) {
      candidates = candidates
          .where((crop) =>
              (_crops[crop]!['soilType'] as List).contains(soilType))
          .toList();
    }

    if (waterAvailability != null) {
      candidates = candidates
          .where((crop) => _crops[crop]!['waterRequirement'] == waterAvailability)
          .toList();
    }

    return candidates
        .map((crop) => {
              'crop': crop,
              'name': _crops[crop]!['name'],
              'yield': _crops[crop]!['yield'],
              'price': _crops[crop]!['price'],
              'duration': _crops[crop]!['duration'],
              'description': _crops[crop]!['description'],
            })
        .toList();
  }

  static Map<String, dynamic> getCropCalendar() {
    Map<String, dynamic> calendar = {};
    
    for (int month = 1; month <= 12; month++) {
      List<String> plantingCrops = getCropsForMonth(month);
      List<String> harvestingCrops = _crops.entries
          .where((entry) =>
              (entry.value['harvestMonths'] as List).contains(month))
          .map((entry) => entry.value['name'] as String)
          .toList();

      calendar[month.toString()] = {
        'planting': plantingCrops.map((crop) => _crops[crop]!['name']).toList(),
        'harvesting': harvestingCrops,
      };
    }

    return calendar;
  }

  static List<String> getSeasons() {
    return ['Kharif', 'Rabi', 'Summer', 'Annual'];
  }

  static List<String> getSoilTypes() {
    return ['Loamy', 'Clay', 'Sandy Loam', 'Black Cotton'];
  }

  static List<String> getWaterRequirements() {
    return ['Low', 'Medium', 'High'];
  }
}
