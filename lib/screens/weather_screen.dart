import 'package:flutter/material.dart';
import '../services/weather_service.dart';
import '../widgets/loading_widget.dart';
import '../widgets/error_widget.dart';

class WeatherScreen extends StatefulWidget {
  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  final WeatherService _weatherService = WeatherService();
  Map<String, dynamic>? weatherData;
  bool isLoading = true;
  String? error;

  @override
  void initState() {
    super.initState();
    _loadWeatherData();
  }

  Future<void> _loadWeatherData() async {
    try {
      setState(() {
        isLoading = true;
        error = null;
      });
      
      final data = await _weatherService.getCurrentWeather('Jaipur');
      setState(() {
        weatherData = data;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        error = e.toString();
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.teal.shade700,
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(24)),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: _loadWeatherData,
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.teal.shade400, Colors.blue.shade200],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: isLoading
            ? LoadingWidget(message: 'Loading weather data...')
            : error != null
                ? ErrorWidgetCustom(error: error!)
                : _buildWeatherContent(),
      ),
    );
  }

  Widget _buildWeatherContent() {
    if (weatherData == null) return LoadingWidget();

    return ListView(
      padding: EdgeInsets.all(20),
      children: [
        Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
          elevation: 8,
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blue.shade200, Colors.green.shade100],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(24),
            ),
            padding: EdgeInsets.all(24),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          weatherData!['location'] ?? 'Unknown',
                          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          weatherData!['condition'] ?? 'N/A',
                          style: TextStyle(fontSize: 18),
                        ),
                        Text(
                          '${weatherData!['temperature']?.toStringAsFixed(1) ?? 'N/A'}°C',
                          style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Icon(
                      _getWeatherIcon(weatherData!['condition']),
                      size: 64,
                      color: Colors.blue.shade700,
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _WeatherDetail(
                      icon: Icons.water_drop,
                      label: 'Humidity',
                      value: '${weatherData!['humidity'] ?? 'N/A'}%',
                    ),
                    _WeatherDetail(
                      icon: Icons.air,
                      label: 'Wind',
                      value: '${weatherData!['windSpeed'] ?? 'N/A'} km/h',
                    ),
                    _WeatherDetail(
                      icon: Icons.visibility,
                      label: 'Visibility',
                      value: '${weatherData!['visibility'] ?? 'N/A'} km',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 20),
        Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          elevation: 4,
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Weather Advisory',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 12),
                Text(
                  _getWeatherAdvice(weatherData!),
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  IconData _getWeatherIcon(String? condition) {
    switch (condition?.toLowerCase()) {
      case 'sunny':
      case 'clear':
        return Icons.wb_sunny;
      case 'cloudy':
        return Icons.cloud;
      case 'rainy':
        return Icons.beach_access;
      default:
        return Icons.wb_cloudy;
    }
  }

  String _getWeatherAdvice(Map<String, dynamic> data) {
    final temp = data['temperature'] as double?;
    final condition = data['condition'] as String?;
    
    if (temp != null && temp > 35) {
      return 'High temperature detected. Ensure adequate irrigation and consider providing shade for crops.';
    } else if (condition?.toLowerCase().contains('rain') == true) {
      return 'Rain expected. Good for natural irrigation but monitor for waterlogging.';
    } else if (temp != null && temp < 10) {
      return 'Low temperature alert. Protect sensitive crops from frost damage.';
    }
    
    return 'Weather conditions are favorable for farming activities.';
  }
}

class _WeatherDetail extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _WeatherDetail({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: Colors.blue.shade700),
        SizedBox(height: 4),
        Text(label, style: TextStyle(fontSize: 12)),
        Text(value, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
      ],
    );
  }
}
