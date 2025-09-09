import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/indian_agriculture_models.dart';

/// Comprehensive Indian Crop Database
class IndianCropDatabase {
  static const Map<String, IndianCrop> crops = {
    // CEREALS
    'rice_basmati': IndianCrop(
      id: 'rice_basmati',
      name: 'Basmati Rice',
      hindiName: 'बासमती चावल',
      scientificName: 'Oryza sativa',
      category: CropCategory.cereals,
      suitableStates: [
        IndianState.punjab,
        IndianState.haryana,
        IndianState.uttarPradesh,
        IndianState.uttarakhand,
        IndianState.bihar,
        IndianState.jammuKashmir,
      ],
      suitableSoils: [SoilType.alluvial, SoilType.red],
      suitableClimates: [ClimateZone.subtropical, ClimateZone.temperate],
      seasons: [CropSeason.kharif],
      growthDurationDays: 120,
      temperatureMin: 20.0,
      temperatureMax: 35.0,
      rainfallMin: 1000.0,
      rainfallMax: 2000.0,
      description: 'Premium aromatic long grain rice variety grown in northern India',
      varieties: [
        'Pusa Basmati 1121',
        'Pusa Basmati 1509',
        'CSR 30',
        'Pusa Sugandh 5',
        'Haryana Basmati 1',
        'Taraori Basmati'
      ],
      manual: CropManual(
        cropId: 'rice_basmati',
        soilPreparation: SoilPreparation(
          steps: [
            'First ploughing after harvesting previous crop',
            'Add farmyard manure 10-12 tons/hectare',
            'Second ploughing and mixing of manure',
            'Puddling with standing water',
            'Leveling the field properly'
          ],
          ploughingDepth: '15-20 cm',
          numberOfPloughings: 2,
          tools: ['Disc Harrow', 'Cultivator', 'Puddler', 'Leveler'],
          timing: '15-20 days before transplanting',
          soilMoisture: 'Field should be saturated with water',
        ),
        seedingInfo: SeedingInfo(
          seedRate: 25.0,
          seedRateUnit: 'kg/hectare',
          spacingBetweenRows: '20 cm',
          spacingBetweenPlants: '10 cm',
          sowingDepth: '2-3 cm',
          sowingMethod: 'Transplanting',
          seedTreatment: [
            'Treat seeds with Carbendazim @ 2g/kg',
            'Soak seeds for 24 hours',
            'Incubate for 48 hours for sprouting'
          ],
          bestSowingTime: 'June 15 - July 15',
        ),
        irrigation: IrrigationSchedule(
          stages: [
            IrrigationStage(
              stage: 'Nursery',
              daysAfterSowing: 0,
              waterAmount: 5.0,
              frequency: 'Daily light irrigation',
              notes: 'Keep nursery bed moist',
            ),
            IrrigationStage(
              stage: 'Transplanting',
              daysAfterSowing: 25,
              waterAmount: 10.0,
              frequency: 'Flood irrigation',
              notes: 'Maintain 2-5 cm standing water',
            ),
            IrrigationStage(
              stage: 'Tillering',
              daysAfterSowing: 45,
              waterAmount: 8.0,
              frequency: 'Every 3-4 days',
              notes: 'Critical stage for water',
            ),
            IrrigationStage(
              stage: 'Panicle Initiation',
              daysAfterSowing: 65,
              waterAmount: 10.0,
              frequency: 'Every 2-3 days',
              notes: 'Most critical stage',
            ),
            IrrigationStage(
              stage: 'Flowering',
              daysAfterSowing: 85,
              waterAmount: 8.0,
              frequency: 'Every 3-4 days',
              notes: 'Maintain adequate moisture',
            ),
            IrrigationStage(
              stage: 'Grain Filling',
              daysAfterSowing: 100,
              waterAmount: 6.0,
              frequency: 'Every 4-5 days',
              notes: 'Gradually reduce water',
            ),
          ],
          method: 'Flood irrigation with check basins',
          totalWaterRequirement: 1200.0,
          waterQuality: 'Fresh water with EC < 2.0 dS/m',
          criticalStages: ['Transplanting', 'Panicle Initiation', 'Flowering'],
        ),
        fertilizer: FertilizerSchedule(
          applications: [
            FertilizerApplication(
              stage: 'Basal',
              daysAfterSowing: 0,
              npkRatio: '120:60:40',
              quantity: 220.0,
              unit: 'kg/hectare',
              method: 'Broadcasting before transplanting',
              notes: 'Apply full phosphorus and potash, half nitrogen',
            ),
            FertilizerApplication(
              stage: 'Tillering',
              daysAfterSowing: 25,
              npkRatio: '60:0:0',
              quantity: 60.0,
              unit: 'kg/hectare',
              method: 'Top dressing',
              notes: 'Apply remaining nitrogen',
            ),
          ],
          organic: OrganicFertilizers(
            farmyardManure: '10-12 tons/hectare',
            compost: '8-10 tons/hectare',
            vermicompost: '5-6 tons/hectare',
            greenManure: 'Dhaincha or Sunhemp before rice',
            biofertilizers: ['Azospirillum', 'PSB', 'Potash mobilizing bacteria'],
          ),
          micronutrients: ['Zinc Sulphate @ 25 kg/ha', 'Iron @ 10 kg/ha'],
          soilTesting: 'Test soil every 2 years for pH, EC, and nutrients',
        ),
        pestManagement: PestManagement(
          pests: [
            CommonPest(
              name: 'Brown Plant Hopper',
              hindiName: 'भूरा फुदका',
              scientificName: 'Nilaparvata lugens',
              description: 'Small brown insects that suck plant sap',
              symptoms: ['Yellowing of leaves', 'Stunted growth', 'Hopper burn'],
              control: [
                'Use resistant varieties',
                'Spray Imidacloprid @ 0.5 ml/liter',
                'Maintain proper plant spacing'
              ],
              severity: 'High',
            ),
            CommonPest(
              name: 'Stem Borer',
              hindiName: 'तना छेदक',
              scientificName: 'Scirpophaga incertulas',
              description: 'Larvae bore into rice stems',
              symptoms: ['Dead heart in vegetative stage', 'White ear head', 'Tunneling in stem'],
              control: [
                'Use pheromone traps',
                'Spray Chlorantraniliprole @ 0.4 ml/liter',
                'Release Trichogramma @ 1 lakh/hectare'
              ],
              severity: 'Medium',
            ),
          ],
          diseases: [
            CommonDisease(
              name: 'Blast',
              hindiName: 'झुलसा रोग',
              scientificName: 'Pyricularia oryzae',
              type: 'Fungal',
              symptoms: ['Diamond shaped spots on leaves', 'Node infection', 'Neck blast'],
              prevention: [
                'Use resistant varieties',
                'Avoid excessive nitrogen',
                'Proper field sanitation'
              ],
              treatment: [
                'Spray Tricyclazole @ 0.6 g/liter',
                'Apply Carbendazim @ 0.5 g/liter',
                'Use Kasugamycin @ 2 ml/liter'
              ],
              severity: 'High',
            ),
          ],
          ipm: IntegratedPestManagement(
            cultural: [
              'Crop rotation with legumes',
              'Use of resistant varieties',
              'Proper field sanitation',
              'Optimal plant density'
            ],
            biological: [
              'Release of Trichogramma',
              'Use of Trichoderma',
              'Bird perches in field',
              'Conservation of natural enemies'
            ],
            mechanical: [
              'Light traps for moths',
              'Pheromone traps',
              'Hand picking of larvae',
              'Sticky traps'
            ],
            chemical: [
              'Need-based pesticide application',
              'Use of recommended chemicals',
              'Rotation of insecticides',
              'Follow PHI period'
            ],
            monitoring: 'Weekly field monitoring for pest incidence',
          ),
          organicSolutions: [
            'Neem oil @ 3-5 ml/liter',
            'Panchagavya @ 3%',
            'Jeevamrut application',
            'Botanical extracts'
          ],
          chemicalSolutions: [
            'Imidacloprid 17.8% SL',
            'Chlorantraniliprole 18.5% SC',
            'Tricyclazole 75% WP',
            'Carbendazim 50% WP'
          ],
        ),
        harvesting: HarvestingInfo(
          maturitySigns: [
            'Grain becomes hard and golden yellow',
            '80% of grains are filled',
            'Moisture content 20-25%',
            'Panicles bend downward'
          ],
          harvestingMethod: 'Cut with sickle or use combine harvester',
          bestTime: 'Early morning when moisture is high',
          weatherConditions: 'Clear sunny weather',
          tools: 'Sickle, Combine Harvester, Thresher',
          expectedYield: 5.0,
          yieldUnit: 'tons/hectare',
        ),
        postHarvest: PostHarvestCare(
          processing: [
            'Threshing within 24 hours',
            'Cleaning and grading',
            'Drying to 14% moisture',
            'Polishing if required'
          ],
          storage: StorageInfo(
            method: 'Store in gunny bags or silos',
            temperature: '15-20°C',
            humidity: '60-70%',
            duration: '12-24 months',
            precautions: [
              'Control moisture content',
              'Protect from rodents',
              'Regular fumigation',
              'Proper ventilation'
            ],
          ),
          packaging: [
            'Clean jute bags 50 kg capacity',
            'Polypropylene bags for export',
            'Vacuum packaging for premium quality'
          ],
          transportation: [
            'Use covered vehicles',
            'Avoid damage during loading',
            'Maintain proper documentation'
          ],
          quality: QualityStandards(
            grades: ['Grade A', 'Grade B', 'Grade C'],
            specifications: [
              'Length: 6.61-7.50 mm',
              'Breadth: Less than 2.0 mm',
              'Broken grains: Max 5%',
              'Moisture: Max 14%'
            ],
            certification: 'APEDA export certification',
            export: ['USA', 'Middle East', 'Europe', 'Southeast Asia'],
          ),
        ),
        tips: [
          'Use certified seeds from authorized dealers',
          'Maintain proper plant spacing for better yield',
          'Monitor weather conditions regularly',
          'Apply fertilizers based on soil test results',
          'Practice crop rotation to maintain soil health'
        ],
        warnings: [
          'Avoid over-irrigation during flowering stage',
          'Do not apply nitrogen during grain filling',
          'Harvest at right time to avoid quality loss',
          'Store properly to prevent aflatoxin contamination'
        ],
      ),
      diseases: ['Blast', 'Brown Spot', 'Sheath Blight', 'Bacterial Leaf Blight'],
      pests: ['Brown Plant Hopper', 'Stem Borer', 'Leaf Folder', 'Gall Midge'],
      marketInfo: MarketInfo(
        currentPrice: 3500.0,
        priceUnit: 'Rs/quintal',
        majorMarkets: ['Delhi', 'Mumbai', 'Kolkata', 'Chennai'],
        demand: 'High domestic and export demand',
        exportPotential: 'Very High - Premium international market',
        buyers: ['Exporters', 'Rice Millers', 'Retailers', 'Government'],
        priceRange: '3000-4500 Rs/quintal',
      ),
      images: [
        'assets/crops/basmati_rice_field.jpg',
        'assets/crops/basmati_rice_grain.jpg',
        'assets/crops/basmati_rice_harvest.jpg'
      ],
    ),

    'wheat_durum': IndianCrop(
      id: 'wheat_durum',
      name: 'Durum Wheat',
      hindiName: 'कठिया गेहूं',
      scientificName: 'Triticum durum',
      category: CropCategory.cereals,
      suitableStates: [
        IndianState.madhyaPradesh,
        IndianState.rajasthan,
        IndianState.gujarat,
        IndianState.maharashtra,
        IndianState.karnataka,
      ],
      suitableSoils: [SoilType.blackCotton, SoilType.alluvial],
      suitableClimates: [ClimateZone.semiArid, ClimateZone.subtropical],
      seasons: [CropSeason.rabi],
      growthDurationDays: 110,
      temperatureMin: 15.0,
      temperatureMax: 25.0,
      rainfallMin: 300.0,
      rainfallMax: 600.0,
      description: 'High protein wheat variety suitable for semolina production',
      varieties: [
        'HI 8627',
        'MACS 3125',
        'PDW 314',
        'GW 1139',
        'NIAW 34'
      ],
      manual: CropManual(
        cropId: 'wheat_durum',
        soilPreparation: SoilPreparation(
          steps: [
            'Deep ploughing after monsoon',
            'Apply FYM 8-10 tons/hectare',
            'Cross ploughing and planking',
            'Make field level for uniform irrigation'
          ],
          ploughingDepth: '20-25 cm',
          numberOfPloughings: 3,
          tools: ['Disc Plough', 'Cultivator', 'Harrow', 'Planker'],
          timing: 'October-November',
          soilMoisture: 'Adequate moisture for germination',
        ),
        seedingInfo: SeedingInfo(
          seedRate: 100.0,
          seedRateUnit: 'kg/hectare',
          spacingBetweenRows: '23 cm',
          spacingBetweenPlants: 'Continuous',
          sowingDepth: '3-5 cm',
          sowingMethod: 'Line sowing with seed drill',
          seedTreatment: [
            'Treat with Vitavax @ 2.5 g/kg',
            'Use Thiram @ 2 g/kg for fungal diseases'
          ],
          bestSowingTime: 'November 15 - December 15',
        ),
        irrigation: IrrigationSchedule(
          stages: [
            IrrigationStage(
              stage: 'Crown Root Initiation',
              daysAfterSowing: 20,
              waterAmount: 6.0,
              frequency: 'First irrigation',
              notes: 'Critical for establishment',
            ),
            IrrigationStage(
              stage: 'Tillering',
              daysAfterSowing: 40,
              waterAmount: 6.0,
              frequency: 'Second irrigation',
              notes: 'Promotes tillering',
            ),
            IrrigationStage(
              stage: 'Jointing',
              daysAfterSowing: 60,
              waterAmount: 6.0,
              frequency: 'Third irrigation',
              notes: 'Node formation stage',
            ),
            IrrigationStage(
              stage: 'Flowering',
              daysAfterSowing: 80,
              waterAmount: 6.0,
              frequency: 'Fourth irrigation',
              notes: 'Critical for grain formation',
            ),
            IrrigationStage(
              stage: 'Milk Stage',
              daysAfterSowing: 95,
              waterAmount: 5.0,
              frequency: 'Fifth irrigation',
              notes: 'Grain filling stage',
            ),
          ],
          method: 'Furrow irrigation or sprinkler',
          totalWaterRequirement: 350.0,
          waterQuality: 'Good quality water, EC < 1.0 dS/m',
          criticalStages: ['Crown Root Initiation', 'Flowering', 'Grain Filling'],
        ),
        fertilizer: FertilizerSchedule(
          applications: [
            FertilizerApplication(
              stage: 'Basal',
              daysAfterSowing: 0,
              npkRatio: '80:40:20',
              quantity: 140.0,
              unit: 'kg/hectare',
              method: 'Broadcasting and incorporation',
              notes: 'Apply full P & K, half nitrogen',
            ),
            FertilizerApplication(
              stage: 'First Top Dressing',
              daysAfterSowing: 25,
              npkRatio: '40:0:0',
              quantity: 40.0,
              unit: 'kg/hectare',
              method: 'Side dressing',
              notes: 'Apply remaining nitrogen',
            ),
          ],
          organic: OrganicFertilizers(
            farmyardManure: '8-10 tons/hectare',
            compost: '6-8 tons/hectare',
            vermicompost: '4-5 tons/hectare',
            greenManure: 'Dhaincha or Cluster bean',
            biofertilizers: ['Azotobacter', 'PSB'],
          ),
          micronutrients: ['Zinc Sulphate @ 25 kg/ha'],
          soilTesting: 'Annual soil testing recommended',
        ),
        pestManagement: PestManagement(
          pests: [
            CommonPest(
              name: 'Aphid',
              hindiName: 'माहू',
              scientificName: 'Rhopalosiphum maidis',
              description: 'Small green insects that suck plant juices',
              symptoms: ['Yellowing of leaves', 'Honeydew secretion', 'Sooty mold'],
              control: [
                'Spray Imidacloprid @ 0.3 ml/liter',
                'Use yellow sticky traps',
                'Encourage natural enemies'
              ],
              severity: 'Medium',
            ),
          ],
          diseases: [
            CommonDisease(
              name: 'Rust',
              hindiName: 'गेरुआ रोग',
              scientificName: 'Puccinia graminis',
              type: 'Fungal',
              symptoms: ['Orange pustules on leaves', 'Reduced photosynthesis'],
              prevention: ['Use resistant varieties', 'Avoid late sowing'],
              treatment: ['Spray Propiconazole @ 1 ml/liter'],
              severity: 'High',
            ),
          ],
          ipm: IntegratedPestManagement(
            cultural: ['Crop rotation', 'Resistant varieties', 'Timely sowing'],
            biological: ['Natural enemies conservation', 'Biocontrol agents'],
            mechanical: ['Light traps', 'Pheromone traps'],
            chemical: ['Need-based application', 'Recommended pesticides'],
            monitoring: 'Regular field scouting',
          ),
          organicSolutions: ['Neem oil', 'NSKE spray'],
          chemicalSolutions: ['Imidacloprid', 'Propiconazole'],
        ),
        harvesting: HarvestingInfo(
          maturitySigns: [
            'Golden yellow color of crop',
            'Moisture content 20%',
            'Easy separation of grains'
          ],
          harvestingMethod: 'Combine harvester or manual cutting',
          bestTime: 'Early morning',
          weatherConditions: 'Dry and sunny',
          tools: 'Combine harvester, Sickle',
          expectedYield: 3.5,
          yieldUnit: 'tons/hectare',
        ),
        postHarvest: PostHarvestCare(
          processing: ['Threshing', 'Cleaning', 'Grading'],
          storage: StorageInfo(
            method: 'Silos or warehouses',
            temperature: '20-25°C',
            humidity: '60%',
            duration: '12 months',
            precautions: ['Moisture control', 'Pest management'],
          ),
          packaging: ['Jute bags', 'PP bags'],
          transportation: ['Covered trucks'],
          quality: QualityStandards(
            grades: ['Superior', 'Good', 'Fair'],
            specifications: ['Protein > 12%', 'Moisture < 14%'],
            certification: 'FCI standards',
            export: ['Middle East', 'Africa'],
          ),
        ),
        tips: [
          'Choose high-yielding varieties',
          'Timely sowing is crucial',
          'Balanced fertilization'
        ],
        warnings: [
          'Avoid water stress during flowering',
          'Monitor for rust disease'
        ],
      ),
      diseases: ['Rust', 'Smut', 'Bunt'],
      pests: ['Aphid', 'Termites', 'Cut worms'],
      marketInfo: MarketInfo(
        currentPrice: 2800.0,
        priceUnit: 'Rs/quintal',
        majorMarkets: ['Indore', 'Bhopal', 'Delhi'],
        demand: 'Steady demand for semolina industry',
        exportPotential: 'Good export potential',
        buyers: ['Flour mills', 'Semolina manufacturers'],
        priceRange: '2500-3200 Rs/quintal',
      ),
      images: ['assets/crops/durum_wheat.jpg'],
    ),

    // Add more crops here...
  };

