class SoilData {
  final int regionId;
  final String state;
  final String district;
  final String soilType;
  final double phLevel;
  final double organicCarbonPercent;
  final int nitrogenKgPerHectare;
  final int phosphorusKgPerHectare;
  final int potassiumKgPerHectare;
  final String micronutrientStatus;
  final String drainageCapacity;

  SoilData({
    required this.regionId,
    required this.state,
    required this.district,
    required this.soilType,
    required this.phLevel,
    required this.organicCarbonPercent,
    required this.nitrogenKgPerHectare,
    required this.phosphorusKgPerHectare,
    required this.potassiumKgPerHectare,
    required this.micronutrientStatus,
    required this.drainageCapacity,
  });

  factory SoilData.fromCsv(List<String> csvRow) {
    return SoilData(
      regionId: int.parse(csvRow[0]),
      state: csvRow[1],
      district: csvRow[2],
      soilType: csvRow[3],
      phLevel: double.parse(csvRow[4]),
      organicCarbonPercent: double.parse(csvRow[5]),
      nitrogenKgPerHectare: int.parse(csvRow[6]),
      phosphorusKgPerHectare: int.parse(csvRow[7]),
      potassiumKgPerHectare: int.parse(csvRow[8]),
      micronutrientStatus: csvRow[9],
      drainageCapacity: csvRow[10],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'regionId': regionId,
      'state': state,
      'district': district,
      'soilType': soilType,
      'phLevel': phLevel,
      'organicCarbonPercent': organicCarbonPercent,
      'nitrogenKgPerHectare': nitrogenKgPerHectare,
      'phosphorusKgPerHectare': phosphorusKgPerHectare,
      'potassiumKgPerHectare': potassiumKgPerHectare,
      'micronutrientStatus': micronutrientStatus,
      'drainageCapacity': drainageCapacity,
    };
  }

  factory SoilData.fromJson(Map<String, dynamic> json) {
    return SoilData(
      regionId: json['regionId'],
      state: json['state'],
      district: json['district'],
      soilType: json['soilType'],
      phLevel: json['phLevel'].toDouble(),
      organicCarbonPercent: json['organicCarbonPercent'].toDouble(),
      nitrogenKgPerHectare: json['nitrogenKgPerHectare'],
      phosphorusKgPerHectare: json['phosphorusKgPerHectare'],
      potassiumKgPerHectare: json['potassiumKgPerHectare'],
      micronutrientStatus: json['micronutrientStatus'],
      drainageCapacity: json['drainageCapacity'],
    );
  }

  // Helper methods for soil analysis
  String get phCategory {
    if (phLevel < 6.5) return 'Acidic';
    if (phLevel > 7.5) return 'Alkaline';
    return 'Neutral';
  }

  String get organicMatterStatus {
    if (organicCarbonPercent < 0.5) return 'Low';
    if (organicCarbonPercent > 0.75) return 'High';
    return 'Medium';
  }

  String get nitrogenStatus {
    if (nitrogenKgPerHectare < 250) return 'Low';
    if (nitrogenKgPerHectare > 300) return 'High';
    return 'Medium';
  }

  String get phosphorusStatus {
    if (phosphorusKgPerHectare < 20) return 'Low';
    if (phosphorusKgPerHectare > 25) return 'High';
    return 'Medium';
  }

  String get potassiumStatus {
    if (potassiumKgPerHectare < 170) return 'Low';
    if (potassiumKgPerHectare > 200) return 'High';
    return 'Medium';
  }

  // Get fertilizer recommendations based on soil data
  List<String> getFertilizerRecommendations() {
    List<String> recommendations = [];

    if (nitrogenStatus == 'Low') {
      recommendations.add('Apply nitrogen fertilizer (Urea 46% N) - 130 kg/ha');
    }
    
    if (phosphorusStatus == 'Low') {
      recommendations.add('Apply phosphorus fertilizer (DAP 18-46-0) - 100 kg/ha');
    }
    
    if (potassiumStatus == 'Low') {
      recommendations.add('Apply potassium fertilizer (MOP 0-0-60) - 85 kg/ha');
    }

    if (organicMatterStatus == 'Low') {
      recommendations.add('Apply organic matter (FYM/Compost) - 5-7 tons/ha');
    }

    if (phCategory == 'Acidic') {
      recommendations.add('Apply lime to neutralize soil acidity - 2-3 tons/ha');
    } else if (phCategory == 'Alkaline') {
      recommendations.add('Apply gypsum to reduce alkalinity - 2.5-5 tons/ha');
    }

    if (micronutrientStatus == 'Low') {
      recommendations.add('Apply micronutrient mixture (Zn, Fe, Mn, B) - 25 kg/ha');
    }

    if (drainageCapacity == 'Poor') {
      recommendations.add('Improve drainage through field leveling and drainage channels');
    }

    return recommendations;
  }

  // Get suitable crops for this soil type
  List<String> getSuitableCrops() {
    switch (soilType.toLowerCase()) {
      case 'alluvial':
        return ['Rice', 'Wheat', 'Sugarcane', 'Cotton', 'Jute', 'Maize'];
      case 'black':
        return ['Cotton', 'Soybean', 'Wheat', 'Sugarcane', 'Jowar', 'Groundnut'];
      case 'red':
        return ['Millet', 'Groundnut', 'Cotton', 'Tobacco', 'Coconut', 'Cashew'];
      case 'arid':
        return ['Millet', 'Barley', 'Mustard', 'Gram', 'Fodder crops'];
      default:
        return ['General crops suitable for mixed soil types'];
    }
  }
}
