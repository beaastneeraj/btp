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
    @Default([]) List<FieldExpense> expenses,
    @Default([]) List<FieldActivity> activities,
  }) = _CropField;

  factory CropField.fromJson(Map<String, dynamic> json) =>
      _$CropFieldFromJson(json);
}

/// Farm types available in India
enum FarmType {
  cropFarming,
  dairyFarming,
  poultryFarming,
  fishFarming,
  beekeeping,
  goatFarming,
  sheepFarming,
  pigFarming,
  rabbitFarming,
  mushroomFarming,
  floriculture,
  horticulture,
  sericulture,
  aquaculture,
  organicFarming,
  hydroponics,
  polyhouse,
  nursery,
  agroforestry,
  mixedFarming,
}

/// Farm instruments and equipment
enum FarmInstrument {
  // Tillage Equipment
  plough,
  harrow,
  cultivator,
  rotavator,
  subsoiler,
  puddler,
  // Sowing Equipment
  seedDrill,
  planter,
  transplanter,
  dibbler,
  // Irrigation Equipment
  sprinklerSystem,
  dripIrrigation,
  channelIrrigation,
  pump,
  tubewell,
  waterMotor,
  // Harvesting Equipment
  harvester,
  reaper,
  thresher,
  combine,
  windrower,
  // Processing Equipment
  mill,
  cleaner,
  grader,
  dryer,
  // Transport Equipment
  tractor,
  trolley,
  cart,
  // Hand Tools
  khurpi,
  sickle,
  spade,
  hoe,
  rake,
  pruningShears,
  // Modern Equipment
  drone,
  soilTester,
  weatherStation,
  gpsTracker,
  // Livestock Equipment
  milkingMachine,
  fodderCutter,
  chaff,
  // Storage Equipment
  silo,
  warehouse,
  coldStorage,
  // Power Equipment
  generator,
  solarPanel,
  biogas,
}

/// Fertilizer types used in India
enum FertilizerType {
  // Nitrogen Fertilizers
  urea,
  ammoniumSulphate,
  calciumAmmoniumNitrate,
  ammoniumChloride,
  // Phosphatic Fertilizers
  singleSuperPhosphate,
  tripleSuper,
  diammoniumPhosphate,
  monoammoniumPhosphate,
  // Potassic Fertilizers
  muriatePotash,
  sulphatePotash,
  // Complex Fertilizers
  npk101010,
  npk121212,
  npk141414,
  npk151515,
  npk171717,
  npk192323,
  npk201020,
  // Organic Fertilizers
  farmyardManure,
  compost,
  vermicompost,
  greenManure,
  bioFertilizer,
  neemCake,
  boneMeal,
  // Micronutrient Fertilizers
  zinc,
  iron,
  manganese,
  copper,
  boron,
  molybdenum,
  // Bio-fertilizers
  rhizobium,
  azotobacter,
  psb,
  vam,
}

/// Pesticides and chemicals
enum PesticideType {
  // Insecticides
  organophosphate,
  carbamate,
  pyrethroid,
  neonicotinoid,
  organochlorine,
  // Fungicides
  copper,
  sulfur,
  triazole,
  strobilurin,
  // Herbicides
  glyphosate,
  atrazine,
  paraquat,
  // Organic Pesticides
  neemOil,
  pyrethrum,
  bacillusThuringiensis,
  trichoderma,
  // Biopesticides
  pheromones,
  microbial,
  botanical,
}

/// Seeds and planting materials
enum SeedType {
  // Quality Types
  hybrid,
  openPollinated,
  geneticallyModified,
  organic,
  heirloom,
  // Seed Grades
  foundation,
  registered,
  certified,
  truthfullyLabeled,
  // Seed Forms
  raw,
  treated,
  pelleted,
  primed,
  // Planting Material
  seedlings,
  saplings,
  grafts,
  cuttings,
  bulbs,
  tubers,
}

/// Livestock types
enum LivestockType {
  // Cattle
  cow,
  buffalo,
  bull,
  // Small Ruminants
  goat,
  sheep,
  // Poultry
  chicken,
  duck,
  turkey,
  quail,
  // Swine
  pig,
  // Others
  rabbit,
  fish,
  bee,
  silkworm,
}

