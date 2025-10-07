import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../services/enhanced_weather_service.dart';
import '../themes/material3_theme.dart';

// Enhanced Weather Screen for Farmers with Agricultural Focus
class EnhancedWeatherScreen extends ConsumerStatefulWidget {
  const EnhancedWeatherScreen({super.key});

  @override
  ConsumerState<EnhancedWeatherScreen> createState() => _EnhancedWeatherScreenState();
}

class _EnhancedWeatherScreenState extends ConsumerState<EnhancedWeatherScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;
  late AnimationController _animationController;
  late Animation<double> _slideAnimation;
  
  final EnhancedWeatherService _weatherService = EnhancedWeatherService();
  
  WeatherData? _currentWeather;
  List<WeatherForecast> _forecast = [];
  List<WeatherAlert> _alerts = [];
  List<WeatherAdvice> _advice = [];
  IrrigationRecommendation? _irrigationRecommendation;
  bool _isLoading = true;
  String _selectedLocation = 'Delhi';

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _animationController = AnimationController(
      duration: Duration(milliseconds: 800),
      vsync: this,
    );
    _slideAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOutCubic),
    );
    
    _loadWeatherData();
    _animationController.forward();
  }

  @override
  void dispose() {
    _tabController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  Future<void> _loadWeatherData() async {
    setState(() => _isLoading = true);
    
    try {
      final weather = await _weatherService.getCurrentWeather(cityName: _selectedLocation);
      final forecast = await _weatherService.getWeatherForecast(cityName: _selectedLocation);
      final alerts = await _weatherService.getWeatherAlerts();
      
      if (weather != null) {
        final advice = _weatherService.getAgriculturalAdvice(weather);
        final irrigation = _weatherService.getIrrigationRecommendation(weather, forecast);
        
        setState(() {
          _currentWeather = weather;
          _forecast = forecast;
          _alerts = alerts;
          _advice = advice;
          _irrigationRecommendation = irrigation;
          _isLoading = false;
        });
      }
    } catch (e) {
      setState(() => _isLoading = false);
      _showErrorSnackBar('Failed to load weather data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: SlideTransition(
        position: Tween<Offset>(
          begin: Offset(0, 0.1),
          end: Offset.zero,
        ).animate(_slideAnimation),
        child: FadeTransition(
          opacity: _slideAnimation,
          child: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) => [
              _buildSliverAppBar(colorScheme),
            ],
            body: _isLoading
                ? Center(child: CircularProgressIndicator())
                : Column(
                    children: [
                      if (_currentWeather != null) _buildCurrentWeatherCard(colorScheme),
                      _buildTabBar(colorScheme),
                      Expanded(
                        child: TabBarView(
                          controller: _tabController,
                          children: [
                            _buildForecastTab(colorScheme),
                            _buildAdviceTab(colorScheme),
                            _buildIrrigationTab(colorScheme),
                            _buildAlertsTab(colorScheme),
                          ],
                        ),
                      ),
                    ],
                  ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _loadWeatherData,
        child: Icon(Icons.refresh),
        tooltip: 'Refresh weather data',
      ),
    );
  }

  Widget _buildSliverAppBar(ColorScheme colorScheme) {
    return SliverAppBar(
      expandedHeight: 120,
      floating: false,
      pinned: true,
      backgroundColor: colorScheme.primary,
      foregroundColor: colorScheme.onPrimary,
      flexibleSpace: FlexibleSpaceBar(
        title: Text(
          'Weather Center',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            color: colorScheme.onPrimary,
            fontWeight: FontWeight.w600,
          ),
        ),
        background: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                colorScheme.primary,
                colorScheme.secondary,
              ],
            ),
          ),
        ),
      ),
      actions: [
        IconButton(
          onPressed: () => _showLocationPicker(colorScheme),
          icon: Icon(Icons.location_on),
          tooltip: 'Change location',
        ),
      ],
    );
  }

  Widget _buildCurrentWeatherCard(ColorScheme colorScheme) {
    if (_currentWeather == null) return SizedBox.shrink();
    
    return Container(
      margin: EdgeInsets.all(16),
      child: M3Card(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                colorScheme.primaryContainer,
                colorScheme.secondaryContainer,
              ],
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              // Location and time
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _currentWeather!.location,
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        'Updated: ${DateFormat('HH:mm').format(_currentWeather!.lastUpdated)}',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                  Icon(
                    _getWeatherIcon(_currentWeather!.condition),
                    size: 48,
                    color: colorScheme.primary,
                  ),
                ],
              ),
              SizedBox(height: 16),
              
              // Temperature and condition
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${_currentWeather!.temperature.toStringAsFixed(1)}°C',
                        style: Theme.of(context).textTheme.displayMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Feels like ${_currentWeather!.feelsLike.toStringAsFixed(1)}°C',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        _currentWeather!.condition,
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        _currentWeather!.description,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),
              
              // Weather details grid
              GridView.count(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 3,
                childAspectRatio: 1.2,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                children: [
                  _buildWeatherDetail(
                    'Humidity',
                    '${_currentWeather!.humidity}%',
                    Icons.water_drop,
                    colorScheme,
                  ),
                  _buildWeatherDetail(
                    'Wind',
                    '${_currentWeather!.windSpeed.toStringAsFixed(1)} km/h',
                    Icons.air,
                    colorScheme,
                  ),
                  _buildWeatherDetail(
                    'UV Index',
                    '${_currentWeather!.uvIndex}',
                    Icons.wb_sunny,
                    colorScheme,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildWeatherDetail(String label, String value, IconData icon, ColorScheme colorScheme) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: colorScheme.surface.withOpacity(0.8),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 20, color: colorScheme.primary),
          SizedBox(height: 4),
          Text(
            value,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            label,
            style: Theme.of(context).textTheme.labelSmall,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildTabBar(ColorScheme colorScheme) {
    return TabBar(
      controller: _tabController,
      labelColor: colorScheme.primary,
      unselectedLabelColor: colorScheme.onSurfaceVariant,
      indicatorColor: colorScheme.primary,
      isScrollable: true,
      tabs: [
        Tab(text: 'Forecast', icon: Icon(Icons.calendar_view_week)),
        Tab(text: 'Farm Advice', icon: Icon(Icons.agriculture)),
        Tab(text: 'Irrigation', icon: Icon(Icons.water_drop)),
        Tab(text: 'Alerts', icon: Icon(Icons.warning)),
      ],
    );
  }

  Widget _buildForecastTab(ColorScheme colorScheme) {
    return ListView.builder(
      padding: EdgeInsets.all(16),
      itemCount: _forecast.length,
      itemBuilder: (context, index) {
        final forecast = _forecast[index];
        return _buildForecastCard(forecast, colorScheme);
      },
    );
  }

  Widget _buildForecastCard(WeatherForecast forecast, ColorScheme colorScheme) {
    return M3Card(
      margin: EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Row(
          children: [
            // Date
            Container(
              width: 60,
              child: Column(
                children: [
                  Text(
                    DateFormat('EEE').format(forecast.date),
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    DateFormat('dd').format(forecast.date),
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ],
              ),
            ),
            SizedBox(width: 16),
            
            // Weather icon and condition
            Expanded(
              child: Row(
                children: [
                  Icon(
                    _getWeatherIcon(forecast.condition),
                    size: 32,
                    color: colorScheme.primary,
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          forecast.condition,
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        if (forecast.rainAmount != null)
                          Text(
                            'Rain: ${forecast.rainAmount!.toStringAsFixed(1)}mm',
                            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Colors.blue,
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            
            // Temperature range
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '${forecast.maxTemp.toStringAsFixed(0)}°',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '${forecast.minTemp.toStringAsFixed(0)}°',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAdviceTab(ColorScheme colorScheme) {
    if (_advice.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.agriculture, size: 64, color: colorScheme.onSurfaceVariant),
            SizedBox(height: 16),
            Text(
              'No specific advice for current conditions',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Weather conditions are favorable for normal farming activities',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
    }
    
    return ListView.builder(
      padding: EdgeInsets.all(16),
      itemCount: _advice.length,
      itemBuilder: (context, index) {
        final advice = _advice[index];
        return _buildAdviceCard(advice, colorScheme);
      },
    );
  }

  Widget _buildAdviceCard(WeatherAdvice advice, ColorScheme colorScheme) {
    Color cardColor;
    Color iconColor;
    IconData iconData;
    
    switch (advice.type) {
      case AdviceType.warning:
        cardColor = colorScheme.errorContainer;
        iconColor = colorScheme.error;
        iconData = Icons.warning;
        break;
      case AdviceType.caution:
        cardColor = Colors.orange.withOpacity(0.2);
        iconColor = Colors.orange;
        iconData = Icons.info;
        break;
      case AdviceType.critical:
        cardColor = colorScheme.errorContainer;
        iconColor = colorScheme.error;
        iconData = Icons.dangerous;
        break;
      default:
        cardColor = colorScheme.primaryContainer;
        iconColor = colorScheme.primary;
        iconData = Icons.lightbulb;
    }
    
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: iconColor.withOpacity(0.3)),
      ),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(iconData, color: iconColor, size: 24),
            SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    advice.title,
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: iconColor,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    advice.message,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIrrigationTab(ColorScheme colorScheme) {
    if (_irrigationRecommendation == null) {
      return Center(child: CircularProgressIndicator());
    }
    
    final recommendation = _irrigationRecommendation!;
    
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          // Main recommendation card
          M3Card(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: recommendation.shouldIrrigate
                      ? [Colors.blue.withOpacity(0.1), Colors.blue.withOpacity(0.2)]
                      : [Colors.green.withOpacity(0.1), Colors.green.withOpacity(0.2)],
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Icon(
                    recommendation.shouldIrrigate ? Icons.water_drop : Icons.water_drop_outlined,
                    size: 48,
                    color: recommendation.shouldIrrigate ? Colors.blue : Colors.green,
                  ),
                  SizedBox(height: 16),
                  Text(
                    recommendation.shouldIrrigate ? 'Irrigation Recommended' : 'No Irrigation Needed',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: recommendation.shouldIrrigate ? Colors.blue : Colors.green,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    recommendation.reason,
                    style: Theme.of(context).textTheme.bodyMedium,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Icon(Icons.event, color: colorScheme.primary),
                          SizedBox(height: 4),
                          Text(
                            'Next Check',
                            style: Theme.of(context).textTheme.labelSmall,
                          ),
                          Text(
                            DateFormat('dd MMM').format(recommendation.nextIrrigationDate),
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      if (recommendation.waterSavings != null)
                        Column(
                          children: [
                            Icon(Icons.savings, color: Colors.green),
                            SizedBox(height: 4),
                            Text(
                              'Water Savings',
                              style: Theme.of(context).textTheme.labelSmall,
                            ),
                            Text(
                              recommendation.waterSavings!,
                              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Colors.green,
                              ),
                            ),
                          ],
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 16),
          
          // Irrigation tips
          M3Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Irrigation Tips',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                SizedBox(height: 12),
                ..._getIrrigationTips().map((tip) => Padding(
                  padding: EdgeInsets.only(bottom: 8),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.tips_and_updates, size: 16, color: colorScheme.primary),
                      SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          tip,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                    ],
                  ),
                )),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAlertsTab(ColorScheme colorScheme) {
    if (_alerts.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.check_circle, size: 64, color: Colors.green),
            SizedBox(height: 16),
            Text(
              'No Weather Alerts',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: Colors.green,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Current weather conditions are normal',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      );
    }
    
    return ListView.builder(
      padding: EdgeInsets.all(16),
      itemCount: _alerts.length,
      itemBuilder: (context, index) {
        final alert = _alerts[index];
        return _buildAlertCard(alert, colorScheme);
      },
    );
  }

  Widget _buildAlertCard(WeatherAlert alert, ColorScheme colorScheme) {
    Color alertColor;
    switch (alert.severity) {
      case AlertSeverity.severe:
        alertColor = colorScheme.error;
        break;
      case AlertSeverity.high:
        alertColor = Colors.orange;
        break;
      case AlertSeverity.moderate:
        alertColor = Colors.yellow.shade700;
        break;
      default:
        alertColor = colorScheme.primary;
    }
    
    return M3Card(
      margin: EdgeInsets.only(bottom: 12),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: alertColor.withOpacity(0.3)),
        ),
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.warning, color: alertColor),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      alert.title,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: alertColor,
                      ),
                    ),
                  ),
                  M3Chip(
                    label: alert.severity.name.toUpperCase(),
                    selected: true,
                  ),
                ],
              ),
              SizedBox(height: 8),
              Text(
                alert.description,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              SizedBox(height: 8),
              Text(
                'Valid: ${DateFormat('dd MMM HH:mm').format(alert.startTime)} - ${DateFormat('dd MMM HH:mm').format(alert.endTime)}',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  IconData _getWeatherIcon(String condition) {
    switch (condition.toLowerCase()) {
      case 'clear':
      case 'sunny':
        return Icons.wb_sunny;
      case 'clouds':
      case 'cloudy':
      case 'partly cloudy':
        return Icons.wb_cloudy;
      case 'rain':
      case 'drizzle':
        return Icons.grain;
      case 'thunderstorm':
        return Icons.flash_on;
      case 'snow':
        return Icons.ac_unit;
      case 'mist':
      case 'fog':
        return Icons.blur_on;
      default:
        return Icons.wb_cloudy;
    }
  }

  List<String> _getIrrigationTips() {
    return [
      'Best irrigation time is early morning (5-8 AM) to minimize water loss',
      'Check soil moisture 6 inches deep before irrigating',
      'Drip irrigation can save up to 50% water compared to flood irrigation',
      'Monitor plants for signs of water stress: wilting, yellowing leaves',
      'Avoid watering during windy conditions to prevent uneven distribution',
    ];
  }

  void _showLocationPicker(ColorScheme colorScheme) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Select Location'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: Text('Delhi'),
              onTap: () {
                Navigator.pop(context);
                setState(() => _selectedLocation = 'Delhi');
                _loadWeatherData();
              },
            ),
            ListTile(
              title: Text('Mumbai'),
              onTap: () {
                Navigator.pop(context);
                setState(() => _selectedLocation = 'Mumbai');
                _loadWeatherData();
              },
            ),
            ListTile(
              title: Text('Bangalore'),
              onTap: () {
                Navigator.pop(context);
                setState(() => _selectedLocation = 'Bangalore');
                _loadWeatherData();
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showErrorSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Theme.of(context).colorScheme.error,
      ),
    );
  }
}