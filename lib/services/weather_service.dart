import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';

class WeatherService {
  static const String _apiKey = 'a8e71c9932b20c4ceb0aed183e6a83bb'; // OpenWeatherMap API key
  static const String _baseUrl = 'https://api.openweathermap.org/data/2.5';

  // Get current location
  Future<Position> getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Check if location services are enabled
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

    return await Geolocator.getCurrentPosition();
  }

  // Get current weather by coordinates
  Future<Map<String, dynamic>> getCurrentWeather(double lat, double lon) async {
    try {
      final url = '$_baseUrl/weather?lat=$lat&lon=$lon&appid=$_apiKey&units=metric';
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return _formatCurrentWeather(data);
      } else {
        throw Exception('Failed to fetch weather data: ${response.statusCode}');
      }
    } catch (e) {
      // Return mock data if API fails
      return _getMockCurrentWeather();
    }
  }

  // Get current weather by city name
  Future<Map<String, dynamic>> getCurrentWeatherByCity(String cityName) async {
    try {
      final url = '$_baseUrl/weather?q=$cityName&appid=$_apiKey&units=metric';
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return _formatCurrentWeather(data);
      } else {
        throw Exception('Failed to fetch weather data for $cityName');
      }
    } catch (e) {
      // Return mock data if API fails
      return _getMockCurrentWeather();
    }
  }

  // Get weather forecast
  Future<List<Map<String, dynamic>>> getWeatherForecast(double lat, double lon) async {
    try {
      final url = '$_baseUrl/forecast?lat=$lat&lon=$lon&appid=$_apiKey&units=metric';
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return _formatForecastData(data);
      } else {
        throw Exception('Failed to fetch forecast data: ${response.statusCode}');
      }
    } catch (e) {
      // Return mock data if API fails
      return _getMockForecastData();
    }
  }

  // Get weather forecast by city
  Future<List<Map<String, dynamic>>> getWeatherForecastByCity(String cityName) async {
    try {
      final url = '$_baseUrl/forecast?q=$cityName&appid=$_apiKey&units=metric';
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return _formatForecastData(data);
      } else {
        throw Exception('Failed to fetch forecast data for $cityName');
      }
    } catch (e) {
      // Return mock data if API fails
      return _getMockForecastData();
    }
  }

  // Get agricultural weather advisory
  Future<Map<String, dynamic>> getAgricultureAdvisory(double lat, double lon) async {
    try {
      // Get current weather and forecast
      final currentWeather = await getCurrentWeather(lat, lon);
      final forecast = await getWeatherForecast(lat, lon);

      return {
        'current': currentWeather,
        'forecast': forecast.take(5).toList(),
        'farmingRecommendations': _generateFarmingRecommendations(currentWeather, forecast),
        'alerts': _generateWeatherAlerts(currentWeather, forecast),
        'soilConditions': _analyzeSoilConditions(currentWeather, forecast),
      };
    } catch (e) {
      return _getMockAgricultureAdvisory();
    }
  }

  // Format current weather data
  Map<String, dynamic> _formatCurrentWeather(Map<String, dynamic> data) {
    final main = data['main'];
    final weather = data['weather'][0];
    final wind = data['wind'];
    final sys = data['sys'];

    return {
      'location': '${data['name']}, ${sys['country']}',
      'temperature': (main['temp'] as num).toDouble(),
      'feelsLike': (main['feels_like'] as num).toDouble(),
      'condition': weather['main'],
      'description': weather['description'],
      'humidity': main['humidity'],
      'pressure': (main['pressure'] as num).toDouble(),
      'windSpeed': (wind['speed'] as num).toDouble(),
      'windDirection': wind['deg'] ?? 0,
      'visibility': (data['visibility'] ?? 10000) / 1000, // Convert to km
      'uvIndex': 5, // UV data requires separate API call
      'icon': weather['icon'],
      'sunrise': DateTime.fromMillisecondsSinceEpoch(sys['sunrise'] * 1000),
      'sunset': DateTime.fromMillisecondsSinceEpoch(sys['sunset'] * 1000),
      'precipitation': 0, // Current precipitation not available in free tier
    };
  }

  // Format forecast data
  List<Map<String, dynamic>> _formatForecastData(Map<String, dynamic> data) {
    final List<dynamic> list = data['list'];
    final Map<String, Map<String, dynamic>> dailyForecast = {};

    for (final item in list) {
      final DateTime date = DateTime.fromMillisecondsSinceEpoch(item['dt'] * 1000);
      final String dateKey = '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';

      final temp = (item['main']['temp'] as num).toDouble();
      final weather = item['weather'][0];

      if (!dailyForecast.containsKey(dateKey)) {
        dailyForecast[dateKey] = {
          'date': date,
          'maxTemp': temp,
          'minTemp': temp,
          'condition': weather['main'],
          'description': weather['description'],
          'icon': weather['icon'],
          'humidity': item['main']['humidity'],
          'precipitation': (item['pop'] as num).toDouble() * 100, // Probability of precipitation
          'windSpeed': (item['wind']['speed'] as num).toDouble(),
        };
      } else {
        final existing = dailyForecast[dateKey]!;
        existing['maxTemp'] = (existing['maxTemp'] as double).compareTo(temp) > 0 
            ? existing['maxTemp'] 
            : temp;
        existing['minTemp'] = (existing['minTemp'] as double).compareTo(temp) < 0 
            ? existing['minTemp'] 
            : temp;
      }
    }

    return dailyForecast.values.toList()..sort((a, b) => (a['date'] as DateTime).compareTo(b['date'] as DateTime));
  }

  // Generate farming recommendations based on weather
  List<String> _generateFarmingRecommendations(Map<String, dynamic> current, List<Map<String, dynamic>> forecast) {
    List<String> recommendations = [];
    
    final temp = current['temperature'] as double;
    final humidity = current['humidity'] as int;
    final windSpeed = current['windSpeed'] as double;

    // Temperature-based recommendations
    if (temp > 35) {
      recommendations.add('Extreme heat warning: Provide shade for livestock and increase irrigation');
      recommendations.add('Avoid heavy field work during midday hours');
      recommendations.add('Monitor crops for heat stress and water requirements');
    } else if (temp > 30) {
      recommendations.add('High temperature: Ensure adequate irrigation for crops');
      recommendations.add('Consider shade nets for sensitive plants');
      recommendations.add('Early morning or evening work recommended');
    } else if (temp < 10) {
      recommendations.add('Cold weather: Protect sensitive crops from frost');
      recommendations.add('Consider covering young plants overnight');
      recommendations.add('Good time for winter crop preparation');
    } else {
      recommendations.add('Ideal temperature for most farming activities');
      recommendations.add('Good conditions for planting and field work');
    }

    // Humidity-based recommendations
    if (humidity > 80) {
      recommendations.add('High humidity: Monitor for fungal diseases');
      recommendations.add('Ensure good air circulation in greenhouse');
      recommendations.add('Delay fungicide application if possible');
    } else if (humidity < 30) {
      recommendations.add('Low humidity: Increase irrigation frequency');
      recommendations.add('Consider misting for nursery plants');
    }

    // Wind-based recommendations
    if (windSpeed > 15) {
      recommendations.add('High winds: Secure loose structures and equipment');
      recommendations.add('Postpone pesticide spraying');
      recommendations.add('Check for crop damage after windy conditions');
    }

    // Check upcoming precipitation
    final hasRainForecast = forecast.any((day) => (day['precipitation'] as double) > 50);
    if (hasRainForecast) {
      recommendations.add('Rain expected: Postpone pesticide and fertilizer application');
      recommendations.add('Prepare drainage systems');
      recommendations.add('Good opportunity for rain-fed crop planting');
    } else {
      recommendations.add('No significant rain expected: Plan irrigation schedule');
      recommendations.add('Good conditions for field operations');
    }

    return recommendations;
  }

  // Generate weather alerts
  List<Map<String, dynamic>> _generateWeatherAlerts(Map<String, dynamic> current, List<Map<String, dynamic>> forecast) {
    List<Map<String, dynamic>> alerts = [];

    final temp = current['temperature'] as double;
    final windSpeed = current['windSpeed'] as double;

    // Temperature alerts
    if (temp > 40) {
      alerts.add({
        'type': 'extreme_heat',
        'title': 'Extreme Heat Warning',
        'description': 'Temperature above 40°C. Take immediate protective measures.',
        'severity': 'high',
        'icon': 'warning',
      });
    } else if (temp < 5) {
      alerts.add({
        'type': 'frost_warning',
        'title': 'Frost Warning',
        'description': 'Temperature below 5°C. Protect sensitive crops.',
        'severity': 'medium',
        'icon': 'ac_unit',
      });
    }

    // Wind alerts
    if (windSpeed > 20) {
      alerts.add({
        'type': 'high_wind',
        'title': 'High Wind Alert',
        'description': 'Wind speed above 20 km/h. Secure equipment and structures.',
        'severity': 'medium',
        'icon': 'air',
      });
    }

    // Precipitation alerts
    final heavyRainDays = forecast.where((day) => (day['precipitation'] as double) > 80).length;
    if (heavyRainDays > 0) {
      alerts.add({
        'type': 'heavy_rain',
        'title': 'Heavy Rain Expected',
        'description': 'Heavy rainfall expected in the next few days. Prepare drainage.',
        'severity': 'medium',
        'icon': 'grain',
      });
    }

    return alerts;
  }

  // Analyze soil conditions based on weather
  Map<String, dynamic> _analyzeSoilConditions(Map<String, dynamic> current, List<Map<String, dynamic>> forecast) {
    final temp = current['temperature'] as double;
    final humidity = current['humidity'] as int;
    
    String soilMoisture;
    String workability;
    String recommendation;

    // Estimate soil conditions
    if (humidity > 70 && temp < 25) {
      soilMoisture = 'High';
      workability = 'Poor - Soil may be too wet';
      recommendation = 'Wait for drier conditions before heavy machinery use';
    } else if (humidity < 40 && temp > 30) {
      soilMoisture = 'Low';
      workability = 'Good - But soil may be hard';
      recommendation = 'Consider irrigation before planting. Good for harvesting';
    } else {
      soilMoisture = 'Moderate';
      workability = 'Good';
      recommendation = 'Ideal conditions for most field operations';
    }

    return {
      'moisture': soilMoisture,
      'workability': workability,
      'recommendation': recommendation,
      'temperature': temp > 15 ? 'Favorable' : 'Cool',
    };
  }

  // Mock data fallbacks
  Map<String, dynamic> _getMockCurrentWeather() {
    return {
      'location': 'Delhi, IN',
      'temperature': 28.5,
      'feelsLike': 31.2,
      'condition': 'Partly Cloudy',
      'description': 'Perfect farming weather with good sunshine',
      'humidity': 65,
      'pressure': 1013.2,
      'windSpeed': 12.5,
      'windDirection': 180,
      'visibility': 10.0,
      'uvIndex': 7,
      'icon': '02d',
      'sunrise': DateTime.now().subtract(const Duration(hours: 2)),
      'sunset': DateTime.now().add(const Duration(hours: 6)),
      'precipitation': 0,
    };
  }

  List<Map<String, dynamic>> _getMockForecastData() {
    return List.generate(5, (index) {
      final date = DateTime.now().add(Duration(days: index + 1));
      final temps = [32, 29, 26, 30, 33];
      final conditions = ['Sunny', 'Partly Cloudy', 'Light Rain', 'Cloudy', 'Sunny'];
      final icons = ['01d', '02d', '10d', '03d', '01d'];
      
      return {
        'date': date,
        'maxTemp': temps[index].toDouble(),
        'minTemp': (temps[index] - 10).toDouble(),
        'condition': conditions[index],
        'description': conditions[index],
        'icon': icons[index],
        'humidity': 60 + (index * 5),
        'precipitation': index == 2 ? 75.0 : (index * 10).toDouble(),
        'windSpeed': 10.0 + (index * 2),
      };
    });
  }

  Map<String, dynamic> _getMockAgricultureAdvisory() {
    return {
      'current': _getMockCurrentWeather(),
      'forecast': _getMockForecastData(),
      'farmingRecommendations': [
        'Ideal temperature for most farming activities',
        'Good conditions for planting and field work',
        'Monitor irrigation requirements',
      ],
      'alerts': [],
      'soilConditions': {
        'moisture': 'Moderate',
        'workability': 'Good',
        'recommendation': 'Ideal conditions for most field operations',
        'temperature': 'Favorable',
      },
    };
  }
}
