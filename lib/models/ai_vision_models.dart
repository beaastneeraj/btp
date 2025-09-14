// AI Vision Data Models

// Crop Disease Analysis Model
class CropDiseaseAnalysis {
  final String diseaseName;
  final double confidence;
  final String severity;
  final List<TreatmentRecommendation> treatmentRecommendations;
  final double estimatedDamage;
  final List<String> preventionTips;
  final DateTime analysisDate;
  final String imageUrl;

  const CropDiseaseAnalysis({
    required this.diseaseName,
    required this.confidence,
    required this.severity,
    required this.treatmentRecommendations,
    required this.estimatedDamage,
    required this.preventionTips,
    required this.analysisDate,
    required this.imageUrl,
  });

  Map<String, dynamic> toJson() => {
    'diseaseName': diseaseName,
    'confidence': confidence,
    'severity': severity,
    'treatmentRecommendations': treatmentRecommendations.map((e) => e.toJson()).toList(),
    'estimatedDamage': estimatedDamage,
    'preventionTips': preventionTips,
    'analysisDate': analysisDate.toIso8601String(),
    'imageUrl': imageUrl,
  };

  factory CropDiseaseAnalysis.fromJson(Map<String, dynamic> json) => CropDiseaseAnalysis(
    diseaseName: json['diseaseName'],
    confidence: json['confidence'],
    severity: json['severity'],
    treatmentRecommendations: (json['treatmentRecommendations'] as List)
        .map((e) => TreatmentRecommendation.fromJson(e))
        .toList(),
    estimatedDamage: json['estimatedDamage'],
    preventionTips: List<String>.from(json['preventionTips']),
    analysisDate: DateTime.parse(json['analysisDate']),
    imageUrl: json['imageUrl'],
  );
}

// Treatment Recommendation Model
class TreatmentRecommendation {
  final String treatment;
  final String dosage;
  final String frequency;
  final String duration;
  final double cost;

  const TreatmentRecommendation({
    required this.treatment,
    required this.dosage,
    required this.frequency,
    required this.duration,
    required this.cost,
  });

  Map<String, dynamic> toJson() => {
    'treatment': treatment,
    'dosage': dosage,
    'frequency': frequency,
    'duration': duration,
    'cost': cost,
  };

  factory TreatmentRecommendation.fromJson(Map<String, dynamic> json) => TreatmentRecommendation(
    treatment: json['treatment'],
    dosage: json['dosage'],
    frequency: json['frequency'],
    duration: json['duration'],
    cost: json['cost'],
  );
}

// Crop Health Analysis Model
class CropHealthAnalysis {
  final double overallHealthScore;
  final NutrientLevel nitrogenLevel;
  final NutrientLevel phosphorusLevel;
  final NutrientLevel potassiumLevel;
  final StressLevel waterStress;
  final DamageLevel pestDamage;
  final String growthStage;
  final double yieldPotential;
  final List<ActionItem> actionItems;
  final DateTime analysisDate;
  final String imageUrl;

  const CropHealthAnalysis({
    required this.overallHealthScore,
    required this.nitrogenLevel,
    required this.phosphorusLevel,
    required this.potassiumLevel,
    required this.waterStress,
    required this.pestDamage,
    required this.growthStage,
    required this.yieldPotential,
    required this.actionItems,
    required this.analysisDate,
    required this.imageUrl,
  });

  Map<String, dynamic> toJson() => {
    'overallHealthScore': overallHealthScore,
    'nitrogenLevel': nitrogenLevel.name,
    'phosphorusLevel': phosphorusLevel.name,
    'potassiumLevel': potassiumLevel.name,
    'waterStress': waterStress.name,
    'pestDamage': pestDamage.name,
    'growthStage': growthStage,
    'yieldPotential': yieldPotential,
    'actionItems': actionItems.map((e) => e.toJson()).toList(),
    'analysisDate': analysisDate.toIso8601String(),
    'imageUrl': imageUrl,
  };

