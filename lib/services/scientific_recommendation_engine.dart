import 'dart:math' as math;
import 'package:geolocator/geolocator.dart';
import 'indian_market_price_service.dart';
import 'indian_weather_service.dart';

class ScientificRecommendationEngine {
  static ScientificRecommendationEngine? _instance;
  static ScientificRecommendationEngine get instance => _instance ??= ScientificRecommendationEngine._internal();
  ScientificRecommendationEngine._internal();

  // ICAR (Indian Council of Agricultural Research) approved data
  final Map<String, ICARCropData> _icarCropDatabase = {};
  final Map<String, SoilHealthCard> _soilHealthDatabase = {};
  
  // Initialize with ICAR scientific data
  Future<void> initializeScientificData() async {
    await _loadICARCropData();
    await _loadSoilHealthData();
    await _loadClimateZoneData();
  }

  // Generate comprehensive scientific recommendations
  Future<ScientificRecommendations> generateScientificRecommendations(
    Position userLocation,
    MarketPriceData marketData,
    ComprehensiveWeatherData weatherData,
    UserFarmProfile farmProfile,
  ) async {
    try {
      // Get location-specific data
      final locationData = await _getLocationSpecificData(userLocation);
      
      // Analyze soil suitability
      final soilAnalysis = await _analyzeSoilSuitability(userLocation, farmProfile.soilType);
      
      // Generate crop recommendations based on multiple factors
      final cropRecommendations = await _generateCropRecommendations(
        locationData,
        weatherData,
        marketData,
        soilAnalysis,
        farmProfile,
      );
      
      // Generate planting calendar
      final plantingCalendar = await _generatePlantingCalendar(
        userLocation,
        weatherData,
        cropRecommendations,
      );
      
      // Generate input recommendations
      final inputRecommendations = await _generateInputRecommendations(
        cropRecommendations,
        soilAnalysis,
        weatherData,
      );
      
      // Generate risk assessments
      final riskAssessment = await _generateRiskAssessment(
        weatherData,
        cropRecommendations,
        marketData,
      );
      
      // Generate sustainability recommendations
      final sustainabilityAdvice = await _generateSustainabilityRecommendations(
        farmProfile,
        soilAnalysis,
        weatherData,
      );
      
      return ScientificRecommendations(
        locationData: locationData,
        soilAnalysis: soilAnalysis,
        cropRecommendations: cropRecommendations,
        plantingCalendar: plantingCalendar,
        inputRecommendations: inputRecommendations,
        riskAssessment: riskAssessment,
        sustainabilityAdvice: sustainabilityAdvice,
        confidenceScore: _calculateOverallConfidence(cropRecommendations),
        generatedAt: DateTime.now(),
        validUntil: DateTime.now().add(Duration(days: 7)),
        scientificBasis: 'ICAR Guidelines & Research Data',
      );
    } catch (e) {
      throw Exception('Failed to generate scientific recommendations: $e');
    }
  }

  // Analyze soil suitability based on scientific parameters
  Future<SoilAnalysis> _analyzeSoilSuitability(
    Position location,
    String soilType,
  ) async {
    final soilHealthCard = _soilHealthDatabase[soilType] ?? _getDefaultSoilHealth(soilType);
    
    // Get regional soil characteristics
    final regionalSoil = await _getRegionalSoilData(location);
    
    return SoilAnalysis(
      soilType: soilType,
      phLevel: regionalSoil.phLevel,
      organicCarbon: regionalSoil.organicCarbon,
      nitrogen: regionalSoil.nitrogen,
      phosphorus: regionalSoil.phosphorus,
      potassium: regionalSoil.potassium,
      sulfur: regionalSoil.sulfur,
      zinc: regionalSoil.zinc,
      iron: regionalSoil.iron,
      manganese: regionalSoil.manganese,
      copper: regionalSoil.copper,
      boron: regionalSoil.boron,
      electricalConductivity: regionalSoil.electricalConductivity,
      waterHoldingCapacity: regionalSoil.waterHoldingCapacity,
      drainage: regionalSoil.drainage,
      erosionRisk: regionalSoil.erosionRisk,
      recommendations: await _generateSoilRecommendations(regionalSoil),
      suitableCrops: await _identifySuitableCrops(regionalSoil),
      amendments: await _recommendSoilAmendments(regionalSoil),
    );
  }

