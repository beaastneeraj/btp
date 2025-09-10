import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/indian_agriculture_models.dart';

/// Comprehensive Farm Instruments Database for India
class FarmInstrumentsDatabase {
  static final Map<String, FarmInstrumentDetail> instruments = {
        'tractor_mahindra_575': FarmInstrumentDetail(
      id: 'tractor_mahindra_575',
      type: FarmInstrument.tractor,
      name: 'Mahindra 575 DI Tractor',
      hindiName: 'महिंद्रा 575 डीआई ट्रैक्टर',
      description: '47 HP diesel tractor suitable for all farming operations',
      brand: 'Mahindra',
      model: '575 DI',
      purchasePrice: 850000.0,
      purchaseDate: DateTime(2024, 1, 15),
      condition: 'Good',
      maintenance: MaintenanceInfo(
        frequency: 'Every 250 hours or 6 months',
        checklist: [
          'Engine oil change',
          'Filter replacement',
          'Battery check',
          'Tire pressure',
          'Hydraulic oil level',
          'Brake adjustment',
          'PTO operation check'
        ],
        estimatedCost: 8000.0,
        lastMaintenance: DateTime(2024, 6, 1),
        nextMaintenance: DateTime(2024, 12, 1),
        commonIssues: [
          'Engine overheating',
          'Hydraulic pump issues',
          'Clutch problems',
          'Fuel injection problems'
        ],
        spareParts: [
          'Engine oil filter',
          'Air filter',
          'Fuel filter',
          'Hydraulic oil',
          'Brake pads',
          'Clutch plates'
        ],
      ),
      suitableCrops: [
        'Wheat',
        'Rice',
        'Sugarcane',
        'Cotton',
        'Soybean',
        'Maize'
      ],
      features: [
        '4-cylinder engine',
        'Power steering',
        'Dual clutch',
        'Oil immersed brakes',
        '540/1000 RPM PTO',
        '1800 kg lifting capacity'
      ],
      powerSource: 'Diesel',
      size: 'Medium',
      maintenanceHistory: [],
      usageHistory: [],
    ),

    'seed_drill_john_deere': FarmInstrumentDetail(
      id: 'seed_drill_john_deere',
      type: FarmInstrument.seedDrill,
      name: 'John Deere Seed Drill',
      hindiName: 'जॉन डियर सीड ड्रिल',
      description: '9-tyne seed drill for precise seed placement',
      brand: 'John Deere',
      model: 'JD-350',
      purchasePrice: 180000.0,
      purchaseDate: DateTime(2023, 8, 10),
      condition: 'Excellent',
      maintenance: MaintenanceInfo(
        frequency: 'Before and after each season',
        checklist: [
          'Tyne condition check',
          'Seed metering mechanism',
          'Depth adjustment',
          'Chain and sprocket',
          'Bearing lubrication'
        ],
        estimatedCost: 3000.0,
        lastMaintenance: DateTime(2024, 5, 15),
        nextMaintenance: DateTime(2024, 11, 15),
        commonIssues: [
          'Tyne breakage',
          'Seed blockage',
          'Uneven depth',
          'Chain wear'
        ],
        spareParts: [
          'Tyne points',
          'Seed cups',
          'Chains',
          'Bearings',
          'Bolts and nuts'
        ],
      ),
      suitableCrops: [
        'Wheat',
        'Barley',
        'Mustard',
        'Gram',
        'Pea',
        'Lentil'
      ],
      features: [
        '9 tyne configuration',
        'Adjustable depth control',
        'Uniform seed distribution',
        'Fertilizer attachment ready',
        'Easy maintenance'
      ],
      powerSource: 'Tractor PTO',
      size: '2.7 meters working width',
      maintenanceHistory: [],
      usageHistory: [],
    ),

    'sprinkler_system_netafim': FarmInstrumentDetail(
      id: 'sprinkler_system_netafim',
      type: FarmInstrument.sprinklerSystem,
      name: 'Netafim Sprinkler Irrigation System',
      hindiName: 'नेटाफिम स्प्रिंकलर सिस्टम',
      description: 'Complete sprinkler irrigation system for 5 hectare',
      brand: 'Netafim',
      model: 'SuperNet',
      purchasePrice: 450000.0,
      purchaseDate: DateTime(2023, 3, 20),
      condition: 'Good',
      maintenance: MaintenanceInfo(
        frequency: 'Monthly during season',
        checklist: [
          'Nozzle cleaning',
          'Pressure check',
          'Pipe inspection',
          'Pump maintenance',
          'Filter cleaning',
          'Timer functionality'
        ],
        estimatedCost: 5000.0,
        lastMaintenance: DateTime(2024, 7, 1),
        nextMaintenance: DateTime(2024, 8, 1),
        commonIssues: [
          'Nozzle clogging',
          'Pipe leakage',
          'Pump problems',
          'Uneven water distribution'
        ],
        spareParts: [
          'Sprinkler nozzles',
          'Gaskets',
          'Pipe fittings',
          'Filters',
          'Control valves'
        ],
      ),
      suitableCrops: [
        'Vegetables',
        'Fruits',
        'Flowers',
        'Spice crops',
        'Cash crops'
      ],
      features: [
        'Uniform water distribution',
        'Timer controlled',
        'Multiple zone operation',
        'Weather sensor compatible',
        'Energy efficient'
      ],
      powerSource: 'Electric pump',
      size: '5 hectare coverage',
      maintenanceHistory: [],
      usageHistory: [],
    ),

    'combine_harvester_preet': FarmInstrumentDetail(
      id: 'combine_harvester_preet',
      type: FarmInstrument.combine,
      name: 'Preet Combine Harvester',
      hindiName: 'प्रीत कंबाइन हार्वेस्टर',
      description: 'Self-propelled combine harvester for cereals',
      brand: 'Preet',
      model: '987',
      purchasePrice: 2200000.0,
      purchaseDate: DateTime(2022, 10, 5),
      condition: 'Very Good',
      maintenance: MaintenanceInfo(
        frequency: 'Every 100 hours or after season',
        checklist: [
          'Engine service',
          'Threshing drum check',
          'Belt tension',
          'Cleaning system',
          'Hydraulic system',
          'Electrical system'
        ],
        estimatedCost: 25000.0,
        lastMaintenance: DateTime(2024, 5, 20),
        nextMaintenance: DateTime(2024, 10, 20),
        commonIssues: [
          'Belt breakage',
          'Grain loss',
          'Engine overheating',
          'Hydraulic leaks'
        ],
        spareParts: [
          'Belts',
          'Filters',
          'Hydraulic oil',
          'Cutting blades',
          'Concave bars'
        ],
      ),
      suitableCrops: [
        'Wheat',
        'Rice',
        'Barley',
        'Mustard',
        'Sunflower'
      ],
      features: [
        'Self-propelled',
        '14 feet cutting width',
        'Grain tank 1400 kg',
        'AC cabin',
        'Track type'
      ],
      powerSource: 'Diesel engine 90 HP',
      size: 'Large',
      maintenanceHistory: [],
      usageHistory: [],
    ),

    'rotavator_fieldking': FarmInstrumentDetail(
      id: 'rotavator_fieldking',
      type: FarmInstrument.rotavator,
      name: 'Fieldking Rotavator',
      hindiName: 'फील्डकिंग रोटावेटर',
      description: 'Heavy duty rotavator for soil preparation',
      brand: 'Fieldking',
      model: 'Super Roto 180',
      purchasePrice: 120000.0,
      purchaseDate: DateTime(2023, 12, 8),
      condition: 'Excellent',
      maintenance: MaintenanceInfo(
        frequency: 'Every 50 hours',
        checklist: [
          'Blade sharpening',
          'Gearbox oil level',
          'Belt condition',
          'Bearing greasing',
          'Side plate adjustment'
        ],
        estimatedCost: 2500.0,
        lastMaintenance: DateTime(2024, 6, 15),
        nextMaintenance: DateTime(2024, 9, 15),
        commonIssues: [
          'Blade wear',
          'Gearbox problems',
          'Belt slipping',
          'Stone damage'
        ],
        spareParts: [
          'Rotavator blades',
          'Gearbox oil',
          'Belts',
          'Bearings',
          'Bolts'
        ],
      ),
      suitableCrops: [
        'All field crops',
        'Vegetable preparation',
        'Orchard cultivation'
      ],
      features: [
        '6 feet working width',
        'Heavy duty blades',
        'Cast iron gearbox',
        'Adjustable depth',
        'Stone protection'
      ],
      powerSource: 'Tractor PTO',
      size: 'Medium',
      maintenanceHistory: [],
      usageHistory: [],
    ),

    'thresher_dasmesh': FarmInstrumentDetail(
      id: 'thresher_dasmesh',
      type: FarmInstrument.thresher,
      name: 'Dasmesh Wheat Thresher',
      hindiName: 'दसमेश गेहूं थ्रेशर',
      description: 'Multi-crop thresher for small grains',
      brand: 'Dasmesh',
      model: 'DM-636',
      purchasePrice: 95000.0,
      purchaseDate: DateTime(2024, 2, 12),
      condition: 'New',
      maintenance: MaintenanceInfo(
        frequency: 'After every 10 hours',
        checklist: [
          'Belt adjustment',
          'Drum clearance',
          'Sieve cleaning',
          'Bearing lubrication',
          'Blower adjustment'
        ],
        estimatedCost: 1500.0,
        lastMaintenance: DateTime(2024, 7, 10),
        nextMaintenance: DateTime(2024, 8, 10),
        commonIssues: [
          'Grain breakage',
          'Incomplete threshing',
          'Chaff mixing',
          'Belt problems'
        ],
        spareParts: [
          'Threshing bars',
          'Sieves',
          'Belts',
          'Bearings'
        ],
      ),
      suitableCrops: [
        'Wheat',
        'Barley',
        'Mustard',
        'Coriander',
        'Cumin'
      ],
      features: [
        '6-8 HP engine',
        '8-10 quintal/hour capacity',
        'Clean grain output',
        'Portable design',
        'Low maintenance'
      ],
      powerSource: 'Diesel engine',
      size: 'Small',
      maintenanceHistory: [],
      usageHistory: [],
    ),
  };

