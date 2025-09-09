import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../providers/theme_provider.dart';
import '../services/localization_service.dart';

// Weather data providers
final weatherDataProvider = StateProvider<WeatherData?>((ref) => null);
final locationProvider = StateProvider<String>((ref) => 'Delhi, India');

class WeatherData {
  final String location;
  final double temperature;
  final String condition;
  final String description;
  final int humidity;
  final double windSpeed;
  final double precipitation;
  final int uvIndex;
  final double pressure;
  final String icon;
  final List<WeatherForecast> forecast;

  WeatherData({
    required this.location,
    required this.temperature,
    required this.condition,
    required this.description,
    required this.humidity,
    required this.windSpeed,
    required this.precipitation,
    required this.uvIndex,
    required this.pressure,
    required this.icon,
    required this.forecast,
  });
}

class WeatherForecast {
  final DateTime date;
  final double maxTemp;
  final double minTemp;
  final String condition;
  final String icon;
  final double precipitation;

  WeatherForecast({
    required this.date,
    required this.maxTemp,
    required this.minTemp,
    required this.condition,
    required this.icon,
    required this.precipitation,
  });
}

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

    // Simulate API call delay
    await Future.delayed(const Duration(seconds: 1));

    if (!_mounted) return;

    // Mock weather data
    final weatherData = WeatherData(
      location: ref.read(locationProvider),
      temperature: 28.5,
      condition: 'Partly Cloudy',
      description: 'Perfect farming weather with good sunshine',
      humidity: 65,
      windSpeed: 12.5,
      precipitation: 0,
      uvIndex: 7,
      pressure: 1013.2,
      icon: 'partly_cloudy',
      forecast: [
        WeatherForecast(
          date: DateTime.now().add(const Duration(days: 1)),
          maxTemp: 32,
          minTemp: 22,
          condition: 'Sunny',
          icon: 'sunny',
          precipitation: 0,
        ),
        WeatherForecast(
          date: DateTime.now().add(const Duration(days: 2)),
          maxTemp: 29,
          minTemp: 20,
          condition: 'Partly Cloudy',
          icon: 'partly_cloudy',
          precipitation: 10,
        ),
        WeatherForecast(
          date: DateTime.now().add(const Duration(days: 3)),
          maxTemp: 26,
          minTemp: 18,
          condition: 'Light Rain',
          icon: 'rainy',
          precipitation: 75,
        ),
        WeatherForecast(
          date: DateTime.now().add(const Duration(days: 4)),
          maxTemp: 30,
          minTemp: 21,
          condition: 'Cloudy',
          icon: 'cloudy',
          precipitation: 20,
        ),
        WeatherForecast(
          date: DateTime.now().add(const Duration(days: 5)),
          maxTemp: 33,
          minTemp: 24,
          condition: 'Sunny',
          icon: 'sunny',
          precipitation: 0,
        ),
      ],
    );

    if (_mounted) {
      ref.read(weatherDataProvider.notifier).state = weatherData;
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final appSettings = ref.watch(appSettingsProvider);
    final languageCode = appSettings.locale.languageCode;
    final colorScheme = Theme.of(context).colorScheme;
    final weatherData = ref.watch(weatherDataProvider);

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        title: Text('weather'.tr(languageCode)),
        backgroundColor: colorScheme.surface,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.refresh, color: colorScheme.onSurface),
            onPressed: _loadWeatherData,
          ),
          IconButton(
            icon: Icon(Icons.location_on, color: colorScheme.onSurface),
            onPressed: () => _showLocationDialog(context, languageCode),
          ),
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : weatherData == null
              ? _buildErrorState(context, languageCode, colorScheme)
              : RefreshIndicator(
                  onRefresh: _loadWeatherData,
                  child: SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Current Weather Card
                        _buildCurrentWeatherCard(weatherData, colorScheme, languageCode),
                        
                        const SizedBox(height: 20),
                        
                        // Weather Details Grid
                        _buildWeatherDetailsGrid(weatherData, colorScheme, languageCode),
                        
                        const SizedBox(height: 20),
                        
                        // Farming Recommendations
                        _buildFarmingRecommendations(weatherData, colorScheme, languageCode),
                        
                        const SizedBox(height: 20),
                        
                        // 5-Day Forecast
                        _buildForecastSection(weatherData, colorScheme, languageCode),
                      ],
                    ),
                  ),
                ),
    );
  }

  Widget _buildCurrentWeatherCard(WeatherData data, ColorScheme colorScheme, String languageCode) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            colorScheme.primary,
            colorScheme.primary.withOpacity(0.8),
          ],
        ),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: colorScheme.primary.withOpacity(0.3),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        children: [
          // Location and Time
          Row(
            children: [
              Icon(Icons.location_on, color: Colors.white, size: 20),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  data.location,
                  style: GoogleFonts.roboto(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Text(
                DateFormat('MMM d, h:mm a').format(DateTime.now()),
                style: GoogleFonts.roboto(
                  color: Colors.white.withOpacity(0.8),
                  fontSize: 14,
                ),
              ),
            ],
          ),
          
          const SizedBox(height: 24),
          
          // Main Weather Info
          Row(
            children: [
              // Weather Icon
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Icon(
                  _getWeatherIcon(data.icon),
                  size: 60,
                  color: Colors.white,
                ),
              ),
              
              const SizedBox(width: 24),
              
              // Temperature and Description
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${data.temperature.toInt()}°C',
                      style: GoogleFonts.roboto(
                        color: Colors.white,
                        fontSize: 48,
                        fontWeight: FontWeight.w300,
                        height: 1,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      data.condition,
                      style: GoogleFonts.roboto(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      data.description,
                      style: GoogleFonts.roboto(
                        color: Colors.white.withOpacity(0.8),
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildWeatherDetailsGrid(WeatherData data, ColorScheme colorScheme, String languageCode) {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      crossAxisSpacing: 12,
      mainAxisSpacing: 12,
      childAspectRatio: 1.5,
      children: [
        _buildDetailCard(
          'Humidity',
          '${data.humidity}%',
          Icons.water_drop,
          colorScheme,
        ),
        _buildDetailCard(
          'Wind Speed',
          '${data.windSpeed} km/h',
          Icons.air,
          colorScheme,
        ),
        _buildDetailCard(
          'UV Index',
          '${data.uvIndex}/10',
          Icons.wb_sunny,
          colorScheme,
        ),
        _buildDetailCard(
          'Pressure',
          '${data.pressure.toInt()} hPa',
          Icons.compress,
          colorScheme,
        ),
      ],
    );
  }

  Widget _buildDetailCard(String title, String value, IconData icon, ColorScheme colorScheme) {
    return Card(
      elevation: 0,
      color: colorScheme.surfaceContainerHigh,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: colorScheme.primary, size: 32),
            const SizedBox(height: 8),
            Text(
              value,
              style: GoogleFonts.roboto(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: colorScheme.onSurface,
              ),
            ),
            Text(
              title,
              style: GoogleFonts.roboto(
                fontSize: 12,
                color: colorScheme.onSurface.withOpacity(0.7),
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFarmingRecommendations(WeatherData data, ColorScheme colorScheme, String languageCode) {
    final recommendations = _getFarmingRecommendations(data);
    
    return Card(
      elevation: 0,
      color: colorScheme.surfaceContainerHigh,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.agriculture, color: colorScheme.primary),
                const SizedBox(width: 12),
                Text(
                  'Farming Recommendations',
                  style: GoogleFonts.roboto(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: colorScheme.onSurface,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            ...recommendations.map((rec) => Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.circle,
                    size: 8,
                    color: colorScheme.primary,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      rec,
                      style: GoogleFonts.roboto(
                        fontSize: 14,
                        color: colorScheme.onSurface.withOpacity(0.8),
                      ),
                    ),
                  ),
                ],
              ),
            )).toList(),
          ],
        ),
      ),
    );
  }

  Widget _buildForecastSection(WeatherData data, ColorScheme colorScheme, String languageCode) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '5-Day Forecast',
          style: GoogleFonts.roboto(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: colorScheme.onSurface,
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 140,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: data.forecast.length,
            itemBuilder: (context, index) {
              final forecast = data.forecast[index];
              return Container(
                width: 100,
                margin: const EdgeInsets.only(right: 12),
                child: Card(
                  elevation: 0,
                  color: colorScheme.surfaceContainerHigh,
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          DateFormat('EEE').format(forecast.date),
                          style: GoogleFonts.roboto(
                            fontSize: 11,
                            fontWeight: FontWeight.w500,
                            color: colorScheme.onSurface,
                          ),
                        ),
                        Icon(
                          _getWeatherIcon(forecast.icon),
                          color: colorScheme.primary,
                          size: 28,
                        ),
                        Column(
                          children: [
                            Text(
                              '${forecast.maxTemp.toInt()}°',
                              style: GoogleFonts.roboto(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: colorScheme.onSurface,
                              ),
                            ),
                            Text(
                              '${forecast.minTemp.toInt()}°',
                              style: GoogleFonts.roboto(
                                fontSize: 11,
                                color: colorScheme.onSurface.withOpacity(0.6),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildErrorState(BuildContext context, String languageCode, ColorScheme colorScheme) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.cloud_off,
            size: 80,
            color: colorScheme.onSurface.withOpacity(0.5),
          ),
          const SizedBox(height: 16),
          Text(
            'Unable to fetch weather data',
            style: GoogleFonts.roboto(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: colorScheme.onSurface,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Please check your internet connection',
            style: GoogleFonts.roboto(
              fontSize: 14,
              color: colorScheme.onSurface.withOpacity(0.7),
            ),
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: _loadWeatherData,
            child: Text('Retry'),
          ),
        ],
      ),
    );
  }

  IconData _getWeatherIcon(String condition) {
    switch (condition) {
      case 'sunny':
        return Icons.wb_sunny;
      case 'partly_cloudy':
        return Icons.wb_cloudy;
      case 'cloudy':
        return Icons.cloud;
      case 'rainy':
        return Icons.grain;
      case 'stormy':
        return Icons.thunderstorm;
      default:
        return Icons.wb_sunny;
    }
  }

  List<String> _getFarmingRecommendations(WeatherData data) {
    List<String> recommendations = [];
    
    if (data.temperature > 30) {
      recommendations.add('High temperature - ensure adequate irrigation for crops');
      recommendations.add('Consider shade nets for sensitive plants');
    } else if (data.temperature < 15) {
      recommendations.add('Cool weather - protect sensitive crops from cold');
      recommendations.add('Good time for winter crop planting');
    } else {
      recommendations.add('Ideal temperature for most farming activities');
    }
    
    if (data.humidity > 70) {
      recommendations.add('High humidity - monitor for fungal diseases');
      recommendations.add('Ensure good air circulation in greenhouse');
    }
    
    if (data.windSpeed > 20) {
      recommendations.add('High winds - secure loose structures and equipment');
    }
    
    if (data.precipitation > 50) {
      recommendations.add('Rain expected - postpone pesticide application');
      recommendations.add('Good for water-hungry crops');
    } else if (data.precipitation == 0 && data.humidity < 40) {
      recommendations.add('Dry conditions - increase irrigation frequency');
    }
    
    return recommendations;
  }

  void _showLocationDialog(BuildContext context, String languageCode) {
    final TextEditingController controller = TextEditingController(
      text: ref.read(locationProvider),
    );
    
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Change Location'),
        content: TextField(
          controller: controller,
          decoration: InputDecoration(
            labelText: 'Enter city name',
            border: OutlineInputBorder(),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('cancel'.tr(languageCode)),
          ),
          ElevatedButton(
            onPressed: () {
              if (_mounted) {
                ref.read(locationProvider.notifier).state = controller.text;
                Navigator.pop(context);
                _loadWeatherData();
              }
            },
            child: Text('update'.tr(languageCode)),
          ),
        ],
      ),
    );
  }
}
