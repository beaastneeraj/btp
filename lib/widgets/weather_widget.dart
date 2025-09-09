import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/app_provider.dart';
import '../services/weather_service.dart';

class WeatherWidget extends StatefulWidget {
  const WeatherWidget({super.key});

  @override
  State<WeatherWidget> createState() => _WeatherWidgetState();
}

class _WeatherWidgetState extends State<WeatherWidget> {
  final WeatherService _weatherService = WeatherService();
  Map<String, dynamic>? currentWeather;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadWeather();
  }

  Future<void> _loadWeather() async {
    try {
      setState(() => isLoading = true);
      
      // For demo, using mock coordinates (New Delhi)
      final weather = await _weatherService.getCurrentWeather(28.6139, 77.2090);
      
      if (mounted) {
        setState(() {
          currentWeather = weather;
          isLoading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() => isLoading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Colors.white.withOpacity(0.2),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(
                Icons.cloud,
                color: Colors.white,
                size: 24,
              ),
              const SizedBox(width: 8),
              const Text(
                'Weather Conditions',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const Spacer(),
              IconButton(
                onPressed: _loadWeather,
                icon: Icon(
                  Icons.refresh,
                  color: Colors.white.withOpacity(0.8),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          if (isLoading)
            const Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            )
          else if (currentWeather != null)
            _buildWeatherContent()
          else
            _buildErrorContent(),
        ],
      ),
    );
  }

  Widget _buildWeatherContent() {
    final weather = currentWeather!;
    final temp = weather['temperature']?.toInt() ?? 0;
    final condition = weather['condition'] ?? 'Unknown';
    final humidity = weather['humidity']?.toInt() ?? 0;
    final windSpeed = weather['windSpeed']?.toInt() ?? 0;

    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '$temp°C',
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    condition,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white.withOpacity(0.9),
                    ),
                  ),
                  Text(
                    weather['cityName'] ?? 'Farm Location',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white.withOpacity(0.7),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1),
                borderRadius: BorderRadius.circular(50),
              ),
              child: Icon(
                _getWeatherIcon(condition),
                size: 48,
                color: Colors.white,
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            Expanded(
              child: _buildWeatherStat(
                'Humidity',
                '$humidity%',
                Icons.water_drop,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: _buildWeatherStat(
                'Wind Speed',
                '${windSpeed}km/h',
                Icons.air,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: _buildWeatherStat(
                'Visibility',
                '${weather['visibility']?.toInt() ?? 10}km',
                Icons.visibility,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        _buildFarmingAdvice(),
      ],
    );
  }

  Widget _buildWeatherStat(String label, String value, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Icon(
            icon,
            size: 20,
            color: Colors.white.withOpacity(0.8),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: Colors.white.withOpacity(0.7),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFarmingAdvice() {
    if (currentWeather == null) return const SizedBox.shrink();

    final advice = _weatherService.getAgriculturalAdvice(currentWeather!);
    final suitabilityIndex = _weatherService.calculateFarmingSuitabilityIndex(currentWeather!);

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(
                Icons.agriculture,
                size: 16,
                color: Colors.white,
              ),
              const SizedBox(width: 8),
              const Text(
                'Farming Conditions',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: _getSuitabilityColor(suitabilityIndex),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  '${suitabilityIndex.toInt()}%',
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          if (advice['condition'] != null)
            Text(
              advice['condition']!,
              style: TextStyle(
                fontSize: 12,
                color: Colors.white.withOpacity(0.9),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildErrorContent() {
    return Center(
      child: Column(
        children: [
          Icon(
            Icons.error_outline,
            size: 48,
            color: Colors.white.withOpacity(0.7),
          ),
          const SizedBox(height: 8),
          Text(
            'Unable to load weather data',
            style: TextStyle(
              color: Colors.white.withOpacity(0.8),
            ),
          ),
          const SizedBox(height: 8),
          TextButton(
            onPressed: _loadWeather,
            child: const Text(
              'Retry',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  IconData _getWeatherIcon(String condition) {
    switch (condition.toLowerCase()) {
      case 'sunny':
      case 'clear':
        return Icons.wb_sunny;
      case 'cloudy':
      case 'clouds':
        return Icons.cloud;
      case 'rain':
      case 'drizzle':
        return Icons.umbrella;
      case 'snow':
        return Icons.ac_unit;
      case 'thunderstorm':
        return Icons.flash_on;
      default:
        return Icons.wb_cloudy;
    }
  }

  Color _getSuitabilityColor(double index) {
    if (index >= 80) return Colors.green;
    if (index >= 60) return Colors.orange;
    return Colors.red;
  }
}
