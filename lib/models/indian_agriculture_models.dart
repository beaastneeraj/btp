import 'package:freezed_annotation/freezed_annotation.dart';

part 'indian_agriculture_models.freezed.dart';
part 'indian_agriculture_models.g.dart';

/// Indian states and union territories
enum IndianState {
  andhraPradesh,
  arunachalPradesh,
  assam,
  bihar,
  chhattisgarh,
  goa,
  gujarat,
  haryana,
  himachalPradesh,
  jharkhand,
  karnataka,
  kerala,
  madhyaPradesh,
  maharashtra,
  manipur,
  meghalaya,
  mizoram,
  nagaland,
  odisha,
  punjab,
  rajasthan,
  sikkim,
  tamilNadu,
  telangana,
  tripura,
  uttarPradesh,
  uttarakhand,
  westBengal,
  // Union Territories
  andamanNicobar,
  chandigarh,
  dadraHaveli,
  delhiNct,
  jammuKashmir,
  ladakh,
  lakshadweep,
  puducherry,
}

/// Crop categories based on Indian agriculture
enum CropCategory {
  cereals,
  pulses,
  oilseeds,
  cash,
  vegetables,
  fruits,
  spices,
  plantation,
  medicinal,
  fodder,
}

/// Soil types common in India
enum SoilType {
  alluvial,
  blackCotton,
  red,
  laterite,
  desert,
  mountain,
  saline,
  peaty,
  forest,
}

/// Climate zones in India
enum ClimateZone {
  tropical,
  subtropical,
  temperate,
  alpine,
  arid,
  semiArid,
  humid,
  subHumid,
}

/// Crop seasons in India
enum CropSeason {
  kharif,   // Monsoon season (June-October)
  rabi,     // Winter season (November-April)
  zaid,     // Summer season (April-June)
  perennial, // Year-round
}

@freezed
class IndianCrop with _$IndianCrop {
  const factory IndianCrop({
    required String id,
    required String name,
    required String hindiName,
    required String scientificName,
    required CropCategory category,
    required List<IndianState> suitableStates,
    required List<SoilType> suitableSoils,
    required List<ClimateZone> suitableClimates,
    required List<CropSeason> seasons,
    required int growthDurationDays,
    required double temperatureMin,
    required double temperatureMax,
    required double rainfallMin,
    required double rainfallMax,
    required String description,
    required List<String> varieties,
    required CropManual manual,
    required List<String> diseases,
    required List<String> pests,
    required MarketInfo marketInfo,
    @Default([]) List<String> images,
  }) = _IndianCrop;

  factory IndianCrop.fromJson(Map<String, dynamic> json) =>
      _$IndianCropFromJson(json);
}

@freezed
class CropManual with _$CropManual {
  const factory CropManual({
    required String cropId,
    required SoilPreparation soilPreparation,
    required SeedingInfo seedingInfo,
    required IrrigationSchedule irrigation,
    required FertilizerSchedule fertilizer,
    required PestManagement pestManagement,
    required HarvestingInfo harvesting,
    required PostHarvestCare postHarvest,
    required List<String> tips,
    required List<String> warnings,
  }) = _CropManual;

  factory CropManual.fromJson(Map<String, dynamic> json) =>
      _$CropManualFromJson(json);
}

@freezed
class SoilPreparation with _$SoilPreparation {
  const factory SoilPreparation({
    required List<String> steps,
    required String ploughingDepth,
    required int numberOfPloughings,
    required List<String> tools,
    required String timing,
    required String soilMoisture,
  }) = _SoilPreparation;

  factory SoilPreparation.fromJson(Map<String, dynamic> json) =>
      _$SoilPreparationFromJson(json);
}

@freezed
class SeedingInfo with _$SeedingInfo {
  const factory SeedingInfo({
    required double seedRate,
    required String seedRateUnit,
    required String spacingBetweenRows,
    required String spacingBetweenPlants,
    required String sowingDepth,
    required String sowingMethod,
    required List<String> seedTreatment,
    required String bestSowingTime,
  }) = _SeedingInfo;

  factory SeedingInfo.fromJson(Map<String, dynamic> json) =>
      _$SeedingInfoFromJson(json);
}

@freezed
class IrrigationSchedule with _$IrrigationSchedule {
  const factory IrrigationSchedule({
    required List<IrrigationStage> stages,
    required String method,
    required double totalWaterRequirement,
    required String waterQuality,
    required List<String> criticalStages,
  }) = _IrrigationSchedule;

