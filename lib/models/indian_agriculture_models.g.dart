// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'indian_agriculture_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$IndianCropImpl _$$IndianCropImplFromJson(Map<String, dynamic> json) =>
    _$IndianCropImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      hindiName: json['hindiName'] as String,
      scientificName: json['scientificName'] as String,
      category: $enumDecode(_$CropCategoryEnumMap, json['category']),
      suitableStates: (json['suitableStates'] as List<dynamic>)
          .map((e) => $enumDecode(_$IndianStateEnumMap, e))
          .toList(),
      suitableSoils: (json['suitableSoils'] as List<dynamic>)
          .map((e) => $enumDecode(_$SoilTypeEnumMap, e))
          .toList(),
      suitableClimates: (json['suitableClimates'] as List<dynamic>)
          .map((e) => $enumDecode(_$ClimateZoneEnumMap, e))
          .toList(),
      seasons: (json['seasons'] as List<dynamic>)
          .map((e) => $enumDecode(_$CropSeasonEnumMap, e))
          .toList(),
      growthDurationDays: (json['growthDurationDays'] as num).toInt(),
      temperatureMin: (json['temperatureMin'] as num).toDouble(),
      temperatureMax: (json['temperatureMax'] as num).toDouble(),
      rainfallMin: (json['rainfallMin'] as num).toDouble(),
      rainfallMax: (json['rainfallMax'] as num).toDouble(),
      description: json['description'] as String,
      varieties:
          (json['varieties'] as List<dynamic>).map((e) => e as String).toList(),
      manual: CropManual.fromJson(json['manual'] as Map<String, dynamic>),
      diseases:
          (json['diseases'] as List<dynamic>).map((e) => e as String).toList(),
      pests: (json['pests'] as List<dynamic>).map((e) => e as String).toList(),
      marketInfo:
          MarketInfo.fromJson(json['marketInfo'] as Map<String, dynamic>),
      images: (json['images'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$IndianCropImplToJson(_$IndianCropImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'hindiName': instance.hindiName,
      'scientificName': instance.scientificName,
      'category': _$CropCategoryEnumMap[instance.category]!,
      'suitableStates':
          instance.suitableStates.map((e) => _$IndianStateEnumMap[e]!).toList(),
      'suitableSoils':
          instance.suitableSoils.map((e) => _$SoilTypeEnumMap[e]!).toList(),
      'suitableClimates': instance.suitableClimates
          .map((e) => _$ClimateZoneEnumMap[e]!)
          .toList(),
      'seasons': instance.seasons.map((e) => _$CropSeasonEnumMap[e]!).toList(),
      'growthDurationDays': instance.growthDurationDays,
      'temperatureMin': instance.temperatureMin,
      'temperatureMax': instance.temperatureMax,
      'rainfallMin': instance.rainfallMin,
      'rainfallMax': instance.rainfallMax,
      'description': instance.description,
      'varieties': instance.varieties,
      'manual': instance.manual,
      'diseases': instance.diseases,
      'pests': instance.pests,
      'marketInfo': instance.marketInfo,
      'images': instance.images,
    };

const _$CropCategoryEnumMap = {
  CropCategory.cereals: 'cereals',
  CropCategory.pulses: 'pulses',
  CropCategory.oilseeds: 'oilseeds',
  CropCategory.cash: 'cash',
  CropCategory.vegetables: 'vegetables',
  CropCategory.fruits: 'fruits',
  CropCategory.spices: 'spices',
  CropCategory.plantation: 'plantation',
  CropCategory.medicinal: 'medicinal',
  CropCategory.fodder: 'fodder',
};

const _$IndianStateEnumMap = {
  IndianState.andhraPradesh: 'andhraPradesh',
  IndianState.arunachalPradesh: 'arunachalPradesh',
  IndianState.assam: 'assam',
  IndianState.bihar: 'bihar',
  IndianState.chhattisgarh: 'chhattisgarh',
  IndianState.goa: 'goa',
  IndianState.gujarat: 'gujarat',
  IndianState.haryana: 'haryana',
  IndianState.himachalPradesh: 'himachalPradesh',
  IndianState.jharkhand: 'jharkhand',
  IndianState.karnataka: 'karnataka',
  IndianState.kerala: 'kerala',
  IndianState.madhyaPradesh: 'madhyaPradesh',
  IndianState.maharashtra: 'maharashtra',
  IndianState.manipur: 'manipur',
  IndianState.meghalaya: 'meghalaya',
  IndianState.mizoram: 'mizoram',
  IndianState.nagaland: 'nagaland',
  IndianState.odisha: 'odisha',
  IndianState.punjab: 'punjab',
  IndianState.rajasthan: 'rajasthan',
  IndianState.sikkim: 'sikkim',
  IndianState.tamilNadu: 'tamilNadu',
  IndianState.telangana: 'telangana',
  IndianState.tripura: 'tripura',
  IndianState.uttarPradesh: 'uttarPradesh',
  IndianState.uttarakhand: 'uttarakhand',
  IndianState.westBengal: 'westBengal',
  IndianState.andamanNicobar: 'andamanNicobar',
  IndianState.chandigarh: 'chandigarh',
  IndianState.dadraHaveli: 'dadraHaveli',
  IndianState.delhiNct: 'delhiNct',
  IndianState.jammuKashmir: 'jammuKashmir',
  IndianState.ladakh: 'ladakh',
  IndianState.lakshadweep: 'lakshadweep',
  IndianState.puducherry: 'puducherry',
};

const _$SoilTypeEnumMap = {
  SoilType.alluvial: 'alluvial',
  SoilType.blackCotton: 'blackCotton',
  SoilType.red: 'red',
  SoilType.laterite: 'laterite',
  SoilType.desert: 'desert',
  SoilType.mountain: 'mountain',
  SoilType.saline: 'saline',
  SoilType.peaty: 'peaty',
  SoilType.forest: 'forest',
};

const _$ClimateZoneEnumMap = {
  ClimateZone.tropical: 'tropical',
  ClimateZone.subtropical: 'subtropical',
  ClimateZone.temperate: 'temperate',
  ClimateZone.alpine: 'alpine',
  ClimateZone.arid: 'arid',
  ClimateZone.semiArid: 'semiArid',
  ClimateZone.humid: 'humid',
  ClimateZone.subHumid: 'subHumid',
};

const _$CropSeasonEnumMap = {
  CropSeason.kharif: 'kharif',
  CropSeason.rabi: 'rabi',
  CropSeason.zaid: 'zaid',
  CropSeason.perennial: 'perennial',
};

_$CropManualImpl _$$CropManualImplFromJson(Map<String, dynamic> json) =>
    _$CropManualImpl(
      cropId: json['cropId'] as String,
      soilPreparation: SoilPreparation.fromJson(
          json['soilPreparation'] as Map<String, dynamic>),
      seedingInfo:
          SeedingInfo.fromJson(json['seedingInfo'] as Map<String, dynamic>),
      irrigation: IrrigationSchedule.fromJson(
          json['irrigation'] as Map<String, dynamic>),
      fertilizer: FertilizerSchedule.fromJson(
          json['fertilizer'] as Map<String, dynamic>),
      pestManagement: PestManagement.fromJson(
          json['pestManagement'] as Map<String, dynamic>),
      harvesting:
          HarvestingInfo.fromJson(json['harvesting'] as Map<String, dynamic>),
      postHarvest:
          PostHarvestCare.fromJson(json['postHarvest'] as Map<String, dynamic>),
      tips: (json['tips'] as List<dynamic>).map((e) => e as String).toList(),
      warnings:
          (json['warnings'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$CropManualImplToJson(_$CropManualImpl instance) =>
    <String, dynamic>{
      'cropId': instance.cropId,
      'soilPreparation': instance.soilPreparation,
      'seedingInfo': instance.seedingInfo,
      'irrigation': instance.irrigation,
      'fertilizer': instance.fertilizer,
      'pestManagement': instance.pestManagement,
      'harvesting': instance.harvesting,
      'postHarvest': instance.postHarvest,
      'tips': instance.tips,
      'warnings': instance.warnings,
    };

_$SoilPreparationImpl _$$SoilPreparationImplFromJson(
        Map<String, dynamic> json) =>
    _$SoilPreparationImpl(
      steps: (json['steps'] as List<dynamic>).map((e) => e as String).toList(),
      ploughingDepth: json['ploughingDepth'] as String,
      numberOfPloughings: (json['numberOfPloughings'] as num).toInt(),
      tools: (json['tools'] as List<dynamic>).map((e) => e as String).toList(),
      timing: json['timing'] as String,
      soilMoisture: json['soilMoisture'] as String,
    );

Map<String, dynamic> _$$SoilPreparationImplToJson(
        _$SoilPreparationImpl instance) =>
    <String, dynamic>{
      'steps': instance.steps,
      'ploughingDepth': instance.ploughingDepth,
      'numberOfPloughings': instance.numberOfPloughings,
      'tools': instance.tools,
      'timing': instance.timing,
      'soilMoisture': instance.soilMoisture,
    };

_$SeedingInfoImpl _$$SeedingInfoImplFromJson(Map<String, dynamic> json) =>
    _$SeedingInfoImpl(
      seedRate: (json['seedRate'] as num).toDouble(),
      seedRateUnit: json['seedRateUnit'] as String,
      spacingBetweenRows: json['spacingBetweenRows'] as String,
      spacingBetweenPlants: json['spacingBetweenPlants'] as String,
      sowingDepth: json['sowingDepth'] as String,
      sowingMethod: json['sowingMethod'] as String,
      seedTreatment: (json['seedTreatment'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      bestSowingTime: json['bestSowingTime'] as String,
    );

Map<String, dynamic> _$$SeedingInfoImplToJson(_$SeedingInfoImpl instance) =>
    <String, dynamic>{
      'seedRate': instance.seedRate,
      'seedRateUnit': instance.seedRateUnit,
      'spacingBetweenRows': instance.spacingBetweenRows,
      'spacingBetweenPlants': instance.spacingBetweenPlants,
      'sowingDepth': instance.sowingDepth,
      'sowingMethod': instance.sowingMethod,
      'seedTreatment': instance.seedTreatment,
      'bestSowingTime': instance.bestSowingTime,
    };

_$IrrigationScheduleImpl _$$IrrigationScheduleImplFromJson(
        Map<String, dynamic> json) =>
    _$IrrigationScheduleImpl(
      stages: (json['stages'] as List<dynamic>)
          .map((e) => IrrigationStage.fromJson(e as Map<String, dynamic>))
          .toList(),
      method: json['method'] as String,
      totalWaterRequirement: (json['totalWaterRequirement'] as num).toDouble(),
      waterQuality: json['waterQuality'] as String,
      criticalStages: (json['criticalStages'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$IrrigationScheduleImplToJson(
        _$IrrigationScheduleImpl instance) =>
    <String, dynamic>{
      'stages': instance.stages,
      'method': instance.method,
      'totalWaterRequirement': instance.totalWaterRequirement,
      'waterQuality': instance.waterQuality,
      'criticalStages': instance.criticalStages,
    };

_$IrrigationStageImpl _$$IrrigationStageImplFromJson(
        Map<String, dynamic> json) =>
    _$IrrigationStageImpl(
      stage: json['stage'] as String,
      daysAfterSowing: (json['daysAfterSowing'] as num).toInt(),
      waterAmount: (json['waterAmount'] as num).toDouble(),
      frequency: json['frequency'] as String,
      notes: json['notes'] as String,
    );

Map<String, dynamic> _$$IrrigationStageImplToJson(
        _$IrrigationStageImpl instance) =>
    <String, dynamic>{
      'stage': instance.stage,
      'daysAfterSowing': instance.daysAfterSowing,
      'waterAmount': instance.waterAmount,
      'frequency': instance.frequency,
      'notes': instance.notes,
    };

_$FertilizerScheduleImpl _$$FertilizerScheduleImplFromJson(
        Map<String, dynamic> json) =>
    _$FertilizerScheduleImpl(
      applications: (json['applications'] as List<dynamic>)
          .map((e) => FertilizerApplication.fromJson(e as Map<String, dynamic>))
          .toList(),
      organic:
          OrganicFertilizers.fromJson(json['organic'] as Map<String, dynamic>),
      micronutrients: (json['micronutrients'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      soilTesting: json['soilTesting'] as String,
    );

Map<String, dynamic> _$$FertilizerScheduleImplToJson(
        _$FertilizerScheduleImpl instance) =>
    <String, dynamic>{
      'applications': instance.applications,
      'organic': instance.organic,
      'micronutrients': instance.micronutrients,
      'soilTesting': instance.soilTesting,
    };

_$FertilizerApplicationImpl _$$FertilizerApplicationImplFromJson(
        Map<String, dynamic> json) =>
    _$FertilizerApplicationImpl(
      stage: json['stage'] as String,
      daysAfterSowing: (json['daysAfterSowing'] as num).toInt(),
      npkRatio: json['npkRatio'] as String,
      quantity: (json['quantity'] as num).toDouble(),
      unit: json['unit'] as String,
      method: json['method'] as String,
      notes: json['notes'] as String,
    );

Map<String, dynamic> _$$FertilizerApplicationImplToJson(
        _$FertilizerApplicationImpl instance) =>
    <String, dynamic>{
      'stage': instance.stage,
      'daysAfterSowing': instance.daysAfterSowing,
      'npkRatio': instance.npkRatio,
      'quantity': instance.quantity,
      'unit': instance.unit,
      'method': instance.method,
      'notes': instance.notes,
    };

_$OrganicFertilizersImpl _$$OrganicFertilizersImplFromJson(
        Map<String, dynamic> json) =>
    _$OrganicFertilizersImpl(
      farmyardManure: json['farmyardManure'] as String,
      compost: json['compost'] as String,
      vermicompost: json['vermicompost'] as String,
      greenManure: json['greenManure'] as String,
      biofertilizers: (json['biofertilizers'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$OrganicFertilizersImplToJson(
        _$OrganicFertilizersImpl instance) =>
    <String, dynamic>{
      'farmyardManure': instance.farmyardManure,
      'compost': instance.compost,
      'vermicompost': instance.vermicompost,
      'greenManure': instance.greenManure,
      'biofertilizers': instance.biofertilizers,
    };

_$PestManagementImpl _$$PestManagementImplFromJson(Map<String, dynamic> json) =>
    _$PestManagementImpl(
      pests: (json['pests'] as List<dynamic>)
          .map((e) => CommonPest.fromJson(e as Map<String, dynamic>))
          .toList(),
      diseases: (json['diseases'] as List<dynamic>)
          .map((e) => CommonDisease.fromJson(e as Map<String, dynamic>))
          .toList(),
      ipm: IntegratedPestManagement.fromJson(
          json['ipm'] as Map<String, dynamic>),
      organicSolutions: (json['organicSolutions'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      chemicalSolutions: (json['chemicalSolutions'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$PestManagementImplToJson(
        _$PestManagementImpl instance) =>
    <String, dynamic>{
      'pests': instance.pests,
      'diseases': instance.diseases,
      'ipm': instance.ipm,
      'organicSolutions': instance.organicSolutions,
      'chemicalSolutions': instance.chemicalSolutions,
    };

_$CommonPestImpl _$$CommonPestImplFromJson(Map<String, dynamic> json) =>
    _$CommonPestImpl(
      name: json['name'] as String,
      hindiName: json['hindiName'] as String,
      scientificName: json['scientificName'] as String,
      description: json['description'] as String,
      symptoms:
          (json['symptoms'] as List<dynamic>).map((e) => e as String).toList(),
      control:
          (json['control'] as List<dynamic>).map((e) => e as String).toList(),
      severity: json['severity'] as String,
    );

Map<String, dynamic> _$$CommonPestImplToJson(_$CommonPestImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'hindiName': instance.hindiName,
      'scientificName': instance.scientificName,
      'description': instance.description,
      'symptoms': instance.symptoms,
      'control': instance.control,
      'severity': instance.severity,
    };

_$CommonDiseaseImpl _$$CommonDiseaseImplFromJson(Map<String, dynamic> json) =>
    _$CommonDiseaseImpl(
      name: json['name'] as String,
      hindiName: json['hindiName'] as String,
      scientificName: json['scientificName'] as String,
      type: json['type'] as String,
      symptoms:
          (json['symptoms'] as List<dynamic>).map((e) => e as String).toList(),
      prevention: (json['prevention'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      treatment:
          (json['treatment'] as List<dynamic>).map((e) => e as String).toList(),
      severity: json['severity'] as String,
    );

Map<String, dynamic> _$$CommonDiseaseImplToJson(_$CommonDiseaseImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'hindiName': instance.hindiName,
      'scientificName': instance.scientificName,
      'type': instance.type,
      'symptoms': instance.symptoms,
      'prevention': instance.prevention,
      'treatment': instance.treatment,
      'severity': instance.severity,
    };

_$IntegratedPestManagementImpl _$$IntegratedPestManagementImplFromJson(
        Map<String, dynamic> json) =>
    _$IntegratedPestManagementImpl(
      cultural:
          (json['cultural'] as List<dynamic>).map((e) => e as String).toList(),
      biological: (json['biological'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      mechanical: (json['mechanical'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      chemical:
          (json['chemical'] as List<dynamic>).map((e) => e as String).toList(),
      monitoring: json['monitoring'] as String,
    );

Map<String, dynamic> _$$IntegratedPestManagementImplToJson(
        _$IntegratedPestManagementImpl instance) =>
    <String, dynamic>{
      'cultural': instance.cultural,
      'biological': instance.biological,
      'mechanical': instance.mechanical,
      'chemical': instance.chemical,
      'monitoring': instance.monitoring,
    };

_$HarvestingInfoImpl _$$HarvestingInfoImplFromJson(Map<String, dynamic> json) =>
    _$HarvestingInfoImpl(
      maturitySigns: (json['maturitySigns'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      harvestingMethod: json['harvestingMethod'] as String,
      bestTime: json['bestTime'] as String,
      weatherConditions: json['weatherConditions'] as String,
      tools: json['tools'] as String,
      expectedYield: (json['expectedYield'] as num).toDouble(),
      yieldUnit: json['yieldUnit'] as String,
    );

Map<String, dynamic> _$$HarvestingInfoImplToJson(
        _$HarvestingInfoImpl instance) =>
    <String, dynamic>{
      'maturitySigns': instance.maturitySigns,
      'harvestingMethod': instance.harvestingMethod,
      'bestTime': instance.bestTime,
      'weatherConditions': instance.weatherConditions,
      'tools': instance.tools,
      'expectedYield': instance.expectedYield,
      'yieldUnit': instance.yieldUnit,
    };

_$PostHarvestCareImpl _$$PostHarvestCareImplFromJson(
        Map<String, dynamic> json) =>
    _$PostHarvestCareImpl(
      processing: (json['processing'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      storage: StorageInfo.fromJson(json['storage'] as Map<String, dynamic>),
      packaging:
          (json['packaging'] as List<dynamic>).map((e) => e as String).toList(),
      transportation: (json['transportation'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      quality:
          QualityStandards.fromJson(json['quality'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PostHarvestCareImplToJson(
        _$PostHarvestCareImpl instance) =>
    <String, dynamic>{
      'processing': instance.processing,
      'storage': instance.storage,
      'packaging': instance.packaging,
      'transportation': instance.transportation,
      'quality': instance.quality,
    };

_$StorageInfoImpl _$$StorageInfoImplFromJson(Map<String, dynamic> json) =>
    _$StorageInfoImpl(
      method: json['method'] as String,
      temperature: json['temperature'] as String,
      humidity: json['humidity'] as String,
      duration: json['duration'] as String,
      precautions: (json['precautions'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$StorageInfoImplToJson(_$StorageInfoImpl instance) =>
    <String, dynamic>{
      'method': instance.method,
      'temperature': instance.temperature,
      'humidity': instance.humidity,
      'duration': instance.duration,
      'precautions': instance.precautions,
    };

_$QualityStandardsImpl _$$QualityStandardsImplFromJson(
        Map<String, dynamic> json) =>
    _$QualityStandardsImpl(
      grades:
          (json['grades'] as List<dynamic>).map((e) => e as String).toList(),
      specifications: (json['specifications'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      certification: json['certification'] as String,
      export:
          (json['export'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$QualityStandardsImplToJson(
        _$QualityStandardsImpl instance) =>
    <String, dynamic>{
      'grades': instance.grades,
      'specifications': instance.specifications,
      'certification': instance.certification,
      'export': instance.export,
    };

_$MarketInfoImpl _$$MarketInfoImplFromJson(Map<String, dynamic> json) =>
    _$MarketInfoImpl(
      currentPrice: (json['currentPrice'] as num).toDouble(),
      priceUnit: json['priceUnit'] as String,
      majorMarkets: (json['majorMarkets'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      demand: json['demand'] as String,
      exportPotential: json['exportPotential'] as String,
      buyers:
          (json['buyers'] as List<dynamic>).map((e) => e as String).toList(),
      priceRange: json['priceRange'] as String,
    );

Map<String, dynamic> _$$MarketInfoImplToJson(_$MarketInfoImpl instance) =>
    <String, dynamic>{
      'currentPrice': instance.currentPrice,
      'priceUnit': instance.priceUnit,
      'majorMarkets': instance.majorMarkets,
      'demand': instance.demand,
      'exportPotential': instance.exportPotential,
      'buyers': instance.buyers,
      'priceRange': instance.priceRange,
    };

_$GovernmentSchemeImpl _$$GovernmentSchemeImplFromJson(
        Map<String, dynamic> json) =>
    _$GovernmentSchemeImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      hindiName: json['hindiName'] as String,
      description: json['description'] as String,
      ministry: json['ministry'] as String,
      benefits:
          (json['benefits'] as List<dynamic>).map((e) => e as String).toList(),
      eligibility: EligibilityCriteria.fromJson(
          json['eligibility'] as Map<String, dynamic>),
      application: ApplicationProcess.fromJson(
          json['application'] as Map<String, dynamic>),
      documents:
          (json['documents'] as List<dynamic>).map((e) => e as String).toList(),
      website: json['website'] as String,
      helpline: json['helpline'] as String,
      isActive: json['isActive'] as bool,
      lastUpdated: DateTime.parse(json['lastUpdated'] as String),
      applicableStates: (json['applicableStates'] as List<dynamic>?)
              ?.map((e) => $enumDecode(_$IndianStateEnumMap, e))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$GovernmentSchemeImplToJson(
        _$GovernmentSchemeImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'hindiName': instance.hindiName,
      'description': instance.description,
      'ministry': instance.ministry,
      'benefits': instance.benefits,
      'eligibility': instance.eligibility,
      'application': instance.application,
      'documents': instance.documents,
      'website': instance.website,
      'helpline': instance.helpline,
      'isActive': instance.isActive,
      'lastUpdated': instance.lastUpdated.toIso8601String(),
      'applicableStates': instance.applicableStates
          .map((e) => _$IndianStateEnumMap[e]!)
          .toList(),
    };

_$EligibilityCriteriaImpl _$$EligibilityCriteriaImplFromJson(
        Map<String, dynamic> json) =>
    _$EligibilityCriteriaImpl(
      landSize: json['landSize'] as String,
      farmerCategory: json['farmerCategory'] as String,
      income: json['income'] as String,
      age: json['age'] as String,
      other: (json['other'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$EligibilityCriteriaImplToJson(
        _$EligibilityCriteriaImpl instance) =>
    <String, dynamic>{
      'landSize': instance.landSize,
      'farmerCategory': instance.farmerCategory,
      'income': instance.income,
      'age': instance.age,
      'other': instance.other,
    };

_$ApplicationProcessImpl _$$ApplicationProcessImplFromJson(
        Map<String, dynamic> json) =>
    _$ApplicationProcessImpl(
      steps: (json['steps'] as List<dynamic>).map((e) => e as String).toList(),
      mode: json['mode'] as String,
      timeline: json['timeline'] as String,
      fee: json['fee'] as String,
      offices:
          (json['offices'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$ApplicationProcessImplToJson(
        _$ApplicationProcessImpl instance) =>
    <String, dynamic>{
      'steps': instance.steps,
      'mode': instance.mode,
      'timeline': instance.timeline,
      'fee': instance.fee,
      'offices': instance.offices,
    };

_$FarmingNewsImpl _$$FarmingNewsImplFromJson(Map<String, dynamic> json) =>
    _$FarmingNewsImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      hindiTitle: json['hindiTitle'] as String,
      content: json['content'] as String,
      summary: json['summary'] as String,
      category: json['category'] as String,
      source: json['source'] as String,
      publishedAt: DateTime.parse(json['publishedAt'] as String),
      tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
      imageUrl: json['imageUrl'] as String,
      isPinned: json['isPinned'] as bool,
      priority: (json['priority'] as num).toInt(),
    );

Map<String, dynamic> _$$FarmingNewsImplToJson(_$FarmingNewsImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'hindiTitle': instance.hindiTitle,
      'content': instance.content,
      'summary': instance.summary,
      'category': instance.category,
      'source': instance.source,
      'publishedAt': instance.publishedAt.toIso8601String(),
      'tags': instance.tags,
      'imageUrl': instance.imageUrl,
      'isPinned': instance.isPinned,
      'priority': instance.priority,
    };

_$FarmerProfileImpl _$$FarmerProfileImplFromJson(Map<String, dynamic> json) =>
    _$FarmerProfileImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      phoneNumber: json['phoneNumber'] as String,
      email: json['email'] as String,
      state: $enumDecode(_$IndianStateEnumMap, json['state']),
      district: json['district'] as String,
      village: json['village'] as String,
      farmDetails:
          FarmDetails.fromJson(json['farmDetails'] as Map<String, dynamic>),
      preferredCrops: (json['preferredCrops'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      language: json['language'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      lastLogin: DateTime.parse(json['lastLogin'] as String),
      isVerified: json['isVerified'] as bool? ?? false,
    );

Map<String, dynamic> _$$FarmerProfileImplToJson(_$FarmerProfileImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'phoneNumber': instance.phoneNumber,
      'email': instance.email,
      'state': _$IndianStateEnumMap[instance.state]!,
      'district': instance.district,
      'village': instance.village,
      'farmDetails': instance.farmDetails,
      'preferredCrops': instance.preferredCrops,
      'language': instance.language,
      'createdAt': instance.createdAt.toIso8601String(),
      'lastLogin': instance.lastLogin.toIso8601String(),
      'isVerified': instance.isVerified,
    };

_$FarmDetailsImpl _$$FarmDetailsImplFromJson(Map<String, dynamic> json) =>
    _$FarmDetailsImpl(
      totalArea: (json['totalArea'] as num).toDouble(),
      areaUnit: json['areaUnit'] as String,
      soilTypes: (json['soilTypes'] as List<dynamic>)
          .map((e) => $enumDecode(_$SoilTypeEnumMap, e))
          .toList(),
      climateZone: $enumDecode(_$ClimateZoneEnumMap, json['climateZone']),
      waterSource: json['waterSource'] as String,
      irrigationType: json['irrigationType'] as String,
      fields: (json['fields'] as List<dynamic>)
          .map((e) => CropField.fromJson(e as Map<String, dynamic>))
          .toList(),
      equipment:
          (json['equipment'] as List<dynamic>).map((e) => e as String).toList(),
      farmingType: json['farmingType'] as String,
    );

Map<String, dynamic> _$$FarmDetailsImplToJson(_$FarmDetailsImpl instance) =>
    <String, dynamic>{
      'totalArea': instance.totalArea,
      'areaUnit': instance.areaUnit,
      'soilTypes':
          instance.soilTypes.map((e) => _$SoilTypeEnumMap[e]!).toList(),
      'climateZone': _$ClimateZoneEnumMap[instance.climateZone]!,
      'waterSource': instance.waterSource,
      'irrigationType': instance.irrigationType,
      'fields': instance.fields,
      'equipment': instance.equipment,
      'farmingType': instance.farmingType,
    };

_$CropFieldImpl _$$CropFieldImplFromJson(Map<String, dynamic> json) =>
    _$CropFieldImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      area: (json['area'] as num).toDouble(),
      soilType: $enumDecode(_$SoilTypeEnumMap, json['soilType']),
      currentCrop: json['currentCrop'] as String,
      season: $enumDecode(_$CropSeasonEnumMap, json['season']),
      plantingDate: DateTime.parse(json['plantingDate'] as String),
      expectedHarvest: DateTime.parse(json['expectedHarvest'] as String),
      status: json['status'] as String,
      notes:
          (json['notes'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              const [],
      expenses: (json['expenses'] as List<dynamic>?)
              ?.map((e) => FieldExpense.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      activities: (json['activities'] as List<dynamic>?)
              ?.map((e) => FieldActivity.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$CropFieldImplToJson(_$CropFieldImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'area': instance.area,
      'soilType': _$SoilTypeEnumMap[instance.soilType]!,
      'currentCrop': instance.currentCrop,
      'season': _$CropSeasonEnumMap[instance.season]!,
      'plantingDate': instance.plantingDate.toIso8601String(),
      'expectedHarvest': instance.expectedHarvest.toIso8601String(),
      'status': instance.status,
      'notes': instance.notes,
      'expenses': instance.expenses,
      'activities': instance.activities,
    };

_$FarmInstrumentDetailImpl _$$FarmInstrumentDetailImplFromJson(
        Map<String, dynamic> json) =>
    _$FarmInstrumentDetailImpl(
      id: json['id'] as String,
      type: $enumDecode(_$FarmInstrumentEnumMap, json['type']),
      name: json['name'] as String,
      hindiName: json['hindiName'] as String,
      description: json['description'] as String,
      brand: json['brand'] as String,
      model: json['model'] as String,
      purchasePrice: (json['purchasePrice'] as num).toDouble(),
      purchaseDate: DateTime.parse(json['purchaseDate'] as String),
      condition: json['condition'] as String,
      maintenance:
          MaintenanceInfo.fromJson(json['maintenance'] as Map<String, dynamic>),
      suitableCrops: (json['suitableCrops'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      features:
          (json['features'] as List<dynamic>).map((e) => e as String).toList(),
      powerSource: json['powerSource'] as String,
      size: json['size'] as String,
      maintenanceHistory: (json['maintenanceHistory'] as List<dynamic>?)
              ?.map(
                  (e) => MaintenanceRecord.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      usageHistory: (json['usageHistory'] as List<dynamic>?)
              ?.map((e) => UsageRecord.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$FarmInstrumentDetailImplToJson(
        _$FarmInstrumentDetailImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': _$FarmInstrumentEnumMap[instance.type]!,
      'name': instance.name,
      'hindiName': instance.hindiName,
      'description': instance.description,
      'brand': instance.brand,
      'model': instance.model,
      'purchasePrice': instance.purchasePrice,
      'purchaseDate': instance.purchaseDate.toIso8601String(),
      'condition': instance.condition,
      'maintenance': instance.maintenance,
      'suitableCrops': instance.suitableCrops,
      'features': instance.features,
      'powerSource': instance.powerSource,
      'size': instance.size,
      'maintenanceHistory': instance.maintenanceHistory,
      'usageHistory': instance.usageHistory,
    };

const _$FarmInstrumentEnumMap = {
  FarmInstrument.plough: 'plough',
  FarmInstrument.harrow: 'harrow',
  FarmInstrument.cultivator: 'cultivator',
  FarmInstrument.rotavator: 'rotavator',
  FarmInstrument.subsoiler: 'subsoiler',
  FarmInstrument.puddler: 'puddler',
  FarmInstrument.seedDrill: 'seedDrill',
  FarmInstrument.planter: 'planter',
  FarmInstrument.transplanter: 'transplanter',
  FarmInstrument.dibbler: 'dibbler',
  FarmInstrument.sprinklerSystem: 'sprinklerSystem',
  FarmInstrument.dripIrrigation: 'dripIrrigation',
  FarmInstrument.channelIrrigation: 'channelIrrigation',
  FarmInstrument.pump: 'pump',
  FarmInstrument.tubewell: 'tubewell',
  FarmInstrument.waterMotor: 'waterMotor',
  FarmInstrument.harvester: 'harvester',
  FarmInstrument.reaper: 'reaper',
  FarmInstrument.thresher: 'thresher',
  FarmInstrument.combine: 'combine',
  FarmInstrument.windrower: 'windrower',
  FarmInstrument.mill: 'mill',
  FarmInstrument.cleaner: 'cleaner',
  FarmInstrument.grader: 'grader',
  FarmInstrument.dryer: 'dryer',
  FarmInstrument.tractor: 'tractor',
  FarmInstrument.trolley: 'trolley',
  FarmInstrument.cart: 'cart',
  FarmInstrument.khurpi: 'khurpi',
  FarmInstrument.sickle: 'sickle',
  FarmInstrument.spade: 'spade',
  FarmInstrument.hoe: 'hoe',
  FarmInstrument.rake: 'rake',
  FarmInstrument.pruningShears: 'pruningShears',
  FarmInstrument.drone: 'drone',
  FarmInstrument.soilTester: 'soilTester',
  FarmInstrument.weatherStation: 'weatherStation',
  FarmInstrument.gpsTracker: 'gpsTracker',
  FarmInstrument.milkingMachine: 'milkingMachine',
  FarmInstrument.fodderCutter: 'fodderCutter',
  FarmInstrument.chaff: 'chaff',
  FarmInstrument.silo: 'silo',
  FarmInstrument.warehouse: 'warehouse',
  FarmInstrument.coldStorage: 'coldStorage',
  FarmInstrument.generator: 'generator',
  FarmInstrument.solarPanel: 'solarPanel',
  FarmInstrument.biogas: 'biogas',
};

_$MaintenanceInfoImpl _$$MaintenanceInfoImplFromJson(
        Map<String, dynamic> json) =>
    _$MaintenanceInfoImpl(
      frequency: json['frequency'] as String,
      checklist:
          (json['checklist'] as List<dynamic>).map((e) => e as String).toList(),
      estimatedCost: (json['estimatedCost'] as num).toDouble(),
      lastMaintenance: DateTime.parse(json['lastMaintenance'] as String),
      nextMaintenance: DateTime.parse(json['nextMaintenance'] as String),
      commonIssues: (json['commonIssues'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      spareParts: (json['spareParts'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$MaintenanceInfoImplToJson(
        _$MaintenanceInfoImpl instance) =>
    <String, dynamic>{
      'frequency': instance.frequency,
      'checklist': instance.checklist,
      'estimatedCost': instance.estimatedCost,
      'lastMaintenance': instance.lastMaintenance.toIso8601String(),
      'nextMaintenance': instance.nextMaintenance.toIso8601String(),
      'commonIssues': instance.commonIssues,
      'spareParts': instance.spareParts,
    };

_$MaintenanceRecordImpl _$$MaintenanceRecordImplFromJson(
        Map<String, dynamic> json) =>
    _$MaintenanceRecordImpl(
      id: json['id'] as String,
      date: DateTime.parse(json['date'] as String),
      type: json['type'] as String,
      description: json['description'] as String,
      cost: (json['cost'] as num).toDouble(),
      serviceProvider: json['serviceProvider'] as String,
      partsReplaced: (json['partsReplaced'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      notes: json['notes'] as String,
    );

Map<String, dynamic> _$$MaintenanceRecordImplToJson(
        _$MaintenanceRecordImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'date': instance.date.toIso8601String(),
      'type': instance.type,
      'description': instance.description,
      'cost': instance.cost,
      'serviceProvider': instance.serviceProvider,
      'partsReplaced': instance.partsReplaced,
      'notes': instance.notes,
    };

_$UsageRecordImpl _$$UsageRecordImplFromJson(Map<String, dynamic> json) =>
    _$UsageRecordImpl(
      id: json['id'] as String,
      date: DateTime.parse(json['date'] as String),
      fieldId: json['fieldId'] as String,
      operation: json['operation'] as String,
      hoursUsed: (json['hoursUsed'] as num).toDouble(),
      fuelConsumed: (json['fuelConsumed'] as num).toDouble(),
      operator: json['operator'] as String,
      notes: json['notes'] as String,
    );

Map<String, dynamic> _$$UsageRecordImplToJson(_$UsageRecordImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'date': instance.date.toIso8601String(),
      'fieldId': instance.fieldId,
      'operation': instance.operation,
      'hoursUsed': instance.hoursUsed,
      'fuelConsumed': instance.fuelConsumed,
      'operator': instance.operator,
      'notes': instance.notes,
    };

_$FertilizerDetailImpl _$$FertilizerDetailImplFromJson(
        Map<String, dynamic> json) =>
    _$FertilizerDetailImpl(
      id: json['id'] as String,
      type: $enumDecode(_$FertilizerTypeEnumMap, json['type']),
      name: json['name'] as String,
      hindiName: json['hindiName'] as String,
      brand: json['brand'] as String,
      composition: json['composition'] as String,
      pricePerKg: (json['pricePerKg'] as num).toDouble(),
      packagingSize: json['packagingSize'] as String,
      application: ApplicationMethod.fromJson(
          json['application'] as Map<String, dynamic>),
      suitableCrops: (json['suitableCrops'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      suitableSeasons: (json['suitableSeasons'] as List<dynamic>)
          .map((e) => $enumDecode(_$CropSeasonEnumMap, e))
          .toList(),
      storageInstructions: json['storageInstructions'] as String,
      safetyPrecautions: json['safetyPrecautions'] as String,
      manufacturer: json['manufacturer'] as String,
      expiryDate: DateTime.parse(json['expiryDate'] as String),
      benefits: (json['benefits'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      sideEffects: (json['sideEffects'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$FertilizerDetailImplToJson(
        _$FertilizerDetailImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': _$FertilizerTypeEnumMap[instance.type]!,
      'name': instance.name,
      'hindiName': instance.hindiName,
      'brand': instance.brand,
      'composition': instance.composition,
      'pricePerKg': instance.pricePerKg,
      'packagingSize': instance.packagingSize,
      'application': instance.application,
      'suitableCrops': instance.suitableCrops,
      'suitableSeasons':
          instance.suitableSeasons.map((e) => _$CropSeasonEnumMap[e]!).toList(),
      'storageInstructions': instance.storageInstructions,
      'safetyPrecautions': instance.safetyPrecautions,
      'manufacturer': instance.manufacturer,
      'expiryDate': instance.expiryDate.toIso8601String(),
      'benefits': instance.benefits,
      'sideEffects': instance.sideEffects,
    };

const _$FertilizerTypeEnumMap = {
  FertilizerType.urea: 'urea',
  FertilizerType.ammoniumSulphate: 'ammoniumSulphate',
  FertilizerType.calciumAmmoniumNitrate: 'calciumAmmoniumNitrate',
  FertilizerType.ammoniumChloride: 'ammoniumChloride',
  FertilizerType.singleSuperPhosphate: 'singleSuperPhosphate',
  FertilizerType.tripleSuper: 'tripleSuper',
  FertilizerType.diammoniumPhosphate: 'diammoniumPhosphate',
  FertilizerType.monoammoniumPhosphate: 'monoammoniumPhosphate',
  FertilizerType.muriatePotash: 'muriatePotash',
  FertilizerType.sulphatePotash: 'sulphatePotash',
  FertilizerType.npk101010: 'npk101010',
  FertilizerType.npk121212: 'npk121212',
  FertilizerType.npk141414: 'npk141414',
  FertilizerType.npk151515: 'npk151515',
  FertilizerType.npk171717: 'npk171717',
  FertilizerType.npk192323: 'npk192323',
  FertilizerType.npk201020: 'npk201020',
  FertilizerType.farmyardManure: 'farmyardManure',
  FertilizerType.compost: 'compost',
  FertilizerType.vermicompost: 'vermicompost',
  FertilizerType.greenManure: 'greenManure',
  FertilizerType.bioFertilizer: 'bioFertilizer',
  FertilizerType.neemCake: 'neemCake',
  FertilizerType.boneMeal: 'boneMeal',
  FertilizerType.zinc: 'zinc',
  FertilizerType.iron: 'iron',
  FertilizerType.manganese: 'manganese',
  FertilizerType.copper: 'copper',
  FertilizerType.boron: 'boron',
  FertilizerType.molybdenum: 'molybdenum',
  FertilizerType.rhizobium: 'rhizobium',
  FertilizerType.azotobacter: 'azotobacter',
  FertilizerType.psb: 'psb',
  FertilizerType.vam: 'vam',
};

_$ApplicationMethodImpl _$$ApplicationMethodImplFromJson(
        Map<String, dynamic> json) =>
    _$ApplicationMethodImpl(
      method: json['method'] as String,
      dosage: json['dosage'] as String,
      timing: json['timing'] as String,
      frequency: json['frequency'] as String,
      mixingInstructions: (json['mixingInstructions'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      equipment: json['equipment'] as String,
      waterRequirement: json['waterRequirement'] as String,
    );

Map<String, dynamic> _$$ApplicationMethodImplToJson(
        _$ApplicationMethodImpl instance) =>
    <String, dynamic>{
      'method': instance.method,
      'dosage': instance.dosage,
      'timing': instance.timing,
      'frequency': instance.frequency,
      'mixingInstructions': instance.mixingInstructions,
      'equipment': instance.equipment,
      'waterRequirement': instance.waterRequirement,
    };

_$PesticideDetailImpl _$$PesticideDetailImplFromJson(
        Map<String, dynamic> json) =>
    _$PesticideDetailImpl(
      id: json['id'] as String,
      type: $enumDecode(_$PesticideTypeEnumMap, json['type']),
      name: json['name'] as String,
      hindiName: json['hindiName'] as String,
      activeIngredient: json['activeIngredient'] as String,
      concentration: json['concentration'] as String,
      pricePerLiter: (json['pricePerLiter'] as num).toDouble(),
      targetPests: json['targetPests'] as String,
      targetCrops: (json['targetCrops'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      application: ApplicationMethod.fromJson(
          json['application'] as Map<String, dynamic>),
      safety: SafetyInfo.fromJson(json['safety'] as Map<String, dynamic>),
      manufacturer: json['manufacturer'] as String,
      expiryDate: DateTime.parse(json['expiryDate'] as String),
      registrationNumber: json['registrationNumber'] as String,
      restrictions: (json['restrictions'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$PesticideDetailImplToJson(
        _$PesticideDetailImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': _$PesticideTypeEnumMap[instance.type]!,
      'name': instance.name,
      'hindiName': instance.hindiName,
      'activeIngredient': instance.activeIngredient,
      'concentration': instance.concentration,
      'pricePerLiter': instance.pricePerLiter,
      'targetPests': instance.targetPests,
      'targetCrops': instance.targetCrops,
      'application': instance.application,
      'safety': instance.safety,
      'manufacturer': instance.manufacturer,
      'expiryDate': instance.expiryDate.toIso8601String(),
      'registrationNumber': instance.registrationNumber,
      'restrictions': instance.restrictions,
    };

const _$PesticideTypeEnumMap = {
  PesticideType.organophosphate: 'organophosphate',
  PesticideType.carbamate: 'carbamate',
  PesticideType.pyrethroid: 'pyrethroid',
  PesticideType.neonicotinoid: 'neonicotinoid',
  PesticideType.organochlorine: 'organochlorine',
  PesticideType.copper: 'copper',
  PesticideType.sulfur: 'sulfur',
  PesticideType.triazole: 'triazole',
  PesticideType.strobilurin: 'strobilurin',
  PesticideType.glyphosate: 'glyphosate',
  PesticideType.atrazine: 'atrazine',
  PesticideType.paraquat: 'paraquat',
  PesticideType.neemOil: 'neemOil',
  PesticideType.pyrethrum: 'pyrethrum',
  PesticideType.bacillusThuringiensis: 'bacillusThuringiensis',
  PesticideType.trichoderma: 'trichoderma',
  PesticideType.pheromones: 'pheromones',
  PesticideType.microbial: 'microbial',
  PesticideType.botanical: 'botanical',
};

_$SafetyInfoImpl _$$SafetyInfoImplFromJson(Map<String, dynamic> json) =>
    _$SafetyInfoImpl(
      toxicityClass: json['toxicityClass'] as String,
      precautions: (json['precautions'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      protectiveEquipment: json['protectiveEquipment'] as String,
      firstAid: json['firstAid'] as String,
      environmentalImpact: json['environmentalImpact'] as String,
      preHarvestInterval: (json['preHarvestInterval'] as num).toInt(),
      disposal: json['disposal'] as String,
    );

Map<String, dynamic> _$$SafetyInfoImplToJson(_$SafetyInfoImpl instance) =>
    <String, dynamic>{
      'toxicityClass': instance.toxicityClass,
      'precautions': instance.precautions,
      'protectiveEquipment': instance.protectiveEquipment,
      'firstAid': instance.firstAid,
      'environmentalImpact': instance.environmentalImpact,
      'preHarvestInterval': instance.preHarvestInterval,
      'disposal': instance.disposal,
    };

_$SeedDetailImpl _$$SeedDetailImplFromJson(Map<String, dynamic> json) =>
    _$SeedDetailImpl(
      id: json['id'] as String,
      type: $enumDecode(_$SeedTypeEnumMap, json['type']),
      varietyName: json['varietyName'] as String,
      hindiName: json['hindiName'] as String,
      cropName: json['cropName'] as String,
      company: json['company'] as String,
      pricePerKg: (json['pricePerKg'] as num).toDouble(),
      packagingSize: json['packagingSize'] as String,
      specifications: SeedSpecifications.fromJson(
          json['specifications'] as Map<String, dynamic>),
      suitableStates: (json['suitableStates'] as List<dynamic>)
          .map((e) => $enumDecode(_$IndianStateEnumMap, e))
          .toList(),
      suitableSeasons: (json['suitableSeasons'] as List<dynamic>)
          .map((e) => $enumDecode(_$CropSeasonEnumMap, e))
          .toList(),
      description: json['description'] as String,
      productionDate: DateTime.parse(json['productionDate'] as String),
      expiryDate: DateTime.parse(json['expiryDate'] as String),
      features: (json['features'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      benefits: (json['benefits'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$SeedDetailImplToJson(_$SeedDetailImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': _$SeedTypeEnumMap[instance.type]!,
      'varietyName': instance.varietyName,
      'hindiName': instance.hindiName,
      'cropName': instance.cropName,
      'company': instance.company,
      'pricePerKg': instance.pricePerKg,
      'packagingSize': instance.packagingSize,
      'specifications': instance.specifications,
      'suitableStates':
          instance.suitableStates.map((e) => _$IndianStateEnumMap[e]!).toList(),
      'suitableSeasons':
          instance.suitableSeasons.map((e) => _$CropSeasonEnumMap[e]!).toList(),
      'description': instance.description,
      'productionDate': instance.productionDate.toIso8601String(),
      'expiryDate': instance.expiryDate.toIso8601String(),
      'features': instance.features,
      'benefits': instance.benefits,
    };

const _$SeedTypeEnumMap = {
  SeedType.hybrid: 'hybrid',
  SeedType.openPollinated: 'openPollinated',
  SeedType.geneticallyModified: 'geneticallyModified',
  SeedType.organic: 'organic',
  SeedType.heirloom: 'heirloom',
  SeedType.foundation: 'foundation',
  SeedType.registered: 'registered',
  SeedType.certified: 'certified',
  SeedType.truthfullyLabeled: 'truthfullyLabeled',
  SeedType.raw: 'raw',
  SeedType.treated: 'treated',
  SeedType.pelleted: 'pelleted',
  SeedType.primed: 'primed',
  SeedType.seedlings: 'seedlings',
  SeedType.saplings: 'saplings',
  SeedType.grafts: 'grafts',
  SeedType.cuttings: 'cuttings',
  SeedType.bulbs: 'bulbs',
  SeedType.tubers: 'tubers',
};

_$SeedSpecificationsImpl _$$SeedSpecificationsImplFromJson(
        Map<String, dynamic> json) =>
    _$SeedSpecificationsImpl(
      germination: (json['germination'] as num).toDouble(),
      purity: (json['purity'] as num).toDouble(),
      moisture: (json['moisture'] as num).toDouble(),
      maturityDays: (json['maturityDays'] as num).toInt(),
      yieldPotential: (json['yieldPotential'] as num).toDouble(),
      resistance: json['resistance'] as String,
      plantHeight: json['plantHeight'] as String,
      fruitSize: json['fruitSize'] as String,
      specialFeatures: json['specialFeatures'] as String,
    );

Map<String, dynamic> _$$SeedSpecificationsImplToJson(
        _$SeedSpecificationsImpl instance) =>
    <String, dynamic>{
      'germination': instance.germination,
      'purity': instance.purity,
      'moisture': instance.moisture,
      'maturityDays': instance.maturityDays,
      'yieldPotential': instance.yieldPotential,
      'resistance': instance.resistance,
      'plantHeight': instance.plantHeight,
      'fruitSize': instance.fruitSize,
      'specialFeatures': instance.specialFeatures,
    };

_$LivestockDetailImpl _$$LivestockDetailImplFromJson(
        Map<String, dynamic> json) =>
    _$LivestockDetailImpl(
      id: json['id'] as String,
      type: $enumDecode(_$LivestockTypeEnumMap, json['type']),
      breed: json['breed'] as String,
      hindiName: json['hindiName'] as String,
      quantity: (json['quantity'] as num).toInt(),
      averageWeight: (json['averageWeight'] as num).toDouble(),
      age: json['age'] as String,
      healthStatus: json['healthStatus'] as String,
      feeding: FeedingInfo.fromJson(json['feeding'] as Map<String, dynamic>),
      vaccination: VaccinationSchedule.fromJson(
          json['vaccination'] as Map<String, dynamic>),
      breeding: BreedingInfo.fromJson(json['breeding'] as Map<String, dynamic>),
      production:
          ProductionInfo.fromJson(json['production'] as Map<String, dynamic>),
      healthRecords: (json['healthRecords'] as List<dynamic>?)
              ?.map((e) => HealthRecord.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      productionRecords: (json['productionRecords'] as List<dynamic>?)
              ?.map((e) => ProductionRecord.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$LivestockDetailImplToJson(
        _$LivestockDetailImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': _$LivestockTypeEnumMap[instance.type]!,
      'breed': instance.breed,
      'hindiName': instance.hindiName,
      'quantity': instance.quantity,
      'averageWeight': instance.averageWeight,
      'age': instance.age,
      'healthStatus': instance.healthStatus,
      'feeding': instance.feeding,
      'vaccination': instance.vaccination,
      'breeding': instance.breeding,
      'production': instance.production,
      'healthRecords': instance.healthRecords,
      'productionRecords': instance.productionRecords,
    };

const _$LivestockTypeEnumMap = {
  LivestockType.cow: 'cow',
  LivestockType.buffalo: 'buffalo',
  LivestockType.bull: 'bull',
  LivestockType.goat: 'goat',
  LivestockType.sheep: 'sheep',
  LivestockType.chicken: 'chicken',
  LivestockType.duck: 'duck',
  LivestockType.turkey: 'turkey',
  LivestockType.quail: 'quail',
  LivestockType.pig: 'pig',
  LivestockType.rabbit: 'rabbit',
  LivestockType.fish: 'fish',
  LivestockType.bee: 'bee',
  LivestockType.silkworm: 'silkworm',
};

_$FeedingInfoImpl _$$FeedingInfoImplFromJson(Map<String, dynamic> json) =>
    _$FeedingInfoImpl(
      feedTypes:
          (json['feedTypes'] as List<dynamic>).map((e) => e as String).toList(),
      dailyFeedKg: (json['dailyFeedKg'] as num).toDouble(),
      feedingSchedule: json['feedingSchedule'] as String,
      waterRequirement: (json['waterRequirement'] as num).toDouble(),
      supplements: (json['supplements'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      feedCostPerDay: (json['feedCostPerDay'] as num).toDouble(),
    );

Map<String, dynamic> _$$FeedingInfoImplToJson(_$FeedingInfoImpl instance) =>
    <String, dynamic>{
      'feedTypes': instance.feedTypes,
      'dailyFeedKg': instance.dailyFeedKg,
      'feedingSchedule': instance.feedingSchedule,
      'waterRequirement': instance.waterRequirement,
      'supplements': instance.supplements,
      'feedCostPerDay': instance.feedCostPerDay,
    };

_$VaccinationScheduleImpl _$$VaccinationScheduleImplFromJson(
        Map<String, dynamic> json) =>
    _$VaccinationScheduleImpl(
      vaccines: (json['vaccines'] as List<dynamic>)
          .map((e) => VaccineRecord.fromJson(e as Map<String, dynamic>))
          .toList(),
      deworming:
          (json['deworming'] as List<dynamic>).map((e) => e as String).toList(),
      healthCheckup: json['healthCheckup'] as String,
    );

Map<String, dynamic> _$$VaccinationScheduleImplToJson(
        _$VaccinationScheduleImpl instance) =>
    <String, dynamic>{
      'vaccines': instance.vaccines,
      'deworming': instance.deworming,
      'healthCheckup': instance.healthCheckup,
    };

_$VaccineRecordImpl _$$VaccineRecordImplFromJson(Map<String, dynamic> json) =>
    _$VaccineRecordImpl(
      vaccineName: json['vaccineName'] as String,
      date: DateTime.parse(json['date'] as String),
      nextDue: DateTime.parse(json['nextDue'] as String),
      veterinarian: json['veterinarian'] as String,
      cost: (json['cost'] as num).toDouble(),
      notes: json['notes'] as String,
    );

Map<String, dynamic> _$$VaccineRecordImplToJson(_$VaccineRecordImpl instance) =>
    <String, dynamic>{
      'vaccineName': instance.vaccineName,
      'date': instance.date.toIso8601String(),
      'nextDue': instance.nextDue.toIso8601String(),
      'veterinarian': instance.veterinarian,
      'cost': instance.cost,
      'notes': instance.notes,
    };

_$BreedingInfoImpl _$$BreedingInfoImplFromJson(Map<String, dynamic> json) =>
    _$BreedingInfoImpl(
      breedingMethod: json['breedingMethod'] as String,
      gestationPeriod: json['gestationPeriod'] as String,
      averageOffspring: (json['averageOffspring'] as num).toInt(),
      breedingSeason: json['breedingSeason'] as String,
      breedingCost: (json['breedingCost'] as num).toDouble(),
    );

Map<String, dynamic> _$$BreedingInfoImplToJson(_$BreedingInfoImpl instance) =>
    <String, dynamic>{
      'breedingMethod': instance.breedingMethod,
      'gestationPeriod': instance.gestationPeriod,
      'averageOffspring': instance.averageOffspring,
      'breedingSeason': instance.breedingSeason,
      'breedingCost': instance.breedingCost,
    };

_$ProductionInfoImpl _$$ProductionInfoImplFromJson(Map<String, dynamic> json) =>
    _$ProductionInfoImpl(
      productType: json['productType'] as String,
      dailyProduction: (json['dailyProduction'] as num).toDouble(),
      unit: json['unit'] as String,
      pricePerUnit: (json['pricePerUnit'] as num).toDouble(),
      marketDemand: json['marketDemand'] as String,
      buyers:
          (json['buyers'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$ProductionInfoImplToJson(
        _$ProductionInfoImpl instance) =>
    <String, dynamic>{
      'productType': instance.productType,
      'dailyProduction': instance.dailyProduction,
      'unit': instance.unit,
      'pricePerUnit': instance.pricePerUnit,
      'marketDemand': instance.marketDemand,
      'buyers': instance.buyers,
    };

_$HealthRecordImpl _$$HealthRecordImplFromJson(Map<String, dynamic> json) =>
    _$HealthRecordImpl(
      id: json['id'] as String,
      date: DateTime.parse(json['date'] as String),
      issue: json['issue'] as String,
      treatment: json['treatment'] as String,
      veterinarian: json['veterinarian'] as String,
      cost: (json['cost'] as num).toDouble(),
      outcome: json['outcome'] as String,
      notes: json['notes'] as String,
    );

Map<String, dynamic> _$$HealthRecordImplToJson(_$HealthRecordImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'date': instance.date.toIso8601String(),
      'issue': instance.issue,
      'treatment': instance.treatment,
      'veterinarian': instance.veterinarian,
      'cost': instance.cost,
      'outcome': instance.outcome,
      'notes': instance.notes,
    };

_$ProductionRecordImpl _$$ProductionRecordImplFromJson(
        Map<String, dynamic> json) =>
    _$ProductionRecordImpl(
      id: json['id'] as String,
      date: DateTime.parse(json['date'] as String),
      quantity: (json['quantity'] as num).toDouble(),
      unit: json['unit'] as String,
      pricePerUnit: (json['pricePerUnit'] as num).toDouble(),
      buyer: json['buyer'] as String,
      totalRevenue: (json['totalRevenue'] as num).toDouble(),
      quality: json['quality'] as String,
      notes: json['notes'] as String,
    );

Map<String, dynamic> _$$ProductionRecordImplToJson(
        _$ProductionRecordImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'date': instance.date.toIso8601String(),
      'quantity': instance.quantity,
      'unit': instance.unit,
      'pricePerUnit': instance.pricePerUnit,
      'buyer': instance.buyer,
      'totalRevenue': instance.totalRevenue,
      'quality': instance.quality,
      'notes': instance.notes,
    };

_$FieldExpenseImpl _$$FieldExpenseImplFromJson(Map<String, dynamic> json) =>
    _$FieldExpenseImpl(
      id: json['id'] as String,
      date: DateTime.parse(json['date'] as String),
      category: $enumDecode(_$ExpenseCategoryEnumMap, json['category']),
      description: json['description'] as String,
      amount: (json['amount'] as num).toDouble(),
      paymentMethod: json['paymentMethod'] as String,
      vendor: json['vendor'] as String,
      receipt: json['receipt'] as String,
      fieldId: json['fieldId'] as String,
      attachments: (json['attachments'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      notes: json['notes'] as String,
    );

Map<String, dynamic> _$$FieldExpenseImplToJson(_$FieldExpenseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'date': instance.date.toIso8601String(),
      'category': _$ExpenseCategoryEnumMap[instance.category]!,
      'description': instance.description,
      'amount': instance.amount,
      'paymentMethod': instance.paymentMethod,
      'vendor': instance.vendor,
      'receipt': instance.receipt,
      'fieldId': instance.fieldId,
      'attachments': instance.attachments,
      'notes': instance.notes,
    };

const _$ExpenseCategoryEnumMap = {
  ExpenseCategory.seeds: 'seeds',
  ExpenseCategory.fertilizers: 'fertilizers',
  ExpenseCategory.pesticides: 'pesticides',
  ExpenseCategory.irrigation: 'irrigation',
  ExpenseCategory.labor: 'labor',
  ExpenseCategory.machinery: 'machinery',
  ExpenseCategory.fuel: 'fuel',
  ExpenseCategory.electricity: 'electricity',
  ExpenseCategory.transportation: 'transportation',
  ExpenseCategory.storage: 'storage',
  ExpenseCategory.packaging: 'packaging',
  ExpenseCategory.marketing: 'marketing',
  ExpenseCategory.insurance: 'insurance',
  ExpenseCategory.taxes: 'taxes',
  ExpenseCategory.veterinary: 'veterinary',
  ExpenseCategory.feed: 'feed',
  ExpenseCategory.maintenance: 'maintenance',
  ExpenseCategory.miscellaneous: 'miscellaneous',
};

_$FieldActivityImpl _$$FieldActivityImplFromJson(Map<String, dynamic> json) =>
    _$FieldActivityImpl(
      id: json['id'] as String,
      date: DateTime.parse(json['date'] as String),
      activity: json['activity'] as String,
      description: json['description'] as String,
      cost: (json['cost'] as num).toDouble(),
      laborType: json['laborType'] as String,
      hoursWorked: (json['hoursWorked'] as num).toInt(),
      equipment: json['equipment'] as String,
      fieldId: json['fieldId'] as String,
      status: json['status'] as String,
      notes: json['notes'] as String,
    );

Map<String, dynamic> _$$FieldActivityImplToJson(_$FieldActivityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'date': instance.date.toIso8601String(),
      'activity': instance.activity,
      'description': instance.description,
      'cost': instance.cost,
      'laborType': instance.laborType,
      'hoursWorked': instance.hoursWorked,
      'equipment': instance.equipment,
      'fieldId': instance.fieldId,
      'status': instance.status,
      'notes': instance.notes,
    };

_$FinancialSummaryImpl _$$FinancialSummaryImplFromJson(
        Map<String, dynamic> json) =>
    _$FinancialSummaryImpl(
      farmerId: json['farmerId'] as String,
      season: json['season'] as String,
      year: (json['year'] as num).toInt(),
      totalIncome: (json['totalIncome'] as num).toDouble(),
      totalExpenses: (json['totalExpenses'] as num).toDouble(),
      netProfit: (json['netProfit'] as num).toDouble(),
      categoryWiseExpenses:
          (json['categoryWiseExpenses'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(
            $enumDecode(_$ExpenseCategoryEnumMap, k), (e as num).toDouble()),
      ),
      cropWiseProfit: (json['cropWiseProfit'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, (e as num).toDouble()),
      ),
      loans: (json['loans'] as List<dynamic>)
          .map((e) => LoanInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      insurance: (json['insurance'] as List<dynamic>)
          .map((e) => InsuranceInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      taxes: TaxInfo.fromJson(json['taxes'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$FinancialSummaryImplToJson(
        _$FinancialSummaryImpl instance) =>
    <String, dynamic>{
      'farmerId': instance.farmerId,
      'season': instance.season,
      'year': instance.year,
      'totalIncome': instance.totalIncome,
      'totalExpenses': instance.totalExpenses,
      'netProfit': instance.netProfit,
      'categoryWiseExpenses': instance.categoryWiseExpenses
          .map((k, e) => MapEntry(_$ExpenseCategoryEnumMap[k]!, e)),
      'cropWiseProfit': instance.cropWiseProfit,
      'loans': instance.loans,
      'insurance': instance.insurance,
      'taxes': instance.taxes,
    };

_$LoanInfoImpl _$$LoanInfoImplFromJson(Map<String, dynamic> json) =>
    _$LoanInfoImpl(
      id: json['id'] as String,
      bankName: json['bankName'] as String,
      loanType: json['loanType'] as String,
      amount: (json['amount'] as num).toDouble(),
      interestRate: (json['interestRate'] as num).toDouble(),
      disbursalDate: DateTime.parse(json['disbursalDate'] as String),
      maturityDate: DateTime.parse(json['maturityDate'] as String),
      emiAmount: (json['emiAmount'] as num).toDouble(),
      outstandingBalance: (json['outstandingBalance'] as num).toDouble(),
      status: json['status'] as String,
      emiRecords: (json['emiRecords'] as List<dynamic>?)
              ?.map((e) => EMIRecord.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$LoanInfoImplToJson(_$LoanInfoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'bankName': instance.bankName,
      'loanType': instance.loanType,
      'amount': instance.amount,
      'interestRate': instance.interestRate,
      'disbursalDate': instance.disbursalDate.toIso8601String(),
      'maturityDate': instance.maturityDate.toIso8601String(),
      'emiAmount': instance.emiAmount,
      'outstandingBalance': instance.outstandingBalance,
      'status': instance.status,
      'emiRecords': instance.emiRecords,
    };

_$EMIRecordImpl _$$EMIRecordImplFromJson(Map<String, dynamic> json) =>
    _$EMIRecordImpl(
      date: DateTime.parse(json['date'] as String),
      amount: (json['amount'] as num).toDouble(),
      principal: (json['principal'] as num).toDouble(),
      interest: (json['interest'] as num).toDouble(),
      status: json['status'] as String,
      transactionId: json['transactionId'] as String,
    );

Map<String, dynamic> _$$EMIRecordImplToJson(_$EMIRecordImpl instance) =>
    <String, dynamic>{
      'date': instance.date.toIso8601String(),
      'amount': instance.amount,
      'principal': instance.principal,
      'interest': instance.interest,
      'status': instance.status,
      'transactionId': instance.transactionId,
    };

_$InsuranceInfoImpl _$$InsuranceInfoImplFromJson(Map<String, dynamic> json) =>
    _$InsuranceInfoImpl(
      id: json['id'] as String,
      company: json['company'] as String,
      policyType: json['policyType'] as String,
      policyNumber: json['policyNumber'] as String,
      sumInsured: (json['sumInsured'] as num).toDouble(),
      premium: (json['premium'] as num).toDouble(),
      startDate: DateTime.parse(json['startDate'] as String),
      endDate: DateTime.parse(json['endDate'] as String),
      coverages:
          (json['coverages'] as List<dynamic>).map((e) => e as String).toList(),
      status: json['status'] as String,
      claims: (json['claims'] as List<dynamic>?)
              ?.map((e) => ClaimRecord.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$InsuranceInfoImplToJson(_$InsuranceInfoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'company': instance.company,
      'policyType': instance.policyType,
      'policyNumber': instance.policyNumber,
      'sumInsured': instance.sumInsured,
      'premium': instance.premium,
      'startDate': instance.startDate.toIso8601String(),
      'endDate': instance.endDate.toIso8601String(),
      'coverages': instance.coverages,
      'status': instance.status,
      'claims': instance.claims,
    };

_$ClaimRecordImpl _$$ClaimRecordImplFromJson(Map<String, dynamic> json) =>
    _$ClaimRecordImpl(
      id: json['id'] as String,
      claimDate: DateTime.parse(json['claimDate'] as String),
      reason: json['reason'] as String,
      claimAmount: (json['claimAmount'] as num).toDouble(),
      settledAmount: (json['settledAmount'] as num).toDouble(),
      status: json['status'] as String,
      settlementDate: DateTime.parse(json['settlementDate'] as String),
      notes: json['notes'] as String,
    );

Map<String, dynamic> _$$ClaimRecordImplToJson(_$ClaimRecordImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'claimDate': instance.claimDate.toIso8601String(),
      'reason': instance.reason,
      'claimAmount': instance.claimAmount,
      'settledAmount': instance.settledAmount,
      'status': instance.status,
      'settlementDate': instance.settlementDate.toIso8601String(),
      'notes': instance.notes,
    };

_$TaxInfoImpl _$$TaxInfoImplFromJson(Map<String, dynamic> json) =>
    _$TaxInfoImpl(
      assessmentYear: json['assessmentYear'] as String,
      agriculturalIncome: (json['agriculturalIncome'] as num).toDouble(),
      nonAgriculturalIncome: (json['nonAgriculturalIncome'] as num).toDouble(),
      totalTax: (json['totalTax'] as num).toDouble(),
      tds: (json['tds'] as num).toDouble(),
      filingStatus: json['filingStatus'] as String,
      filingDate: DateTime.parse(json['filingDate'] as String),
      acknowledgmentNumber: json['acknowledgmentNumber'] as String,
    );

Map<String, dynamic> _$$TaxInfoImplToJson(_$TaxInfoImpl instance) =>
    <String, dynamic>{
      'assessmentYear': instance.assessmentYear,
      'agriculturalIncome': instance.agriculturalIncome,
      'nonAgriculturalIncome': instance.nonAgriculturalIncome,
      'totalTax': instance.totalTax,
      'tds': instance.tds,
      'filingStatus': instance.filingStatus,
      'filingDate': instance.filingDate.toIso8601String(),
      'acknowledgmentNumber': instance.acknowledgmentNumber,
    };
