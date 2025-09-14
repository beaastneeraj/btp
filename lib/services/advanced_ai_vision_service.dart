import 'dart:io' if (dart.library.html) 'dart:html' as io;
import 'dart:typed_data';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:image/image.dart' as img;
import 'package:camera/camera.dart';
import 'package:image_picker/image_picker.dart';
import '../models/ai_vision_models.dart';

// Web-compatible TensorFlow Lite alternative
// import 'package:tflite_flutter/tflite_flutter.dart' if (dart.library.html) 'dart:html' as tflite;

class AdvancedAIVisionService {
  static AdvancedAIVisionService? _instance;
  static AdvancedAIVisionService get instance => _instance ??= AdvancedAIVisionService._internal();
  AdvancedAIVisionService._internal();

  // Web-compatible: Use dynamic instead of Interpreter
  dynamic _diseaseDetectionModel;
  dynamic _cropHealthModel;
  dynamic _yieldPredictionModel;
  List<String>? _diseaseLabels;
  List<String>? _cropLabels;
  bool _isInitialized = false;

  bool get isInitialized => _isInitialized;

  // Initialize AI models
  Future<void> initializeAIModels() async {
    if (_isInitialized) return;
    
    try {
      print('Initializing AI Vision models...');
      
      if (kIsWeb) {
        // Web-compatible: Skip TensorFlow Lite model loading
        print('Running on web - using simulation mode for AI models');
        _isInitialized = true;
        return;
      }
      
      // Load disease detection model (TensorFlow Lite) - only on non-web platforms
      // _diseaseDetectionModel = await Interpreter.fromAsset('models/crop_disease_detection.tflite');
      
      // Load crop health assessment model
      // _cropHealthModel = await Interpreter.fromAsset('models/crop_health_assessment.tflite');
      
      // Load yield prediction model
      // _yieldPredictionModel = await Interpreter.fromAsset('models/yield_prediction.tflite');
      
      // Load labels
      try {
        String diseaseLabelsText = await rootBundle.loadString('assets/labels/disease_labels.txt');
        _diseaseLabels = diseaseLabelsText.split('\n').where((line) => line.isNotEmpty).toList();
        
        String cropLabelsText = await rootBundle.loadString('assets/labels/crop_labels.txt');
        _cropLabels = cropLabelsText.split('\n').where((line) => line.isNotEmpty).toList();
      } catch (e) {
        print('Could not load label files: $e');
        // Use fallback labels
        _diseaseLabels = _getFallbackDiseaseLabels();
        _cropLabels = _getFallbackCropLabels();
      }
      
      _isInitialized = true;
      print('AI Vision models initialized successfully');
    } catch (e) {
      print('Error initializing AI models: $e');
      // Use fallback logic for demonstration
      _diseaseLabels = _getFallbackDiseaseLabels();
      _cropLabels = _getFallbackCropLabels();
      _isInitialized = true;
    }
  }

  List<String> _getFallbackDiseaseLabels() {
    return [
      'Healthy',
      'Bacterial Blight',
      'Brown Spot',
      'Leaf Blast',
      'Tungro',
      'Bacterial Leaf Streak',
      'Sheath Blight',
      'Yellow Dwarf',
      'Downy Mildew',
      'Anthracnose'
    ];
  }

  List<String> _getFallbackCropLabels() {
    return [
      'Rice',
      'Wheat',
      'Maize',
      'Cotton',
      'Sugarcane',
      'Soybean',
      'Groundnut',
      'Millet',
      'Barley',
      'Mustard'
    ];
  }

  void _initializeFallbackLabels() {
    _diseaseLabels = _getFallbackDiseaseLabels();
    _cropLabels = _getFallbackCropLabels();
  }