  // Generate ICAR-based crop recommendations
  Future<List<CropRecommendation>> _generateCropRecommendations(
    LocationData locationData,
    ComprehensiveWeatherData weatherData,
    MarketPriceData marketData,
    SoilAnalysis soilAnalysis,
    UserFarmProfile farmProfile,
  ) async {
    final List<CropRecommendation> recommendations = [];
    
    // Get all possible crops for the region
    final availableCrops = await _getRegionalCrops(locationData.state, locationData.district);
    
    for (String cropName in availableCrops) {
      final icarData = _icarCropDatabase[cropName];
      if (icarData == null) continue;
      
      // Calculate suitability scores
      final climateSuitability = _calculateClimateSuitability(cropName, weatherData, locationData);
      final soilSuitability = _calculateSoilSuitability(cropName, soilAnalysis);
      final marketViability = _calculateMarketViability(cropName, marketData, farmProfile);
      final riskFactor = _calculateRiskFactor(cropName, weatherData, marketData);
      
      // Overall recommendation score (weighted average)
      final overallScore = (
        climateSuitability * 0.35 +
        soilSuitability * 0.25 +
        marketViability * 0.25 +
        (1 - riskFactor) * 0.15
      );
      
      if (overallScore >= 0.6) { // Only recommend if score is above 60%
        recommendations.add(CropRecommendation(
          cropName: cropName,
          variety: await _recommendBestVariety(cropName, locationData, soilAnalysis),
          overallScore: overallScore,
          climateSuitability: climateSuitability,
          soilSuitability: soilSuitability,
          marketViability: marketViability,
          riskFactor: riskFactor,
          expectedYield: await _calculateExpectedYield(cropName, locationData, soilAnalysis, weatherData),
          expectedIncome: await _calculateExpectedIncome(cropName, marketData, farmProfile.landSize),
          inputCost: await _calculateInputCost(cropName, farmProfile.landSize, locationData),
          profitMargin: 0.0, // Will be calculated after income and cost
          waterRequirement: icarData.waterRequirement,
          growingPeriod: icarData.growingPeriod,
          plantingWindow: await _calculatePlantingWindow(cropName, locationData, weatherData),
          scientificReasons: await _generateScientificReasons(cropName, overallScore, climateSuitability, soilSuitability),
          icarGuidelines: icarData.guidelines,
          bestPractices: icarData.bestPractices,
        ));
      }
    }
    
    // Sort by overall score and return top recommendations
    recommendations.sort((a, b) => b.overallScore.compareTo(a.overallScore));
    return recommendations.take(10).toList();
  }

  // Calculate climate suitability based on ICAR parameters
  double _calculateClimateSuitability(
    String cropName,
    ComprehensiveWeatherData weatherData,
    LocationData locationData,
  ) {
    final icarData = _icarCropDatabase[cropName]!;
    double score = 0.0;
    
    // Temperature suitability (40% weight)
    final temp = weatherData.currentWeather.temperature;
    if (temp >= icarData.optimalTemperature.min && temp <= icarData.optimalTemperature.max) {
      score += 0.4;
    } else {
      final tempDeviation = math.min(
        (temp - icarData.optimalTemperature.min).abs(),
        (temp - icarData.optimalTemperature.max).abs(),
      );
      score += 0.4 * math.max(0, 1 - (tempDeviation / 10)); // Penalty for deviation
    }
    
    // Rainfall suitability (35% weight)
    final annualRainfall = await _getAnnualRainfall(locationData);
    if (annualRainfall >= icarData.rainfallRequirement.min && annualRainfall <= icarData.rainfallRequirement.max) {
      score += 0.35;
    } else {
      final rainDeviation = math.min(
        (annualRainfall - icarData.rainfallRequirement.min).abs(),
        (annualRainfall - icarData.rainfallRequirement.max).abs(),
      );
      score += 0.35 * math.max(0, 1 - (rainDeviation / 500)); // Penalty for deviation
    }
    
    // Seasonal suitability (25% weight)
    final currentSeason = _getCurrentSeason(DateTime.now());
    if (icarData.suitableSeasons.contains(currentSeason)) {
      score += 0.25;
    } else if (_isTransitionPeriod(currentSeason, icarData.suitableSeasons)) {
      score += 0.125; // Half credit for transition periods
    }
    
    return math.min(1.0, score);
  }

