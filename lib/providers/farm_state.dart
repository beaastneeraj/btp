import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'farm_state.freezed.dart';
part 'farm_state.g.dart';

/// Farm data models using Freezed for immutability
@freezed
class WeatherData with _$WeatherData {
  const factory WeatherData({
    required double temperature,
    required double humidity,
    required double uvIndex,
    required double windSpeed,
    required String description,
    required DateTime timestamp,
    @Default([]) List<HourlyForecast> hourlyForecast,
    @Default([]) List<DailyForecast> dailyForecast,
  }) = _WeatherData;

  factory WeatherData.fromJson(Map<String, dynamic> json) =>
      _$WeatherDataFromJson(json);
}

@freezed
class HourlyForecast with _$HourlyForecast {
  const factory HourlyForecast({
    required DateTime time,
    required double temperature,
    required double humidity,
    required String description,
  }) = _HourlyForecast;

  factory HourlyForecast.fromJson(Map<String, dynamic> json) =>
      _$HourlyForecastFromJson(json);
}

@freezed
class DailyForecast with _$DailyForecast {
  const factory DailyForecast({
    required DateTime date,
    required double minTemp,
    required double maxTemp,
    required String description,
    required double precipitationChance,
  }) = _DailyForecast;

  factory DailyForecast.fromJson(Map<String, dynamic> json) =>
      _$DailyForecastFromJson(json);
}

@freezed
class CropSection with _$CropSection {
  const factory CropSection({
    required String id,
    required String name,
    required String cropType,
    required double area,
    required CropHealth health,
    required PlantingInfo plantingInfo,
    required List<SensorReading> sensorReadings,
    @Default([]) List<AIInsight> aiInsights,
  }) = _CropSection;

  factory CropSection.fromJson(Map<String, dynamic> json) =>
      _$CropSectionFromJson(json);
}

@freezed
class CropHealth with _$CropHealth {
  const factory CropHealth({
    required int healthScore,
    required double growthRate,
    required String diseaseRisk,
    required int yieldForecast,
    required DateTime lastAssessment,
    @Default([]) List<String> issues,
    @Default([]) List<String> recommendations,
  }) = _CropHealth;

  factory CropHealth.fromJson(Map<String, dynamic> json) =>
      _$CropHealthFromJson(json);
}

@freezed
class PlantingInfo with _$PlantingInfo {
  const factory PlantingInfo({
    required DateTime plantedDate,
    required DateTime expectedHarvestDate,
    required String variety,
    required int plantCount,
    required double spacing,
  }) = _PlantingInfo;

  factory PlantingInfo.fromJson(Map<String, dynamic> json) =>
      _$PlantingInfoFromJson(json);
}

@freezed
class SensorReading with _$SensorReading {
  const factory SensorReading({
    required String sensorId,
    required String type,
    required double value,
    required String unit,
    required DateTime timestamp,
    required SensorStatus status,
  }) = _SensorReading;

  factory SensorReading.fromJson(Map<String, dynamic> json) =>
      _$SensorReadingFromJson(json);
}

enum SensorStatus { active, inactive, warning, error }

@freezed
class AIInsight with _$AIInsight {
  const factory AIInsight({
    required String id,
    required String type,
    required String title,
    required String description,
    required double confidence,
    required DateTime timestamp,
    required AIInsightPriority priority,
    @Default([]) List<String> actionItems,
  }) = _AIInsight;

  factory AIInsight.fromJson(Map<String, dynamic> json) =>
      _$AIInsightFromJson(json);
}

enum AIInsightPriority { low, medium, high, critical }

@freezed
class FarmActivity with _$FarmActivity {
  const factory FarmActivity({
    required String id,
    required String title,
    required String description,
    required ActivityType type,
    required DateTime timestamp,
    required String sectionId,
    required ActivityStatus status,
    Map<String, dynamic>? metadata,
  }) = _FarmActivity;

  factory FarmActivity.fromJson(Map<String, dynamic> json) =>
      _$FarmActivityFromJson(json);
}

enum ActivityType { planting, irrigation, fertilization, harvesting, inspection, maintenance }
enum ActivityStatus { pending, inProgress, completed, cancelled }

/// Farm state management
@freezed
class FarmState with _$FarmState {
  const factory FarmState({
    @Default(AsyncValue.loading()) AsyncValue<WeatherData> weather,
    @Default(AsyncValue.loading()) AsyncValue<List<CropSection>> cropSections,
    @Default(AsyncValue.loading()) AsyncValue<List<FarmActivity>> activities,
    @Default(AsyncValue.loading()) AsyncValue<List<AIInsight>> insights,
    @Default(false) bool isConnectedToSensors,
    @Default(null) String? selectedSectionId,
    @Default(FarmViewMode.dashboard) FarmViewMode viewMode,
  }) = _FarmState;
}