@freezed
class FarmInstrumentDetail with _$FarmInstrumentDetail {
  const factory FarmInstrumentDetail({
    required String id,
    required FarmInstrument type,
    required String name,
    required String hindiName,
    required String description,
    required String brand,
    required String model,
    required double purchasePrice,
    required DateTime purchaseDate,
    required String condition,
    required MaintenanceInfo maintenance,
    required List<String> suitableCrops,
    required List<String> features,
    required String powerSource,
    required String size,
    @Default([]) List<MaintenanceRecord> maintenanceHistory,
    @Default([]) List<UsageRecord> usageHistory,
  }) = _FarmInstrumentDetail;

  factory FarmInstrumentDetail.fromJson(Map<String, dynamic> json) =>
      _$FarmInstrumentDetailFromJson(json);
}

@freezed
class MaintenanceInfo with _$MaintenanceInfo {
  const factory MaintenanceInfo({
    required String frequency,
    required List<String> checklist,
    required double estimatedCost,
    required DateTime lastMaintenance,
    required DateTime nextMaintenance,
    required List<String> commonIssues,
    required List<String> spareParts,
  }) = _MaintenanceInfo;

  factory MaintenanceInfo.fromJson(Map<String, dynamic> json) =>
      _$MaintenanceInfoFromJson(json);
}

@freezed
class MaintenanceRecord with _$MaintenanceRecord {
  const factory MaintenanceRecord({
    required String id,
    required DateTime date,
    required String type,
    required String description,
    required double cost,
    required String serviceProvider,
    required List<String> partsReplaced,
    required String notes,
  }) = _MaintenanceRecord;

  factory MaintenanceRecord.fromJson(Map<String, dynamic> json) =>
      _$MaintenanceRecordFromJson(json);
}

@freezed
class UsageRecord with _$UsageRecord {
  const factory UsageRecord({
    required String id,
    required DateTime date,
    required String fieldId,
    required String operation,
    required double hoursUsed,
    required double fuelConsumed,
    required String operator,
    required String notes,
  }) = _UsageRecord;

  factory UsageRecord.fromJson(Map<String, dynamic> json) =>
      _$UsageRecordFromJson(json);
}

@freezed
class FertilizerDetail with _$FertilizerDetail {
  const factory FertilizerDetail({
    required String id,
    required FertilizerType type,
    required String name,
    required String hindiName,
    required String brand,
    required String composition,
    required double pricePerKg,
    required String packagingSize,
    required ApplicationMethod application,
    required List<String> suitableCrops,
    required List<CropSeason> suitableSeasons,
    required String storageInstructions,
    required String safetyPrecautions,
    required String manufacturer,
    required DateTime expiryDate,
    @Default([]) List<String> benefits,
    @Default([]) List<String> sideEffects,
  }) = _FertilizerDetail;

  factory FertilizerDetail.fromJson(Map<String, dynamic> json) =>
      _$FertilizerDetailFromJson(json);
}

@freezed
class ApplicationMethod with _$ApplicationMethod {
  const factory ApplicationMethod({
    required String method,
    required String dosage,
    required String timing,
    required String frequency,
    required List<String> mixingInstructions,
    required String equipment,
    required String waterRequirement,
  }) = _ApplicationMethod;

  factory ApplicationMethod.fromJson(Map<String, dynamic> json) =>
      _$ApplicationMethodFromJson(json);
}

@freezed
class PesticideDetail with _$PesticideDetail {
  const factory PesticideDetail({
    required String id,
    required PesticideType type,
    required String name,
    required String hindiName,
    required String activeIngredient,
    required String concentration,
    required double pricePerLiter,
    required String targetPests,
    required List<String> targetCrops,
    required ApplicationMethod application,
    required SafetyInfo safety,
    required String manufacturer,
    required DateTime expiryDate,
    required String registrationNumber,
    @Default([]) List<String> restrictions,
  }) = _PesticideDetail;

  factory PesticideDetail.fromJson(Map<String, dynamic> json) =>
      _$PesticideDetailFromJson(json);
}

@freezed
class SafetyInfo with _$SafetyInfo {
  const factory SafetyInfo({
    required String toxicityClass,
    required List<String> precautions,
    required String protectiveEquipment,
    required String firstAid,
    required String environmentalImpact,
    required int preHarvestInterval,
    required String disposal,
  }) = _SafetyInfo;

  factory SafetyInfo.fromJson(Map<String, dynamic> json) =>
      _$SafetyInfoFromJson(json);
}