  // Generate planting calendar based on weather and crop requirements
  Future<PlantingCalendar> _generatePlantingCalendar(
    Position location,
    ComprehensiveWeatherData weatherData,
    List<CropRecommendation> cropRecommendations,
  ) async {
    final Map<String, List<PlantingWindow>> monthlyCalendar = {};
    
    for (int month = 1; month <= 12; month++) {
      final List<PlantingWindow> monthActivities = [];
      
      for (var crop in cropRecommendations.take(5)) { // Top 5 crops
        final icarData = _icarCropDatabase[crop.cropName]!;
        
        if (icarData.plantingMonths.contains(month)) {
          monthActivities.add(PlantingWindow(
            cropName: crop.cropName,
            variety: crop.variety,
            activity: 'Planting',
            optimalDates: await _calculateOptimalPlantingDates(crop.cropName, month, location),
            weatherConsiderations: await _getMonthlyWeatherConsiderations(month, location),
            soilPreparation: icarData.soilPreparation,
            seedRate: icarData.seedRate,
            spacing: icarData.spacing,
          ));
        }
        
        // Calculate harvest month
        final harvestMonth = (month + (icarData.growingPeriod ~/ 30)) % 12;
        if (harvestMonth != 0) {
          monthActivities.add(PlantingWindow(
            cropName: crop.cropName,
            variety: crop.variety,
            activity: 'Harvesting',
            optimalDates: await _calculateOptimalHarvestDates(crop.cropName, harvestMonth, location),
            weatherConsiderations: await _getMonthlyWeatherConsiderations(harvestMonth, location),
            soilPreparation: '',
            seedRate: 0.0,
            spacing: '',
          ));
        }
      }
      
      monthlyCalendar[_getMonthName(month)] = monthActivities;
    }
    
    return PlantingCalendar(
      monthlyActivities: monthlyCalendar,
      seasonalAdvice: await _generateSeasonalAdvice(location, weatherData),
      monsoonPreparation: await _generateMonsoonPreparation(location, weatherData),
      climateRisks: await _identifyClimateRisks(location, weatherData),
    );
  }

  // Generate input recommendations based on scientific data
  Future<InputRecommendations> _generateInputRecommendations(
    List<CropRecommendation> cropRecommendations,
    SoilAnalysis soilAnalysis,
    ComprehensiveWeatherData weatherData,
  ) async {
    final Map<String, FertilizerRecommendation> fertilizerRecommendations = {};
    final Map<String, SeedRecommendation> seedRecommendations = {};
    final Map<String, PestControlRecommendation> pestControlRecommendations = {};
    
    for (var crop in cropRecommendations.take(3)) { // Top 3 crops
      final icarData = _icarCropDatabase[crop.cropName]!;
      
      // Fertilizer recommendations based on soil test and ICAR guidelines
      fertilizerRecommendations[crop.cropName] = FertilizerRecommendation(
        cropName: crop.cropName,
        nitrogen: _calculateNitrogenRequirement(crop.cropName, soilAnalysis),
        phosphorus: _calculatePhosphorusRequirement(crop.cropName, soilAnalysis),
        potassium: _calculatePotassiumRequirement(crop.cropName, soilAnalysis),
        organicMatter: _calculateOrganicMatterRequirement(crop.cropName, soilAnalysis),
        micronutrients: _calculateMicronutrientRequirement(crop.cropName, soilAnalysis),
        applicationSchedule: icarData.fertilizerSchedule,
        organicAlternatives: icarData.organicFertilizers,
      );
      
      // Seed recommendations
      seedRecommendations[crop.cropName] = SeedRecommendation(
        cropName: crop.cropName,
        recommendedVariety: crop.variety,
        seedRate: icarData.seedRate,
        seedTreatment: icarData.seedTreatment,
        sourcingGuidance: await _getSeedSourcingGuidance(crop.cropName, crop.variety),
        qualityParameters: icarData.seedQualityParameters,
      );
      
      // Pest and disease control
      pestControlRecommendations[crop.cropName] = PestControlRecommendation(
        cropName: crop.cropName,
        commonPests: icarData.commonPests,
        commonDiseases: icarData.commonDiseases,
        ipmSchedule: icarData.ipmSchedule,
        organicSolutions: icarData.organicPestControl,
        weatherBasedAlerts: await _generateWeatherBasedPestAlerts(crop.cropName, weatherData),
      );
    }
    
    return InputRecommendations(
      fertilizerRecommendations: fertilizerRecommendations,
      seedRecommendations: seedRecommendations,
      pestControlRecommendations: pestControlRecommendations,
      irrigationSchedule: await _generateIrrigationSchedule(cropRecommendations, weatherData, soilAnalysis),
      costEstimates: await _calculateInputCosts(cropRecommendations, fertilizerRecommendations),
    );
  }

