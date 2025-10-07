import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fl_chart/fl_chart.dart';
import '../services/satellite_data_service.dart';
import 'dart:math' as math;

/// Revolutionary Satellite Data Dashboard
/// Displays real-time satellite data with stunning 3D visualizations
class SatelliteDataDashboard extends StatefulWidget {
  const SatelliteDataDashboard({super.key});

  @override
  _SatelliteDataDashboardState createState() => _SatelliteDataDashboardState();
}

class _SatelliteDataDashboardState extends State<SatelliteDataDashboard>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late AnimationController _pulseController;
  late Animation<double> _fadeAnimation;
  late Animation<double> _slideAnimation;
  late Animation<double> _pulseAnimation;

  final SatelliteDataService _satelliteService = SatelliteDataService.instance;
  
  NDVIData? _ndviData;
  SatelliteWeatherData? _weatherData;
  CropGrowthMonitoring? _growthData;
  VegetationStressData? _stressData;
  bool _isLoading = true;

  // Mock coordinates - replace with actual location
  final double _lat = 28.7041; // New Delhi
  final double _lon = 77.1025;

  @override
  void initState() {
    super.initState();
    _initializeAnimations();
    _loadSatelliteData();
  }

  void _initializeAnimations() {
    _animationController = AnimationController(
      duration: Duration(milliseconds: 1500),
      vsync: this,
    );
    
    _pulseController = AnimationController(
      duration: Duration(milliseconds: 2000),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOutCubic),
    );

    _slideAnimation = Tween<double>(begin: 50.0, end: 0.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOutBack),
    );

    _pulseAnimation = Tween<double>(begin: 1.0, end: 1.1).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );

    _animationController.forward();
    _pulseController.repeat(reverse: true);
  }

  Future<void> _loadSatelliteData() async {
    try {
      setState(() => _isLoading = true);

      // Load all satellite data in parallel
      final futures = await Future.wait([
        _satelliteService.getNDVIData(_lat, _lon, 1.0),
        _satelliteService.getSatelliteWeatherData(_lat, _lon),
        _satelliteService.getCropGrowthMonitoring(_lat, _lon, DateTime.now().subtract(Duration(days: 90)), CropType.wheat),
        _satelliteService.getVegetationStress(_lat, _lon),
      ]);

      setState(() {
        _ndviData = futures[0] as NDVIData;
        _weatherData = futures[1] as SatelliteWeatherData;
        _growthData = futures[2] as CropGrowthMonitoring;
        _stressData = futures[3] as VegetationStressData;
        _isLoading = false;
      });

      HapticFeedback.lightImpact();
    } catch (e) {
      setState(() => _isLoading = false);
      _showErrorSnackBar('Failed to load satellite data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0A0E27),
      appBar: _buildAppBar(),
      body: _isLoading ? _buildLoadingWidget() : _buildDashboard(),
      floatingActionButton: _buildRefreshFAB(),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: AnimatedBuilder(
        animation: _fadeAnimation,
        builder: (context, child) {
          return Opacity(
            opacity: _fadeAnimation.value,
            child: Row(
              children: [
                Icon(Icons.satellite_alt, color: Colors.white, size: 28),
                SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Satellite Intelligence',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Real-time Earth Observation',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.info_outline, color: Colors.white),
          onPressed: _showInfoDialog,
        ),
      ],
    );
  }

  Widget _buildLoadingWidget() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedBuilder(
            animation: _pulseAnimation,
            builder: (context, child) {
              return Transform.scale(
                scale: _pulseAnimation.value,
                child: Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [Colors.blue, Colors.purple],
                    ),
                  ),
                  child: Icon(
                    Icons.satellite_alt,
                    color: Colors.white,
                    size: 40,
                  ),
                ),
              );
            },
          ),
          SizedBox(height: 24),
          Text(
            'Connecting to Satellites...',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Analyzing Earth from Space',
            style: TextStyle(
              color: Colors.white70,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDashboard() {
    return AnimatedBuilder(
      animation: _fadeAnimation,
      builder: (context, child) {
        return Opacity(
          opacity: _fadeAnimation.value,
          child: Transform.translate(
            offset: Offset(0, _slideAnimation.value),
            child: SingleChildScrollView(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  _buildSatelliteStatusCard(),
                  SizedBox(height: 20),
                  _buildNDVICard(),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(child: _buildWeatherCard()),
                      SizedBox(width: 16),
                      Expanded(child: _buildStressCard()),
                    ],
                  ),
                  SizedBox(height: 20),
                  _buildGrowthTrendCard(),
                  SizedBox(height: 20),
                  _buildRecommendationsCard(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildSatelliteStatusCard() {
    return Revolutionary3DCard(
      child: Container(
        width: double.infinity,
        height: 120,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF667eea),
              Color(0xFF764ba2),
            ],
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1),
                border: Border.all(color: Colors.white.withOpacity(0.2)),
              ),
              padding: EdgeInsets.all(20),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Satellite Connection',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            Container(
                              width: 8,
                              height: 8,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.green,
                              ),
                            ),
                            SizedBox(width: 8),
                            Text(
                              'Active',
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.9),
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Last Update: ${_formatTime(DateTime.now())}',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.7),
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  AnimatedBuilder(
                    animation: _pulseAnimation,
                    builder: (context, child) {
                      return Transform.scale(
                        scale: _pulseAnimation.value,
                        child: Icon(
                          Icons.satellite_alt,
                          color: Colors.white,
                          size: 48,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNDVICard() {
    if (_ndviData == null) return SizedBox.shrink();

    return Revolutionary3DCard(
      child: Container(
        width: double.infinity,
        height: 200,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF11998e),
              Color(0xFF38ef7d),
            ],
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1),
                border: Border.all(color: Colors.white.withOpacity(0.2)),
              ),
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.grass, color: Colors.white, size: 24),
                      SizedBox(width: 12),
                      Text(
                        'Vegetation Health (NDVI)',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${(_ndviData!.ndviValue * 100).toInt()}%',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 36,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            Text(
                              _ndviData!.vegetationHealth,
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.9),
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      CropHealthRing(
                        percentage: _ndviData!.ndviValue * 100,
                        label: 'Health',
                        color: Colors.white,
                        size: 80,
                      ),
                    ],
                  ),
                  SizedBox(height: 12),
                  Row(
                    children: [
                      Icon(Icons.info_outline, color: Colors.white70, size: 16),
                      SizedBox(width: 8),
                      Text(
                        'Confidence: ${(_ndviData!.confidenceLevel * 100).toInt()}%',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 12,
                        ),
                      ),
                      Spacer(),
                      Text(
                        _ndviData!.dataSource,
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildWeatherCard() {
    if (_weatherData == null) return SizedBox.shrink();

    return Revolutionary3DCard(
      child: Container(
        height: 160,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF4facfe),
              Color(0xFF00f2fe),
            ],
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1),
                border: Border.all(color: Colors.white.withOpacity(0.2)),
              ),
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.thermostat, color: Colors.white, size: 20),
                      SizedBox(width: 8),
                      Text(
                        'Weather',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12),
                  Text(
                    '${_weatherData!.temperature.toInt()}°C',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  SizedBox(height: 8),
                  _buildWeatherDetail(Icons.water_drop, '${_weatherData!.humidity.toInt()}%'),
                  SizedBox(height: 4),
                  _buildWeatherDetail(Icons.air, '${_weatherData!.windSpeed.toInt()} km/h'),
                  SizedBox(height: 4),
                  _buildWeatherDetail(Icons.wb_sunny, 'UV ${_weatherData!.uvIndex.toInt()}'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildStressCard() {
    if (_stressData == null) return SizedBox.shrink();

    final stressColor = _stressData!.stressLevel < 0.3 
        ? Colors.green 
        : _stressData!.stressLevel < 0.6 
            ? Colors.orange 
            : Colors.red;

    return Revolutionary3DCard(
      child: Container(
        height: 160,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              stressColor.withOpacity(0.8),
              stressColor.withOpacity(0.6),
            ],
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1),
                border: Border.all(color: Colors.white.withOpacity(0.2)),
              ),
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.local_hospital, color: Colors.white, size: 20),
                      SizedBox(width: 8),
                      Text(
                        'Stress Level',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12),
                  Text(
                    _stressData!.severity,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 8),
                  Container(
                    width: double.infinity,
                    height: 6,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      color: Colors.white.withOpacity(0.3),
                    ),
                    child: FractionallySizedBox(
                      alignment: Alignment.centerLeft,
                      widthFactor: _stressData!.stressLevel,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3),
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    '${(_stressData!.stressLevel * 100).toInt()}% Stress Index',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.9),
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildGrowthTrendCard() {
    if (_growthData == null) return SizedBox.shrink();

    return Revolutionary3DCard(
      child: Container(
        width: double.infinity,
        height: 300,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF8360c3),
              Color(0xFF2ebf91),
            ],
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1),
                border: Border.all(color: Colors.white.withOpacity(0.2)),
              ),
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.trending_up, color: Colors.white, size: 24),
                      SizedBox(width: 12),
                      Text(
                        'Growth Trend',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              _growthData!.growthTrend,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              _growthData!.currentGrowthStage,
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.9),
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            '${_growthData!.yieldForecast.toStringAsFixed(1)} t/ha',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            'Predicted Yield',
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.8),
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Expanded(
                    child: _buildNDVIChart(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNDVIChart() {
    if (_growthData == null || _growthData!.ndviTimeSeries.isEmpty) {
      return Center(
        child: Text(
          'No chart data available',
          style: TextStyle(color: Colors.white70),
        ),
      );
    }

    final spots = _growthData!.ndviTimeSeries.asMap().entries.map((entry) {
      return FlSpot(entry.key.toDouble(), entry.value.ndvi);
    }).toList();

    return LineChart(
      LineChartData(
        gridData: FlGridData(show: false),
        titlesData: FlTitlesData(show: false),
        borderData: FlBorderData(show: false),
        lineBarsData: [
          LineChartBarData(
            spots: spots,
            isCurved: true,
            curveSmoothness: 0.3,
            color: Colors.white,
            barWidth: 3,
            dotData: FlDotData(
              show: true,
              getDotPainter: (spot, percent, barData, index) {
                return FlDotCirclePainter(
                  radius: 4,
                  color: Colors.white,
                  strokeWidth: 2,
                  strokeColor: Colors.white.withOpacity(0.5),
                );
              },
            ),
            belowBarData: BarAreaData(
              show: true,
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.white.withOpacity(0.3),
                  Colors.white.withOpacity(0.1),
                ],
              ),
            ),
          ),
        ],
        minY: 0,
        maxY: 1,
      ),
    );
  }

  Widget _buildRecommendationsCard() {
    final recommendations = _ndviData?.recommendedActions ?? [];
    
    return Revolutionary3DCard(
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF2C3E50),
              Color(0xFF3498DB),
            ],
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1),
                border: Border.all(color: Colors.white.withOpacity(0.2)),
              ),
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.lightbulb, color: Colors.white, size: 24),
                      SizedBox(width: 12),
                      Text(
                        'AI Recommendations',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  ...recommendations.map((recommendation) => Padding(
                    padding: EdgeInsets.only(bottom: 8),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 6,
                          height: 6,
                          margin: EdgeInsets.only(top: 6, right: 12),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            recommendation,
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.9),
                              fontSize: 14,
                              height: 1.5,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildWeatherDetail(IconData icon, String value) {
    return Row(
      children: [
        Icon(icon, color: Colors.white.withOpacity(0.8), size: 16),
        SizedBox(width: 6),
        Text(
          value,
          style: TextStyle(
            color: Colors.white.withOpacity(0.9),
            fontSize: 12,
          ),
        ),
      ],
    );
  }

  Widget _buildRefreshFAB() {
    return FloatingActionButton(
      onPressed: _loadSatelliteData,
      backgroundColor: Color(0xFF667eea),
      child: Icon(Icons.refresh, color: Colors.white),
    );
  }

  String _formatTime(DateTime time) {
    return '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}';
  }

  void _showErrorSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void _showInfoDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Color(0xFF1A1A2E),
        title: Text(
          'Satellite Data Sources',
          style: TextStyle(color: Colors.white),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildInfoRow('NDVI Data:', 'NASA Landsat-8'),
            _buildInfoRow('Weather Data:', 'OpenWeatherMap'),
            _buildInfoRow('Soil Moisture:', 'NASA SMAP'),
            _buildInfoRow('Growth Analysis:', 'Multi-satellite composite'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('OK', style: TextStyle(color: Color(0xFF667eea))),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Text(
            label,
            style: TextStyle(
              color: Colors.white70,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(width: 8),
          Expanded(
            child: Text(
              value,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    _pulseController.dispose();
    super.dispose();
  }
}

// 3D Card with parallax effect
class Revolutionary3DCard extends StatefulWidget {
  final Widget child;
  final double depth;
  final Color shadowColor;
  final Duration animationDuration;

  const Revolutionary3DCard({
    super.key,
    required this.child,
    this.depth = 10.0,
    this.shadowColor = Colors.black26,
    this.animationDuration = const Duration(milliseconds: 300),
  });

  @override
  _Revolutionary3DCardState createState() => _Revolutionary3DCardState();
}

class _Revolutionary3DCardState extends State<Revolutionary3DCard>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  
  Offset _offset = Offset.zero;
  final bool _isHovering = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: widget.animationDuration,
      vsync: this,
    );
    _animation = Tween<double>(begin: 1.0, end: 1.02).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOutBack),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: (details) => _updateOffset(details.localPosition),
      onPanEnd: (_) => _resetOffset(),
      onTap: () {
        HapticFeedback.lightImpact();
        _animationController.forward().then((_) {
          _animationController.reverse();
        });
      },
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return Transform.scale(
            scale: _animation.value,
            child: Transform(
              alignment: Alignment.center,
              transform: _buildTransform(),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: widget.shadowColor,
                      offset: Offset(_offset.dx * 0.1, _offset.dy * 0.1 + widget.depth),
                      blurRadius: 15 + (widget.depth * 0.5),
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: widget.child,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Matrix4 _buildTransform() {
    final rotationX = _offset.dy / 500;
    final rotationY = -_offset.dx / 500;
    
    return Matrix4.identity()
      ..setEntry(3, 2, 0.001)
      ..rotateX(rotationX)
      ..rotateY(rotationY);
  }

  void _updateOffset(Offset localPosition) {
    final center = Offset(200, 100); // Approximate card center
    setState(() {
      _offset = (localPosition - center) * 0.5;
    });
  }

  void _resetOffset() {
    setState(() {
      _offset = Offset.zero;
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}

// Animated health ring component
class CropHealthRing extends StatefulWidget {
  final double percentage;
  final String label;
  final Color color;
  final double size;

  const CropHealthRing({
    super.key,
    required this.percentage,
    required this.label,
    required this.color,
    this.size = 120,
  });

  @override
  _CropHealthRingState createState() => _CropHealthRingState();
}

class _CropHealthRingState extends State<CropHealthRing>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: Duration(milliseconds: 2000),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0, end: widget.percentage / 100).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOutCubic),
    );
    
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return SizedBox(
          width: widget.size,
          height: widget.size,
          child: Stack(
            alignment: Alignment.center,
            children: [
              // Background circle
              SizedBox(
                width: widget.size,
                height: widget.size,
                child: CircularProgressIndicator(
                  value: 1.0,
                  strokeWidth: 6,
                  backgroundColor: widget.color.withOpacity(0.2),
                  valueColor: AlwaysStoppedAnimation(Colors.transparent),
                ),
              ),
              // Animated progress circle
              SizedBox(
                width: widget.size,
                height: widget.size,
                child: CircularProgressIndicator(
                  value: _animation.value,
                  strokeWidth: 6,
                  backgroundColor: Colors.transparent,
                  valueColor: AlwaysStoppedAnimation(widget.color),
                  strokeCap: StrokeCap.round,
                ),
              ),
              // Center text
              Text(
                '${(_animation.value * 100).toInt()}%',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: widget.color,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