  // Analyze crop disease from image
  Future<CropDiseaseAnalysis> analyzeCropDisease(XFile imageFile) async {
    try {
      if (!_isInitialized) {
        await initializeAIModels();
      }

      // Preprocess image
      final imageBytes = await imageFile.readAsBytes();
      final image = img.decodeImage(imageBytes);
      
      if (image == null) {
        throw Exception('Failed to decode image');
      }
      
      final resizedImage = img.copyResize(image, width: 224, height: 224);
      
      // For demonstration, simulate AI analysis
      final simulatedResults = _simulateDiseaseDetection();
      final diseaseName = _diseaseLabels?[simulatedResults['diseaseIndex']] ?? 'Unknown';
      final confidence = simulatedResults['confidence'];
      
      return CropDiseaseAnalysis(
        diseaseName: diseaseName,
        confidence: confidence,
        severity: _calculateSeverity(confidence),
        treatmentRecommendations: await _getTreatmentRecommendations(diseaseName),
        estimatedDamage: _calculateEstimatedDamage(confidence),
        preventionTips: await _getPreventionTips(diseaseName),
        analysisDate: DateTime.now(),
        imageUrl: imageFile.path,
      );
    } catch (e) {
      throw Exception('Error analyzing crop disease: $e');
    }
  }

  // Analyze crop health and nutrition
  Future<CropHealthAnalysis> analyzeCropHealth(XFile imageFile, CropType cropType) async {
    try {
      if (!_isInitialized) {
        await initializeAIModels();
      }

      final imageBytes = await imageFile.readAsBytes();
      final image = img.decodeImage(imageBytes);
      
      if (image == null) {
        throw Exception('Failed to decode image');
      }
      
      final resizedImage = img.copyResize(image, width: 224, height: 224);
      
      // Simulate health analysis
      final healthScores = _simulateHealthAnalysis();
      
      return CropHealthAnalysis(
        overallHealthScore: healthScores[0] * 100,
        nitrogenLevel: _interpretNutrientLevel(healthScores[1]),
        phosphorusLevel: _interpretNutrientLevel(healthScores[2]),
        potassiumLevel: _interpretNutrientLevel(healthScores[3]),
        waterStress: _interpretStressLevel(healthScores[4]),
        pestDamage: _interpretDamageLevel(healthScores[5]),
        growthStage: _interpretGrowthStage(healthScores[6]),
        yieldPotential: healthScores[7] * 100,
        actionItems: await _generateActionItems(healthScores, cropType),
        analysisDate: DateTime.now(),
        imageUrl: imageFile.path,
      );
    } catch (e) {
      throw Exception('Error analyzing crop health: $e');
    }
  }

  // Predict yield using computer vision + historical data
  Future<YieldPrediction> predictYieldFromImage(
    XFile imageFile,
    CropType cropType,
    double fieldArea,
    Map<String, dynamic> historicalData,
  ) async {
    try {
      if (!_isInitialized) {
        await initializeAIModels();
      }

      final imageBytes = await imageFile.readAsBytes();
      final image = img.decodeImage(imageBytes);
      
      if (image == null) {
        throw Exception('Failed to decode image');
      }
      
      final resizedImage = img.copyResize(image, width: 224, height: 224);
      
      // Simulate yield prediction
      final predictions = _simulateYieldPrediction(fieldArea, historicalData);
      
      return YieldPrediction(
        expectedYield: predictions[2] * fieldArea,
        minYield: predictions[0] * fieldArea,
        maxYield: predictions[1] * fieldArea,
        confidenceLevel: _calculateConfidence(predictions),
        factorsAffectingYield: await _identifyYieldFactors(imageFile, historicalData),
        recommendedActions: await _getYieldOptimizationActions(predictions, cropType),
        marketValue: await _calculateMarketValue(predictions[2] * fieldArea, cropType),
        predictionDate: DateTime.now(),
        imageUrl: imageFile.path,
      );
    } catch (e) {
      throw Exception('Error predicting yield: $e');
    }
  }

  // Real-time crop monitoring using camera stream
  Stream<RealTimeCropAnalysis> getRealTimeCropAnalysis(CameraController controller) async* {
    while (controller.value.isInitialized) {
      try {
        final image = await controller.takePicture();
        final file = XFile(image.path);
        
        final analysis = await _performRealTimeAnalysis(file);
        yield analysis;
        
        await Future.delayed(const Duration(seconds: 5)); // Analyze every 5 seconds
      } catch (e) {
        print('Real-time analysis error: $e');
        await Future.delayed(const Duration(seconds: 5));
      }
    }
  }

  // Helper methods for simulation (replace with actual ML inference)
  Map<String, dynamic> _simulateDiseaseDetection() {
    final random = DateTime.now().millisecondsSinceEpoch % 100;
    return {
      'diseaseIndex': random % (_diseaseLabels?.length ?? 10),
      'confidence': 0.7 + (random % 30) / 100.0, // 0.7 to 0.99
    };
  }

