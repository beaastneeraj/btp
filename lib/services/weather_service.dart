import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';

class WeatherService {
  static const String _apiKey = 'YOUR_OPENWEATHER_API_KEY'; // Replace with actual API key
  static const String _baseUrl = 'https://api.openweathermap.org/data/2.5';

  // Get current weather by coordinates
  Future<Map<String, dynamic>> getCurrentWeather(double lat, double lon) async {
    try {
      final url = '$_baseUrl/weather?lat=$lat&lon=$lon&appid=$_apiKey&units=metric';
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return _formatCurrentWeather(data);
      } else {
        throw Exception('Failed to fetch weather data');
      }
    } catch (e) {
      // Return mock data if API fails
      return _getMockCurrentWeather();
    }
  }

  // Get weather forecast
  Future<List<Map<String, dynamic>>> getWeatherForecast(double lat, double lon, {int days = 5}) async {
    try {
      final url = '$_baseUrl/forecast?lat=$lat&lon=$lon&appid=$_apiKey&units=metric&cnt=${days * 8}';
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return _formatForecast(data);
      } else {
        throw Exception('Failed to fetch forecast data');
      }
    } catch (e) {
      // Return mock data if API fails
      return _getMockForecast(days);
    }
  }

  // Get current location
  Future<Position> getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw Exception('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw Exception('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      throw Exception('Location permissions are permanently denied');
    }

    return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
  }

  // Get weather by city name
  Future<Map<String, dynamic>> getWeatherByCity(String cityName) async {
    try {
      final url = '$_baseUrl/weather?q=$cityName&appid=$_apiKey&units=metric';
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return _formatCurrentWeather(data);
      } else {
        throw Exception('City not found');
      }
    } catch (e) {
      return _getMockCurrentWeather();
    }
  }

  // Get agricultural weather advice
  Map<String, String> getAgriculturalAdvice(Map<String, dynamic> weather) {
    final temp = weather['temperature'] as double;
    final humidity = weather['humidity'] as double;
    final windSpeed = weather['windSpeed'] as double;
    final condition = weather['condition'] as String;

    Map<String, String> advice = {};

    // Temperature advice
    if (temp < 10) {
      advice['temperature'] = 'Cold weather: Protect sensitive crops from frost. Consider covering or moving to shelter.';
    } else if (temp > 35) {
      advice['temperature'] = 'Hot weather: Increase watering frequency. Provide shade for sensitive plants.';
    } else {
      advice['temperature'] = 'Optimal temperature for most crops. Good growing conditions.';
    }

    // Humidity advice
    if (humidity < 30) {
      advice['humidity'] = 'Low humidity: Increase watering and consider mulching to retain soil moisture.';
    } else if (humidity > 80) {
      advice['humidity'] = 'High humidity: Watch for fungal diseases. Ensure good air circulation.';
    } else {
      advice['humidity'] = 'Good humidity levels for healthy plant growth.';
    }

    // Wind advice
    if (windSpeed > 15) {
      advice['wind'] = 'Strong winds: Secure tall plants and provide windbreaks for young crops.';
    } else {
      advice['wind'] = 'Gentle winds help with air circulation and plant health.';
    }

    // Condition-based advice
    switch (condition.toLowerCase()) {
      case 'rain':
        advice['condition'] = 'Rainy weather: Good for soil moisture. Avoid fieldwork to prevent soil compaction.';
        break;
      case 'sunny':
        advice['condition'] = 'Sunny weather: Perfect for photosynthesis. Monitor soil moisture levels.';
        break;
      case 'cloudy':
        advice['condition'] = 'Cloudy weather: Reduced evaporation. Good for transplanting young plants.';
        break;
      case 'snow':
        advice['condition'] = 'Snow: Provides insulation for soil. Protect greenhouse structures.';
        break;
      default:
        advice['condition'] = 'Monitor weather conditions and adjust farming activities accordingly.';
    }

    return advice;
  }

  // Get farming tasks based on weather
  List<String> getWeatherBasedTasks(Map<String, dynamic> weather) {
    final temp = weather['temperature'] as double;
    final condition = weather['condition'] as String;
    final humidity = weather['humidity'] as double;

    List<String> tasks = [];

    if (condition.toLowerCase().contains('rain')) {
      tasks.addAll([
        'Check drainage systems',
        'Inspect for pest issues after rain',
        'Plan indoor maintenance tasks',
      ]);
    } else if (condition.toLowerCase().contains('sunny')) {
      if (temp > 25) {
        tasks.addAll([
          'Water crops in early morning or evening',
          'Check irrigation systems',
          'Harvest mature crops',
        ]);
      } else {
        tasks.addAll([
          'Perfect day for fieldwork',
          'Plant new crops',
          'Apply fertilizers',
        ]);
      }
    }

    if (temp < 15) {
      tasks.addAll([
        'Check for frost damage',
        'Cover sensitive plants',
        'Prepare heating systems',
      ]);
    }

    if (humidity > 80) {
      tasks.addAll([
        'Monitor for fungal diseases',
        'Improve air circulation',
        'Check stored produce',
      ]);
    }

    return tasks;
  }

  // Format current weather data
  Map<String, dynamic> _formatCurrentWeather(Map<String, dynamic> data) {
    return {
      'temperature': data['main']['temp'].toDouble(),
      'feelsLike': data['main']['feels_like'].toDouble(),
      'humidity': data['main']['humidity'].toDouble(),
      'pressure': data['main']['pressure'].toDouble(),
      'windSpeed': data['wind']['speed'].toDouble(),
      'windDirection': data['wind']['deg'].toDouble(),
      'visibility': (data['visibility'] / 1000).toDouble(), // Convert to km
      'condition': data['weather'][0]['main'],
      'description': data['weather'][0]['description'],
      'icon': data['weather'][0]['icon'],
      'cityName': data['name'],
      'country': data['sys']['country'],
      'sunrise': DateTime.fromMillisecondsSinceEpoch(data['sys']['sunrise'] * 1000),
      'sunset': DateTime.fromMillisecondsSinceEpoch(data['sys']['sunset'] * 1000),
      'timestamp': DateTime.now(),
    };
  }

  // Format forecast data
  List<Map<String, dynamic>> _formatForecast(Map<String, dynamic> data) {
    final List<dynamic> list = data['list'];
    return list.map((item) {
      return {
        'date': DateTime.fromMillisecondsSinceEpoch(item['dt'] * 1000),
        'temperature': item['main']['temp'].toDouble(),
        'minTemp': item['main']['temp_min'].toDouble(),
        'maxTemp': item['main']['temp_max'].toDouble(),
        'humidity': item['main']['humidity'].toDouble(),
        'condition': item['weather'][0]['main'],
        'description': item['weather'][0]['description'],
        'icon': item['weather'][0]['icon'],
        'windSpeed': item['wind']['speed'].toDouble(),
        'precipitation': item['rain']?['3h']?.toDouble() ?? 0.0,
      };
    }).toList();
  }

  // Mock current weather data for development/offline use
  Map<String, dynamic> _getMockCurrentWeather() {
    return {
      'temperature': 24.5,
      'feelsLike': 26.2,
      'humidity': 65.0,
      'pressure': 1013.2,
      'windSpeed': 8.5,
      'windDirection': 180.0,
      'visibility': 10.0,
      'condition': 'Sunny',
      'description': 'Clear sky',
      'icon': '01d',
      'cityName': 'Farm Location',
      'country': 'IN',
      'sunrise': DateTime.now().subtract(const Duration(hours: 2)),
      'sunset': DateTime.now().add(const Duration(hours: 6)),
      'timestamp': DateTime.now(),
    };
  }

  // Mock forecast data
  List<Map<String, dynamic>> _getMockForecast(int days) {
    final List<Map<String, dynamic>> forecast = [];
    final now = DateTime.now();

    for (int i = 0; i < days * 4; i++) {
      forecast.add({
        'date': now.add(Duration(hours: i * 6)),
        'temperature': 20.0 + (i % 10),
        'minTemp': 18.0 + (i % 8),
        'maxTemp': 25.0 + (i % 12),
        'humidity': 60.0 + (i % 20),
        'condition': ['Sunny', 'Cloudy', 'Rain'][i % 3],
        'description': ['Clear sky', 'Few clouds', 'Light rain'][i % 3],
        'icon': ['01d', '02d', '10d'][i % 3],
        'windSpeed': 5.0 + (i % 10),
        'precipitation': i % 3 == 2 ? 2.5 : 0.0,
      });
    }

    return forecast;
  }

  // Get weather alerts
  Future<List<Map<String, dynamic>>> getWeatherAlerts(double lat, double lon) async {
    try {
      final url = '$_baseUrl/onecall?lat=$lat&lon=$lon&appid=$_apiKey&exclude=minutely,hourly';
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data['alerts'] != null) {
          return List<Map<String, dynamic>>.from(data['alerts']);
        }
      }
      return [];
    } catch (e) {
      return [];
    }
  }

  // Calculate farming suitability index
  double calculateFarmingSuitabilityIndex(Map<String, dynamic> weather) {
    final temp = weather['temperature'] as double;
    final humidity = weather['humidity'] as double;
    final windSpeed = weather['windSpeed'] as double;
    final condition = weather['condition'] as String;

    double index = 0.0;

    // Temperature scoring (optimal range: 15-30°C)
    if (temp >= 15 && temp <= 30) {
      index += 0.4;
    } else if (temp > 10 && temp < 35) {
      index += 0.2;
    }

    // Humidity scoring (optimal range: 40-70%)
    if (humidity >= 40 && humidity <= 70) {
      index += 0.3;
    } else if (humidity > 30 && humidity < 80) {
      index += 0.15;
    }

    // Wind scoring (optimal: < 15 m/s)
    if (windSpeed < 10) {
      index += 0.2;
    } else if (windSpeed < 15) {
      index += 0.1;
    }

    // Condition scoring
    switch (condition.toLowerCase()) {
      case 'sunny':
      case 'clear':
        index += 0.1;
        break;
      case 'cloudy':
      case 'partly cloudy':
        index += 0.08;
        break;
      case 'rain':
        index += 0.05;
        break;
    }

    return (index * 100).clamp(0.0, 100.0);
  }
}
          'location': data['name'],
          'temperature': data['main']['temp'].toDouble(),
          'condition': data['weather'][0]['main'],
          'humidity': data['main']['humidity'],
          'windSpeed': data['wind']['speed'].toDouble(),
          'visibility': (data['visibility'] / 1000).toDouble(),
        };
      } else {
        throw Exception('Failed to load weather data');
      }
      */
    } catch (e) {
      throw Exception('Error fetching weather data: $e');
    }
  }

  Future<List<Map<String, dynamic>>> getWeatherForecast(String location, int days) async {
    try {
      // For demo purposes, return mock forecast data
      await Future.delayed(Duration(seconds: 1));
      
      return List.generate(days, (index) => {
        'date': DateTime.now().add(Duration(days: index + 1)).toIso8601String(),
        'temperature': 30.0 + (index % 5),
        'condition': ['Sunny', 'Cloudy', 'Rainy'][index % 3],
        'humidity': 60 + (index % 20),
      });
    } catch (e) {
      throw Exception('Error fetching forecast data: $e');
    }
  }
}