@freezed
class SeedDetail with _$SeedDetail {
  const factory SeedDetail({
    required String id,
    required SeedType type,
    required String varietyName,
    required String hindiName,
    required String cropName,
    required String company,
    required double pricePerKg,
    required String packagingSize,
    required SeedSpecifications specifications,
    required List<IndianState> suitableStates,
    required List<CropSeason> suitableSeasons,
    required String description,
    required DateTime productionDate,
    required DateTime expiryDate,
    @Default([]) List<String> features,
    @Default([]) List<String> benefits,
  }) = _SeedDetail;

  factory SeedDetail.fromJson(Map<String, dynamic> json) =>
      _$SeedDetailFromJson(json);
}

@freezed
class SeedSpecifications with _$SeedSpecifications {
  const factory SeedSpecifications({
    required double germination,
    required double purity,
    required double moisture,
    required int maturityDays,
    required double yieldPotential,
    required String resistance,
    required String plantHeight,
    required String fruitSize,
    required String specialFeatures,
  }) = _SeedSpecifications;

  factory SeedSpecifications.fromJson(Map<String, dynamic> json) =>
      _$SeedSpecificationsFromJson(json);
}

@freezed
class LivestockDetail with _$LivestockDetail {
  const factory LivestockDetail({
    required String id,
    required LivestockType type,
    required String breed,
    required String hindiName,
    required int quantity,
    required double averageWeight,
    required String age,
    required String healthStatus,
    required FeedingInfo feeding,
    required VaccinationSchedule vaccination,
    required BreedingInfo breeding,
    required ProductionInfo production,
    @Default([]) List<HealthRecord> healthRecords,
    @Default([]) List<ProductionRecord> productionRecords,
  }) = _LivestockDetail;

  factory LivestockDetail.fromJson(Map<String, dynamic> json) =>
      _$LivestockDetailFromJson(json);
}

@freezed
class FeedingInfo with _$FeedingInfo {
  const factory FeedingInfo({
    required List<String> feedTypes,
    required double dailyFeedKg,
    required String feedingSchedule,
    required double waterRequirement,
    required List<String> supplements,
    required double feedCostPerDay,
  }) = _FeedingInfo;

  factory FeedingInfo.fromJson(Map<String, dynamic> json) =>
      _$FeedingInfoFromJson(json);
}

@freezed
class VaccinationSchedule with _$VaccinationSchedule {
  const factory VaccinationSchedule({
    required List<VaccineRecord> vaccines,
    required List<String> deworming,
    required String healthCheckup,
  }) = _VaccinationSchedule;

  factory VaccinationSchedule.fromJson(Map<String, dynamic> json) =>
      _$VaccinationScheduleFromJson(json);
}

@freezed
class VaccineRecord with _$VaccineRecord {
  const factory VaccineRecord({
    required String vaccineName,
    required DateTime date,
    required DateTime nextDue,
    required String veterinarian,
    required double cost,
    required String notes,
  }) = _VaccineRecord;

  factory VaccineRecord.fromJson(Map<String, dynamic> json) =>
      _$VaccineRecordFromJson(json);
}

@freezed
class BreedingInfo with _$BreedingInfo {
  const factory BreedingInfo({
    required String breedingMethod,
    required String gestationPeriod,
    required int averageOffspring,
    required String breedingSeason,
    required double breedingCost,
  }) = _BreedingInfo;

  factory BreedingInfo.fromJson(Map<String, dynamic> json) =>
      _$BreedingInfoFromJson(json);
}

@freezed
class ProductionInfo with _$ProductionInfo {
  const factory ProductionInfo({
    required String productType,
    required double dailyProduction,
    required String unit,
    required double pricePerUnit,
    required String marketDemand,
    required List<String> buyers,
  }) = _ProductionInfo;

  factory ProductionInfo.fromJson(Map<String, dynamic> json) =>
      _$ProductionInfoFromJson(json);
}

@freezed
class HealthRecord with _$HealthRecord {
  const factory HealthRecord({
    required String id,
    required DateTime date,
    required String issue,
    required String treatment,
    required String veterinarian,
    required double cost,
    required String outcome,
    required String notes,
  }) = _HealthRecord;

  factory HealthRecord.fromJson(Map<String, dynamic> json) =>
      _$HealthRecordFromJson(json);
}

@freezed
class ProductionRecord with _$ProductionRecord {
  const factory ProductionRecord({
    required String id,
    required DateTime date,
    required double quantity,
    required String unit,
    required double pricePerUnit,
    required String buyer,
    required double totalRevenue,
    required String quality,
    required String notes,
  }) = _ProductionRecord;