  factory IrrigationSchedule.fromJson(Map<String, dynamic> json) =>
      _$IrrigationScheduleFromJson(json);
}

@freezed
class IrrigationStage with _$IrrigationStage {
  const factory IrrigationStage({
    required String stage,
    required int daysAfterSowing,
    required double waterAmount,
    required String frequency,
    required String notes,
  }) = _IrrigationStage;

  factory IrrigationStage.fromJson(Map<String, dynamic> json) =>
      _$IrrigationStageFromJson(json);
}

@freezed
class FertilizerSchedule with _$FertilizerSchedule {
  const factory FertilizerSchedule({
    required List<FertilizerApplication> applications,
    required OrganicFertilizers organic,
    required List<String> micronutrients,
    required String soilTesting,
  }) = _FertilizerSchedule;

  factory FertilizerSchedule.fromJson(Map<String, dynamic> json) =>
      _$FertilizerScheduleFromJson(json);
}

@freezed
class FertilizerApplication with _$FertilizerApplication {
  const factory FertilizerApplication({
    required String stage,
    required int daysAfterSowing,
    required String npkRatio,
    required double quantity,
    required String unit,
    required String method,
    required String notes,
  }) = _FertilizerApplication;

  factory FertilizerApplication.fromJson(Map<String, dynamic> json) =>
      _$FertilizerApplicationFromJson(json);
}

@freezed
class OrganicFertilizers with _$OrganicFertilizers {
  const factory OrganicFertilizers({
    required String farmyardManure,
    required String compost,
    required String vermicompost,
    required String greenManure,
    required List<String> biofertilizers,
  }) = _OrganicFertilizers;

  factory OrganicFertilizers.fromJson(Map<String, dynamic> json) =>
      _$OrganicFertilizersFromJson(json);
}

@freezed
class PestManagement with _$PestManagement {
  const factory PestManagement({
    required List<CommonPest> pests,
    required List<CommonDisease> diseases,
    required IntegratedPestManagement ipm,
    required List<String> organicSolutions,
    required List<String> chemicalSolutions,
  }) = _PestManagement;

  factory PestManagement.fromJson(Map<String, dynamic> json) =>
      _$PestManagementFromJson(json);
}

@freezed
class CommonPest with _$CommonPest {
  const factory CommonPest({
    required String name,
    required String hindiName,
    required String scientificName,
    required String description,
    required List<String> symptoms,
    required List<String> control,
    required String severity,
  }) = _CommonPest;

  factory CommonPest.fromJson(Map<String, dynamic> json) =>
      _$CommonPestFromJson(json);
}

@freezed
class CommonDisease with _$CommonDisease {
  const factory CommonDisease({
    required String name,
    required String hindiName,
    required String scientificName,
    required String type,
    required List<String> symptoms,
    required List<String> prevention,
    required List<String> treatment,
    required String severity,
  }) = _CommonDisease;

  factory CommonDisease.fromJson(Map<String, dynamic> json) =>
      _$CommonDiseaseFromJson(json);
}

@freezed
class IntegratedPestManagement with _$IntegratedPestManagement {
  const factory IntegratedPestManagement({
    required List<String> cultural,
    required List<String> biological,
    required List<String> mechanical,
    required List<String> chemical,
    required String monitoring,
  }) = _IntegratedPestManagement;

  factory IntegratedPestManagement.fromJson(Map<String, dynamic> json) =>
      _$IntegratedPestManagementFromJson(json);
}

@freezed
class HarvestingInfo with _$HarvestingInfo {
  const factory HarvestingInfo({
    required List<String> maturitySigns,
    required String harvestingMethod,
    required String bestTime,
    required String weatherConditions,
    required String tools,
    required double expectedYield,
    required String yieldUnit,
  }) = _HarvestingInfo;

  factory HarvestingInfo.fromJson(Map<String, dynamic> json) =>
      _$HarvestingInfoFromJson(json);
}

@freezed
class PostHarvestCare with _$PostHarvestCare {
  const factory PostHarvestCare({
    required List<String> processing,
    required StorageInfo storage,
    required List<String> packaging,
    required List<String> transportation,
    required QualityStandards quality,
  }) = _PostHarvestCare;

  factory PostHarvestCare.fromJson(Map<String, dynamic> json) =>
      _$PostHarvestCareFromJson(json);
}

@freezed
class StorageInfo with _$StorageInfo {
  const factory StorageInfo({
    required String method,
    required String temperature,
    required String humidity,
    required String duration,
    required List<String> precautions,
  }) = _StorageInfo;