  factory CropHealthAnalysis.fromJson(Map<String, dynamic> json) => CropHealthAnalysis(
    overallHealthScore: json['overallHealthScore'],
    nitrogenLevel: NutrientLevel.values.firstWhere((e) => e.name == json['nitrogenLevel']),
    phosphorusLevel: NutrientLevel.values.firstWhere((e) => e.name == json['phosphorusLevel']),
    potassiumLevel: NutrientLevel.values.firstWhere((e) => e.name == json['potassiumLevel']),
    waterStress: StressLevel.values.firstWhere((e) => e.name == json['waterStress']),
    pestDamage: DamageLevel.values.firstWhere((e) => e.name == json['pestDamage']),
    growthStage: json['growthStage'],
    yieldPotential: json['yieldPotential'],
    actionItems: (json['actionItems'] as List)
        .map((e) => ActionItem.fromJson(e))
        .toList(),
    analysisDate: DateTime.parse(json['analysisDate']),
    imageUrl: json['imageUrl'],
  );
}

// Action Item Model
class ActionItem {
  final String title;
  final String description;
  final ActionPriority priority;
  final double estimatedCost;
  final String timeframe;

  const ActionItem({
    required this.title,
    required this.description,
    required this.priority,
    required this.estimatedCost,
    required this.timeframe,
  });

  Map<String, dynamic> toJson() => {
    'title': title,
    'description': description,
    'priority': priority.name,
    'estimatedCost': estimatedCost,
    'timeframe': timeframe,
  };

  factory ActionItem.fromJson(Map<String, dynamic> json) => ActionItem(
    title: json['title'],
    description: json['description'],
    priority: ActionPriority.values.firstWhere((e) => e.name == json['priority']),
    estimatedCost: json['estimatedCost'],
    timeframe: json['timeframe'],
  );
}

// Yield Prediction Model
class YieldPrediction {
  final double expectedYield;
  final double minYield;
  final double maxYield;
  final double confidenceLevel;
  final List<YieldFactor> factorsAffectingYield;
  final List<String> recommendedActions;
  final double marketValue;
  final DateTime predictionDate;
  final String imageUrl;

  const YieldPrediction({
    required this.expectedYield,
    required this.minYield,
    required this.maxYield,
    required this.confidenceLevel,
    required this.factorsAffectingYield,
    required this.recommendedActions,
    required this.marketValue,
    required this.predictionDate,
    required this.imageUrl,
  });

  Map<String, dynamic> toJson() => {
    'expectedYield': expectedYield,
    'minYield': minYield,
    'maxYield': maxYield,
    'confidenceLevel': confidenceLevel,
    'factorsAffectingYield': factorsAffectingYield.map((e) => e.toJson()).toList(),
    'recommendedActions': recommendedActions,
    'marketValue': marketValue,
    'predictionDate': predictionDate.toIso8601String(),
    'imageUrl': imageUrl,
  };

  factory YieldPrediction.fromJson(Map<String, dynamic> json) => YieldPrediction(
    expectedYield: json['expectedYield'],
    minYield: json['minYield'],
    maxYield: json['maxYield'],
    confidenceLevel: json['confidenceLevel'],
    factorsAffectingYield: (json['factorsAffectingYield'] as List)
        .map((e) => YieldFactor.fromJson(e))
        .toList(),
    recommendedActions: List<String>.from(json['recommendedActions']),
    marketValue: json['marketValue'],
    predictionDate: DateTime.parse(json['predictionDate']),
    imageUrl: json['imageUrl'],
  );
}

// Yield Factor Model
class YieldFactor {
  final String factor;
  final double impact;
  final String description;

  const YieldFactor({
    required this.factor,
    required this.impact,
    required this.description,
  });

  Map<String, dynamic> toJson() => {
    'factor': factor,
    'impact': impact,
    'description': description,
  };

  factory YieldFactor.fromJson(Map<String, dynamic> json) => YieldFactor(
    factor: json['factor'],
    impact: json['impact'],
    description: json['description'],
  );
}

// Real-time Crop Analysis Model
class RealTimeCropAnalysis {
  final double healthScore;
  final double moistureLevel;
  final String pestActivity;
  final String growthRate;
  final String recommendedAction;
  final DateTime timestamp;

  const RealTimeCropAnalysis({
    required this.healthScore,
    required this.moistureLevel,
    required this.pestActivity,
    required this.growthRate,
    required this.recommendedAction,
    required this.timestamp,
  });

  Map<String, dynamic> toJson() => {
    'healthScore': healthScore,
    'moistureLevel': moistureLevel,
    'pestActivity': pestActivity,
    'growthRate': growthRate,
    'recommendedAction': recommendedAction,
    'timestamp': timestamp.toIso8601String(),
  };