  /// Get instruments by type
  static List<FarmInstrumentDetail> getInstrumentsByType(FarmInstrument type) {
    return instruments.values
        .where((instrument) => instrument.type == type)
        .toList();
  }

  /// Get instruments by brand
  static List<FarmInstrumentDetail> getInstrumentsByBrand(String brand) {
    return instruments.values
        .where((instrument) => instrument.brand.toLowerCase() == brand.toLowerCase())
        .toList();
  }

  /// Search instruments
  static List<FarmInstrumentDetail> searchInstruments(String query) {
    final lowerQuery = query.toLowerCase();
    return instruments.values
        .where((instrument) =>
            instrument.name.toLowerCase().contains(lowerQuery) ||
            instrument.hindiName.contains(query) ||
            instrument.brand.toLowerCase().contains(lowerQuery))
        .toList();
  }
}

/// Fertilizer Database for India
class FertilizerDatabase {
  static final Map<String, FertilizerDetail> fertilizers = {
    'urea_iffco': FertilizerDetail(
      id: 'urea_iffco',
      type: FertilizerType.urea,
      name: 'IFFCO Urea',
      hindiName: 'इफको यूरिया',
      brand: 'IFFCO',
      composition: 'N: 46%',
      pricePerKg: 6.50,
      packagingSize: '50 kg bag',
      application: ApplicationMethod(
        method: 'Broadcasting or side dressing',
        dosage: '100-150 kg/hectare',
        timing: 'Split application - Basal and top dressing',
        frequency: '2-3 times during crop season',
        mixingInstructions: [
          'Can be mixed with other fertilizers',
          'Avoid mixing with SSP in humid conditions',
          'Apply in moist soil'
        ],
        equipment: 'Fertilizer broadcaster or manual',
        waterRequirement: 'Apply before irrigation',
      ),
      suitableCrops: [
        'All crops',
        'Cereals',
        'Vegetables',
        'Fruits',
        'Cash crops'
      ],
      suitableSeasons: [
        CropSeason.kharif,
        CropSeason.rabi,
        CropSeason.zaid
      ],
      storageInstructions: 'Store in dry, cool place away from moisture',
      safetyPrecautions: 'Use gloves, avoid inhalation, wash hands after use',
      manufacturer: 'Indian Farmers Fertiliser Cooperative Limited',
      expiryDate: DateTime(2025, 12, 31),
      benefits: [
        'Quick nitrogen release',
        'Promotes vegetative growth',
        'Increases protein content',
        'Improves crop yield'
      ],
      sideEffects: [
        'Can cause soil acidity if overused',
        'May lead to lodging if excess applied',
        'Environmental concerns with runoff'
      ],
    ),

    'dap_iffco': FertilizerDetail(
      id: 'dap_iffco',
      type: FertilizerType.diammoniumPhosphate,
      name: 'IFFCO DAP',
      hindiName: 'इफको डीएपी',
      brand: 'IFFCO',
      composition: 'N: 18%, P2O5: 46%',
      pricePerKg: 28.50,
      packagingSize: '50 kg bag',
      application: ApplicationMethod(
        method: 'Broadcasting at sowing',
        dosage: '100-125 kg/hectare',
        timing: 'Basal application before sowing',
        frequency: 'Once per season',
        mixingInstructions: [
          'Can be mixed with potash fertilizers',
          'Avoid mixing with urea in humid conditions',
          'Apply uniformly'
        ],
        equipment: 'Seed cum fertilizer drill or broadcasting',
        waterRequirement: 'Apply in moist soil',
      ),
      suitableCrops: [
        'Wheat',
        'Rice',
        'Maize',
        'Sugarcane',
        'Cotton',
        'Pulses'
      ],
      suitableSeasons: [
        CropSeason.kharif,
        CropSeason.rabi
      ],
      storageInstructions: 'Store in covered godown, protect from rain',
      safetyPrecautions: 'Avoid direct contact with skin, use protective gear',
      manufacturer: 'Indian Farmers Fertiliser Cooperative Limited',
      expiryDate: DateTime(2026, 6, 30),
      benefits: [
        'Provides nitrogen and phosphorus',
        'Promotes root development',
        'Improves flowering and fruiting',
        'Increases crop quality'
      ],
      sideEffects: [
        'May reduce soil pH',
        'Can cause nutrient imbalance if overused'
      ],
    ),

    'mop_kcl': FertilizerDetail(
      id: 'mop_kcl',
      type: FertilizerType.muriatePotash,
      name: 'Muriate of Potash',
      hindiName: 'म्यूरिएट ऑफ पोटाश',
      brand: 'KCL',
      composition: 'K2O: 60%',
      pricePerKg: 18.75,
      packagingSize: '50 kg bag',
      application: ApplicationMethod(
        method: 'Broadcasting or banding',
        dosage: '50-100 kg/hectare',
        timing: 'Basal application or split with nitrogen',
        frequency: '1-2 times per season',
        mixingInstructions: [
          'Can be mixed with nitrogen fertilizers',
          'Avoid application during flowering',
          'Apply in splits for better utilization'
        ],
        equipment: 'Fertilizer spreader or manual broadcasting',
        waterRequirement: 'Apply before irrigation',
      ),
      suitableCrops: [
        'Potato',
        'Sugarcane',
        'Fruits',
        'Vegetables',
        'Cotton',
        'Tobacco'
      ],
      suitableSeasons: [
        CropSeason.kharif,
        CropSeason.rabi,
        CropSeason.zaid
      ],
      storageInstructions: 'Store in dry place, avoid contact with water',
      safetyPrecautions: 'Non-toxic but avoid eye contact',
      manufacturer: 'Various importers and manufacturers',
      expiryDate: DateTime(2026, 12, 31),
      benefits: [
        'Improves fruit quality',
        'Increases disease resistance',
        'Enhances water use efficiency',
        'Improves shelf life of produce'
      ],
      sideEffects: [
        'Can cause chloride toxicity in sensitive crops',
        'May affect soil structure if overused'
      ],
    ),

    'ssp_coromandel': FertilizerDetail(
      id: 'ssp_coromandel',
      type: FertilizerType.singleSuperPhosphate,
      name: 'Coromandel SSP',
      hindiName: 'कोरोमंडल एसएसपी',
      brand: 'Coromandel',
      composition: 'P2O5: 16%, S: 11%',
      pricePerKg: 8.25,
      packagingSize: '50 kg bag',
      application: ApplicationMethod(
        method: 'Broadcasting before sowing',
        dosage: '200-250 kg/hectare',
        timing: 'Basal application',
        frequency: 'Once per season',
        mixingInstructions: [
          'Can be mixed with other fertilizers',
          'Apply uniformly in the field',
          'Incorporate into soil'
        ],
        equipment: 'Fertilizer broadcaster',
        waterRequirement: 'Apply in moist soil conditions',
      ),
      suitableCrops: [
        'Oilseeds',
        'Pulses',
        'Groundnut',
        'Sunflower',
        'Safflower'
      ],
      suitableSeasons: [
        CropSeason.kharif,
        CropSeason.rabi
      ],
      storageInstructions: 'Store in dry, ventilated godown',
      safetyPrecautions: 'Avoid inhalation of dust, use mask if needed',
      manufacturer: 'Coromandel International Limited',
      expiryDate: DateTime(2025, 8, 31),
      benefits: [
        'Provides phosphorus and sulfur',
        'Improves oil content in oilseeds',
        'Enhances protein synthesis',
        'Cost-effective phosphorus source'
      ],
      sideEffects: [
        'May reduce soil pH gradually',
        'Sulfur content may be excessive for some crops'
      ],
    ),

    'npk_iffco': FertilizerDetail(
      id: 'npk_iffco_201020',
      type: FertilizerType.npk201020,
      name: 'IFFCO NPK 20:10:20',
      hindiName: 'इफको एनपीके 20:10:20',
      brand: 'IFFCO',
      composition: 'N: 20%, P2O5: 10%, K2O: 20%',
      pricePerKg: 22.50,
      packagingSize: '50 kg bag',
      application: ApplicationMethod(
        method: 'Broadcasting or drilling',
        dosage: '150-200 kg/hectare',
        timing: 'Basal application at sowing',
        frequency: 'Once per season',
        mixingInstructions: [
          'Ready to use complex fertilizer',
          'No mixing required',
          'Apply uniformly'
        ],
        equipment: 'Fertilizer drill or broadcaster',
        waterRequirement: 'Apply before irrigation',
      ),
      suitableCrops: [
        'Vegetables',
        'Fruits',
        'Cash crops',
        'Spices',
        'Flowers'
      ],
      suitableSeasons: [
        CropSeason.kharif,
        CropSeason.rabi,
        CropSeason.zaid
      ],
      storageInstructions: 'Store in moisture-free environment',
      safetyPrecautions: 'Handle with care, avoid skin contact',
      manufacturer: 'Indian Farmers Fertiliser Cooperative Limited',
      expiryDate: DateTime(2025, 10, 31),
      benefits: [
        'Balanced nutrition in one application',
        'Convenient to use',
        'Suitable for high-value crops',
        'Improves overall plant health'
      ],
      sideEffects: [
        'More expensive than single nutrient fertilizers',
        'May not suit all soil types'
      ],
    ),
  };