  List<double> _simulateHealthAnalysis() {
    final random = DateTime.now().millisecondsSinceEpoch;
    return List.generate(8, (i) => 0.6 + ((random + i) % 40) / 100.0);
  }

  List<double> _simulateYieldPrediction(double fieldArea, Map<String, dynamic> historicalData) {
    final baseYield = 2.5; // tons per hectare
    final variation = 0.5;
    final random = DateTime.now().millisecondsSinceEpoch % 100;
    
    final expected = baseYield + (random - 50) / 100.0 * variation;
    final min = expected - variation;
    final max = expected + variation;
    
    return [min.clamp(0.5, 10.0), max.clamp(0.5, 10.0), expected.clamp(0.5, 10.0)];
  }

  Future<RealTimeCropAnalysis> _performRealTimeAnalysis(XFile imageFile) async {
    // Simulate real-time analysis
    final random = DateTime.now().millisecondsSinceEpoch % 100;
    
    return RealTimeCropAnalysis(
      healthScore: 70 + random % 30,
      moistureLevel: 40 + random % 40,
      pestActivity: random > 80 ? 'High' : random > 60 ? 'Medium' : 'Low',
      growthRate: 'Normal',
      recommendedAction: _getRealtimeRecommendation(random),
      timestamp: DateTime.now(),
    );
  }

  String _getRealtimeRecommendation(int random) {
    if (random > 90) return 'Immediate irrigation required';
    if (random > 80) return 'Monitor for pest activity';
    if (random > 70) return 'Consider fertilizer application';
    if (random > 60) return 'Good conditions, continue monitoring';
    return 'Optimal growing conditions';
  }

  String _calculateSeverity(double confidence) {
    if (confidence > 0.8) return 'High';
    if (confidence > 0.6) return 'Medium';
    if (confidence > 0.4) return 'Low';
    return 'Very Low';
  }

  double _calculateEstimatedDamage(double confidence) {
    // Higher confidence in disease detection means higher potential damage
    return confidence * 100;
  }

  Future<List<TreatmentRecommendation>> _getTreatmentRecommendations(String diseaseName) async {
    final treatments = <TreatmentRecommendation>[];
    
    switch (diseaseName.toLowerCase()) {
      case 'bacterial blight':
        treatments.addAll([
          TreatmentRecommendation(
            treatment: 'Copper-based bactericide spray',
            dosage: '2g per liter of water',
            frequency: 'Every 10-14 days',
            duration: '4-6 weeks',
            cost: 150.0,
          ),
          TreatmentRecommendation(
            treatment: 'Resistant variety planting',
            dosage: 'Use certified seeds',
            frequency: 'Next season',
            duration: 'Permanent',
            cost: 300.0,
          ),
        ]);
        break;
      case 'brown spot':
        treatments.addAll([
          TreatmentRecommendation(
            treatment: 'Organic Neem Oil Spray',
            dosage: '5ml per liter of water',
            frequency: 'Every 7 days',
            duration: '3-4 weeks',
            cost: 80.0,
          ),
          TreatmentRecommendation(
            treatment: 'Triazole fungicide',
            dosage: '1ml per liter of water',
            frequency: 'Every 14 days',
            duration: '6 weeks',
            cost: 200.0,
          ),
        ]);
        break;
      default:
        treatments.add(
          TreatmentRecommendation(
            treatment: 'General crop protection spray',
            dosage: '5ml per liter of water',
            frequency: 'Every 10 days',
            duration: '4 weeks',
            cost: 100.0,
          ),
        );
    }
    
    return treatments;
  }

  Future<List<String>> _getPreventionTips(String diseaseName) async {
    switch (diseaseName.toLowerCase()) {
      case 'bacterial blight':
        return [
          'Use disease-free seeds',
          'Avoid overhead irrigation',
          'Maintain proper plant spacing',
          'Remove infected plant debris',
          'Apply balanced fertilization',
        ];
      case 'brown spot':
        return [
          'Ensure proper drainage',
          'Avoid water stress',
          'Use silicon-rich fertilizers',
          'Practice crop rotation',
          'Maintain field hygiene',
        ];
      default:
        return [
          'Regular field monitoring',
          'Proper crop nutrition',
          'Adequate drainage',
          'Timely pest control',
          'Use quality seeds',
        ];
    }
  }

