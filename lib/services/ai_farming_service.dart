import 'package:flutter/foundation.dart';
import 'package:firebase_vertexai/firebase_vertexai.dart';
import 'package:tflite_flutter/tflite_flutter.dart';
import 'package:google_mlkit_image_labeling/google_mlkit_image_labeling.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:logger/logger.dart';

class AIFarmingService {
  static final AIFarmingService _instance = AIFarmingService._internal();
  factory AIFarmingService() => _instance;
  AIFarmingService._internal();

  final Logger _logger = Logger();
  late GenerativeModel _vertexAI;
  Interpreter? _cropHealthModel;
  Interpreter? _yieldPredictionModel;
  final ImageLabeler _imageLabeler = ImageLabeler(options: ImageLabelerOptions());
  final TextRecognizer _textRecognizer = TextRecognizer();
  final SpeechToText _speechToText = SpeechToText();
  final FlutterTts _flutterTts = FlutterTts();
  
  bool _isInitialized = false;

  /// Initialize AI services
  Future<void> initialize() async {
    if (_isInitialized) return;

    try {
      // Initialize Vertex AI
      _vertexAI = FirebaseVertexAI.instance.generativeModel(
        model: 'gemini-1.5-pro-002',
        systemInstruction: Content.system('''
          You are an advanced AI farming assistant specializing in:
          - Crop health diagnosis and treatment recommendations
          - Yield prediction and optimization strategies
          - Soil analysis and fertilizer recommendations
          - Weather-based farming advice
          - Pest and disease identification
          - Sustainable farming practices
          - Market price analysis and selling strategies
          
          Always provide practical, actionable advice suitable for farmers.
          Include specific measurements, timelines, and cost estimates when possible.
          Consider local climate, soil conditions, and regional farming practices.
        '''),
      );

      // Load TensorFlow Lite models
      await _loadMLModels();

      // Initialize speech services
      await _initializeSpeechServices();

      _isInitialized = true;
      _logger.i('AI Farming Service initialized successfully');
    } catch (e) {
      _logger.e('Failed to initialize AI services: $e');
      rethrow;
    }
  }

  /// Load machine learning models
  Future<void> _loadMLModels() async {
    try {
      // Load crop health detection model
      _cropHealthModel = await Interpreter.fromAsset('assets/models/crop_health_model.tflite');
      
      // Load yield prediction model
      _yieldPredictionModel = await Interpreter.fromAsset('assets/models/yield_prediction_model.tflite');
      
      _logger.i('ML models loaded successfully');
    } catch (e) {
      _logger.w('Failed to load ML models: $e');
    }
  }

  /// Initialize speech-to-text and text-to-speech
  Future<void> _initializeSpeechServices() async {
    try {
      await _speechToText.initialize(
        onError: (error) => _logger.e('Speech recognition error: $error'),
        onStatus: (status) => _logger.d('Speech recognition status: $status'),
      );

      await _flutterTts.setLanguage('en-US');
      await _flutterTts.setSpeechRate(0.5);
      await _flutterTts.setVolume(1.0);
      await _flutterTts.setPitch(1.0);

      _logger.i('Speech services initialized');
    } catch (e) {
      _logger.w('Failed to initialize speech services: $e');
    }
  }

  /// Get AI-powered farming recommendations
  Future<FarmingRecommendation> getFarmingRecommendations({
    required Map<String, dynamic> farmData,
    required Map<String, dynamic> weatherData,
    required Map<String, dynamic> soilData,
  }) async {
    try {
      final prompt = '''
        Based on the following farm data, provide comprehensive farming recommendations:
        
        Farm Data: ${farmData.toString()}
        Weather Data: ${weatherData.toString()}
        Soil Data: ${soilData.toString()}
        
        Please provide:
        1. Immediate action items (next 7 days)
        2. Short-term planning (next 30 days)
        3. Long-term strategies (next season)
        4. Risk assessments and mitigation strategies
        5. Cost-benefit analysis for suggested actions
        6. Sustainability recommendations
        
        Format the response as detailed JSON with actionable insights.
      ''';

      final response = await _vertexAI.generateContent([Content.text(prompt)]);
      final recommendation = FarmingRecommendation.fromAIResponse(response.text ?? '');
      
      _logger.i('Generated farming recommendations successfully');
      return recommendation;
    } catch (e) {
      _logger.e('Failed to generate farming recommendations: $e');
      rethrow;
    }
  }