  // Load ICAR crop data
  Future<void> _loadICARCropData() async {
    // This would normally load from a comprehensive database
    // For demonstration, here's a sample structure
    _icarCropDatabase['wheat'] = ICARCropData(
      cropName: 'wheat',
      scientificName: 'Triticum aestivum',
      optimalTemperature: TemperatureRange(min: 15.0, max: 25.0),
      rainfallRequirement: RainfallRange(min: 300, max: 600),
      soilPh: PhRange(min: 6.0, max: 7.5),
      growingPeriod: 120, // days
      plantingMonths: [11, 12, 1], // November, December, January
      suitableSeasons: ['Rabi'],
      waterRequirement: 450.0, // mm
      seedRate: 100.0, // kg/hectare
      spacing: '20 cm between rows',
      soilPreparation: 'Deep ploughing followed by 2-3 harrowings',
      fertilizerSchedule: 'N:P:K = 120:60:40 kg/ha',
      commonPests: ['Aphids', 'Termites', 'Cutworms'],
      commonDiseases: ['Rust', 'Smut', 'Blight'],
      guidelines: 'Follow ICAR-IARI wheat production guidelines',
      bestPractices: ['Zero tillage', 'Crop rotation', 'Timely sowing'],
      organicFertilizers: ['FYM', 'Compost', 'Vermicompost'],
      seedTreatment: 'Treat with fungicide + insecticide',
      seedQualityParameters: 'Germination > 85%, Purity > 98%',
      ipmSchedule: 'Monitor weekly, apply IPM as needed',
      organicPestControl: ['Neem oil', 'Trichoderma', 'Pheromone traps'],
    );
    
    // Add rice data
    _icarCropDatabase['rice'] = ICARCropData(
      cropName: 'rice',
      scientificName: 'Oryza sativa',
      optimalTemperature: TemperatureRange(min: 20.0, max: 30.0),
      rainfallRequirement: RainfallRange(min: 1000, max: 2000),
      soilPh: PhRange(min: 5.5, max: 7.0),
      growingPeriod: 120,
      plantingMonths: [6, 7, 8], // June, July, August
      suitableSeasons: ['Kharif'],
      waterRequirement: 1200.0,
      seedRate: 25.0,
      spacing: '20 x 15 cm',
      soilPreparation: 'Puddling and leveling',
      fertilizerSchedule: 'N:P:K = 150:75:75 kg/ha',
      commonPests: ['Stem borer', 'Brown planthopper', 'Leaf folder'],
      commonDiseases: ['Blast', 'Bacterial blight', 'Sheath blight'],
      guidelines: 'Follow ICAR-IRRI rice production guidelines',
      bestPractices: ['System of Rice Intensification', 'Direct seeding', 'Water management'],
      organicFertilizers: ['FYM', 'Green manure', 'Azolla'],
      seedTreatment: 'Carbendazim + Thiram treatment',
      seedQualityParameters: 'Germination > 80%, Purity > 98%',
      ipmSchedule: 'Weekly monitoring, pheromone traps',
      organicPestControl: ['Neem extract', 'Trichoderma', 'Light traps'],
    );
    
    // Add more crops as needed...
  }

  Future<void> _loadSoilHealthData() async {
    // Load soil health card data
  }

  Future<void> _loadClimateZoneData() async {
    // Load climate zone specific data
  }

  // Helper methods with placeholder implementations
  Future<LocationData> _getLocationSpecificData(Position position) async {
    return LocationData(
      state: 'Unknown',
      district: 'Unknown',
      climateZone: 'Tropical',
      agroEcologicalZone: 'Zone 1',
    );
  }