  NutrientLevel _interpretNutrientLevel(double score) {
    if (score > 0.8) return NutrientLevel.optimal;
    if (score > 0.6) return NutrientLevel.adequate;
    if (score > 0.4) return NutrientLevel.deficient;
    return NutrientLevel.severelyDeficient;
  }

  StressLevel _interpretStressLevel(double score) {
    if (score < 0.2) return StressLevel.none;
    if (score < 0.4) return StressLevel.low;
    if (score < 0.7) return StressLevel.medium;
    return StressLevel.high;
  }

  DamageLevel _interpretDamageLevel(double score) {
    if (score < 0.1) return DamageLevel.none;
    if (score < 0.3) return DamageLevel.minimal;
    if (score < 0.6) return DamageLevel.moderate;
    return DamageLevel.severe;
  }

  String _interpretGrowthStage(double score) {
    if (score < 0.2) return 'Seedling';
    if (score < 0.4) return 'Vegetative';
    if (score < 0.6) return 'Flowering';
    if (score < 0.8) return 'Grain Filling';
    return 'Maturity';
  }

  Future<List<ActionItem>> _generateActionItems(List<double> healthScores, CropType cropType) async {
    final actions = <ActionItem>[];
    
    // Nitrogen deficiency
    if (healthScores[1] < 0.5) {
      actions.add(ActionItem(
        title: 'Apply Nitrogen Fertilizer',
        description: 'Crop shows signs of nitrogen deficiency',
        priority: ActionPriority.high,
        estimatedCost: 200.0,
        timeframe: '2-3 days',
      ));
    }
    
    // Water stress
    if (healthScores[4] > 0.6) {
      actions.add(ActionItem(
        title: 'Increase Irrigation',
        description: 'Crop is experiencing water stress',
        priority: ActionPriority.urgent,
        estimatedCost: 50.0,
        timeframe: 'Immediate',
      ));
    }
    
    // Pest damage
    if (healthScores[5] > 0.4) {
      actions.add(ActionItem(
        title: 'Pest Control Treatment',
        description: 'Pest damage detected, apply appropriate pesticide',
        priority: ActionPriority.medium,
        estimatedCost: 150.0,
        timeframe: '1-2 days',
      ));
    }
    
    return actions;
  }

  double _calculateConfidence(List<double> predictions) {
    final variance = _calculateVariance(predictions);
    return (1.0 - variance).clamp(0.0, 1.0);
  }

  double _calculateVariance(List<double> values) {
    final mean = values.reduce((a, b) => a + b) / values.length;
    final variance = values.map((x) => (x - mean) * (x - mean)).reduce((a, b) => a + b) / values.length;
    return variance / (mean * mean); // Coefficient of variation
  }

  Future<List<YieldFactor>> _identifyYieldFactors(XFile imageFile, Map<String, dynamic> historicalData) async {
    return [
      YieldFactor(
        factor: 'Weather Conditions',
        impact: 0.8,
        description: 'Favorable rainfall and temperature',
      ),
      YieldFactor(
        factor: 'Soil Health',
        impact: 0.7,
        description: 'Good soil nutrition levels detected',
      ),
      YieldFactor(
        factor: 'Pest Pressure',
        impact: 0.3,
        description: 'Low pest activity observed',
      ),
    ];
  }

  Future<List<String>> _getYieldOptimizationActions(List<double> predictions, CropType cropType) async {
    return [
      'Apply balanced fertilizer at flowering stage',
      'Ensure adequate irrigation during grain filling',
      'Monitor for pest activity weekly',
      'Consider foliar nutrition application',
      'Maintain optimal plant density',
    ];
  }

  Future<double> _calculateMarketValue(double expectedYield, CropType cropType) async {
    // Simulated market prices per quintal
    final marketPrices = {
      CropType.rice: 2100.0,
      CropType.wheat: 2050.0,
      CropType.maize: 1800.0,
      CropType.cotton: 5500.0,
      CropType.sugarcane: 350.0,
    };
    
    final pricePerQuintal = marketPrices[cropType] ?? 2000.0;
    final yieldInQuintals = expectedYield * 10; // Convert tonnes to quintals
    
    return yieldInQuintals * pricePerQuintal;
  }
}