  /// Get crops suitable for a specific state
  static List<IndianCrop> getCropsForState(IndianState state) {
    return crops.values
        .where((crop) => crop.suitableStates.contains(state))
        .toList();
  }

  /// Get crops by category
  static List<IndianCrop> getCropsByCategory(CropCategory category) {
    return crops.values
        .where((crop) => crop.category == category)
        .toList();
  }

  /// Get crops by season
  static List<IndianCrop> getCropsBySeason(CropSeason season) {
    return crops.values
        .where((crop) => crop.seasons.contains(season))
        .toList();
  }

  /// Get crops suitable for specific soil type
  static List<IndianCrop> getCropsForSoil(SoilType soilType) {
    return crops.values
        .where((crop) => crop.suitableSoils.contains(soilType))
        .toList();
  }

  /// Search crops by name
  static List<IndianCrop> searchCrops(String query) {
    final lowerQuery = query.toLowerCase();
    return crops.values
        .where((crop) =>
            crop.name.toLowerCase().contains(lowerQuery) ||
            crop.hindiName.contains(query) ||
            crop.scientificName.toLowerCase().contains(lowerQuery))
        .toList();
  }
}

/// Provider for Indian crop database
final indianCropDatabaseProvider = Provider<IndianCropDatabase>((ref) {
  return IndianCropDatabase();
});

/// Provider for crops by state
final cropsForStateProvider = Provider.family<List<IndianCrop>, IndianState>((ref, state) {
  return IndianCropDatabase.getCropsForState(state);
});

/// Provider for crops by category
final cropsByCategoryProvider = Provider.family<List<IndianCrop>, CropCategory>((ref, category) {
  return IndianCropDatabase.getCropsByCategory(category);
});

/// Provider for crops by season
final cropsBySeasonProvider = Provider.family<List<IndianCrop>, CropSeason>((ref, season) {
  return IndianCropDatabase.getCropsBySeason(season);
});

/// Provider for crop search
final cropSearchProvider = Provider.family<List<IndianCrop>, String>((ref, query) {
  if (query.isEmpty) return [];
  return IndianCropDatabase.searchCrops(query);
});