  SoilHealthCard _getDefaultSoilHealth(String soilType) {
    return SoilHealthCard(
      soilType: soilType,
      phLevel: 6.5,
      organicCarbon: 0.5,
      nitrogen: 250.0,
      phosphorus: 20.0,
      potassium: 150.0,
    );
  }

  Future<RegionalSoilData> _getRegionalSoilData(Position location) async {
    return RegionalSoilData(
      phLevel: 6.5,
      organicCarbon: 0.5,
      nitrogen: 250.0,
      phosphorus: 20.0,
      potassium: 150.0,
      sulfur: 10.0,
      zinc: 1.2,
      iron: 4.5,
      manganese: 2.0,
      copper: 0.8,
      boron: 0.5,
      electricalConductivity: 0.3,
      waterHoldingCapacity: 45.0,
      drainage: 'Good',
      erosionRisk: 'Low',
    );
  }

  Future<List<String>> _generateSoilRecommendations(RegionalSoilData soil) async {
    return ['Apply organic matter', 'Monitor pH levels'];
  }

  Future<List<String>> _identifySuitableCrops(RegionalSoilData soil) async {
    return ['wheat', 'rice', 'maize'];
  }

  Future<List<String>> _recommendSoilAmendments(RegionalSoilData soil) async {
    return ['Lime application', 'Gypsum for saline soils'];
  }

  Future<List<String>> _getRegionalCrops(String state, String district) async {
    return ['wheat', 'rice', 'maize', 'cotton', 'sugarcane'];
  }

  double _calculateSoilSuitability(String cropName, SoilAnalysis soilAnalysis) {
    return 0.8; // Placeholder
  }

  double _calculateMarketViability(String cropName, MarketPriceData marketData, UserFarmProfile farmProfile) {
    return 0.7; // Placeholder
  }

  double _calculateRiskFactor(String cropName, ComprehensiveWeatherData weatherData, MarketPriceData marketData) {
    return 0.3; // Placeholder
  }

  Future<String> _recommendBestVariety(String cropName, LocationData locationData, SoilAnalysis soilAnalysis) async {
    return 'Recommended Variety';
  }

  Future<double> _calculateExpectedYield(String cropName, LocationData locationData, SoilAnalysis soilAnalysis, ComprehensiveWeatherData weatherData) async {
    return 4.5; // tonnes per hectare
  }

  Future<double> _calculateExpectedIncome(String cropName, MarketPriceData marketData, double landSize) async {
    return 100000.0; // INR
  }

  Future<double> _calculateInputCost(String cropName, double landSize, LocationData locationData) async {
    return 25000.0; // INR
  }

  Future<String> _calculatePlantingWindow(String cropName, LocationData locationData, ComprehensiveWeatherData weatherData) async {
    return 'November - December';
  }

  Future<List<String>> _generateScientificReasons(String cropName, double overallScore, double climateSuitability, double soilSuitability) async {
    return ['Suitable climate conditions', 'Good soil parameters'];
  }

  double _calculateOverallConfidence(List<CropRecommendation> recommendations) {
    if (recommendations.isEmpty) return 0.0;
    return recommendations.map((r) => r.overallScore).reduce((a, b) => a + b) / recommendations.length;
  }

  Future<double> _getAnnualRainfall(LocationData locationData) async {
    return 800.0; // mm
  }

  String _getCurrentSeason(DateTime date) {
    final month = date.month;
    if (month >= 6 && month <= 9) return 'Kharif';
    if (month >= 10 && month <= 3) return 'Rabi';
    return 'Zaid';
  }

  bool _isTransitionPeriod(String currentSeason, List<String> suitableSeasons) {
    return false; // Placeholder
  }

  Future<List<String>> _calculateOptimalPlantingDates(String cropName, int month, Position location) async {
    return ['1st week', '2nd week'];
  }

  Future<List<String>> _getMonthlyWeatherConsiderations(int month, Position location) async {
    return ['Monitor rainfall', 'Check temperature'];
  }

  Future<List<String>> _calculateOptimalHarvestDates(String cropName, int month, Position location) async {
    return ['3rd week', '4th week'];
  }

  String _getMonthName(int month) {
    const months = ['', 'January', 'February', 'March', 'April', 'May', 'June',
                   'July', 'August', 'September', 'October', 'November', 'December'];
    return months[month];
  }

