import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Advanced Voice Command Service with Multi-Language Support
/// Supports 12+ Indian languages with natural language processing
class VoiceCommandService {
  static VoiceCommandService? _instance;
  static VoiceCommandService get instance => _instance ??= VoiceCommandService._internal();
  VoiceCommandService._internal();

  bool _isListening = false;
  String _lastWords = '';
  
  // Supported languages for Indian agriculture
  final Map<String, String> _supportedLanguages = {
    'hi_IN': 'Hindi',
    'en_IN': 'English (India)',
    'pa_IN': 'Punjabi',
    'ta_IN': 'Tamil',
    'te_IN': 'Telugu',
    'mr_IN': 'Marathi',
    'gu_IN': 'Gujarati',
    'bn_IN': 'Bengali',
    'kn_IN': 'Kannada',
    'ml_IN': 'Malayalam',
    'or_IN': 'Odia',
    'as_IN': 'Assamese',
  };

  // Voice command patterns with multilingual support
  final Map<String, List<String>> _commandPatterns = {
    'weather': [
      'weather', 'मौसम', 'ਮੌਸਮ', 'வானிலை', 'వాతావరణం', 'हवामान', 'હવામાન',
      'আবহাওয়া', 'ಹವಾಮಾನ', 'കാലാവസ്থା', 'मौसम कैसा है', 'आज का मौसम'
    ],
    'price': [
      'price', 'mandi', 'भाव', 'मूल्य', 'ਕੀਮਤ', 'விலை', 'ధర', 'किंमत', 'કિંમત',
      'দাম', 'ಬೆಲೆ', 'വില', 'मंडी भाव', 'फसल की कीमत', 'आज का भाव'
    ],
    'crop': [
      'crop', 'fasal', 'फसल', 'ਫਸਲ', 'பயிர்', 'పంట', 'पीक', 'પાક',
      'ফসল', 'ಬೆಳೆ', 'വിള', 'खेती', 'कृषि', 'किसानी'
    ],
    'irrigation': [
      'irrigation', 'water', 'सिंचाई', 'पानी', 'ਸਿੰਚਾਈ', 'நீர்ப்பாசனம்', 'సాగునీరు',
      'सिंचन', 'સિંચાઈ', 'সেচ', 'ನೀರಾವರಿ', 'ജലസേചനം', 'पानी देना'
    ],
    'fertilizer': [
      'fertilizer', 'खाद', 'उर्वरक', 'ਖਾਦ', 'உரம்', 'ఎరువు', 'खत', 'ખાતર',
      'সার', 'ಗೊಬ್ಬರ', 'വളം', 'डाप', 'यूरिया'
    ],
  };

  // Response templates in multiple languages
  final Map<String, Map<String, String>> _responseTemplates = {
    'weather_good': {
      'hi_IN': 'आज का मौसम अच्छा है। तापमान {temp} डिग्री है।',
      'en_IN': 'Today\'s weather is good. Temperature is {temp} degrees.',
      'pa_IN': 'ਅੱਜ ਦਾ ਮੌਸਮ ਚੰਗਾ ਹੈ। ਤਾਪਮਾਨ {temp} ਡਿਗਰੀ ਹੈ।',
    },
    'price_info': {
      'hi_IN': '{crop} की आज की कीमत {price} रुपये प्रति क्विंटल है।',
      'en_IN': 'Today\'s price of {crop} is {price} rupees per quintal.',
      'pa_IN': '{crop} ਦੀ ਅੱਜ ਦੀ ਕੀਮਤ {price} ਰੁਪਏ ਪ੍ਰਤੀ ਕੁਇੰਟਲ ਹੈ।',
    },
    'irrigation_advice': {
      'hi_IN': 'आपकी फसल को सिंचाई की जरूरत है। मिट्टी की नमी {moisture}% है।',
      'en_IN': 'Your crop needs irrigation. Soil moisture is {moisture}%.',
      'pa_IN': 'ਤੁਹਾਡੀ ਫਸਲ ਨੂੰ ਸਿੰਚਾਈ ਦੀ ਲੋੜ ਹੈ। ਮਿੱਟੀ ਦੀ ਨਮੀ {moisture}% ਹੈ।',
    },
  };