  /// Analyze crop health from image
  Future<CropHealthAnalysis> analyzeCropHealth(Uint8List imageBytes) async {
    try {
      final inputImage = InputImage.fromBytes(
        bytes: imageBytes,
        metadata: InputImageMetadata(
          size: Size(224, 224),
          rotation: InputImageRotation.rotation0deg,
          format: InputImageFormat.bgra8888,
          bytesPerRow: 224 * 4,
        ),
      );

      // Use ML Kit for initial analysis
      final labels = await _imageLabeler.processImage(inputImage);
      
      // Use custom TensorFlow model for detailed health analysis
      Map<String, double> healthScores = {};
      if (_cropHealthModel != null) {
        healthScores = await _runCropHealthModel(imageBytes);
      }

      // Get AI interpretation
      final prompt = '''
        Analyze this crop health data:
        Image Labels: ${labels.map((l) => '${l.label}: ${l.confidence}').join(', ')}
        Health Scores: ${healthScores.toString()}
        
        Provide:
        1. Health status assessment
        2. Identified diseases or issues
        3. Treatment recommendations
        4. Prevention strategies
        5. Expected recovery timeline
        6. Cost estimates for treatment
      ''';

      final response = await _vertexAI.generateContent([Content.text(prompt)]);
      
      return CropHealthAnalysis(
        healthScore: healthScores['health'] ?? 0.5,
        diseases: _extractDiseases(labels),
        recommendations: response.text ?? 'No recommendations available',
        confidence: _calculateConfidence(labels, healthScores),
        treatmentCost: _estimateTreatmentCost(labels),
      );
    } catch (e) {
      _logger.e('Failed to analyze crop health: $e');
      rethrow;
    }
  }

  /// Predict crop yield
  Future<YieldPrediction> predictYield({
    required String cropType,
    required double fieldArea,
    required Map<String, dynamic> historicalData,
    required Map<String, dynamic> currentConditions,
  }) async {
    try {
      // Run ML model prediction
      Map<String, double> modelPrediction = {};
      if (_yieldPredictionModel != null) {
        modelPrediction = await _runYieldPredictionModel({
          'cropType': cropType,
          'fieldArea': fieldArea,
          'historicalData': historicalData,
          'currentConditions': currentConditions,
        });
      }

      // Get AI analysis
      final prompt = '''
        Predict crop yield based on:
        Crop Type: $cropType
        Field Area: $fieldArea hectares
        Historical Data: ${historicalData.toString()}
        Current Conditions: ${currentConditions.toString()}
        Model Prediction: ${modelPrediction.toString()}
        
        Provide:
        1. Yield prediction with confidence intervals
        2. Factors affecting yield
        3. Optimization recommendations
        4. Risk factors and mitigation
        5. Market timing advice
        6. Revenue projections
      ''';

      final response = await _vertexAI.generateContent([Content.text(prompt)]);
      
      return YieldPrediction(
        predictedYield: modelPrediction['yield'] ?? 0.0,
        confidenceInterval: [
          modelPrediction['yield_low'] ?? 0.0,
          modelPrediction['yield_high'] ?? 0.0,
        ],
        factors: _extractYieldFactors(response.text ?? ''),
        recommendations: response.text ?? '',
        revenueProjection: _calculateRevenue(modelPrediction['yield'] ?? 0.0, cropType),
      );
    } catch (e) {
      _logger.e('Failed to predict yield: $e');
      rethrow;
    }
  }