  Future<List<String>> _generateSeasonalAdvice(Position location, ComprehensiveWeatherData weatherData) async {
    return ['Prepare for monsoon', 'Check irrigation systems'];
  }

  Future<List<String>> _generateMonsoonPreparation(Position location, ComprehensiveWeatherData weatherData) async {
    return ['Clean drainage channels', 'Prepare water storage'];
  }

  Future<List<String>> _identifyClimateRisks(Position location, ComprehensiveWeatherData weatherData) async {
    return ['Drought risk', 'Flood risk'];
  }

  double _calculateNitrogenRequirement(String cropName, SoilAnalysis soilAnalysis) {
    return 120.0; // kg/ha
  }

  double _calculatePhosphorusRequirement(String cropName, SoilAnalysis soilAnalysis) {
    return 60.0; // kg/ha
  }

  double _calculatePotassiumRequirement(String cropName, SoilAnalysis soilAnalysis) {
    return 40.0; // kg/ha
  }

  double _calculateOrganicMatterRequirement(String cropName, SoilAnalysis soilAnalysis) {
    return 5.0; // tonnes/ha
  }

  Map<String, double> _calculateMicronutrientRequirement(String cropName, SoilAnalysis soilAnalysis) {
    return {'Zinc': 5.0, 'Boron': 1.0};
  }

  Future<String> _getSeedSourcingGuidance(String cropName, String variety) async {
    return 'Source from certified seed dealers';
  }

  Future<List<String>> _generateWeatherBasedPestAlerts(String cropName, ComprehensiveWeatherData weatherData) async {
    return ['Monitor for aphids during warm weather'];
  }

  Future<String> _generateIrrigationSchedule(List<CropRecommendation> cropRecommendations, ComprehensiveWeatherData weatherData, SoilAnalysis soilAnalysis) async {
    return 'Irrigate weekly based on soil moisture';
  }

  Future<Map<String, double>> _calculateInputCosts(List<CropRecommendation> cropRecommendations, Map<String, FertilizerRecommendation> fertilizerRecommendations) async {
    return {'Seeds': 5000.0, 'Fertilizers': 15000.0, 'Pesticides': 5000.0};
  }

  Future<RiskAssessment> _generateRiskAssessment(ComprehensiveWeatherData weatherData, List<CropRecommendation> cropRecommendations, MarketPriceData marketData) async {
    return RiskAssessment(
      weatherRisks: ['Drought', 'Excessive rainfall'],
      marketRisks: ['Price volatility'],
      productionRisks: ['Pest attacks'],
      mitigation: ['Crop insurance', 'Diversification'],
    );
  }

  Future<SustainabilityAdvice> _generateSustainabilityRecommendations(UserFarmProfile farmProfile, SoilAnalysis soilAnalysis, ComprehensiveWeatherData weatherData) async {
    return SustainabilityAdvice(
      organicPractices: ['Composting', 'Green manure'],
      waterConservation: ['Drip irrigation', 'Rainwater harvesting'],
      soilHealth: ['Cover crops', 'Crop rotation'],
      biodiversity: ['Companion planting', 'Wildlife corridors'],
    );
  }
}

// Data models for scientific recommendations
class ScientificRecommendations {
  final LocationData locationData;
  final SoilAnalysis soilAnalysis;
  final List<CropRecommendation> cropRecommendations;
  final PlantingCalendar plantingCalendar;
  final InputRecommendations inputRecommendations;
  final RiskAssessment riskAssessment;
  final SustainabilityAdvice sustainabilityAdvice;
  final double confidenceScore;
  final DateTime generatedAt;
  final DateTime validUntil;
  final String scientificBasis;

  ScientificRecommendations({
    required this.locationData,
    required this.soilAnalysis,
    required this.cropRecommendations,
    required this.plantingCalendar,
    required this.inputRecommendations,
    required this.riskAssessment,
    required this.sustainabilityAdvice,
    required this.confidenceScore,
    required this.generatedAt,
    required this.validUntil,
    required this.scientificBasis,
  });
}