  /// Get fertilizers by type
  static List<FertilizerDetail> getFertilizersByType(FertilizerType type) {
    return fertilizers.values
        .where((fertilizer) => fertilizer.type == type)
        .toList();
  }

  /// Get fertilizers suitable for crop
  static List<FertilizerDetail> getFertilizersForCrop(String cropName) {
    return fertilizers.values
        .where((fertilizer) => fertilizer.suitableCrops
            .any((crop) => crop.toLowerCase().contains(cropName.toLowerCase())))
        .toList();
  }

  /// Search fertilizers
  static List<FertilizerDetail> searchFertilizers(String query) {
    final lowerQuery = query.toLowerCase();
    return fertilizers.values
        .where((fertilizer) =>
            fertilizer.name.toLowerCase().contains(lowerQuery) ||
            fertilizer.hindiName.contains(query) ||
            fertilizer.brand.toLowerCase().contains(lowerQuery))
        .toList();
  }
}

/// Seeds Database
class SeedDatabase {
  static final Map<String, SeedDetail> seeds = {
    'wheat_hd3086': SeedDetail(
      id: 'wheat_hd3086',
      type: SeedType.hybrid,
      varietyName: 'HD 3086',
      hindiName: 'एचडी 3086',
      cropName: 'Wheat',
      company: 'IARI',
      pricePerKg: 45.0,
      packagingSize: '40 kg bag',
      specifications: SeedSpecifications(
        germination: 95.0,
        purity: 98.0,
        moisture: 8.0,
        maturityDays: 145,
        yieldPotential: 6.5,
        resistance: 'Rust resistant',
        plantHeight: '90-100 cm',
        fruitSize: 'Medium grain',
        specialFeatures: 'High protein content, drought tolerant',
      ),
      suitableStates: [
        IndianState.punjab,
        IndianState.haryana,
        IndianState.uttarPradesh,
        IndianState.rajasthan,
        IndianState.madhyaPradesh,
      ],
      suitableSeasons: [CropSeason.rabi],
      description: 'High yielding wheat variety suitable for irrigated conditions',
      productionDate: DateTime(2024, 6, 1),
      expiryDate: DateTime(2025, 5, 31),
      features: [
        'High yielding variety',
        'Rust resistant',
        'Good chapati quality',
        'Drought tolerant'
      ],
      benefits: [
        'Higher yields',
        'Better disease resistance',
        'Good market demand',
        'Suitable for mechanical harvesting'
      ],
    ),
  };
}

/// Providers for databases
final farmInstrumentsDatabaseProvider = Provider<FarmInstrumentsDatabase>((ref) {
  return FarmInstrumentsDatabase();
});

final fertilizerDatabaseProvider = Provider<FertilizerDatabase>((ref) {
  return FertilizerDatabase();
});

final seedDatabaseProvider = Provider<SeedDatabase>((ref) {
  return SeedDatabase();
});
