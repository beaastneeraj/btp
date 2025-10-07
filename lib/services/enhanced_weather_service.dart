import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';

// Enhanced Weather Service for Indian Farmers
class EnhancedWeatherService {
  static const String _apiKey = 'your_openweather_api_key'; // Replace with actual API key
  static const String _baseUrl = 'https://api.openweathermap.org/data/2.5';
  
  // Get current weather data
  Future<WeatherData?> getCurrentWeather({
    double? latitude,
    double? longitude,
    String? cityName,
  }) async {
    try {
      String url;
      if (latitude != null && longitude != null) {
        url = '$_baseUrl/weather?lat=$latitude&lon=$longitude&appid=$_apiKey&units=metric';
      } else if (cityName != null) {
        url = '$_baseUrl/weather?q=$cityName,IN&appid=$_apiKey&units=metric';
      } else {
        // Default to Delhi if no location provided
        url = '$_baseUrl/weather?q=Delhi,IN&appid=$_apiKey&units=metric';
      }
      
      final response = await http.get(Uri.parse(url));
      
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return WeatherData.fromJson(data);
      }
    } catch (e) {
      print('Error fetching weather data: $e');
    }
    
    // Return mock data if API fails
    return _getMockWeatherData();
  }
  
  // Get 5-day weather forecast
  Future<List<WeatherForecast>> getWeatherForecast({
    double? latitude,
    double? longitude,
    String? cityName,
  }) async {
    try {
      String url;
      if (latitude != null && longitude != null) {
        url = '$_baseUrl/forecast?lat=$latitude&lon=$longitude&appid=$_apiKey&units=metric';
      } else if (cityName != null) {
        url = '$_baseUrl/forecast?q=$cityName,IN&appid=$_apiKey&units=metric';
      } else {
        // Default to Delhi if no location provided
        url = '$_baseUrl/forecast?q=Delhi,IN&appid=$_apiKey&units=metric';
      }
      
      final response = await http.get(Uri.parse(url));
      
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return _parseForecastData(data);
      }
    } catch (e) {
      print('Error fetching forecast data: $e');
    }
    
    // Return mock data if API fails
    return _getMockForecastData();
  }
  
  // Get agricultural weather alerts
  Future<List<WeatherAlert>> getWeatherAlerts({
    double? latitude,
    double? longitude,
  }) async {
    // In a real implementation, this would fetch from a weather alert service
    return _getMockWeatherAlerts();
  }
  
  // Get current location
  Future<Position?> getCurrentLocation() async {
    try {
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        return null;
      }

      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          return null;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        return null;
      }

      return await Geolocator.getCurrentPosition();
    } catch (e) {
      print('Error getting location: $e');
      return null;
    }
  }
  
  // Get agricultural weather advice
  List<WeatherAdvice> getAgriculturalAdvice(WeatherData weather) {
    List<WeatherAdvice> advice = [];
    
    // Temperature-based advice
    if (weather.temperature > 35) {
      advice.add(WeatherAdvice(
        type: AdviceType.warning,
        title: 'High Temperature Alert',
        message: 'Extreme heat can stress crops. Increase irrigation frequency and consider shade nets for sensitive crops.',
        icon: 'thermometer-hot',
      ));
    } else if (weather.temperature < 10) {
      advice.add(WeatherAdvice(
        type: AdviceType.warning,
        title: 'Cold Temperature Alert',
        message: 'Low temperatures may damage sensitive crops. Cover plants if possible and delay sowing of warm-season crops.',
        icon: 'thermometer-cold',
      ));
    }
    
    // Humidity-based advice
    if (weather.humidity > 85) {
      advice.add(WeatherAdvice(
        type: AdviceType.caution,
        title: 'High Humidity Warning',
        message: 'High humidity increases risk of fungal diseases. Ensure proper air circulation and consider fungicide application.',
        icon: 'water-percent',
      ));
    }
    
    // Wind-based advice
    if (weather.windSpeed > 25) {
      advice.add(WeatherAdvice(
        type: AdviceType.warning,
        title: 'Strong Winds Alert',
        message: 'Strong winds may damage crops. Secure loose materials and avoid spraying pesticides.',
        icon: 'weather-windy',
      ));
    }
    
    // Weather condition-based advice
    switch (weather.condition.toLowerCase()) {
      case 'rain':
      case 'drizzle':
        advice.add(WeatherAdvice(
          type: AdviceType.info,
          title: 'Rainfall Detected',
          message: 'Good for crops! Reduce irrigation and avoid field operations until soil dries.',
          icon: 'weather-rainy',
        ));
        break;
      case 'thunderstorm':
        advice.add(WeatherAdvice(
          type: AdviceType.warning,
          title: 'Thunderstorm Warning',
          message: 'Avoid field work and secure equipment. Risk of crop damage from hail and strong winds.',
          icon: 'weather-lightning',
        ));
        break;
      case 'clear':
        advice.add(WeatherAdvice(
          type: AdviceType.info,
          title: 'Clear Weather',
          message: 'Perfect for field operations like spraying, harvesting, and soil preparation.',
          icon: 'weather-sunny',
        ));
        break;
    }
    
    return advice;
  }
  
  // Get irrigation recommendations
  IrrigationRecommendation getIrrigationRecommendation(
    WeatherData current, 
    List<WeatherForecast> forecast
  ) {
    bool rainExpected = forecast.any((f) => 
        f.condition.toLowerCase().contains('rain') || 
        f.condition.toLowerCase().contains('thunderstorm'));
    
    double totalExpectedRain = forecast
        .where((f) => f.rainAmount != null)
        .map((f) => f.rainAmount!)
        .fold(0.0, (sum, rain) => sum + rain);
    
    if (rainExpected && totalExpectedRain > 10) {
      return IrrigationRecommendation(
        shouldIrrigate: false,
        reason: 'Rain expected in next 3 days (${totalExpectedRain.toStringAsFixed(1)}mm)',
        nextIrrigationDate: DateTime.now().add(Duration(days: 3)),
        waterSavings: '${(totalExpectedRain * 100).toInt()} liters per hectare',
      );
    }
    
    if (current.humidity < 40 && current.temperature > 30) {
      return IrrigationRecommendation(
        shouldIrrigate: true,
        reason: 'High temperature and low humidity increase water stress',
        nextIrrigationDate: DateTime.now(),
        waterSavings: null,
      );
    }
    
    return IrrigationRecommendation(
      shouldIrrigate: false,
      reason: 'Current conditions are suitable, monitor for changes',
      nextIrrigationDate: DateTime.now().add(Duration(days: 2)),
      waterSavings: null,
    );
  }
  
  // Parse forecast data from API response
  List<WeatherForecast> _parseForecastData(Map<String, dynamic> data) {
    List<WeatherForecast> forecasts = [];
    
    if (data['list'] != null) {
      for (var item in data['list']) {
        forecasts.add(WeatherForecast.fromJson(item));
      }
    }
    
    return forecasts;
  }
  
  // Mock weather data for offline/demo use
  WeatherData _getMockWeatherData() {
    return WeatherData(
      temperature: 28.5,
      feelsLike: 32.1,
      humidity: 65,
      pressure: 1013,
      windSpeed: 8.2,
      windDirection: 'NW',
      visibility: 10.0,
      uvIndex: 6,
      condition: 'Partly Cloudy',
      description: 'Partly cloudy with gentle breeze',
      location: 'Delhi, India',
      sunrise: DateTime.now().subtract(Duration(hours: 2)),
      sunset: DateTime.now().add(Duration(hours: 8)),
      lastUpdated: DateTime.now(),
    );
  }
  
  // Mock forecast data
  List<WeatherForecast> _getMockForecastData() {
    return List.generate(5, (index) {
      return WeatherForecast(
        date: DateTime.now().add(Duration(days: index + 1)),
        minTemp: 22.0 + (index * 0.5),
        maxTemp: 30.0 + (index * 0.3),
        condition: index % 2 == 0 ? 'Sunny' : 'Partly Cloudy',
        humidity: 60 + (index * 2),
        windSpeed: 5.0 + (index * 0.5),
        rainAmount: index == 2 ? 5.2 : null,
      );
    });
  }
  
  // Mock weather alerts
  List<WeatherAlert> _getMockWeatherAlerts() {
    return [
      WeatherAlert(
        id: '1',
        title: 'Heat Wave Warning',
        description: 'High temperatures expected for the next 3 days. Take precautions for crops and livestock.',
        severity: AlertSeverity.moderate,
        startTime: DateTime.now(),
        endTime: DateTime.now().add(Duration(days: 3)),
        affectedAreas: ['Delhi', 'Haryana', 'Punjab'],
      ),
    ];
  }
}