// Supporting data models
class ICARCropData {
  final String cropName;
  final String scientificName;
  final TemperatureRange optimalTemperature;
  final RainfallRange rainfallRequirement;
  final PhRange soilPh;
  final int growingPeriod;
  final List<int> plantingMonths;
  final List<String> suitableSeasons;
  final double waterRequirement;
  final double seedRate;
  final String spacing;
  final String soilPreparation;
  final String fertilizerSchedule;
  final List<String> commonPests;
  final List<String> commonDiseases;
  final String guidelines;
  final List<String> bestPractices;
  final List<String> organicFertilizers;
  final String seedTreatment;
  final String seedQualityParameters;
  final String ipmSchedule;
  final List<String> organicPestControl;

  ICARCropData({
    required this.cropName,
    required this.scientificName,
    required this.optimalTemperature,
    required this.rainfallRequirement,
    required this.soilPh,
    required this.growingPeriod,
    required this.plantingMonths,
    required this.suitableSeasons,
    required this.waterRequirement,
    required this.seedRate,
    required this.spacing,
    required this.soilPreparation,
    required this.fertilizerSchedule,
    required this.commonPests,
    required this.commonDiseases,
    required this.guidelines,
    required this.bestPractices,
    required this.organicFertilizers,
    required this.seedTreatment,
    required this.seedQualityParameters,
    required this.ipmSchedule,
    required this.organicPestControl,
  });
}

class UserFarmProfile {
  final String soilType;
  final double landSize;
  final String irrigationType;
  final List<String> currentCrops;

  UserFarmProfile({
    required this.soilType,
    required this.landSize,
    required this.irrigationType,
    required this.currentCrops,
  });
}

class LocationData {
  final String state;
  final String district;
  final String climateZone;
  final String agroEcologicalZone;

  LocationData({
    required this.state,
    required this.district,
    required this.climateZone,
    required this.agroEcologicalZone,
  });
}

class SoilHealthCard {
  final String soilType;
  final double phLevel;
  final double organicCarbon;
  final double nitrogen;
  final double phosphorus;
  final double potassium;

  SoilHealthCard({
    required this.soilType,
    required this.phLevel,
    required this.organicCarbon,
    required this.nitrogen,
    required this.phosphorus,
    required this.potassium,
  });
}

class RegionalSoilData {
  final double phLevel;
  final double organicCarbon;
  final double nitrogen;
  final double phosphorus;
  final double potassium;
  final double sulfur;
  final double zinc;
  final double iron;
  final double manganese;
  final double copper;
  final double boron;
  final double electricalConductivity;
  final double waterHoldingCapacity;
  final String drainage;
  final String erosionRisk;

  RegionalSoilData({
    required this.phLevel,
    required this.organicCarbon,
    required this.nitrogen,
    required this.phosphorus,
    required this.potassium,
    required this.sulfur,
    required this.zinc,
    required this.iron,
    required this.manganese,
    required this.copper,
    required this.boron,
    required this.electricalConductivity,
    required this.waterHoldingCapacity,
    required this.drainage,
    required this.erosionRisk,
  });
}

class SoilAnalysis {
  final String soilType;
  final double phLevel;
  final double organicCarbon;
  final double nitrogen;
  final double phosphorus;
  final double potassium;
  final double sulfur;
  final double zinc;
  final double iron;
  final double manganese;
  final double copper;
  final double boron;
  final double electricalConductivity;
  final double waterHoldingCapacity;
  final String drainage;
  final String erosionRisk;
  final List<String> recommendations;
  final List<String> suitableCrops;
  final List<String> amendments;

  SoilAnalysis({
    required this.soilType,
    required this.phLevel,
    required this.organicCarbon,
    required this.nitrogen,
    required this.phosphorus,
    required this.potassium,
    required this.sulfur,
    required this.zinc,
    required this.iron,
    required this.manganese,
    required this.copper,
    required this.boron,
    required this.electricalConductivity,
    required this.waterHoldingCapacity,
    required this.drainage,
    required this.erosionRisk,
    required this.recommendations,
    required this.suitableCrops,
    required this.amendments,
  });
}

class CropRecommendation {
  final String cropName;
  final String variety;
  final double overallScore;
  final double climateSuitability;
  final double soilSuitability;
  final double marketViability;
  final double riskFactor;
  final double expectedYield;
  final double expectedIncome;
  final double inputCost;
  final double profitMargin;
  final double waterRequirement;
  final int growingPeriod;
  final String plantingWindow;
  final List<String> scientificReasons;
  final String icarGuidelines;
  final List<String> bestPractices;

