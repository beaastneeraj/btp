// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'farm_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WeatherDataImpl _$$WeatherDataImplFromJson(Map<String, dynamic> json) =>
    _$WeatherDataImpl(
      temperature: (json['temperature'] as num).toDouble(),
      humidity: (json['humidity'] as num).toDouble(),
      uvIndex: (json['uvIndex'] as num).toDouble(),
      windSpeed: (json['windSpeed'] as num).toDouble(),
      description: json['description'] as String,
      timestamp: DateTime.parse(json['timestamp'] as String),
      hourlyForecast: (json['hourlyForecast'] as List<dynamic>?)
              ?.map((e) => HourlyForecast.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      dailyForecast: (json['dailyForecast'] as List<dynamic>?)
              ?.map((e) => DailyForecast.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$WeatherDataImplToJson(_$WeatherDataImpl instance) =>
    <String, dynamic>{
      'temperature': instance.temperature,
      'humidity': instance.humidity,
      'uvIndex': instance.uvIndex,
      'windSpeed': instance.windSpeed,
      'description': instance.description,
      'timestamp': instance.timestamp.toIso8601String(),
      'hourlyForecast': instance.hourlyForecast,
      'dailyForecast': instance.dailyForecast,
    };

_$HourlyForecastImpl _$$HourlyForecastImplFromJson(Map<String, dynamic> json) =>
    _$HourlyForecastImpl(
      time: DateTime.parse(json['time'] as String),
      temperature: (json['temperature'] as num).toDouble(),
      humidity: (json['humidity'] as num).toDouble(),
      description: json['description'] as String,
    );

Map<String, dynamic> _$$HourlyForecastImplToJson(
        _$HourlyForecastImpl instance) =>
    <String, dynamic>{
      'time': instance.time.toIso8601String(),
      'temperature': instance.temperature,
      'humidity': instance.humidity,
      'description': instance.description,
    };

_$DailyForecastImpl _$$DailyForecastImplFromJson(Map<String, dynamic> json) =>
    _$DailyForecastImpl(
      date: DateTime.parse(json['date'] as String),
      minTemp: (json['minTemp'] as num).toDouble(),
      maxTemp: (json['maxTemp'] as num).toDouble(),
      description: json['description'] as String,
      precipitationChance: (json['precipitationChance'] as num).toDouble(),
    );

Map<String, dynamic> _$$DailyForecastImplToJson(_$DailyForecastImpl instance) =>
    <String, dynamic>{
      'date': instance.date.toIso8601String(),
      'minTemp': instance.minTemp,
      'maxTemp': instance.maxTemp,
      'description': instance.description,
      'precipitationChance': instance.precipitationChance,
    };

_$CropSectionImpl _$$CropSectionImplFromJson(Map<String, dynamic> json) =>
    _$CropSectionImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      cropType: json['cropType'] as String,
      area: (json['area'] as num).toDouble(),
      health: CropHealth.fromJson(json['health'] as Map<String, dynamic>),
      plantingInfo:
          PlantingInfo.fromJson(json['plantingInfo'] as Map<String, dynamic>),
      sensorReadings: (json['sensorReadings'] as List<dynamic>)
          .map((e) => SensorReading.fromJson(e as Map<String, dynamic>))
          .toList(),
      aiInsights: (json['aiInsights'] as List<dynamic>?)
              ?.map((e) => AIInsight.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$CropSectionImplToJson(_$CropSectionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'cropType': instance.cropType,
      'area': instance.area,
      'health': instance.health,
      'plantingInfo': instance.plantingInfo,
      'sensorReadings': instance.sensorReadings,
      'aiInsights': instance.aiInsights,
    };

_$CropHealthImpl _$$CropHealthImplFromJson(Map<String, dynamic> json) =>
    _$CropHealthImpl(
      healthScore: (json['healthScore'] as num).toInt(),
      growthRate: (json['growthRate'] as num).toDouble(),
      diseaseRisk: json['diseaseRisk'] as String,
      yieldForecast: (json['yieldForecast'] as num).toInt(),
      lastAssessment: DateTime.parse(json['lastAssessment'] as String),
      issues: (json['issues'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      recommendations: (json['recommendations'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$CropHealthImplToJson(_$CropHealthImpl instance) =>
    <String, dynamic>{
      'healthScore': instance.healthScore,
      'growthRate': instance.growthRate,
      'diseaseRisk': instance.diseaseRisk,
      'yieldForecast': instance.yieldForecast,
      'lastAssessment': instance.lastAssessment.toIso8601String(),
      'issues': instance.issues,
      'recommendations': instance.recommendations,
    };

_$PlantingInfoImpl _$$PlantingInfoImplFromJson(Map<String, dynamic> json) =>
    _$PlantingInfoImpl(
      plantedDate: DateTime.parse(json['plantedDate'] as String),
      expectedHarvestDate:
          DateTime.parse(json['expectedHarvestDate'] as String),
      variety: json['variety'] as String,
      plantCount: (json['plantCount'] as num).toInt(),
      spacing: (json['spacing'] as num).toDouble(),
    );

Map<String, dynamic> _$$PlantingInfoImplToJson(_$PlantingInfoImpl instance) =>
    <String, dynamic>{
      'plantedDate': instance.plantedDate.toIso8601String(),
      'expectedHarvestDate': instance.expectedHarvestDate.toIso8601String(),
      'variety': instance.variety,
      'plantCount': instance.plantCount,
      'spacing': instance.spacing,
    };

_$SensorReadingImpl _$$SensorReadingImplFromJson(Map<String, dynamic> json) =>
    _$SensorReadingImpl(
      sensorId: json['sensorId'] as String,
      type: json['type'] as String,
      value: (json['value'] as num).toDouble(),
      unit: json['unit'] as String,
      timestamp: DateTime.parse(json['timestamp'] as String),
      status: $enumDecode(_$SensorStatusEnumMap, json['status']),
    );

Map<String, dynamic> _$$SensorReadingImplToJson(_$SensorReadingImpl instance) =>
    <String, dynamic>{
      'sensorId': instance.sensorId,
      'type': instance.type,
      'value': instance.value,
      'unit': instance.unit,
      'timestamp': instance.timestamp.toIso8601String(),
      'status': _$SensorStatusEnumMap[instance.status]!,
    };

const _$SensorStatusEnumMap = {
  SensorStatus.active: 'active',
  SensorStatus.inactive: 'inactive',
  SensorStatus.warning: 'warning',
  SensorStatus.error: 'error',
};

_$AIInsightImpl _$$AIInsightImplFromJson(Map<String, dynamic> json) =>
    _$AIInsightImpl(
      id: json['id'] as String,
      type: json['type'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      confidence: (json['confidence'] as num).toDouble(),
      timestamp: DateTime.parse(json['timestamp'] as String),
      priority: $enumDecode(_$AIInsightPriorityEnumMap, json['priority']),
      actionItems: (json['actionItems'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$AIInsightImplToJson(_$AIInsightImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'title': instance.title,
      'description': instance.description,
      'confidence': instance.confidence,
      'timestamp': instance.timestamp.toIso8601String(),
      'priority': _$AIInsightPriorityEnumMap[instance.priority]!,
      'actionItems': instance.actionItems,
    };

const _$AIInsightPriorityEnumMap = {
  AIInsightPriority.low: 'low',
  AIInsightPriority.medium: 'medium',
  AIInsightPriority.high: 'high',
  AIInsightPriority.critical: 'critical',
};

_$FarmActivityImpl _$$FarmActivityImplFromJson(Map<String, dynamic> json) =>
    _$FarmActivityImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      type: $enumDecode(_$ActivityTypeEnumMap, json['type']),
      timestamp: DateTime.parse(json['timestamp'] as String),
      sectionId: json['sectionId'] as String,
      status: $enumDecode(_$ActivityStatusEnumMap, json['status']),
      metadata: json['metadata'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$FarmActivityImplToJson(_$FarmActivityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'type': _$ActivityTypeEnumMap[instance.type]!,
      'timestamp': instance.timestamp.toIso8601String(),
      'sectionId': instance.sectionId,
      'status': _$ActivityStatusEnumMap[instance.status]!,
      'metadata': instance.metadata,
    };

const _$ActivityTypeEnumMap = {
  ActivityType.planting: 'planting',
  ActivityType.irrigation: 'irrigation',
  ActivityType.fertilization: 'fertilization',
  ActivityType.harvesting: 'harvesting',
  ActivityType.inspection: 'inspection',
  ActivityType.maintenance: 'maintenance',
};

const _$ActivityStatusEnumMap = {
  ActivityStatus.pending: 'pending',
  ActivityStatus.inProgress: 'inProgress',
  ActivityStatus.completed: 'completed',
  ActivityStatus.cancelled: 'cancelled',
};