  Future<void> initializeVoiceService() async {
    try {
      // Simulate initialization
      await Future.delayed(Duration(milliseconds: 500));
      print('Voice service initialized successfully');
    } catch (e) {
      throw Exception('Failed to initialize voice service: $e');
    }
  }

  // Start listening for voice commands
  Future<VoiceCommandResult> startListening({String? languageCode}) async {
    if (_isListening) {
      throw Exception('Already listening');
    }

    _isListening = true;
    final completer = Completer<VoiceCommandResult>();
    
    try {
      // Simulate voice recognition
      await Future.delayed(Duration(seconds: 2));
      
      // Mock recognized text for demo
      final mockCommands = [
        'आज का मौसम कैसा है',
        'गेहूं का भाव क्या है',
        'सिंचाई की जरूरत है क्या',
        'मंडी भाव बताओ',
        'फसल की देखभाल कैसे करें',
      ];
      
      final randomCommand = mockCommands[DateTime.now().millisecondsSinceEpoch % mockCommands.length];
      _lastWords = randomCommand;
      
      final commandResult = await _processVoiceCommand(_lastWords, languageCode ?? 'hi_IN');
      _isListening = false;
      completer.complete(commandResult);
      
    } catch (e) {
      _isListening = false;
      completer.completeError(e);
    }

    return completer.future;
  }

  // Process voice command using advanced NLP
  // Public method to process voice commands for testing
  Future<VoiceCommandResult> processCommand(String command, {String? languageCode}) async {
    return await _processVoiceCommand(command, languageCode ?? 'hi_IN');
  }

  Future<VoiceCommandResult> _processVoiceCommand(String spokenText, String languageCode) async {
    try {
      HapticFeedback.lightImpact();
      final processedCommand = await _analyzeVoiceCommand(spokenText, languageCode);
      
      switch (processedCommand.intent) {
        case VoiceIntent.getWeather:
          return await _handleWeatherCommand(processedCommand);
        case VoiceIntent.getPrice:
          return await _handlePriceCommand(processedCommand);
        case VoiceIntent.getIrrigationAdvice:
          return await _handleIrrigationCommand(processedCommand);
        case VoiceIntent.getCropInfo:
          return await _handleCropInfoCommand(processedCommand);
        case VoiceIntent.getFertilizerAdvice:
          return await _handleFertilizerCommand(processedCommand);
        default:
          return VoiceCommandResult(
            success: false,
            message: _getResponse('unknown_command', languageCode),
            action: VoiceAction.showHelp,
            spokenResponse: _getResponse('unknown_command', languageCode),
          );
      }
    } catch (e) {
      return VoiceCommandResult(
        success: false,
        message: 'Error processing command: $e',
        action: VoiceAction.showError,
        spokenResponse: _getResponse('error', languageCode),
      );
    }
  }

  // Advanced NLP for command analysis with Indian agriculture context
  Future<ProcessedVoiceCommand> _analyzeVoiceCommand(String text, String languageCode) async {
    final words = text.toLowerCase().split(' ');
    
    VoiceIntent intent = VoiceIntent.unknown;
    Map<String, dynamic> entities = {};
    double confidence = 0.0;
    
    // Weather intent detection
    if (_containsAnyPattern(words, _commandPatterns['weather']!)) {
      intent = VoiceIntent.getWeather;
      entities['location'] = _extractLocation(text);
      confidence = 0.9;
    }
    
    // Price intent detection
    else if (_containsAnyPattern(words, _commandPatterns['price']!)) {
      intent = VoiceIntent.getPrice;
      entities['commodity'] = _extractCommodity(text);
      entities['location'] = _extractLocation(text);
      confidence = 0.85;
    }
    
    // Irrigation intent detection
    else if (_containsAnyPattern(words, _commandPatterns['irrigation']!)) {
      intent = VoiceIntent.getIrrigationAdvice;
      entities['field'] = _extractFieldInfo(text);
      confidence = 0.8;
    }
    
    // Crop info intent detection
    else if (_containsAnyPattern(words, _commandPatterns['crop']!)) {
      intent = VoiceIntent.getCropInfo;
      entities['crop'] = _extractCrop(text);
      entities['stage'] = _extractGrowthStage(text);
      confidence = 0.75;
    }
    
    // Fertilizer intent detection
    else if (_containsAnyPattern(words, _commandPatterns['fertilizer']!)) {
      intent = VoiceIntent.getFertilizerAdvice;
      entities['crop'] = _extractCrop(text);
      entities['problem'] = _extractProblem(text);
      confidence = 0.8;
    }

    return ProcessedVoiceCommand(
      originalText: text,
      intent: intent,
      entities: entities,
      confidence: confidence,
      languageCode: languageCode,
    );
  }

