import 'dart:convert';
import 'package:http/http.dart' as http;

class WeatherService {
  static const String _apiKey = 'your_openweathermap_api_key'; // Replace with actual API key
  static const String _baseUrl = 'https://api.openweathermap.org/data/2.5';

  Future<Map<String, dynamic>> getCurrentWeather(String location) async {
    try {
      // For demo purposes, return mock data
      // In production, use actual API call:
      // final response = await http.get(Uri.parse('$_baseUrl/weather?q=$location&appid=$_apiKey&units=metric'));
      
      // Mock weather data for demo
      await Future.delayed(Duration(seconds: 1)); // Simulate network delay
      
      return {
        'location': location,
        'temperature': 32.5,
        'condition': 'Sunny',
        'humidity': 65,
        'windSpeed': 12.5,
        'visibility': 10,
      };
      
      // Actual API implementation would be:
      /*
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return {
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