  factory StorageInfo.fromJson(Map<String, dynamic> json) =>
      _$StorageInfoFromJson(json);
}

@freezed
class QualityStandards with _$QualityStandards {
  const factory QualityStandards({
    required List<String> grades,
    required List<String> specifications,
    required String certification,
    required List<String> export,
  }) = _QualityStandards;

  factory QualityStandards.fromJson(Map<String, dynamic> json) =>
      _$QualityStandardsFromJson(json);
}

@freezed
class MarketInfo with _$MarketInfo {
  const factory MarketInfo({
    required double currentPrice,
    required String priceUnit,
    required List<String> majorMarkets,
    required String demand,
    required String exportPotential,
    required List<String> buyers,
    required String priceRange,
  }) = _MarketInfo;

  factory MarketInfo.fromJson(Map<String, dynamic> json) =>
      _$MarketInfoFromJson(json);
}

/// Government schemes for farmers
@freezed
class GovernmentScheme with _$GovernmentScheme {
  const factory GovernmentScheme({
    required String id,
    required String name,
    required String hindiName,
    required String description,
    required String ministry,
    required List<String> benefits,
    required EligibilityCriteria eligibility,
    required ApplicationProcess application,
    required List<String> documents,
    required String website,
    required String helpline,
    required bool isActive,
    required DateTime lastUpdated,
    @Default([]) List<IndianState> applicableStates,
  }) = _GovernmentScheme;

  factory GovernmentScheme.fromJson(Map<String, dynamic> json) =>
      _$GovernmentSchemeFromJson(json);
}

@freezed
class EligibilityCriteria with _$EligibilityCriteria {
  const factory EligibilityCriteria({
    required String landSize,
    required String farmerCategory,
    required String income,
    required String age,
    required List<String> other,
  }) = _EligibilityCriteria;

  factory EligibilityCriteria.fromJson(Map<String, dynamic> json) =>
      _$EligibilityCriteriaFromJson(json);
}

@freezed
class ApplicationProcess with _$ApplicationProcess {
  const factory ApplicationProcess({
    required List<String> steps,
    required String mode,
    required String timeline,
    required String fee,
    required List<String> offices,
  }) = _ApplicationProcess;

  factory ApplicationProcess.fromJson(Map<String, dynamic> json) =>
      _$ApplicationProcessFromJson(json);
}

/// News and updates for farmers
@freezed
class FarmingNews with _$FarmingNews {
  const factory FarmingNews({
    required String id,
    required String title,
    required String hindiTitle,
    required String content,
    required String summary,
    required String category,
    required String source,
    required DateTime publishedAt,
    required List<String> tags,
    required String imageUrl,
    required bool isPinned,
    required int priority,
  }) = _FarmingNews;

  factory FarmingNews.fromJson(Map<String, dynamic> json) =>
      _$FarmingNewsFromJson(json);
}

/// Farmer profile for personalized experience
@freezed
class FarmerProfile with _$FarmerProfile {
  const factory FarmerProfile({
    required String id,
    required String name,
    required String phoneNumber,
    required String email,
    required IndianState state,
    required String district,
    required String village,
    required FarmDetails farmDetails,
    required List<String> preferredCrops,
    required String language,
    required DateTime createdAt,
    required DateTime lastLogin,
    @Default(false) bool isVerified,
  }) = _FarmerProfile;

  factory FarmerProfile.fromJson(Map<String, dynamic> json) =>
      _$FarmerProfileFromJson(json);
}

@freezed
class FarmDetails with _$FarmDetails {
  const factory FarmDetails({
    required double totalArea,
    required String areaUnit,
    required List<SoilType> soilTypes,
    required ClimateZone climateZone,
    required String waterSource,
    required String irrigationType,
    required List<CropField> fields,
    required List<String> equipment,
    required String farmingType,
  }) = _FarmDetails;

  factory FarmDetails.fromJson(Map<String, dynamic> json) =>
      _$FarmDetailsFromJson(json);
}

@freezed
class CropField with _$CropField {
  const factory CropField({
    required String id,
    required String name,
    required double area,
    required SoilType soilType,
    required String currentCrop,
    required CropSeason season,
    required DateTime plantingDate,
    required DateTime expectedHarvest,
    required String status,
    @Default([]) List<String> notes,
  }) = _CropField;

  factory CropField.fromJson(Map<String, dynamic> json) =>
      _$CropFieldFromJson(json);
}