  CropRecommendation({
    required this.cropName,
    required this.variety,
    required this.overallScore,
    required this.climateSuitability,
    required this.soilSuitability,
    required this.marketViability,
    required this.riskFactor,
    required this.expectedYield,
    required this.expectedIncome,
    required this.inputCost,
    required this.profitMargin,
    required this.waterRequirement,
    required this.growingPeriod,
    required this.plantingWindow,
    required this.scientificReasons,
    required this.icarGuidelines,
    required this.bestPractices,
  });
}

class PlantingCalendar {
  final Map<String, List<PlantingWindow>> monthlyActivities;
  final List<String> seasonalAdvice;
  final List<String> monsoonPreparation;
  final List<String> climateRisks;

  PlantingCalendar({
    required this.monthlyActivities,
    required this.seasonalAdvice,
    required this.monsoonPreparation,
    required this.climateRisks,
  });
}

class PlantingWindow {
  final String cropName;
  final String variety;
  final String activity;
  final List<String> optimalDates;
  final List<String> weatherConsiderations;
  final String soilPreparation;
  final double seedRate;
  final String spacing;

  PlantingWindow({
    required this.cropName,
    required this.variety,
    required this.activity,
    required this.optimalDates,
    required this.weatherConsiderations,
    required this.soilPreparation,
    required this.seedRate,
    required this.spacing,
  });
}

class InputRecommendations {
  final Map<String, FertilizerRecommendation> fertilizerRecommendations;
  final Map<String, SeedRecommendation> seedRecommendations;
  final Map<String, PestControlRecommendation> pestControlRecommendations;
  final String irrigationSchedule;
  final Map<String, double> costEstimates;

  InputRecommendations({
    required this.fertilizerRecommendations,
    required this.seedRecommendations,
    required this.pestControlRecommendations,
    required this.irrigationSchedule,
    required this.costEstimates,
  });
}

class FertilizerRecommendation {
  final String cropName;
  final double nitrogen;
  final double phosphorus;
  final double potassium;
  final double organicMatter;
  final Map<String, double> micronutrients;
  final String applicationSchedule;
  final List<String> organicAlternatives;

  FertilizerRecommendation({
    required this.cropName,
    required this.nitrogen,
    required this.phosphorus,
    required this.potassium,
    required this.organicMatter,
    required this.micronutrients,
    required this.applicationSchedule,
    required this.organicAlternatives,
  });
}

class SeedRecommendation {
  final String cropName;
  final String recommendedVariety;
  final double seedRate;
  final String seedTreatment;
  final String sourcingGuidance;
  final String qualityParameters;

  SeedRecommendation({
    required this.cropName,
    required this.recommendedVariety,
    required this.seedRate,
    required this.seedTreatment,
    required this.sourcingGuidance,
    required this.qualityParameters,
  });
}

class PestControlRecommendation {
  final String cropName;
  final List<String> commonPests;
  final List<String> commonDiseases;
  final String ipmSchedule;
  final List<String> organicSolutions;
  final List<String> weatherBasedAlerts;

  PestControlRecommendation({
    required this.cropName,
    required this.commonPests,
    required this.commonDiseases,
    required this.ipmSchedule,
    required this.organicSolutions,
    required this.weatherBasedAlerts,
  });
}

class RiskAssessment {
  final List<String> weatherRisks;
  final List<String> marketRisks;
  final List<String> productionRisks;
  final List<String> mitigation;

  RiskAssessment({
    required this.weatherRisks,
    required this.marketRisks,
    required this.productionRisks,
    required this.mitigation,
  });
}

class SustainabilityAdvice {
  final List<String> organicPractices;
  final List<String> waterConservation;
  final List<String> soilHealth;
  final List<String> biodiversity;

  SustainabilityAdvice({
    required this.organicPractices,
    required this.waterConservation,
    required this.soilHealth,
    required this.biodiversity,
  });
}

class TemperatureRange {
  final double min;
  final double max;

  TemperatureRange({required this.min, required this.max});
}

class RainfallRange {
  final double min;
  final double max;

  RainfallRange({required this.min, required this.max});
}

class PhRange {
  final double min;
  final double max;

  PhRange({required this.min, required this.max});
}