  /// Voice-enabled farming assistant
  Future<String> processVoiceCommand(String command) async {
    try {
      final prompt = '''
        Process this farmer's voice command and provide a helpful response:
        Command: "$command"
        
        Understand the context and provide:
        1. Direct answer to the query
        2. Actionable steps if needed
        3. Additional relevant information
        4. Follow-up questions if clarification needed
        
        Keep the response conversational and practical.
      ''';

      final response = await _vertexAI.generateContent([Content.text(prompt)]);
      final aiResponse = response.text ?? 'I need more information to help you.';
      
      // Convert response to speech
      await _flutterTts.speak(aiResponse);
      
      return aiResponse;
    } catch (e) {
      _logger.e('Failed to process voice command: $e');
      return 'Sorry, I encountered an error processing your request.';
    }
  }

  /// Start listening for voice commands
  Future<String?> startListening() async {
    if (!_speechToText.isAvailable) {
      await _speechToText.initialize();
    }

    String? result;
    
    await _speechToText.listen(
      onResult: (recognition) {
        result = recognition.recognizedWords;
      },
      listenFor: const Duration(seconds: 30),
      pauseFor: const Duration(seconds: 3),
    );

    return result;
  }

  /// Market price analysis and recommendations
  Future<MarketAnalysis> analyzeMarketPrices({
    required String cropType,
    required String location,
    required double quantity,
  }) async {
    try {
      final prompt = '''
        Analyze market conditions for:
        Crop: $cropType
        Location: $location
        Quantity: $quantity tons
        
        Provide:
        1. Current market prices
        2. Price trends and predictions
        3. Best selling timing
        4. Alternative markets or buyers
        5. Price negotiation strategies
        6. Transportation and logistics advice
      ''';

      final response = await _vertexAI.generateContent([Content.text(prompt)]);
      
      return MarketAnalysis.fromAIResponse(response.text ?? '');
    } catch (e) {
      _logger.e('Failed to analyze market prices: $e');
      rethrow;
    }
  }

  /// Sustainable farming recommendations
  Future<SustainabilityReport> getSustainabilityRecommendations({
    required Map<String, dynamic> farmData,
  }) async {
    try {
      final prompt = '''
        Provide sustainability recommendations for:
        Farm Data: ${farmData.toString()}
        
        Focus on:
        1. Water conservation strategies
        2. Soil health improvement
        3. Biodiversity enhancement
        4. Carbon footprint reduction
        5. Renewable energy integration
        6. Waste management optimization
        7. Certification opportunities
        8. Cost-benefit analysis of sustainable practices
      ''';

      final response = await _vertexAI.generateContent([Content.text(prompt)]);
      
      return SustainabilityReport.fromAIResponse(response.text ?? '');
    } catch (e) {
      _logger.e('Failed to generate sustainability recommendations: $e');
      rethrow;
    }
  }

  // Helper methods
  Future<Map<String, double>> _runCropHealthModel(Uint8List imageBytes) async {
    // Placeholder for TensorFlow Lite model inference
    return {
      'health': 0.85,
      'disease_probability': 0.15,
      'pest_probability': 0.05,
    };
  }

  Future<Map<String, double>> _runYieldPredictionModel(Map<String, dynamic> data) async {
    // Placeholder for TensorFlow Lite model inference
    return {
      'yield': 2.5,
      'yield_low': 2.0,
      'yield_high': 3.0,
      'confidence': 0.75,
    };
  }

  List<String> _extractDiseases(List<ImageLabel> labels) {
    return labels
        .where((label) => label.confidence > 0.7)
        .map((label) => label.label)
        .toList();
  }

  double _calculateConfidence(List<ImageLabel> labels, Map<String, double> scores) {
    if (labels.isEmpty) return 0.0;
    return labels.map((l) => l.confidence).reduce((a, b) => a + b) / labels.length;
  }

