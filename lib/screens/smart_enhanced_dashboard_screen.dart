import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart';
import '../widgets/animated_widgets.dart';
import '../services/satellite_data_service.dart';
import '../services/voice_command_service.dart';
import '../services/iot_integration_service.dart';
import 'ai_vision_crop_analysis_screen.dart';
import 'satellite_data_dashboard.dart';
import 'iot_dashboard_screen.dart';
import '../providers/theme_provider.dart';
import '../services/localization_service.dart';
import 'dart:math' as math;
import 'dart:async';

// Enhanced Dashboard with Advanced Features Integration
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

  // Advanced Services
  final SatelliteDataService _satelliteService = SatelliteDataService.instance;
  final VoiceCommandService _voiceService = VoiceCommandService.instance;
  final IoTIntegrationService _iotService = IoTIntegrationService.instance;

  // State Management
  bool _isVoiceListening = false;
  String _voiceStatus = 'Ready';
  List<IoTDevice> _iotDevices = [];
  Map<String, IoTSensorData> _latestSensorData = {};
  Map<String, dynamic>? _latestSatelliteData;
  
  late StreamSubscription _iotDataSubscription;
  Timer? _dataUpdateTimer;

  int _selectedIndex = 0;
  
  @override
  void initState() {
    super.initState();
    _setupAnimations();
    _startAnimations();
    _initializeAdvancedServices();
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
      begin: -100,
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
      end: 10,
    ).animate(_floatingAnimationController);
  }

  void _startAnimations() {
    _headerAnimationController.forward();
    Future.delayed(const Duration(milliseconds: 500), () {
      _cardAnimationController.forward();
    });
  }

  Future<void> _initializeAdvancedServices() async {
    try {
      // Initialize Voice Service
      await _voiceService.initializeVoiceService();
      
      // Initialize IoT Service
      await _iotService.initializeIoTService();
      setState(() {
        _iotDevices = _iotService.connectedDevices;
      });

      // Listen to IoT sensor data
      _iotDataSubscription = _iotService.sensorDataStream.listen((data) {
        if (mounted) {
          setState(() {
            _latestSensorData[data.deviceId] = data;
          });
        }
      });

      // Update satellite data periodically
      _dataUpdateTimer = Timer.periodic(Duration(minutes: 5), (timer) {
        _updateSatelliteData();
      });

      // Initial satellite data fetch
      _updateSatelliteData();

      print('🚀 All advanced services initialized successfully');
    } catch (e) {
      print('❌ Error initializing services: $e');
    }
  }

  Future<void> _updateSatelliteData() async {
    try {
      // Simulated satellite data
      _latestSatelliteData = {
        'ndviValue': 0.78 + (math.Random().nextDouble() * 0.2 - 0.1),
        'temperature': 28.5 + (math.Random().nextDouble() * 6 - 3),
        'humidity': 65.0 + (math.Random().nextDouble() * 20 - 10),
        'timestamp': DateTime.now().toIso8601String(),
      };
      if (mounted) {
        setState(() {});
      }
    } catch (e) {
      print('Error updating satellite data: $e');
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
                  _buildAdvancedFeaturesSection(colorScheme, languageCode),
                  const SizedBox(height: 20),
                  _buildLiveDataSection(colorScheme, languageCode),
                  const SizedBox(height: 20),
                  _buildQuickActionsSection(colorScheme, languageCode),
                  const SizedBox(height: 20),
                  _buildSmartMonitoringSection(colorScheme, languageCode),
                  const SizedBox(height: 20),
                  _buildVoiceControlSection(colorScheme, languageCode),
                  const SizedBox(height: 100), // Space for FAB
                ]),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: _buildSmartFAB(colorScheme),
    );
  }

  Widget _buildAppBar(ColorScheme colorScheme, String languageCode) {
    return SliverAppBar(
      expandedHeight: 180,
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
                  Icon(Icons.agriculture, color: Colors.white, size: 24),
                  SizedBox(width: 8),
                  Text(
                    'smartFarm'.tr(languageCode),
                    style: GoogleFonts.roboto(
                      color: Colors.white,
                      fontSize: 20,
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
                      children: [
                        SizedBox(height: 20),
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Icon(
                                Icons.satellite_alt,
                                color: Colors.white,
                                size: 24,
                              ),
                            ),
                            SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'smartAgriculturePlatform'.tr(languageCode),
                                    style: GoogleFonts.roboto(
                                      color: Colors.white,
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    'satelliteIotVoiceIntegration'.tr(languageCode),
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
                        SizedBox(height: 20),
                        Row(
                          children: [
                            _buildStatusChip('${_iotDevices.length} IoT', Icons.sensors, Colors.green),
                            SizedBox(width: 8),
                            _buildStatusChip(_voiceStatus, Icons.mic, Colors.blue),
                            SizedBox(width: 8),
                            _buildStatusChip('Satellite', Icons.satellite_alt, Colors.orange),
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

  Widget _buildStatusChip(String label, IconData icon, Color color) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.2),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.5)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: color, size: 14),
          SizedBox(width: 4),
          Text(
            label,
            style: TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAdvancedFeaturesSection(ColorScheme colorScheme, String languageCode) {
    return AnimatedBuilder(
      animation: _cardStaggerAnimation,
      builder: (context, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'advancedFeatures'.tr(languageCode),
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
              childAspectRatio: 1.2,
              children: [
                _buildFeatureCard(
                  'satelliteMonitoring',
                  'realTimeNdviWeather',
                  Icons.satellite_alt,
                  colorScheme.primary,
                  () => _navigateToSatelliteData(),
                  0.1,
                ),
                _buildFeatureCard(
                  'iotIntegration',
                  'smartSensorsControl',
                  Icons.sensors,
                  colorScheme.secondary,
                  () => _navigateToIoTDashboard(),
                  0.2,
                ),
                _buildFeatureCard(
                  'voiceControl',
                  'multiLanguageCommands',
                  Icons.mic,
                  colorScheme.tertiary,
                  () => _startVoiceCommand(),
                  0.3,
                ),
                _buildFeatureCard(
                  'aiAnalysis',
                  'cropHealthPrediction',
                  Icons.psychology,
                  colorScheme.error,
                  () => _navigateToAIAnalysis(),
                  0.4,
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  Widget _buildFeatureCard(String title, String subtitle, IconData icon, Color color, VoidCallback onTap, double delay) {
    return AnimatedBuilder(
      animation: _cardStaggerAnimation,
      builder: (context, child) {
        final staggered = Interval(delay, 1.0, curve: Curves.easeOutCubic);
        final animation = staggered.transform(_cardStaggerAnimation.value);
        
        return Transform.translate(
          offset: Offset(0, 50 * (1 - animation)),
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
                        title.tr(ref.watch(appSettingsProvider).locale.languageCode),
                        style: GoogleFonts.roboto(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        subtitle.tr(ref.watch(appSettingsProvider).locale.languageCode),
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
          'liveData'.tr(languageCode),
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
                'soilMoisture',
                _getSoilMoistureValue(),
                '%',
                Icons.water_drop,
                colorScheme.primary,
              ),
            ),
            SizedBox(width: 12),
            Expanded(
              child: _buildDataCard(
                'ndviIndex',
                _getNDVIValue(),
                '',
                Icons.eco,
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
                'temperature',
                _getTemperatureValue(),
                '°C',
                Icons.thermostat,
                colorScheme.tertiary,
              ),
            ),
            SizedBox(width: 12),
            Expanded(
              child: _buildDataCard(
                'activeDevices',
                _iotDevices.where((d) => d.isConnected).length.toString(),
                '',
                Icons.devices,
                colorScheme.error,
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
          offset: Offset(0, math.sin(_floatingAnimation.value * 0.1) * 2),
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
                      Text(
                        title.tr(ref.watch(appSettingsProvider).locale.languageCode),
                        style: GoogleFonts.roboto(
                          fontSize: 12,
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
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
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: color,
                          ),
                        ),
                        if (unit.isNotEmpty)
                          TextSpan(
                            text: ' $unit',
                            style: GoogleFonts.roboto(
                              fontSize: 14,
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

  Widget _buildQuickActionsSection(ColorScheme colorScheme, String languageCode) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'quickActions'.tr(languageCode),
          style: GoogleFonts.roboto(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: colorScheme.onSurface,
          ),
        ),
        SizedBox(height: 16),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            _buildQuickActionChip('checkCrops', Icons.grass, () => _checkCropHealth()),
            _buildQuickActionChip('startIrrigation', Icons.water_drop, () => _startIrrigation()),
            _buildQuickActionChip('launchDrone', Icons.flight_takeoff, () => _launchDrone()),
            _buildQuickActionChip('weatherAlert', Icons.cloud, () => _getWeatherAlert()),
            _buildQuickActionChip('marketPrices', Icons.trending_up, () => _getMarketPrices()),
            _buildQuickActionChip('autoMode', Icons.auto_awesome, () => _enableAutoMode()),
          ],
        ),
      ],
    );
  }

  Widget _buildQuickActionChip(String label, IconData icon, VoidCallback onPressed) {
    return ActionChip(
      onPressed: () {
        HapticFeedback.lightImpact();
        onPressed();
      },
      avatar: Icon(icon, size: 18),
      label: Text(
        label.tr(ref.watch(appSettingsProvider).locale.languageCode),
        style: GoogleFonts.roboto(fontSize: 12),
      ),
    );
  }

  Widget _buildSmartMonitoringSection(ColorScheme colorScheme, String languageCode) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.monitor_heart, color: colorScheme.primary),
                SizedBox(width: 8),
                Text(
                  'smartMonitoring'.tr(languageCode),
                  style: GoogleFonts.roboto(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            if (_latestSatelliteData != null) ...[
              _buildMonitoringRow('cropHealth', '${((_latestSatelliteData!['ndviValue'] ?? 0.78) * 100).toInt()}%', Icons.eco, colorScheme.primary),
              SizedBox(height: 8),
            ],
            _buildMonitoringRow('connectedSensors', '${_iotDevices.length}', Icons.sensors, colorScheme.secondary),
            SizedBox(height: 8),
            _buildMonitoringRow('dataPoints', '${_latestSensorData.length * 24}', Icons.analytics, colorScheme.tertiary),
            SizedBox(height: 8),
            _buildMonitoringRow('automationRules', '5 Active', Icons.auto_awesome, colorScheme.error),
          ],
        ),
      ),
    );
  }

  Widget _buildMonitoringRow(String label, String value, IconData icon, Color color) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Icon(icon, color: color, size: 16),
        ),
        SizedBox(width: 12),
        Expanded(
          child: Text(
            label.tr(ref.watch(appSettingsProvider).locale.languageCode),
            style: GoogleFonts.roboto(fontSize: 14),
          ),
        ),
        Text(
          value,
          style: GoogleFonts.roboto(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: color,
          ),
        ),
      ],
    );
  }

  Widget _buildVoiceControlSection(ColorScheme colorScheme, String languageCode) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.mic, color: colorScheme.primary),
                SizedBox(width: 8),
                Text(
                  'voiceControl'.tr(languageCode),
                  style: GoogleFonts.roboto(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Spacer(),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: _isVoiceListening ? colorScheme.primary.withOpacity(0.1) : colorScheme.outline.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    _voiceStatus,
                    style: GoogleFonts.roboto(
                      fontSize: 12,
                      color: _isVoiceListening ? colorScheme.primary : colorScheme.onSurfaceVariant,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Text(
              'tryVoiceCommands'.tr(languageCode),
              style: GoogleFonts.roboto(
                fontSize: 14,
                color: colorScheme.onSurfaceVariant,
              ),
            ),
            SizedBox(height: 8),
            Wrap(
              spacing: 6,
              runSpacing: 6,
              children: [
                _buildVoiceCommandChip('मौसम कैसा है?'),
                _buildVoiceCommandChip('फसल की जांच करो'),
                _buildVoiceCommandChip('Check soil moisture'),
                _buildVoiceCommandChip('Start irrigation'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildVoiceCommandChip(String command) {
    return GestureDetector(
      onTap: () => _simulateVoiceCommand(command),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primaryContainer,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          command,
          style: GoogleFonts.roboto(
            fontSize: 12,
            color: Theme.of(context).colorScheme.onPrimaryContainer,
          ),
        ),
      ),
    );
  }

  Widget _buildSmartFAB(ColorScheme colorScheme) {
    return AnimatedBuilder(
      animation: _floatingAnimation,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, _floatingAnimation.value),
          child: FloatingActionButton.extended(
            onPressed: _toggleVoiceListening,
            backgroundColor: _isVoiceListening ? colorScheme.error : colorScheme.primary,
            icon: Icon(_isVoiceListening ? Icons.mic : Icons.mic_none),
            label: Text(
              _isVoiceListening ? 'listening'.tr(ref.watch(appSettingsProvider).locale.languageCode) : 'voiceCommand'.tr(ref.watch(appSettingsProvider).locale.languageCode),
              style: GoogleFonts.roboto(fontWeight: FontWeight.w600),
            ),
          ),
        );
      },
    );
  }

  // Helper methods for data
  String _getSoilMoistureValue() {
    final soilData = _latestSensorData.values
        .whereType<SoilMoistureReading>()
        .fold<double>(0, (sum, data) => sum + data.moistureLevel);
    final count = _latestSensorData.values.whereType<SoilMoistureReading>().length;
    return count > 0 ? (soilData / count).toStringAsFixed(1) : '45.2';
  }

  String _getNDVIValue() {
    return _latestSatelliteData?['ndviValue']?.toStringAsFixed(2) ?? '0.78';
  }

  String _getTemperatureValue() {
    final weatherData = _latestSensorData.values
        .whereType<WeatherStationReading>()
        .fold<double>(0, (sum, data) => sum + data.temperature);
    final count = _latestSensorData.values.whereType<WeatherStationReading>().length;
    return count > 0 ? (weatherData / count).toStringAsFixed(1) : '28.5';
  }

  // Action methods
  Future<void> _refreshData() async {
    await _updateSatelliteData();
    // Refresh other data sources as needed
  }

  void _navigateToSatelliteData() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SatelliteDataDashboard()),
    );
  }

  void _navigateToIoTDashboard() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => IoTDashboardScreen()),
    );
  }

  void _navigateToAIAnalysis() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AIVisionCropAnalysisScreen()),
    );
  }

  Future<void> _startVoiceCommand() async {
    setState(() {
      _isVoiceListening = true;
      _voiceStatus = 'Listening...';
    });

    try {
      // Simulate voice recognition
      await Future.delayed(Duration(seconds: 2));
      
      setState(() {
        _isVoiceListening = false;
        _voiceStatus = 'Processing...';
      });
      
      await Future.delayed(Duration(seconds: 1));
      
      setState(() {
        _voiceStatus = 'Ready';
      });

      _showSuccessSnackBar('Voice command processed successfully!');
    } catch (e) {
      setState(() {
        _isVoiceListening = false;
        _voiceStatus = 'Error';
      });
      _showErrorSnackBar('Voice command failed: $e');
    }
  }

  Future<void> _toggleVoiceListening() async {
    if (_isVoiceListening) {
      setState(() {
        _isVoiceListening = false;
        _voiceStatus = 'Ready';
      });
    } else {
      await _startVoiceCommand();
    }
  }

  Future<void> _simulateVoiceCommand(String command) async {
    try {
      final response = await _voiceService.processCommand(command);
      _showSuccessSnackBar('Voice: $command\nResponse: ${response.spokenResponse}');
    } catch (e) {
      _showErrorSnackBar('Voice processing failed: $e');
    }
  }

  Future<void> _checkCropHealth() async {
    _showInfoSnackBar('🌱 Analyzing crop health via satellite data...');
    await Future.delayed(Duration(seconds: 2));
    _showSuccessSnackBar('✅ Crop health: Excellent (NDVI: ${_getNDVIValue()})');
  }

  Future<void> _startIrrigation() async {
    _showInfoSnackBar('💧 Starting smart irrigation system...');
    await Future.delayed(Duration(seconds: 1));
    _showSuccessSnackBar('✅ Irrigation started for Zone 1 & 2');
  }

  Future<void> _launchDrone() async {
    _showInfoSnackBar('🚁 Launching agricultural drone...');
    await Future.delayed(Duration(seconds: 2));
    _showSuccessSnackBar('✅ Drone mission started: Field surveillance');
  }

  Future<void> _getWeatherAlert() async {
    _showInfoSnackBar('🌤️ Fetching weather data...');
    await Future.delayed(Duration(seconds: 1));
    _showSuccessSnackBar('☀️ Weather: ${_getTemperatureValue()}°C, Perfect for field work!');
  }

  Future<void> _getMarketPrices() async {
    _showInfoSnackBar('📈 Fetching market prices...');
    await Future.delayed(Duration(seconds: 1));
    _showSuccessSnackBar('💰 Wheat: ₹2,150/quintal, Rice: ₹1,890/quintal');
  }

  Future<void> _enableAutoMode() async {
    _showInfoSnackBar('🤖 Enabling smart automation...');
    await Future.delayed(Duration(seconds: 1));
    _showSuccessSnackBar('✅ Auto-irrigation and monitoring activated');
  }

  void _showNotifications(String languageCode) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('notifications'.tr(languageCode)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: Icon(Icons.warning, color: Colors.orange),
              title: Text('Soil moisture low in Field A'),
              subtitle: Text('2 minutes ago'),
            ),
            ListTile(
              leading: Icon(Icons.check_circle, color: Colors.green),
              title: Text('Irrigation completed successfully'),
              subtitle: Text('10 minutes ago'),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('close'.tr(languageCode)),
          ),
        ],
      ),
    );
  }

  void _showSettings(String languageCode) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('settings'.tr(languageCode)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: Icon(Icons.language),
              title: Text('Language'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: Icon(Icons.notifications),
              title: Text('Notifications'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: Icon(Icons.sync),
              title: Text('Sync Settings'),
              onTap: () => Navigator.pop(context),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('close'.tr(languageCode)),
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

  void _showInfoSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.blue,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  void dispose() {
    _headerAnimationController.dispose();
    _cardAnimationController.dispose();
    _floatingAnimationController.dispose();
    _iotDataSubscription.cancel();
    _dataUpdateTimer?.cancel();
    super.dispose();
  }
}
