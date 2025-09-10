class InputCostData {
  final int regionId;
  final String inputType;
  final String inputName;
  final double costPerUnit;
  final String unitType;
  final String supplierContact;
  final String availabilityStatus;
  final DateTime lastUpdated;

  InputCostData({
    required this.regionId,
    required this.inputType,
    required this.inputName,
    required this.costPerUnit,
    required this.unitType,
    required this.supplierContact,
    required this.availabilityStatus,
    required this.lastUpdated,
  });

  factory InputCostData.fromCsv(List<String> csvRow) {
    return InputCostData(
      regionId: int.parse(csvRow[0]),
      inputType: csvRow[1],
      inputName: csvRow[2],
      costPerUnit: double.parse(csvRow[3]),
      unitType: csvRow[4],
      supplierContact: csvRow[5],
      availabilityStatus: csvRow[6],
      lastUpdated: DateTime.parse(csvRow[7]),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'regionId': regionId,
      'inputType': inputType,
      'inputName': inputName,
      'costPerUnit': costPerUnit,
      'unitType': unitType,
      'supplierContact': supplierContact,
      'availabilityStatus': availabilityStatus,
      'lastUpdated': lastUpdated.toIso8601String(),
    };
  }

  factory InputCostData.fromJson(Map<String, dynamic> json) {
    return InputCostData(
      regionId: json['regionId'],
      inputType: json['inputType'],
      inputName: json['inputName'],
      costPerUnit: json['costPerUnit'].toDouble(),
      unitType: json['unitType'],
      supplierContact: json['supplierContact'],
      availabilityStatus: json['availabilityStatus'],
      lastUpdated: DateTime.parse(json['lastUpdated']),
    );
  }

  bool get isAvailable => availabilityStatus.toLowerCase() == 'available';
  
  bool get isPriceRecent {
    final daysSinceUpdate = DateTime.now().difference(lastUpdated).inDays;
    return daysSinceUpdate <= 7; // Consider price recent if updated within 7 days
  }

  String get priceCategory {
    switch (inputType.toLowerCase()) {
      case 'seed':
        if (costPerUnit < 40) return 'Low cost';
        if (costPerUnit > 60) return 'High cost';
        return 'Medium cost';
      case 'fertilizer':
        if (costPerUnit < 1200) return 'Low cost';
        if (costPerUnit > 1500) return 'High cost';
        return 'Medium cost';
      case 'pesticide':
        if (costPerUnit < 600) return 'Low cost';
        if (costPerUnit > 1000) return 'High cost';
        return 'Medium cost';
      case 'labor':
        if (costPerUnit < 300) return 'Low cost';
        if (costPerUnit > 500) return 'High cost';
        return 'Medium cost';
      case 'machinery':
        if (costPerUnit < 600) return 'Low cost';
        if (costPerUnit > 1000) return 'High cost';
        return 'Medium cost';
      default:
        return 'Standard cost';
    }
  }
}

class RegionalConfiguration {
  final String regionName;
  final List<String> states;
  final List<String> primaryCrops;
  final Map<String, SeasonInfo> seasons;
  final List<String> soilTypes;
  final List<String> languages;
  final String currency;
  final String measurementUnits;

  RegionalConfiguration({
    required this.regionName,
    required this.states,
    required this.primaryCrops,
    required this.seasons,
    required this.soilTypes,
    required this.languages,
    required this.currency,
    required this.measurementUnits,
  });

  factory RegionalConfiguration.fromJson(String regionKey, Map<String, dynamic> json) {
    return RegionalConfiguration(
      regionName: regionKey,
      states: List<String>.from(json['states']),
      primaryCrops: List<String>.from(json['primary_crops']),
      seasons: Map<String, SeasonInfo>.from(
        json['seasons'].map((key, value) => MapEntry(
          key,
          SeasonInfo.fromJson(value),
        )),
      ),
      soilTypes: List<String>.from(json['soil_types']),
      languages: List<String>.from(json['languages']),
      currency: json['currency'],
      measurementUnits: json['measurement_units'],
    );
  }

  bool includesState(String state) {
    return states.any((s) => s.toLowerCase() == state.toLowerCase());
  }

  String getCurrentSeason() {
    final now = DateTime.now();
    final currentMonth = now.month;

    for (final entry in seasons.entries) {
      if (entry.value.isCurrentSeason(currentMonth)) {
        return entry.key;
      }
    }
    return 'off_season';
  }

  List<String> getCropsForCurrentSeason() {
    final currentSeason = getCurrentSeason();
    if (currentSeason == 'off_season') return [];

    // Return crops suitable for current season
    // This would need to be enhanced with season-crop mapping
    return primaryCrops;
  }
}

class SeasonInfo {
  final String start;
  final String end;

  SeasonInfo({
    required this.start,
    required this.end,
  });

  factory SeasonInfo.fromJson(Map<String, dynamic> json) {
    return SeasonInfo(
      start: json['start'],
      end: json['end'],
    );
  }

  bool isCurrentSeason(int currentMonth) {
    final startMonth = _monthNameToNumber(start);
    final endMonth = _monthNameToNumber(end);

    if (startMonth <= endMonth) {
      return currentMonth >= startMonth && currentMonth <= endMonth;
    } else {
      // Season spans across year (e.g., Nov to Apr)
      return currentMonth >= startMonth || currentMonth <= endMonth;
    }
  }

  int _monthNameToNumber(String monthName) {
    const months = {
      'january': 1, 'february': 2, 'march': 3, 'april': 4,
      'may': 5, 'june': 6, 'july': 7, 'august': 8,
      'september': 9, 'october': 10, 'november': 11, 'december': 12
    };
    return months[monthName.toLowerCase()] ?? 1;
  }
}