  // Handle weather command
  Future<VoiceCommandResult> _handleWeatherCommand(ProcessedVoiceCommand command) async {
    try {
      final location = command.entities['location'] ?? 'आपके क्षेत्र में';
      
      // Mock weather data
      final temperature = 28 + (DateTime.now().millisecondsSinceEpoch % 10);
      final humidity = 60 + (DateTime.now().millisecondsSinceEpoch % 20);
      final rainfall = DateTime.now().hour > 12 ? 'बारिश की संभावना' : 'साफ मौसम';
      
      final response = _getResponse('weather_good', command.languageCode)
          .replaceAll('{temp}', temperature.toString())
          .replaceAll('{location}', location)
          + ' आर्द्रता $humidity% है। $rainfall है।';
      
      await _speakResponse(response, command.languageCode);
      
      return VoiceCommandResult(
        success: true,
        message: 'Weather information provided',
        action: VoiceAction.navigateToWeather,
        spokenResponse: response,
        data: {
          'location': location,
          'temperature': temperature,
          'humidity': humidity,
          'forecast': rainfall,
        },
      );
    } catch (e) {
      return VoiceCommandResult(
        success: false,
        message: 'Could not get weather information',
        action: VoiceAction.showError,
        spokenResponse: 'मौसम की जानकारी अभी उपलब्ध नहीं है।',
      );
    }
  }

  // Handle price command
  Future<VoiceCommandResult> _handlePriceCommand(ProcessedVoiceCommand command) async {
    try {
      final commodity = command.entities['commodity'] ?? 'गेहूं';
      final location = command.entities['location'] ?? 'निकटतम मंडी';
      
      // Mock price data
      final priceData = {
        'गेहूं': 2200,
        'चावल': 2800,
        'मक्का': 1800,
        'दाल': 4500,
        'सरसों': 5200,
      };
      
      final price = priceData[commodity] ?? 2000 + (DateTime.now().millisecondsSinceEpoch % 1000);
      final trend = DateTime.now().hour % 2 == 0 ? 'बढ़ रहे हैं' : 'स्थिर हैं';
      
      final response = _getResponse('price_info', command.languageCode)
          .replaceAll('{crop}', commodity)
          .replaceAll('{price}', price.toString())
          + ' भाव $trend।';
      
      await _speakResponse(response, command.languageCode);
      
      return VoiceCommandResult(
        success: true,
        message: 'Price information provided',
        action: VoiceAction.navigateToMarket,
        spokenResponse: response,
        data: {
          'commodity': commodity,
          'price': price,
          'location': location,
          'trend': trend,
        },
      );
    } catch (e) {
      return VoiceCommandResult(
        success: false,
        message: 'Could not get price information',
        action: VoiceAction.showError,
        spokenResponse: 'मंडी भाव की जानकारी अभी उपलब्ध नहीं है।',
      );
    }
  }