  factory RealTimeCropAnalysis.fromJson(Map<String, dynamic> json) => RealTimeCropAnalysis(
    healthScore: json['healthScore'],
    moistureLevel: json['moistureLevel'],
    pestActivity: json['pestActivity'],
    growthRate: json['growthRate'],
    recommendedAction: json['recommendedAction'],
    timestamp: DateTime.parse(json['timestamp']),
  );
}

// Enums
enum NutrientLevel {
  optimal,
  adequate,
  deficient,
  severelyDeficient,
}

enum StressLevel {
  none,
  low,
  medium,
  high,
}

enum DamageLevel {
  none,
  minimal,
  moderate,
  severe,
}

enum ActionPriority {
  low,
  medium,
  high,
  urgent,
}

enum CropType {
  rice,
  wheat,
  maize,
  cotton,
  sugarcane,
  soybean,
  groundnut,
  millet,
  barley,
  mustard,
}

// Extension methods for better UX
extension NutrientLevelExtension on NutrientLevel {
  String get displayName {
    switch (this) {
      case NutrientLevel.optimal:
        return 'Optimal';
      case NutrientLevel.adequate:
        return 'Adequate';
      case NutrientLevel.deficient:
        return 'Deficient';
      case NutrientLevel.severelyDeficient:
        return 'Severely Deficient';
    }
  }

  String get colorCode {
    switch (this) {
      case NutrientLevel.optimal:
        return '#4CAF50'; // Green
      case NutrientLevel.adequate:
        return '#8BC34A'; // Light Green
      case NutrientLevel.deficient:
        return '#FF9800'; // Orange
      case NutrientLevel.severelyDeficient:
        return '#F44336'; // Red
    }
  }
}

extension StressLevelExtension on StressLevel {
  String get displayName {
    switch (this) {
      case StressLevel.none:
        return 'No Stress';
      case StressLevel.low:
        return 'Low Stress';
      case StressLevel.medium:
        return 'Medium Stress';
      case StressLevel.high:
        return 'High Stress';
    }
  }

  String get colorCode {
    switch (this) {
      case StressLevel.none:
        return '#4CAF50'; // Green
      case StressLevel.low:
        return '#8BC34A'; // Light Green
      case StressLevel.medium:
        return '#FF9800'; // Orange
      case StressLevel.high:
        return '#F44336'; // Red
    }
  }
}

extension ActionPriorityExtension on ActionPriority {
  String get displayName {
    switch (this) {
      case ActionPriority.low:
        return 'Low Priority';
      case ActionPriority.medium:
        return 'Medium Priority';
      case ActionPriority.high:
        return 'High Priority';
      case ActionPriority.urgent:
        return 'Urgent';
    }
  }

  String get colorCode {
    switch (this) {
      case ActionPriority.low:
        return '#2196F3'; // Blue
      case ActionPriority.medium:
        return '#FF9800'; // Orange
      case ActionPriority.high:
        return '#FF5722'; // Deep Orange
      case ActionPriority.urgent:
        return '#F44336'; // Red
    }
  }
}

extension CropTypeExtension on CropType {
  String get displayName {
    switch (this) {
      case CropType.rice:
        return 'Rice';
      case CropType.wheat:
        return 'Wheat';
      case CropType.maize:
        return 'Maize';
      case CropType.cotton:
        return 'Cotton';
      case CropType.sugarcane:
        return 'Sugarcane';
      case CropType.soybean:
        return 'Soybean';
      case CropType.groundnut:
        return 'Groundnut';
      case CropType.millet:
        return 'Millet';
      case CropType.barley:
        return 'Barley';
      case CropType.mustard:
        return 'Mustard';
    }
  }

  String get icon {
    switch (this) {
      case CropType.rice:
        return '🌾';
      case CropType.wheat:
        return '🌾';
      case CropType.maize:
        return '🌽';
      case CropType.cotton:
        return '🌱';
      case CropType.sugarcane:
        return '🎋';
      case CropType.soybean:
        return '🫘';
      case CropType.groundnut:
        return '🥜';
      case CropType.millet:
        return '🌾';
      case CropType.barley:
        return '🌾';
      case CropType.mustard:
        return '🌻';
    }
  }
}
