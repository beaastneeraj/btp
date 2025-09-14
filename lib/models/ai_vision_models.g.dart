// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_vision_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CropDiseaseAnalysisImpl _$$CropDiseaseAnalysisImplFromJson(
        Map<String, dynamic> json) =>
    _$CropDiseaseAnalysisImpl(
      diseaseName: json['diseaseName'] as String,
      confidence: (json['confidence'] as num).toDouble(),
      severity: json['severity'] as String,
      treatmentRecommendations:
          (json['treatmentRecommendations'] as List<dynamic>)
              .map((e) =>
                  TreatmentRecommendation.fromJson(e as Map<String, dynamic>))
              .toList(),
      estimatedDamage: (json['estimatedDamage'] as num).toDouble(),
      preventionTips: (json['preventionTips'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      analysisDate: DateTime.parse(json['analysisDate'] as String),
      imageUrl: json['imageUrl'] as String,
    );

Map<String, dynamic> _$$CropDiseaseAnalysisImplToJson(
        _$CropDiseaseAnalysisImpl instance) =>
    <String, dynamic>{
      'diseaseName': instance.diseaseName,
      'confidence': instance.confidence,
      'severity': instance.severity,
      'treatmentRecommendations': instance.treatmentRecommendations,
      'estimatedDamage': instance.estimatedDamage,
      'preventionTips': instance.preventionTips,
      'analysisDate': instance.analysisDate.toIso8601String(),
      'imageUrl': instance.imageUrl,
    };

_$TreatmentRecommendationImpl _$$TreatmentRecommendationImplFromJson(
        Map<String, dynamic> json) =>
    _$TreatmentRecommendationImpl(
      treatment: json['treatment'] as String,
      dosage: json['dosage'] as String,
      frequency: json['frequency'] as String,
      duration: json['duration'] as String,
      cost: (json['cost'] as num).toDouble(),
    );

Map<String, dynamic> _$$TreatmentRecommendationImplToJson(
        _$TreatmentRecommendationImpl instance) =>
    <String, dynamic>{
      'treatment': instance.treatment,
      'dosage': instance.dosage,
      'frequency': instance.frequency,
      'duration': instance.duration,
      'cost': instance.cost,
    };

_$CropHealthAnalysisImpl _$$CropHealthAnalysisImplFromJson(
        Map<String, dynamic> json) =>
    _$CropHealthAnalysisImpl(
      overallHealthScore: (json['overallHealthScore'] as num).toDouble(),
      nitrogenLevel: $enumDecode(_$NutrientLevelEnumMap, json['nitrogenLevel']),
      phosphorusLevel:
          $enumDecode(_$NutrientLevelEnumMap, json['phosphorusLevel']),
      potassiumLevel:
          $enumDecode(_$NutrientLevelEnumMap, json['potassiumLevel']),
      waterStress: $enumDecode(_$StressLevelEnumMap, json['waterStress']),
      pestDamage: $enumDecode(_$DamageLevelEnumMap, json['pestDamage']),
      growthStage: json['growthStage'] as String,
      yieldPotential: (json['yieldPotential'] as num).toDouble(),
      actionItems: (json['actionItems'] as List<dynamic>)
          .map((e) => ActionItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      analysisDate: DateTime.parse(json['analysisDate'] as String),
      imageUrl: json['imageUrl'] as String,
    );

Map<String, dynamic> _$$CropHealthAnalysisImplToJson(
        _$CropHealthAnalysisImpl instance) =>
    <String, dynamic>{
      'overallHealthScore': instance.overallHealthScore,
      'nitrogenLevel': _$NutrientLevelEnumMap[instance.nitrogenLevel]!,
      'phosphorusLevel': _$NutrientLevelEnumMap[instance.phosphorusLevel]!,
      'potassiumLevel': _$NutrientLevelEnumMap[instance.potassiumLevel]!,
      'waterStress': _$StressLevelEnumMap[instance.waterStress]!,
      'pestDamage': _$DamageLevelEnumMap[instance.pestDamage]!,
      'growthStage': instance.growthStage,
      'yieldPotential': instance.yieldPotential,
      'actionItems': instance.actionItems,
      'analysisDate': instance.analysisDate.toIso8601String(),
      'imageUrl': instance.imageUrl,
    };

const _$NutrientLevelEnumMap = {
  NutrientLevel.optimal: 'optimal',
  NutrientLevel.adequate: 'adequate',
  NutrientLevel.deficient: 'deficient',
  NutrientLevel.severelyDeficient: 'severely_deficient',
};

const _$StressLevelEnumMap = {
  StressLevel.none: 'none',
  StressLevel.low: 'low',
  StressLevel.medium: 'medium',
  StressLevel.high: 'high',
};

const _$DamageLevelEnumMap = {
  DamageLevel.none: 'none',
  DamageLevel.minimal: 'minimal',
  DamageLevel.moderate: 'moderate',
  DamageLevel.severe: 'severe',
};

_$ActionItemImpl _$$ActionItemImplFromJson(Map<String, dynamic> json) =>
    _$ActionItemImpl(
      title: json['title'] as String,
      description: json['description'] as String,
      priority: $enumDecode(_$ActionPriorityEnumMap, json['priority']),
      estimatedCost: (json['estimatedCost'] as num).toDouble(),
      timeframe: json['timeframe'] as String,
    );

Map<String, dynamic> _$$ActionItemImplToJson(_$ActionItemImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'priority': _$ActionPriorityEnumMap[instance.priority]!,
      'estimatedCost': instance.estimatedCost,
      'timeframe': instance.timeframe,
    };

const _$ActionPriorityEnumMap = {
  ActionPriority.low: 'low',
  ActionPriority.medium: 'medium',
  ActionPriority.high: 'high',
  ActionPriority.urgent: 'urgent',
};

_$YieldPredictionImpl _$$YieldPredictionImplFromJson(
        Map<String, dynamic> json) =>
    _$YieldPredictionImpl(
      expectedYield: (json['expectedYield'] as num).toDouble(),
      minYield: (json['minYield'] as num).toDouble(),
      maxYield: (json['maxYield'] as num).toDouble(),
      confidenceLevel: (json['confidenceLevel'] as num).toDouble(),
      factorsAffectingYield: (json['factorsAffectingYield'] as List<dynamic>)
          .map((e) => YieldFactor.fromJson(e as Map<String, dynamic>))
          .toList(),
      recommendedActions: (json['recommendedActions'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      marketValue: (json['marketValue'] as num).toDouble(),
      predictionDate: DateTime.parse(json['predictionDate'] as String),
      imageUrl: json['imageUrl'] as String,
    );

Map<String, dynamic> _$$YieldPredictionImplToJson(
        _$YieldPredictionImpl instance) =>
    <String, dynamic>{
      'expectedYield': instance.expectedYield,
      'minYield': instance.minYield,
      'maxYield': instance.maxYield,
      'confidenceLevel': instance.confidenceLevel,
      'factorsAffectingYield': instance.factorsAffectingYield,
      'recommendedActions': instance.recommendedActions,
      'marketValue': instance.marketValue,
      'predictionDate': instance.predictionDate.toIso8601String(),
      'imageUrl': instance.imageUrl,
    };

_$YieldFactorImpl _$$YieldFactorImplFromJson(Map<String, dynamic> json) =>
    _$YieldFactorImpl(
      factor: json['factor'] as String,
      impact: (json['impact'] as num).toDouble(),
      description: json['description'] as String,
    );

Map<String, dynamic> _$$YieldFactorImplToJson(_$YieldFactorImpl instance) =>
    <String, dynamic>{
      'factor': instance.factor,
      'impact': instance.impact,
      'description': instance.description,
    };

_$RealTimeCropAnalysisImpl _$$RealTimeCropAnalysisImplFromJson(
        Map<String, dynamic> json) =>
    _$RealTimeCropAnalysisImpl(
      healthScore: (json['healthScore'] as num).toDouble(),
      moistureLevel: (json['moistureLevel'] as num).toDouble(),
      pestActivity: json['pestActivity'] as String,
      growthRate: json['growthRate'] as String,
      recommendedAction: json['recommendedAction'] as String,
      timestamp: DateTime.parse(json['timestamp'] as String),
    );

Map<String, dynamic> _$$RealTimeCropAnalysisImplToJson(
        _$RealTimeCropAnalysisImpl instance) =>
    <String, dynamic>{
      'healthScore': instance.healthScore,
      'moistureLevel': instance.moistureLevel,
      'pestActivity': instance.pestActivity,
      'growthRate': instance.growthRate,
      'recommendedAction': instance.recommendedAction,
      'timestamp': instance.timestamp.toIso8601String(),
    };