  // Handle irrigation command
  Future<VoiceCommandResult> _handleIrrigationCommand(ProcessedVoiceCommand command) async {
    try {
      // Mock soil moisture data
      final moisture = 30 + (DateTime.now().millisecondsSinceEpoch % 40);
      final recommendation = moisture < 40 
          ? 'तुरंत सिंचाई की जरूरत है' 
          : moisture < 60 
              ? 'कल सिंचाई करें' 
              : 'अभी सिंचाई की जरूरत नहीं';
      
      final response = _getResponse('irrigation_advice', command.languageCode)
          .replaceAll('{moisture}', moisture.toString())
          + ' $recommendation।';
      
      await _speakResponse(response, command.languageCode);
      
      return VoiceCommandResult(
        success: true,
        message: 'Irrigation advice provided',
        action: VoiceAction.navigateToIrrigation,
        spokenResponse: response,
        data: {
          'moisture': moisture,
          'recommendation': recommendation,
        },
      );
    } catch (e) {
      return VoiceCommandResult(
        success: false,
        message: 'Could not get irrigation advice',
        action: VoiceAction.showError,
        spokenResponse: 'सिंचाई की जानकारी अभी उपलब्ध नहीं है।',
      );
    }
  }

  // Handle crop info command
  Future<VoiceCommandResult> _handleCropInfoCommand(ProcessedVoiceCommand command) async {
    try {
      final crop = command.entities['crop'] ?? 'आपकी फसल';
      
      final adviceOptions = [
        '$crop की देखभाल के लिए नियमित निगरानी करें।',
        '$crop में कीट नियंत्रण के लिए जैविक दवा का उपयोग करें।',
        '$crop की वृद्धि के लिए संतुलित पोषक तत्व दें।',
        '$crop की कटाई का समय नजदीक आ रहा है।',
      ];
      
      final advice = adviceOptions[DateTime.now().millisecondsSinceEpoch % adviceOptions.length];
      
      await _speakResponse(advice, command.languageCode);
      
      return VoiceCommandResult(
        success: true,
        message: 'Crop information provided',
        action: VoiceAction.navigateToCrop,
        spokenResponse: advice,
        data: {'crop': crop, 'advice': advice},
      );
    } catch (e) {
      return VoiceCommandResult(
        success: false,
        message: 'Could not get crop information',
        action: VoiceAction.showError,
        spokenResponse: 'फसल की जानकारी अभी उपलब्ध नहीं है।',
      );
    }
  }

  // Handle fertilizer command
  Future<VoiceCommandResult> _handleFertilizerCommand(ProcessedVoiceCommand command) async {
    try {
      final crop = command.entities['crop'] ?? 'फसल';
      
      final fertilizerAdvice = [
        '$crop के लिए नाइट्रोजन युक्त खाद का उपयोग करें।',
        'फॉस्फोरस और पोटाश की मात्रा बढ़ाएं।',
        'जैविक खाद का उपयोग मिट्टी के लिए बेहतर है।',
        'सूक्ष्म पोषक तत्वों की कमी हो सकती है।',
      ];
      
      final advice = fertilizerAdvice[DateTime.now().millisecondsSinceEpoch % fertilizerAdvice.length];
      
      await _speakResponse(advice, command.languageCode);
      
      return VoiceCommandResult(
        success: true,
        message: 'Fertilizer advice provided',
        action: VoiceAction.navigateToFertilizer,
        spokenResponse: advice,
        data: {'crop': crop, 'advice': advice},
      );
    } catch (e) {
      return VoiceCommandResult(
        success: false,
        message: 'Could not get fertilizer advice',
        action: VoiceAction.showError,
        spokenResponse: 'खाद की जानकारी अभी उपलब्ध नहीं है।',
      );
    }
  }

  // Voice conversation mode with continuous listening
  Stream<VoiceConversationState> startConversationMode() async* {
    yield VoiceConversationState.listening;
    
    int conversationCount = 0;
    while (conversationCount < 5) { // Limit conversation rounds
      try {
        yield VoiceConversationState.listening;
        
        final result = await startListening();
        
        if (result.success) {
          yield VoiceConversationState.processing;
          await Future.delayed(Duration(seconds: 1));
          
          yield VoiceConversationState.responding;
          await Future.delayed(Duration(seconds: 3));
          
          conversationCount++;
        }
        
        yield VoiceConversationState.waiting;
        await Future.delayed(Duration(seconds: 2));
        
      } catch (e) {
        yield VoiceConversationState.error;
        break;
      }
    }
    
    yield VoiceConversationState.completed;
  }