  factory ProductionRecord.fromJson(Map<String, dynamic> json) =>
      _$ProductionRecordFromJson(json);
}

/// Expense management
enum ExpenseCategory {
  seeds,
  fertilizers,
  pesticides,
  irrigation,
  labor,
  machinery,
  fuel,
  electricity,
  transportation,
  storage,
  packaging,
  marketing,
  insurance,
  taxes,
  veterinary,
  feed,
  maintenance,
  miscellaneous,
}

@freezed
class FieldExpense with _$FieldExpense {
  const factory FieldExpense({
    required String id,
    required DateTime date,
    required ExpenseCategory category,
    required String description,
    required double amount,
    required String paymentMethod,
    required String vendor,
    required String receipt,
    required String fieldId,
    @Default([]) List<String> attachments,
    required String notes,
  }) = _FieldExpense;

  factory FieldExpense.fromJson(Map<String, dynamic> json) =>
      _$FieldExpenseFromJson(json);
}

@freezed
class FieldActivity with _$FieldActivity {
  const factory FieldActivity({
    required String id,
    required DateTime date,
    required String activity,
    required String description,
    required double cost,
    required String laborType,
    required int hoursWorked,
    required String equipment,
    required String fieldId,
    required String status,
    required String notes,
  }) = _FieldActivity;

  factory FieldActivity.fromJson(Map<String, dynamic> json) =>
      _$FieldActivityFromJson(json);
}

/// Financial management
@freezed
class FinancialSummary with _$FinancialSummary {
  const factory FinancialSummary({
    required String farmerId,
    required String season,
    required int year,
    required double totalIncome,
    required double totalExpenses,
    required double netProfit,
    required Map<ExpenseCategory, double> categoryWiseExpenses,
    required Map<String, double> cropWiseProfit,
    required List<LoanInfo> loans,
    required List<InsuranceInfo> insurance,
    required TaxInfo taxes,
  }) = _FinancialSummary;

  factory FinancialSummary.fromJson(Map<String, dynamic> json) =>
      _$FinancialSummaryFromJson(json);
}

@freezed
class LoanInfo with _$LoanInfo {
  const factory LoanInfo({
    required String id,
    required String bankName,
    required String loanType,
    required double amount,
    required double interestRate,
    required DateTime disbursalDate,
    required DateTime maturityDate,
    required double emiAmount,
    required double outstandingBalance,
    required String status,
    @Default([]) List<EMIRecord> emiRecords,
  }) = _LoanInfo;

  factory LoanInfo.fromJson(Map<String, dynamic> json) =>
      _$LoanInfoFromJson(json);
}

@freezed
class EMIRecord with _$EMIRecord {
  const factory EMIRecord({
    required DateTime date,
    required double amount,
    required double principal,
    required double interest,
    required String status,
    required String transactionId,
  }) = _EMIRecord;

  factory EMIRecord.fromJson(Map<String, dynamic> json) =>
      _$EMIRecordFromJson(json);
}

@freezed
class InsuranceInfo with _$InsuranceInfo {
  const factory InsuranceInfo({
    required String id,
    required String company,
    required String policyType,
    required String policyNumber,
    required double sumInsured,
    required double premium,
    required DateTime startDate,
    required DateTime endDate,
    required List<String> coverages,
    required String status,
    @Default([]) List<ClaimRecord> claims,
  }) = _InsuranceInfo;

  factory InsuranceInfo.fromJson(Map<String, dynamic> json) =>
      _$InsuranceInfoFromJson(json);
}

@freezed
class ClaimRecord with _$ClaimRecord {
  const factory ClaimRecord({
    required String id,
    required DateTime claimDate,
    required String reason,
    required double claimAmount,
    required double settledAmount,
    required String status,
    required DateTime settlementDate,
    required String notes,
  }) = _ClaimRecord;

  factory ClaimRecord.fromJson(Map<String, dynamic> json) =>
      _$ClaimRecordFromJson(json);
}

@freezed
class TaxInfo with _$TaxInfo {
  const factory TaxInfo({
    required String assessmentYear,
    required double agriculturalIncome,
    required double nonAgriculturalIncome,
    required double totalTax,
    required double tds,
    required String filingStatus,
    required DateTime filingDate,
    required String acknowledgmentNumber,
  }) = _TaxInfo;

  factory TaxInfo.fromJson(Map<String, dynamic> json) =>
      _$TaxInfoFromJson(json);
}