// Weather Data Models
class WeatherData {
  final double temperature;
  final double feelsLike;
  final int humidity;
  final double pressure;
  final double windSpeed;
  final String windDirection;
  final double visibility;
  final int uvIndex;
  final String condition;
  final String description;
  final String location;
  final DateTime sunrise;
  final DateTime sunset;
  final DateTime lastUpdated;

  WeatherData({
    required this.temperature,
    required this.feelsLike,
    required this.humidity,
    required this.pressure,
    required this.windSpeed,
    required this.windDirection,
    required this.visibility,
    required this.uvIndex,
    required this.condition,
    required this.description,
    required this.location,
    required this.sunrise,
    required this.sunset,
    required this.lastUpdated,
  });

  factory WeatherData.fromJson(Map<String, dynamic> json) {
    return WeatherData(
      temperature: json['main']['temp'].toDouble(),
      feelsLike: json['main']['feels_like'].toDouble(),
      humidity: json['main']['humidity'],
      pressure: json['main']['pressure'].toDouble(),
      windSpeed: json['wind']?['speed']?.toDouble() ?? 0.0,
      windDirection: _getWindDirection(json['wind']?['deg'] ?? 0),
      visibility: (json['visibility'] ?? 10000) / 1000.0,
      uvIndex: 5, // Would come from separate UV API call
      condition: json['weather'][0]['main'],
      description: json['weather'][0]['description'],
      location: json['name'],
      sunrise: DateTime.fromMillisecondsSinceEpoch(json['sys']['sunrise'] * 1000),
      sunset: DateTime.fromMillisecondsSinceEpoch(json['sys']['sunset'] * 1000),
      lastUpdated: DateTime.now(),
    );
  }
  