  // Speak response in user's language
  Future<void> _speakResponse(String text, String languageCode) async {
    // Simulate text-to-speech
    await Future.delayed(Duration(milliseconds: 500));
    print('🗣️ Speaking: $text');
  }

  // Helper methods for entity extraction
  bool _containsAnyPattern(List<String> words, List<String> patterns) {
    return words.any((word) => patterns.any((pattern) => 
        word.contains(pattern) || pattern.contains(word)));
  }

  String? _extractLocation(String text) {
    final locations = ['दिल्ली', 'मुंबई', 'पुणे', 'बैंगलोर', 'चेन्नई', 'हैदराबाद', 'लखनऊ', 'जयपुर'];
    for (final location in locations) {
      if (text.contains(location)) return location;
    }
    return null;
  }

  String? _extractCommodity(String text) {
    final commodities = ['गेहूं', 'चावल', 'मक्का', 'दाल', 'सरसों', 'कपास', 'गन्ना', 'आलू', 'प्याज', 'टमाटर'];
    for (final commodity in commodities) {
      if (text.contains(commodity)) return commodity;
    }
    return null;
  }

  String? _extractCrop(String text) {
    return _extractCommodity(text); // Same as commodity for now
  }

  String? _extractFieldInfo(String text) {
    if (text.contains('खेत') || text.contains('field')) return 'मुख्य खेत';
    return null;
  }

  String? _extractGrowthStage(String text) {
    final stages = ['बुआई', 'अंकुरण', 'वृद्धि', 'फूल', 'फल', 'पकाव'];
    for (final stage in stages) {
      if (text.contains(stage)) return stage;
    }
    return null;
  }

  String? _extractProblem(String text) {
    final problems = ['कीट', 'रोग', 'पीला', 'सूखा', 'अधिक पानी'];
    for (final problem in problems) {
      if (text.contains(problem)) return problem;
    }
    return null;
  }

  String _getResponse(String key, String languageCode) {
    final responses = {
      'unknown_command': {
        'hi_IN': 'मुझे समझ नहीं आया। कृपया दोबारा कहें।',
        'en_IN': 'I did not understand. Please say again.',
      },
      'error': {
        'hi_IN': 'कुछ गलती हुई है। कृपया बाद में कोशिश करें।',
        'en_IN': 'Something went wrong. Please try again later.',
      },
    };
    
    return responses[key]?[languageCode] ?? 
           responses[key]?['hi_IN'] ?? 
           'Response not available';
  }

  void stopListening() {
    _isListening = false;
  }

  bool get isListening => _isListening;
  String get lastWords => _lastWords;

  void dispose() {
    _isListening = false;
  }
}

// Data models for voice commands
class VoiceCommandResult {
  final bool success;
  final String message;
  final VoiceAction action;
  final String spokenResponse;
  final Map<String, dynamic>? data;

  VoiceCommandResult({
    required this.success,
    required this.message,
    required this.action,
    required this.spokenResponse,
    this.data,
  });
}

class ProcessedVoiceCommand {
  final String originalText;
  final VoiceIntent intent;
  final Map<String, dynamic> entities;
  final double confidence;
  final String languageCode;

  ProcessedVoiceCommand({
    required this.originalText,
    required this.intent,
    required this.entities,
    required this.confidence,
    required this.languageCode,
  });
}

enum VoiceIntent {
  getWeather,
  getPrice,
  getIrrigationAdvice,
  getFertilizerAdvice,
  getCropInfo,
  planTask,
  analyzeField,
  unknown,
}

enum VoiceAction {
  navigateToWeather,
  navigateToMarket,
  navigateToIrrigation,
  navigateToFertilizer,
  navigateToCrop,
  navigateToExpenses,
  navigateToKhatabook,
  showHelp,
  showError,
}

enum VoiceConversationState {
  listening,
  processing,
  responding,
  waiting,
  error,
  completed,
}
