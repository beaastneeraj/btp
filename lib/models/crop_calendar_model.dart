class CropCalendar {
  final int regionId;
  final String state;
  final String district;
  final int cropId;
  final DateTime sowingStartDate;
  final DateTime sowingEndDate;
  final DateTime harvestStartDate;
  final DateTime harvestEndDate;
  final String varietyRecommended;
  final int seedRateKgPerHectare;

  CropCalendar({
    required this.regionId,
    required this.state,
    required this.district,
    required this.cropId,
    required this.sowingStartDate,
    required this.sowingEndDate,
    required this.harvestStartDate,
    required this.harvestEndDate,
    required this.varietyRecommended,
    required this.seedRateKgPerHectare,
  });

  factory CropCalendar.fromCsv(List<String> csvRow) {
    return CropCalendar(
      regionId: int.parse(csvRow[0]),
      state: csvRow[1],
      district: csvRow[2],
      cropId: int.parse(csvRow[3]),
      sowingStartDate: DateTime.parse(csvRow[4]),
      sowingEndDate: DateTime.parse(csvRow[5]),
      harvestStartDate: DateTime.parse(csvRow[6]),
      harvestEndDate: DateTime.parse(csvRow[7]),
      varietyRecommended: csvRow[8],
      seedRateKgPerHectare: int.parse(csvRow[9]),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'regionId': regionId,
      'state': state,
      'district': district,
      'cropId': cropId,
      'sowingStartDate': sowingStartDate.toIso8601String(),
      'sowingEndDate': sowingEndDate.toIso8601String(),
      'harvestStartDate': harvestStartDate.toIso8601String(),
      'harvestEndDate': harvestEndDate.toIso8601String(),
      'varietyRecommended': varietyRecommended,
      'seedRateKgPerHectare': seedRateKgPerHectare,
    };
  }

  factory CropCalendar.fromJson(Map<String, dynamic> json) {
    return CropCalendar(
      regionId: json['regionId'],
      state: json['state'],
      district: json['district'],
      cropId: json['cropId'],
      sowingStartDate: DateTime.parse(json['sowingStartDate']),
      sowingEndDate: DateTime.parse(json['sowingEndDate']),
      harvestStartDate: DateTime.parse(json['harvestStartDate']),
      harvestEndDate: DateTime.parse(json['harvestEndDate']),
      varietyRecommended: json['varietyRecommended'],
      seedRateKgPerHectare: json['seedRateKgPerHectare'],
    );
  }

  // Helper methods
  int get cropDurationDays {
    return harvestStartDate.difference(sowingStartDate).inDays;
  }

  bool get isCurrentlyInSowingWindow {
    final now = DateTime.now();
    return now.isAfter(sowingStartDate) && now.isBefore(sowingEndDate);
  }

  bool get isCurrentlyInHarvestWindow {
    final now = DateTime.now();
    return now.isAfter(harvestStartDate) && now.isBefore(harvestEndDate);
  }

  String get currentPhase {
    final now = DateTime.now();
    
    if (now.isBefore(sowingStartDate)) {
      final daysToSowing = sowingStartDate.difference(now).inDays;
      return 'Prepare for sowing in $daysToSowing days';
    } else if (isCurrentlyInSowingWindow) {
      return 'Sowing window is active';
    } else if (now.isAfter(sowingEndDate) && now.isBefore(harvestStartDate)) {
      final daysToHarvest = harvestStartDate.difference(now).inDays;
      return 'Growing phase - harvest in $daysToHarvest days';
    } else if (isCurrentlyInHarvestWindow) {
      return 'Harvest window is active';
    } else {
      return 'Off-season';
    }
  }

  String get season {
    final sowingMonth = sowingStartDate.month;
    
    if (sowingMonth >= 6 && sowingMonth <= 8) {
      return 'Kharif';
    } else if (sowingMonth >= 11 || sowingMonth <= 2) {
      return 'Rabi';
    } else {
      return 'Zaid';
    }
  }

  List<String> getSowingTips() {
    List<String> tips = [];
    
    tips.add('Use recommended variety: $varietyRecommended');
    tips.add('Seed rate: $seedRateKgPerHectare kg per hectare');
    
    switch (season) {
      case 'Kharif':
        tips.addAll([
          'Ensure proper monsoon water management',
          'Prepare for pest control during rainy season',
          'Monitor soil moisture levels regularly',
        ]);
        break;
      case 'Rabi':
        tips.addAll([
          'Ensure adequate irrigation facilities',
          'Protect from frost damage',
          'Plan for timely harvest before summer heat',
        ]);
        break;
      case 'Zaid':
        tips.addAll([
          'Arrange for intensive irrigation',
          'Protect from heat stress',
          'Use heat-tolerant varieties',
        ]);
        break;
    }
    
    return tips;
  }
}

class HistoricalWeatherData {
  final int regionId;
  final int month;
  final double avgTemperatureCelsius;
  final double maxTemperature;
  final double minTemperature;
  final double rainfallMm;
  final int humidityPercent;
  final double windSpeedKmh;
  final int sunshineHours;

  HistoricalWeatherData({
    required this.regionId,
    required this.month,
    required this.avgTemperatureCelsius,
    required this.maxTemperature,
    required this.minTemperature,
    required this.rainfallMm,
    required this.humidityPercent,
    required this.windSpeedKmh,
    required this.sunshineHours,
  });

  factory HistoricalWeatherData.fromCsv(List<String> csvRow) {
    return HistoricalWeatherData(
      regionId: int.parse(csvRow[0]),
      month: int.parse(csvRow[1]),
      avgTemperatureCelsius: double.parse(csvRow[2]),
      maxTemperature: double.parse(csvRow[3]),
      minTemperature: double.parse(csvRow[4]),
      rainfallMm: double.parse(csvRow[5]),
      humidityPercent: int.parse(csvRow[6]),
      windSpeedKmh: double.parse(csvRow[7]),
      sunshineHours: int.parse(csvRow[8]),
    );
  }

  String get monthName {
    const months = [
      'January', 'February', 'March', 'April', 'May', 'June',
      'July', 'August', 'September', 'October', 'November', 'December'
    ];
    return months[month - 1];
  }

  String get weatherPattern {
    if (rainfallMm > 150) return 'Heavy rainfall period';
    if (rainfallMm > 50) return 'Moderate rainfall period';
    if (avgTemperatureCelsius > 35) return 'Hot period';
    if (avgTemperatureCelsius < 20) return 'Cool period';
    return 'Normal weather period';
  }

  List<String> getCropSuitability() {
    List<String> suitableCrops = [];
    
    if (rainfallMm > 100 && avgTemperatureCelsius > 25) {
      suitableCrops.addAll(['Rice', 'Sugarcane', 'Cotton']);
    }
    
    if (rainfallMm < 50 && avgTemperatureCelsius < 25) {
      suitableCrops.addAll(['Wheat', 'Barley', 'Mustard']);
    }
    
    if (avgTemperatureCelsius > 30 && rainfallMm < 100) {
      suitableCrops.addAll(['Millet', 'Sorghum', 'Groundnut']);
    }
    
    return suitableCrops;
  }
}