  static String _getWindDirection(int degrees) {
    const directions = ['N', 'NE', 'E', 'SE', 'S', 'SW', 'W', 'NW'];
    return directions[((degrees / 45) % 8).round()];
  }
}

class WeatherForecast {
  final DateTime date;
  final double minTemp;
  final double maxTemp;
  final String condition;
  final int humidity;
  final double windSpeed;
  final double? rainAmount;

  WeatherForecast({
    required this.date,
    required this.minTemp,
    required this.maxTemp,
    required this.condition,
    required this.humidity,
    required this.windSpeed,
    this.rainAmount,
  });

  factory WeatherForecast.fromJson(Map<String, dynamic> json) {
    return WeatherForecast(
      date: DateTime.fromMillisecondsSinceEpoch(json['dt'] * 1000),
      minTemp: json['main']['temp_min'].toDouble(),
      maxTemp: json['main']['temp_max'].toDouble(),
      condition: json['weather'][0]['main'],
      humidity: json['main']['humidity'],
      windSpeed: json['wind']?['speed']?.toDouble() ?? 0.0,
      rainAmount: json['rain']?['3h']?.toDouble(),
    );
  }
}

class WeatherAlert {
  final String id;
  final String title;
  final String description;
  final AlertSeverity severity;
  final DateTime startTime;
  final DateTime endTime;
  final List<String> affectedAreas;

  WeatherAlert({
    required this.id,
    required this.title,
    required this.description,
    required this.severity,
    required this.startTime,
    required this.endTime,
    required this.affectedAreas,
  });
}

class WeatherAdvice {
  final AdviceType type;
  final String title;
  final String message;
  final String icon;

  WeatherAdvice({
    required this.type,
    required this.title,
    required this.message,
    required this.icon,
  });
}

class IrrigationRecommendation {
  final bool shouldIrrigate;
  final String reason;
  final DateTime nextIrrigationDate;
  final String? waterSavings;

  IrrigationRecommendation({
    required this.shouldIrrigate,
    required this.reason,
    required this.nextIrrigationDate,
    this.waterSavings,
  });
}

enum AlertSeverity { low, moderate, high, severe }
enum AdviceType { info, caution, warning, critical }