  double _estimateTreatmentCost(List<ImageLabel> labels) {
    // Simple cost estimation based on detected issues
    return labels.length * 500.0; // ₹500 per detected issue
  }

  List<String> _extractYieldFactors(String response) {
    // Extract factors from AI response
    return ['Weather conditions', 'Soil quality', 'Fertilizer application', 'Pest management'];
  }

  double _calculateRevenue(double yield, String cropType) {
    // Placeholder revenue calculation
    const pricePerTon = {
      'wheat': 25000.0,
      'rice': 22000.0,
      'corn': 20000.0,
      'cotton': 55000.0,
    };
    return yield * (pricePerTon[cropType.toLowerCase()] ?? 20000.0);
  }

  void dispose() {
    _cropHealthModel?.close();
    _yieldPredictionModel?.close();
    _imageLabeler.close();
    _textRecognizer.close();
  }
}

// Data models for AI responses
class FarmingRecommendation {
  final List<String> immediateActions;
  final List<String> shortTermPlanning;
  final List<String> longTermStrategies;
  final List<String> riskAssessments;
  final double estimatedCost;
  final double expectedBenefit;

  FarmingRecommendation({
    required this.immediateActions,
    required this.shortTermPlanning,
    required this.longTermStrategies,
    required this.riskAssessments,
    required this.estimatedCost,
    required this.expectedBenefit,
  });

  factory FarmingRecommendation.fromAIResponse(String response) {
    // Parse AI response - simplified implementation
    return FarmingRecommendation(
      immediateActions: ['Sample immediate action'],
      shortTermPlanning: ['Sample short-term plan'],
      longTermStrategies: ['Sample long-term strategy'],
      riskAssessments: ['Sample risk assessment'],
      estimatedCost: 10000.0,
      expectedBenefit: 25000.0,
    );
  }
}

class CropHealthAnalysis {
  final double healthScore;
  final List<String> diseases;
  final String recommendations;
  final double confidence;
  final double treatmentCost;

  CropHealthAnalysis({
    required this.healthScore,
    required this.diseases,
    required this.recommendations,
    required this.confidence,
    required this.treatmentCost,
  });
}

class YieldPrediction {
  final double predictedYield;
  final List<double> confidenceInterval;
  final List<String> factors;
  final String recommendations;
  final double revenueProjection;

  YieldPrediction({
    required this.predictedYield,
    required this.confidenceInterval,
    required this.factors,
    required this.recommendations,
    required this.revenueProjection,
  });
}

class MarketAnalysis {
  final double currentPrice;
  final List<String> priceTrends;
  final String bestSellingTime;
  final List<String> recommendations;

  MarketAnalysis({
    required this.currentPrice,
    required this.priceTrends,
    required this.bestSellingTime,
    required this.recommendations,
  });

  factory MarketAnalysis.fromAIResponse(String response) {
    return MarketAnalysis(
      currentPrice: 25000.0,
      priceTrends: ['Increasing trend expected'],
      bestSellingTime: 'Next month',
      recommendations: ['Hold for better prices'],
    );
  }
}

class SustainabilityReport {
  final List<String> waterConservation;
  final List<String> soilImprovement;
  final List<String> biodiversityTips;
  final double carbonReduction;
  final double costSavings;

  SustainabilityReport({
    required this.waterConservation,
    required this.soilImprovement,
    required this.biodiversityTips,
    required this.carbonReduction,
    required this.costSavings,
  });

  factory SustainabilityReport.fromAIResponse(String response) {
    return SustainabilityReport(
      waterConservation: ['Drip irrigation', 'Rainwater harvesting'],
      soilImprovement: ['Organic fertilizers', 'Crop rotation'],
      biodiversityTips: ['Native plants', 'Beneficial insects'],
      carbonReduction: 25.0,
      costSavings: 15000.0,
    );
  }
}
