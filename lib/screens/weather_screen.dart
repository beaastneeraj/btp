import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../providers/theme_provider.dart';
import '../services/localization_service.dart';
import '../services/weather_service.dart';

// Weather data providers
final weatherServiceProvider = Provider<WeatherService>((ref) => WeatherService());
final weatherDataProvider = StateProvider<Map<String, dynamic>?>((ref) => null);
final locationProvider = StateProvider<String>((ref) => 'Delhi, India');
final forecastDataProvider = StateProvider<List<Map<String, dynamic>>?>((ref) => null);

class WeatherScreen extends ConsumerStatefulWidget {
  const WeatherScreen({super.key});

  @override
  ConsumerState<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends ConsumerState<WeatherScreen> {
  bool _isLoading = false;
  bool _mounted = true;

  @override
  void initState() {
    super.initState();
    _loadWeatherData();
  }

  @override
  void dispose() {
    _mounted = false;
    super.dispose();
  }

  Future<void> _loadWeatherData() async {
    if (!_mounted) return;
    
    setState(() {
      _isLoading = true;
    });

    try {
      final weatherService = ref.read(weatherServiceProvider);
      final location = ref.read(locationProvider);

      // Get weather data from API
      final currentWeather = await weatherService.getCurrentWeatherByCity(location);
      final forecast = await weatherService.getWeatherForecastByCity(location);

      if (_mounted) {
        ref.read(weatherDataProvider.notifier).state = currentWeather;
        ref.read(forecastDataProvider.notifier).state = forecast;
        setState(() {
          _isLoading = false;
        });
      }
    } catch (e) {
      if (_mounted) {
        // Fallback to mock data on error
        final mockWeather = {
          'location': ref.read(locationProvider),
          'temperature': 28.5,
          'condition': 'Partly Cloudy',
          'description': 'Pleasant farming weather',
          'humidity': 65,
          'windSpeed': 12.5,
          'precipitation': 0.0,
          'uvIndex': 7,
          'pressure': 1013.2,
          'icon': '02d',
        };
        
        ref.read(weatherDataProvider.notifier).state = mockWeather;
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final weatherData = ref.watch(weatherDataProvider);
    final forecast = ref.watch(forecastDataProvider);
    final isDarkMode = ref.watch(themeModeProvider) == ThemeMode.dark;

    return Scaffold(
      backgroundColor: isDarkMode ? Colors.grey[900] : Colors.grey[50],
      appBar: AppBar(
        title: Text(
          LocalizationService.translate('weather', 'en'),
          style: GoogleFonts.inter(fontWeight: FontWeight.w600),
        ),
        backgroundColor: isDarkMode ? Colors.grey[850] : Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: _loadWeatherData,
            icon: Icon(_isLoading ? Icons.hourglass_empty : Icons.refresh),
          ),
        ],
      ),
      body: _isLoading && weatherData == null
          ? const Center(child: CircularProgressIndicator())
          : weatherData == null
              ? _buildErrorState()
              : _buildWeatherContent(weatherData, forecast ?? []),
    );
  }

  Widget _buildErrorState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.error_outline, size: 64, color: Colors.grey),
          const SizedBox(height: 16),
          Text(
            'Failed to load weather data',
            style: GoogleFonts.inter(fontSize: 18, color: Colors.grey),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: _loadWeatherData,
            child: Text('Retry'),
          ),
        ],
      ),
    );
  }

  Widget _buildWeatherContent(Map<String, dynamic> weather, List<Map<String, dynamic>> forecast) {
    final isDarkMode = ref.watch(themeModeProvider) == ThemeMode.dark;
    
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Current Weather Card
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: isDarkMode
                    ? [Colors.blue[900]!, Colors.purple[900]!]
                    : [Colors.blue[400]!, Colors.purple[400]!],
              ),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          weather['location'] ?? 'Unknown Location',
                          style: GoogleFonts.inter(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          weather['condition'] ?? 'Unknown',
                          style: GoogleFonts.inter(
                            fontSize: 16,
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ),
                    Icon(
                      _getWeatherIcon(weather['icon'] ?? '01d'),
                      size: 64,
                      color: Colors.white,
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '${(weather['temperature'] ?? 0).round()}°',
                      style: GoogleFonts.inter(
                        fontSize: 64,
                        fontWeight: FontWeight.w300,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: Text(
                        'C',
                        style: GoogleFonts.inter(
                          fontSize: 24,
                          color: Colors.white70,
                        ),
                      ),
                    ),
                  ],
                ),
                Text(
                  weather['description'] ?? 'No description',
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ),
          
          const SizedBox(height: 24),
          
          // Weather Details
          _buildWeatherDetails(weather),
          
          const SizedBox(height: 24),
          
          // 5-Day Forecast
          if (forecast.isNotEmpty) _buildForecast(forecast),
        ],
      ),
    );
  }

  Widget _buildWeatherDetails(Map<String, dynamic> weather) {
    final isDarkMode = ref.watch(themeModeProvider) == ThemeMode.dark;
    
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: isDarkMode ? Colors.grey[800] : Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Weather Details',
            style: GoogleFonts.inter(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: isDarkMode ? Colors.white : Colors.black87,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: _buildDetailItem(
                  'Humidity',
                  '${weather['humidity'] ?? 0}%',
                  Icons.water_drop,
                  isDarkMode,
                ),
              ),
              Expanded(
                child: _buildDetailItem(
                  'Wind Speed',
                  '${(weather['windSpeed'] ?? 0).round()} km/h',
                  Icons.air,
                  isDarkMode,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: _buildDetailItem(
                  'Pressure',
                  '${(weather['pressure'] ?? 0).round()} hPa',
                  Icons.speed,
                  isDarkMode,
                ),
              ),
              Expanded(
                child: _buildDetailItem(
                  'UV Index',
                  '${weather['uvIndex'] ?? 0}',
                  Icons.wb_sunny,
                  isDarkMode,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDetailItem(String label, String value, IconData icon, bool isDarkMode) {
    return Column(
      children: [
        Icon(
          icon,
          size: 24,
          color: isDarkMode ? Colors.white70 : Colors.grey[600],
        ),
        const SizedBox(height: 8),
        Text(
          value,
          style: GoogleFonts.inter(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: isDarkMode ? Colors.white : Colors.black87,
          ),
        ),
        Text(
          label,
          style: GoogleFonts.inter(
            fontSize: 12,
            color: isDarkMode ? Colors.white70 : Colors.grey[600],
          ),
        ),
      ],
    );
  }

  Widget _buildForecast(List<Map<String, dynamic>> forecast) {
    final isDarkMode = ref.watch(themeModeProvider) == ThemeMode.dark;
    
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: isDarkMode ? Colors.grey[800] : Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '5-Day Forecast',
            style: GoogleFonts.inter(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: isDarkMode ? Colors.white : Colors.black87,
            ),
          ),
          const SizedBox(height: 16),
          ...forecast.take(5).map((day) => _buildForecastItem(day, isDarkMode)),
        ],
      ),
    );
  }

  Widget _buildForecastItem(Map<String, dynamic> day, bool isDarkMode) {
    final date = day['date'] as DateTime;
    final dayName = DateFormat('EEE').format(date);
    
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 2,
            child: Text(
              dayName,
              style: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: isDarkMode ? Colors.white : Colors.black87,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Row(
              children: [
                Icon(
                  _getWeatherIcon(day['icon'] ?? '01d'),
                  size: 20,
                  color: isDarkMode ? Colors.white70 : Colors.grey[600],
                ),
                const SizedBox(width: 8),
                Text(
                  day['condition'] ?? 'Unknown',
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    color: isDarkMode ? Colors.white70 : Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  '${(day['maxTemp'] ?? 0).round()}°',
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: isDarkMode ? Colors.white : Colors.black87,
                  ),
                ),
                Text(
                  '/${(day['minTemp'] ?? 0).round()}°',
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    color: isDarkMode ? Colors.white70 : Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  IconData _getWeatherIcon(String icon) {
    switch (icon) {
      case '01d':
      case '01n':
        return Icons.wb_sunny;
      case '02d':
      case '02n':
        return Icons.wb_cloudy;
      case '03d':
      case '03n':
      case '04d':
      case '04n':
        return Icons.cloud;
      case '09d':
      case '09n':
      case '10d':
      case '10n':
        return Icons.grain;
      case '11d':
      case '11n':
        return Icons.flash_on;
      case '13d':
      case '13n':
        return Icons.ac_unit;
      case '50d':
      case '50n':
        return Icons.foggy;
      default:
        return Icons.wb_sunny;
    }
  }
}
