import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart';
import '../providers/theme_provider.dart';
import '../services/localization_service.dart';
import 'khatabook_screen.dart';
import 'weather_screen.dart';
import 'market_prices_screen.dart';
import 'tasks_screen.dart';
import 'inventory_screen.dart';
import 'enhanced_crop_planning_screen.dart';
import 'dart:math' as math;
import 'dart:async';

// Enhanced Dashboard focused on Crop Planning and Agriculture Management
class SmartEnhancedDashboardScreen extends ConsumerStatefulWidget {
  const SmartEnhancedDashboardScreen({super.key});

  @override
  ConsumerState<SmartEnhancedDashboardScreen> createState() => _SmartEnhancedDashboardScreenState();
}

class _SmartEnhancedDashboardScreenState extends ConsumerState<SmartEnhancedDashboardScreen>
    with TickerProviderStateMixin {
  late AnimationController _headerAnimationController;
  late AnimationController _cardAnimationController;
  late AnimationController _floatingAnimationController;
  
  late Animation<double> _headerSlideAnimation;
  late Animation<double> _headerFadeAnimation;
  late Animation<double> _cardStaggerAnimation;
  late Animation<double> _floatingAnimation;

  // State Management - Agricultural Data
  double _soilMoisture = 45.2;
  double _temperature = 28.5;
  double _humidity = 65.0;
  int _activeCrops = 8;
  int _pendingTasks = 12;
  
  Timer? _dataUpdateTimer;
  
  @override
  void initState() {
    super.initState();
    _setupAnimations();
    _startAnimations();
    _initializeServices();
  }

  void _setupAnimations() {
    _headerAnimationController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );
    
    _cardAnimationController = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );
    
    _floatingAnimationController = AnimationController(
      duration: const Duration(milliseconds: 3000),
      vsync: this,
    )..repeat(reverse: true);

    _headerSlideAnimation = Tween<double>(
      begin: -50,
      end: 0,
    ).animate(CurvedAnimation(
      parent: _headerAnimationController,
      curve: const Interval(0.0, 0.6, curve: Curves.easeOutCubic),
    ));

    _headerFadeAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(
      parent: _headerAnimationController,
      curve: const Interval(0.2, 0.8, curve: Curves.easeOut),
    ));

    _cardStaggerAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(
      parent: _cardAnimationController,
      curve: Curves.easeOutCubic,
    ));

    _floatingAnimation = Tween<double>(
      begin: 0,
      end: 5,
    ).animate(_floatingAnimationController);
  }

  void _startAnimations() {
    _headerAnimationController.forward();
    Future.delayed(const Duration(milliseconds: 500), () {
      _cardAnimationController.forward();
    });
  }

  void _initializeServices() {
    // Simulate real-time data updates
    _dataUpdateTimer = Timer.periodic(Duration(seconds: 15), (timer) {
      _updateLiveData();
    });
    print('🚀 Smart dashboard services initialized');
  }

  void _updateLiveData() {
    if (mounted) {
      setState(() {
        _soilMoisture = 40 + (math.Random().nextDouble() * 20);
        _humidity = 60 + (math.Random().nextDouble() * 20);
        _temperature = 25 + (math.Random().nextDouble() * 10);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final appSettings = ref.watch(appSettingsProvider);
    final languageCode = appSettings.locale.languageCode;
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: RefreshIndicator(
        onRefresh: _refreshData,
        child: CustomScrollView(
          slivers: [
            _buildAppBar(colorScheme, languageCode),
            SliverPadding(
              padding: const EdgeInsets.all(16),
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  _buildSmartFeaturesSection(colorScheme, languageCode),
                  const SizedBox(height: 20),
                  _buildLiveDataSection(colorScheme, languageCode),
                  const SizedBox(height: 20),
                  _buildRecentActivitiesSection(colorScheme, languageCode),
                  const SizedBox(height: 20),
                  _buildSmartInsightsSection(colorScheme, languageCode),
                  const SizedBox(height: 100), // Space for FABs
                ]),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: _buildFloatingActionButtons(colorScheme, languageCode),
    );
  }

  Widget _buildAppBar(ColorScheme colorScheme, String languageCode) {
    return SliverAppBar(
      expandedHeight: 160,
      floating: false,
      pinned: true,
      backgroundColor: colorScheme.primary,
      flexibleSpace: FlexibleSpaceBar(
        title: AnimatedBuilder(
          animation: _headerFadeAnimation,
          builder: (context, child) {
            return Opacity(
              opacity: _headerFadeAnimation.value,
              child: Row(
                children: [
                  Icon(Icons.agriculture, color: Colors.white, size: 20),
                  SizedBox(width: 8),
                  Text(
                    LocalizationService.translate('appTitle', languageCode),
                    style: GoogleFonts.roboto(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
        background: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                colorScheme.primary,
                colorScheme.primaryContainer,
              ],
            ),
          ),
          child: AnimatedBuilder(
            animation: _headerSlideAnimation,
            builder: (context, child) {
              return Transform.translate(
                offset: Offset(0, _headerSlideAnimation.value),
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Icon(
                                Icons.eco,
                                color: Colors.white,
                                size: 28,
                              ),
                            ),
                            SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    LocalizationService.translate('appTitle', languageCode),
                                    style: GoogleFonts.roboto(
                                      color: Colors.white,
                                      fontSize: 26,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    LocalizationService.translate('appSubtitle', languageCode),
                                    style: GoogleFonts.roboto(
                                      color: Colors.white.withOpacity(0.9),
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Crop Planning Dashboard',
                              style: GoogleFonts.roboto(
                                color: Colors.white.withOpacity(0.9),
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Row(
                              children: [
                                _buildStatusChip('${_activeCrops}', Icons.eco, Colors.green, 'Active Crops'),
                                SizedBox(width: 6),
                                _buildStatusChip('${_pendingTasks}', Icons.task_alt, Colors.orange, 'Tasks'),
                                SizedBox(width: 6),
                                _buildStatusChip('${_temperature.toInt()}°C', Icons.thermostat, Colors.orange, 'Temp'),
                                SizedBox(width: 6),
                                _buildStatusChip('${_soilMoisture.toInt()}%', Icons.water_drop, Colors.blue, 'Soil'),
                                SizedBox(width: 6),
                                _buildStatusChip('${_humidity.toInt()}%', Icons.opacity, Colors.purple, 'Humidity'),
                              ],
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
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.notifications_outlined),
          onPressed: () => _showNotifications(languageCode),
        ),
        IconButton(
          icon: Icon(Icons.settings_outlined),
          onPressed: () => _showSettings(languageCode),
        ),
      ],
    );
  }

  Widget _buildStatusChip(String label, IconData icon, Color color, [String? tooltip]) {
    return GestureDetector(
      onTap: tooltip == 'IoT' ? () => _navigateToIoTDevices() : null,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 6, vertical: 3),
        decoration: BoxDecoration(
          color: color.withOpacity(0.2),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: color.withOpacity(0.5)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (label != '●') Icon(icon, color: color, size: 12),
            if (label == '●') Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                color: color,
                shape: BoxShape.circle,
              ),
            ),
            if (label != '●' && label != '📡') SizedBox(width: 3),
            if (label != '📡') Text(
              label,
              style: TextStyle(
                color: Colors.white,
                fontSize: 10,
                fontWeight: FontWeight.w500,
              ),
            ),
            if (label == '📡') Text(
              '📡',
              style: TextStyle(fontSize: 10),
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToIoTDevices() {
    Navigator.pushNamed(context, '/iot-devices');
  }

  Widget _buildSmartFeaturesSection(ColorScheme colorScheme, String languageCode) {
    return AnimatedBuilder(
      animation: _cardStaggerAnimation,
      builder: (context, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              LocalizationService.translate('smartMonitoring', languageCode),
              style: GoogleFonts.roboto(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: colorScheme.onSurface,
              ),
            ),
            SizedBox(height: 16),
            GridView.count(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 1.4,
              children: [
                _buildFeatureCard(
                  'Crop Health',
                  'Monitoring & Analysis',
                  Icons.eco,
                  colorScheme.primary,
                  () => Navigator.push(context, MaterialPageRoute(builder: (_) => EnhancedCropPlanningScreen())),
                  0.1,
                  languageCode,
                ),
                _buildFeatureCard(
                  'Weather',
                  'Real-time forecasts',
                  Icons.cloud,
                  colorScheme.secondary,
                  () => Navigator.push(context, MaterialPageRoute(builder: (_) => WeatherScreen())),
                  0.2,
                  languageCode,
                ),
                _buildFeatureCard(
                  'Market Prices',
                  'Live market data',
                  Icons.trending_up,
                  colorScheme.tertiary,
                  () => Navigator.push(context, MaterialPageRoute(builder: (_) => MarketPricesScreen())),
                  0.3,
                  languageCode,
                ),
                _buildFeatureCard(
                  'Crop Planning',
                  'Smart recommendations',
                  Icons.calendar_month,
                  colorScheme.error,
                  () => Navigator.push(context, MaterialPageRoute(builder: (_) => EnhancedCropPlanningScreen())),
                  0.4,
                  languageCode,
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  Widget _buildFeatureCard(String title, String subtitle, IconData icon, Color color, VoidCallback onTap, double delay, String languageCode) {
    return AnimatedBuilder(
      animation: _cardStaggerAnimation,
      builder: (context, child) {
        final staggered = Interval(delay, 1.0, curve: Curves.easeOutCubic);
        final animation = staggered.transform(_cardStaggerAnimation.value);
        
        return Transform.translate(
          offset: Offset(0, 30 * (1 - animation)),
          child: Opacity(
            opacity: animation,
            child: Card(
              elevation: 2,
              child: InkWell(
                onTap: () {
                  HapticFeedback.lightImpact();
                  onTap();
                },
                borderRadius: BorderRadius.circular(12),
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: color.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Icon(icon, color: color, size: 24),
                      ),
                      SizedBox(height: 12),
                      Text(
                        title,
                        style: GoogleFonts.roboto(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        subtitle,
                        style: GoogleFonts.roboto(
                          fontSize: 12,
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildLiveDataSection(ColorScheme colorScheme, String languageCode) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          LocalizationService.translate('liveData', languageCode),
          style: GoogleFonts.roboto(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: colorScheme.onSurface,
          ),
        ),
        SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: _buildDataCard(
                LocalizationService.translate('soilMoisture', languageCode),
                _soilMoisture.toStringAsFixed(1),
                '%',
                Icons.water_drop,
                colorScheme.primary,
              ),
            ),
            SizedBox(width: 12),
            Expanded(
              child: _buildDataCard(
                'Humidity',
                _humidity.toStringAsFixed(1),
                '%',
                Icons.opacity,
                colorScheme.secondary,
              ),
            ),
          ],
        ),
        SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: _buildDataCard(
                LocalizationService.translate('temperature', languageCode),
                _temperature.toStringAsFixed(1),
                '°C',
                Icons.thermostat,
                colorScheme.tertiary,
              ),
            ),
            SizedBox(width: 12),
            Expanded(
              child: _buildDataCard(
                'Field Status',
                'Healthy',
                '',
                Icons.check_circle,
                Colors.green,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildDataCard(String title, String value, String unit, IconData icon, Color color) {
    return AnimatedBuilder(
      animation: _floatingAnimation,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, math.sin(_floatingAnimation.value * 0.1) * 1),
          child: Card(
            elevation: 2,
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: color.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Icon(icon, color: color, size: 18),
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          title,
                          style: GoogleFonts.roboto(
                            fontSize: 12,
                            color: Theme.of(context).colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: value,
                          style: GoogleFonts.roboto(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: color,
                          ),
                        ),
                        if (unit.isNotEmpty)
                          TextSpan(
                            text: ' $unit',
                            style: GoogleFonts.roboto(
                              fontSize: 12,
                              color: Theme.of(context).colorScheme.onSurfaceVariant,
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildRecentActivitiesSection(ColorScheme colorScheme, String languageCode) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.history, color: colorScheme.primary),
                SizedBox(width: 8),
                Text(
                  'Recent Activities',
                  style: GoogleFonts.roboto(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            _buildActivityItem('Irrigation completed', 'Field A', Icons.water_drop, Colors.blue, '2 hrs ago'),
            SizedBox(height: 8),
            _buildActivityItem('Fertilizer applied', 'Field B', Icons.eco, Colors.green, '1 day ago'),
            SizedBox(height: 8),
            _buildActivityItem('Crop health checked', 'Field C', Icons.health_and_safety, Colors.orange, '2 days ago'),
          ],
        ),
      ),
    );
  }

  Widget _buildActivityItem(String title, String subtitle, IconData icon, Color color, String time) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: color, size: 20),
        ),
        SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                subtitle,
                style: GoogleFonts.roboto(
                  fontSize: 12,
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ),
        Text(
          time,
          style: GoogleFonts.roboto(
            fontSize: 10,
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }

  Widget _buildSmartInsightsSection(ColorScheme colorScheme, String languageCode) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.lightbulb_outline, color: colorScheme.primary),
                SizedBox(width: 8),
                Text(
                  'Smart Insights',
                  style: GoogleFonts.roboto(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.blue.withOpacity(0.3)),
              ),
              child: Row(
                children: [
                  Icon(Icons.water_drop, color: Colors.blue, size: 20),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'Soil moisture is optimal. Consider light irrigation in 2 days.',
                      style: GoogleFonts.roboto(fontSize: 13),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 8),
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.green.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.green.withOpacity(0.3)),
              ),
              child: Row(
                children: [
                  Icon(Icons.trending_up, color: Colors.green, size: 20),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'Crop health index shows excellent growth. Harvest expected in 3 weeks.',
                      style: GoogleFonts.roboto(fontSize: 13),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFloatingActionButtons(ColorScheme colorScheme, String languageCode) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Voice Command FAB (Secondary)
        AnimatedBuilder(
          animation: _floatingAnimation,
          builder: (context, child) {
            return Transform.translate(
              offset: Offset(0, _floatingAnimation.value * 0.5),
              child: FloatingActionButton(
                heroTag: "tasks_button",
                onPressed: _navigateToTasks,
                backgroundColor: colorScheme.secondary,
                child: Icon(
                  Icons.task_alt,
                  color: Colors.white,
                ),
              ),
            );
          },
        ),
        SizedBox(height: 16),
        // Quick Add FAB (Primary)
        AnimatedBuilder(
          animation: _floatingAnimation,
          builder: (context, child) {
            return Transform.translate(
              offset: Offset(0, _floatingAnimation.value),
              child: FloatingActionButton.extended(
                heroTag: "quick_add",
                onPressed: () => _showQuickActions(context),
                backgroundColor: colorScheme.primary,
                foregroundColor: Colors.white,
                elevation: 8,
                icon: const Icon(Icons.add_rounded),
                label: Text(
                  'Quick Add',
                  style: GoogleFonts.roboto(fontWeight: FontWeight.w600),
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  void _showQuickActions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        margin: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Quick Actions',
                style: GoogleFonts.roboto(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: _buildQuickActionButton(
                      'Add Expense',
                      Icons.add_card_rounded,
                      Colors.purple,
                      () {
                        Navigator.pop(context);
                        Navigator.push(context, MaterialPageRoute(builder: (_) => KhatabookScreen()));
                      },
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _buildQuickActionButton(
                      'Add Task',
                      Icons.add_task_rounded,
                      Colors.blue,
                      () {
                        Navigator.pop(context);
                        Navigator.push(context, MaterialPageRoute(builder: (_) => TasksScreen()));
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: _buildQuickActionButton(
                      'Add Item',
                      Icons.inventory_rounded,
                      Colors.orange,
                      () {
                        Navigator.pop(context);
                        Navigator.push(context, MaterialPageRoute(builder: (_) => InventoryScreen()));
                      },
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _buildQuickActionButton(
                      'Check Weather',
                      Icons.cloud_rounded,
                      Colors.green,
                      () {
                        Navigator.pop(context);
                        Navigator.push(context, MaterialPageRoute(builder: (_) => WeatherScreen()));
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildQuickActionButton(
    String title,
    IconData icon,
    Color color,
    VoidCallback onTap,
  ) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [color, color.withOpacity(0.7)],
        ),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.3),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(12),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Icon(icon, color: Colors.white, size: 24),
                const SizedBox(height: 8),
                Text(
                  title,
                  style: GoogleFonts.roboto(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Action methods
  Future<void> _refreshData() async {
    _updateLiveData();
    _showSuccessSnackBar('Data refreshed successfully!');
  }

  Future<void> _navigateToTasks() async {
    try {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => TasksScreen()),
      );
    } catch (e) {
      _showErrorSnackBar('Navigation failed: $e');
    }
  }

  void _showNotifications(String languageCode) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(LocalizationService.translate('notifications', languageCode)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: Icon(Icons.water_drop, color: Colors.blue),
              title: Text('Irrigation completed in Field A'),
              subtitle: Text('2 hours ago'),
            ),
            ListTile(
              leading: Icon(Icons.warning, color: Colors.orange),
              title: Text('Low soil moisture in Field B'),
              subtitle: Text('5 hours ago'),
            ),
            ListTile(
              leading: Icon(Icons.check_circle, color: Colors.green),
              title: Text('Fertilizer application scheduled'),
              subtitle: Text('1 day ago'),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(LocalizationService.translate('close', languageCode)),
          ),
        ],
      ),
    );
  }

  void _showSettings(String languageCode) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(LocalizationService.translate('settings', languageCode)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: Icon(Icons.language),
              title: Text('Language'),
              trailing: Text(languageCode == 'hi' ? 'हिन्दी' : 'English'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: Icon(Icons.notifications),
              title: Text('Notifications'),
              trailing: Switch(value: true, onChanged: (v) {}),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: Icon(Icons.sync),
              title: Text('Auto Sync'),
              trailing: Switch(value: true, onChanged: (v) {}),
              onTap: () => Navigator.pop(context),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(LocalizationService.translate('close', languageCode)),
          ),
        ],
      ),
    );
  }

  // Snackbar methods
  void _showSuccessSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.green,
        behavior: SnackBarBehavior.floating,
      ),
    );
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

  @override
  void dispose() {
    _headerAnimationController.dispose();
    _cardAnimationController.dispose();
    _floatingAnimationController.dispose();
    _dataUpdateTimer?.cancel();
    super.dispose();
  }
}