enum FarmViewMode { dashboard, monitoring, planning, analytics }

/// Providers for farm data
class FarmNotifier extends StateNotifier<FarmState> {
  FarmNotifier() : super(const FarmState()) {
    _initializeFarm();
  }

  void _initializeFarm() {
    _loadWeatherData();
    _loadCropSections();
    _loadActivities();
    _loadAIInsights();
  }

  Future<void> _loadWeatherData() async {
    try {
      // Simulate API call
      await Future.delayed(const Duration(seconds: 1));
      
      final weatherData = WeatherData(
        temperature: 24.5,
        humidity: 65.0,
        uvIndex: 6.2,
        windSpeed: 12.0,
        description: 'Partly cloudy',
        timestamp: DateTime.now(),
        hourlyForecast: List.generate(24, (index) => 
          HourlyForecast(
            time: DateTime.now().add(Duration(hours: index)),
            temperature: 24.5 + (index % 5) - 2,
            humidity: 65.0 + (index % 10) - 5,
            description: ['Sunny', 'Cloudy', 'Partly cloudy'][index % 3],
          ),
        ),
        dailyForecast: List.generate(7, (index) =>
          DailyForecast(
            date: DateTime.now().add(Duration(days: index)),
            minTemp: 18.0 + index,
            maxTemp: 28.0 + index,
            description: ['Sunny', 'Cloudy', 'Rainy'][index % 3],
            precipitationChance: (index * 10) % 80,
          ),
        ),
      );
      
      state = state.copyWith(weather: AsyncValue.data(weatherData));
    } catch (error, stackTrace) {
      state = state.copyWith(weather: AsyncValue.error(error, stackTrace));
    }
  }

  Future<void> _loadCropSections() async {
    try {
      await Future.delayed(const Duration(milliseconds: 800));
      
      final sections = [
        CropSection(
          id: 'section_a',
          name: 'Section A',
          cropType: 'Tomatoes',
          area: 2.5,
          health: const CropHealth(
            healthScore: 95,
            growthRate: 12.0,
            diseaseRisk: 'Low',
            yieldForecast: 85,
            lastAssessment: DateTime.now(),
            issues: [],
            recommendations: ['Maintain current irrigation schedule'],
          ),
          plantingInfo: PlantingInfo(
            plantedDate: DateTime.now().subtract(const Duration(days: 45)),
            expectedHarvestDate: DateTime.now().add(const Duration(days: 30)),
            variety: 'Cherry Tomato',
            plantCount: 1000,
            spacing: 0.5,
          ),
          sensorReadings: [
            SensorReading(
              sensorId: 'soil_001',
              type: 'Soil Moisture',
              value: 45.0,
              unit: '%',
              timestamp: DateTime.now(),
              status: SensorStatus.active,
            ),
            SensorReading(
              sensorId: 'temp_001',
              type: 'Soil Temperature',
              value: 22.0,
              unit: '°C',
              timestamp: DateTime.now(),
              status: SensorStatus.active,
            ),
          ],
        ),
        CropSection(
          id: 'section_b',
          name: 'Section B',
          cropType: 'Wheat',
          area: 5.0,
          health: const CropHealth(
            healthScore: 88,
            growthRate: 8.0,
            diseaseRisk: 'Medium',
            yieldForecast: 78,
            lastAssessment: DateTime.now(),
            issues: ['Minor fungal detection'],
            recommendations: ['Apply organic fungicide'],
          ),
          plantingInfo: PlantingInfo(
            plantedDate: DateTime.now().subtract(const Duration(days: 60)),
            expectedHarvestDate: DateTime.now().add(const Duration(days: 45)),
            variety: 'Winter Wheat',
            plantCount: 5000,
            spacing: 0.2,
          ),
          sensorReadings: [],
        ),
      ];
      
      state = state.copyWith(cropSections: AsyncValue.data(sections));
    } catch (error, stackTrace) {
      state = state.copyWith(cropSections: AsyncValue.error(error, stackTrace));
    }
  }

  Future<void> _loadActivities() async {
    try {
      await Future.delayed(const Duration(milliseconds: 600));
      
      final activities = [
        FarmActivity(
          id: 'activity_1',
          title: 'Planted Seeds',
          description: 'Planted tomato seeds in Section A',
          type: ActivityType.planting,
          timestamp: DateTime.now().subtract(const Duration(hours: 2)),
          sectionId: 'section_a',
          status: ActivityStatus.completed,
        ),
        FarmActivity(
          id: 'activity_2',
          title: 'Irrigation Complete',
          description: 'Automatic irrigation completed in Zone 2',
          type: ActivityType.irrigation,
          timestamp: DateTime.now().subtract(const Duration(hours: 4)),
          sectionId: 'section_b',
          status: ActivityStatus.completed,
        ),
        FarmActivity(
          id: 'activity_3',
          title: 'Crop Inspection',
          description: 'Weekly health inspection completed',
          type: ActivityType.inspection,
          timestamp: DateTime.now().subtract(const Duration(days: 1)),
          sectionId: 'section_a',
          status: ActivityStatus.completed,
        ),
      ];
      
      state = state.copyWith(activities: AsyncValue.data(activities));
    } catch (error, stackTrace) {
      state = state.copyWith(activities: AsyncValue.error(error, stackTrace));
    }
  }

  Future<void> _loadAIInsights() async {
    try {
      await Future.delayed(const Duration(milliseconds: 1000));
      
      final insights = [
        AIInsight(
          id: 'insight_1',
          type: 'irrigation',
          title: 'Irrigation Recommendation',
          description: 'Consider increasing irrigation for tomato crops. Weather forecast shows dry conditions for the next 3 days.',
          confidence: 0.92,
          timestamp: DateTime.now(),
          priority: AIInsightPriority.medium,
          actionItems: [
            'Increase irrigation frequency by 20%',
            'Monitor soil moisture levels',
            'Check weather updates daily',
          ],
        ),
        AIInsight(
          id: 'insight_2',
          type: 'disease',
          title: 'Disease Prevention',
          description: 'Early signs of fungal growth detected in wheat section. Preventive measures recommended.',
          confidence: 0.78,
          timestamp: DateTime.now().subtract(const Duration(hours: 6)),
          priority: AIInsightPriority.high,
          actionItems: [
            'Apply organic fungicide',
            'Improve ventilation',
            'Reduce watering frequency',
          ],
        ),
      ];
      
      state = state.copyWith(insights: AsyncValue.data(insights));
    } catch (error, stackTrace) {
      state = state.copyWith(insights: AsyncValue.error(error, stackTrace));
    }
  }

  void selectSection(String? sectionId) {
    state = state.copyWith(selectedSectionId: sectionId);
  }

  void setViewMode(FarmViewMode mode) {
    state = state.copyWith(viewMode: mode);
  }

  Future<void> refreshWeather() async {
    state = state.copyWith(weather: const AsyncValue.loading());
    await _loadWeatherData();
  }

  Future<void> refreshAllData() async {
    state = const FarmState();
    _initializeFarm();
  }

  Future<void> addActivity(FarmActivity activity) async {
    final currentActivities = state.activities.value ?? [];
    final updatedActivities = [activity, ...currentActivities];
    state = state.copyWith(activities: AsyncValue.data(updatedActivities));
  }

  Future<void> updateCropHealth(String sectionId, CropHealth health) async {
    final currentSections = state.cropSections.value ?? [];
    final updatedSections = currentSections.map((section) {
      if (section.id == sectionId) {
        return section.copyWith(health: health);
      }
      return section;
    }).toList();
    
    state = state.copyWith(cropSections: AsyncValue.data(updatedSections));
  }
}

final farmProvider = StateNotifierProvider<FarmNotifier, FarmState>((ref) {
  return FarmNotifier();
});

// Computed providers for specific data
final weatherProvider = Provider<AsyncValue<WeatherData>>((ref) {
  return ref.watch(farmProvider).weather;
});

final cropSectionsProvider = Provider<AsyncValue<List<CropSection>>>((ref) {
  return ref.watch(farmProvider).cropSections;
});

final activitiesProvider = Provider<AsyncValue<List<FarmActivity>>>((ref) {
  return ref.watch(farmProvider).activities;
});

final aiInsightsProvider = Provider<AsyncValue<List<AIInsight>>>((ref) {
  return ref.watch(farmProvider).insights;
});

final selectedSectionProvider = Provider<CropSection?>((ref) {
  final selectedId = ref.watch(farmProvider).selectedSectionId;
  final sections = ref.watch(farmProvider).cropSections.value;
  
  if (selectedId == null || sections == null) return null;
  
  try {
    return sections.firstWhere((section) => section.id == selectedId);
  } catch (e) {
    return null;
  }
});

// Real-time sensor data provider
final sensorDataProvider = StreamProvider.family<SensorReading, String>((ref, sensorId) {
  return Stream.periodic(const Duration(seconds: 5), (count) {
    return SensorReading(
      sensorId: sensorId,
      type: 'Soil Moisture',
      value: 45.0 + (count % 10) - 5,
      unit: '%',
      timestamp: DateTime.now(),
      status: SensorStatus.active,
    );
  });
});

// AI recommendations provider
final aiRecommendationsProvider = FutureProvider.family<List<String>, String>((ref, sectionId) async {
  // Simulate AI processing
  await Future.delayed(const Duration(seconds: 2));
  
  return [
    'Optimal irrigation time: 6:00 AM',
    'Consider companion planting with basil',
    'Harvest window: 7-10 days',
    'Apply organic fertilizer next week',
  ];
});
