import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/animated_widgets.dart';
import '../providers/theme_provider.dart';
import '../services/localization_service.dart';
import 'dart:async';
import 'dart:math' as math;

// IoT Device Model
class IoTDevice {
  final String id;
  final String name;
  final String type;
  final String category;
  final bool isOnline;
  final bool isActive;
  final String status;
  final Map<String, dynamic> parameters;
  final IconData icon;
  final Color statusColor;
  final DateTime lastUpdated;

  IoTDevice({
    required this.id,
    required this.name,
    required this.type,
    required this.category,
    required this.isOnline,
    required this.isActive,
    required this.status,
    required this.parameters,
    required this.icon,
    required this.statusColor,
    required this.lastUpdated,
  });

  IoTDevice copyWith({
    String? id,
    String? name,
    String? type,
    String? category,
    bool? isOnline,
    bool? isActive,
    String? status,
    Map<String, dynamic>? parameters,
    IconData? icon,
    Color? statusColor,
    DateTime? lastUpdated,
  }) {
    return IoTDevice(
      id: id ?? this.id,
      name: name ?? this.name,
      type: type ?? this.type,
      category: category ?? this.category,
      isOnline: isOnline ?? this.isOnline,
      isActive: isActive ?? this.isActive,
      status: status ?? this.status,
      parameters: parameters ?? this.parameters,
      icon: icon ?? this.icon,
      statusColor: statusColor ?? this.statusColor,
      lastUpdated: lastUpdated ?? this.lastUpdated,
    );
  }
}

// Providers
final iotDevicesProvider = StateProvider<List<IoTDevice>>((ref) => [
  IoTDevice(
    id: '1',
    name: 'Water Motor Pump',
    type: 'Submersible Pump',
    category: 'Irrigation',
    isOnline: true,
    isActive: true,
    status: 'Running',
    parameters: {
      'flow_rate': '250 LPM',
      'pressure': '45 PSI',
      'power_consumption': '2.5 kW',
      'temperature': '28°C',
      'runtime_today': '4h 30m',
    },
    icon: Icons.water_outlined,
    statusColor: Colors.blue,
    lastUpdated: DateTime.now().subtract(Duration(minutes: 2)),
  ),
  IoTDevice(
    id: '2',
    name: 'Drip Irrigation Controller',
    type: 'Automatic Controller',
    category: 'Irrigation',
    isOnline: true,
    isActive: false,
    status: 'Scheduled',
    parameters: {
      'next_cycle': '06:00 AM',
      'duration': '45 minutes',
      'zones_active': '3/8',
      'water_saved': '25%',
      'soil_moisture': '68%',
    },
    icon: Icons.agriculture,
    statusColor: Colors.green,
    lastUpdated: DateTime.now().subtract(Duration(minutes: 5)),
  ),
  IoTDevice(
    id: '3',
    name: 'Fertilizer Spreader',
    type: 'Automated Spreader',
    category: 'Equipment',
    isOnline: true,
    isActive: false,
    status: 'Ready',
    parameters: {
      'fertilizer_level': '85%',
      'spread_rate': '120 kg/ha',
      'coverage_area': '2.5 acres',
      'battery_level': '92%',
      'calibration': 'OK',
    },
    icon: Icons.scatter_plot,
    statusColor: Colors.orange,
    lastUpdated: DateTime.now().subtract(Duration(minutes: 8)),
  ),
  IoTDevice(
    id: '4',
    name: 'Weather Station',
    type: 'Multi-sensor Station',
    category: 'Monitoring',
    isOnline: true,
    isActive: true,
    status: 'Monitoring',
    parameters: {
      'temperature': '29.5°C',
      'humidity': '72%',
      'wind_speed': '8 km/h',
      'rainfall_24h': '2.3mm',
      'uv_index': '6 (High)',
    },
    icon: Icons.cloud_outlined,
    statusColor: Colors.purple,
    lastUpdated: DateTime.now().subtract(Duration(minutes: 1)),
  ),
  IoTDevice(
    id: '5',
    name: 'Soil Moisture Sensors',
    type: 'Wireless Sensors',
    category: 'Monitoring',
    isOnline: true,
    isActive: true,
    status: 'Active',
    parameters: {
      'field_1': '45%',
      'field_2': '62%',
      'field_3': '38%',
      'average': '48%',
      'battery_life': '8 months',
    },
    icon: Icons.sensors,
    statusColor: Colors.teal,
    lastUpdated: DateTime.now().subtract(Duration(minutes: 3)),
  ),
  IoTDevice(
    id: '6',
    name: 'Solar Water Heater',
    type: 'Solar Heating System',
    category: 'Energy',
    isOnline: true,
    isActive: true,
    status: 'Heating',
    parameters: {
      'water_temp': '45°C',
      'target_temp': '50°C',
      'efficiency': '78%',
      'energy_saved': '12 kWh',
      'panel_voltage': '24V',
    },
    icon: Icons.wb_sunny,
    statusColor: Colors.amber,
    lastUpdated: DateTime.now().subtract(Duration(minutes: 4)),
  ),
  IoTDevice(
    id: '7',
    name: 'Greenhouse Controller',
    type: 'Climate Controller',
    category: 'Environment',
    isOnline: true,
    isActive: true,
    status: 'Regulating',
    parameters: {
      'inside_temp': '26°C',
      'humidity': '65%',
      'co2_level': '450 ppm',
      'ventilation': 'Auto',
      'light_intensity': '85%',
    },
    icon: Icons.home_outlined,
    statusColor: Colors.green,
    lastUpdated: DateTime.now().subtract(Duration(minutes: 6)),
  ),
  IoTDevice(
    id: '8',
    name: 'Pest Control System',
    type: 'Automated Sprayer',
    category: 'Protection',
    isOnline: false,
    isActive: false,
    status: 'Offline',
    parameters: {
      'last_spray': '2 days ago',
      'pesticide_level': '30%',
      'coverage': '0.8 acres',
      'battery': '15%',
      'maintenance': 'Due',
    },
    icon: Icons.bug_report,
    statusColor: Colors.red,
    lastUpdated: DateTime.now().subtract(Duration(hours: 2)),
  ),
]);

final selectedCategoryFilterProvider = StateProvider<String>((ref) => 'All');

class IoTDevicesScreen extends ConsumerStatefulWidget {
  const IoTDevicesScreen({super.key});

  @override
  ConsumerState<IoTDevicesScreen> createState() => _IoTDevicesScreenState();
}

class _IoTDevicesScreenState extends ConsumerState<IoTDevicesScreen>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late AnimationController _cardAnimationController;
  late AnimationController _floatingAnimationController;
  
  late Animation<double> _headerSlideAnimation;
  late Animation<double> _headerFadeAnimation;
  late Animation<double> _cardStaggerAnimation;
  late Animation<double> _floatingAnimation;

  Timer? _dataUpdateTimer;

  @override
  void initState() {
    super.initState();
    _setupAnimations();
    _startAnimations();
    _initializeServices();
  }

  void _setupAnimations() {
    _animationController = AnimationController(
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
      parent: _animationController,
      curve: const Interval(0.0, 0.6, curve: Curves.easeOutCubic),
    ));

    _headerFadeAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(
      parent: _animationController,
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
    _animationController.forward();
    Future.delayed(const Duration(milliseconds: 500), () {
      _cardAnimationController.forward();
    });
  }

  void _initializeServices() {
    _dataUpdateTimer = Timer.periodic(Duration(seconds: 10), (timer) {
      _updateLiveData();
    });
    print('🔌 IoT devices services initialized');
  }

  void _updateLiveData() {
    if (mounted) {
      setState(() {
        // Simulate real-time updates for device parameters
      });
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    _cardAnimationController.dispose();
    _floatingAnimationController.dispose();
    _dataUpdateTimer?.cancel();
    super.dispose();
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
                  _buildQuickStatsSection(colorScheme, languageCode),
                  const SizedBox(height: 20),
                  _buildCategoryFilters(colorScheme, languageCode),
                  const SizedBox(height: 20),
                  _buildDevicesGrid(colorScheme, languageCode),
                  const SizedBox(height: 100), // Space for FAB
                ]),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: _buildFloatingActionButton(colorScheme, languageCode),
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
                  Icon(Icons.devices_other, color: Colors.white, size: 20),
                  SizedBox(width: 8),
                  Text(
                    'IoT Devices',
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
                                Icons.devices_other,
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
                                    'IoT Farm Devices',
                                    style: GoogleFonts.roboto(
                                      color: Colors.white,
                                      fontSize: 26,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    'Smart Equipment Control & Monitoring',
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
                          children: [
                            _buildHeaderStatusChip('8 Total', Icons.devices, Colors.blue),
                            SizedBox(width: 8),
                            _buildHeaderStatusChip('7 Online', Icons.wifi, Colors.green),
                            SizedBox(width: 8),
                            _buildHeaderStatusChip('5 Active', Icons.power, Colors.amber),
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
          icon: Icon(Icons.refresh),
          onPressed: () => _refreshData(),
        ),
        IconButton(
          icon: Icon(Icons.settings_outlined),
          onPressed: () => _showDeviceSettings(),
        ),
      ],
    );
  }

  Widget _buildHeaderStatusChip(String label, IconData icon, Color color) {
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

  Widget _buildQuickStatsSection(ColorScheme colorScheme, String languageCode) {
    final devices = ref.watch(iotDevicesProvider);
    final onlineDevices = devices.where((d) => d.isOnline).length;
    final activeDevices = devices.where((d) => d.isActive).length;
    
    return AnimatedBuilder(
      animation: _cardStaggerAnimation,
      builder: (context, child) {
        return Transform.scale(
          scale: _cardStaggerAnimation.value,
          child: Card(
            elevation: 2,
            color: colorScheme.surfaceVariant,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Expanded(
                    child: _buildStatItem(
                      'Total Devices',
                      devices.length.toString(),
                      Icons.devices,
                      Colors.blue,
                      colorScheme,
                    ),
                  ),
                  Expanded(
                    child: _buildStatItem(
                      'Online',
                      onlineDevices.toString(),
                      Icons.wifi,
                      Colors.green,
                      colorScheme,
                    ),
                  ),
                  Expanded(
                    child: _buildStatItem(
                      'Active',
                      activeDevices.toString(),
                      Icons.power_settings_new,
                      Colors.amber,
                      colorScheme,
                    ),
                  ),
                  Expanded(
                    child: _buildStatItem(
                      'Offline',
                      (devices.length - onlineDevices).toString(),
                      Icons.wifi_off,
                      Colors.red,
                      colorScheme,
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

  Widget _buildStatItem(String label, String value, IconData icon, Color color, ColorScheme colorScheme) {
    return Column(
      children: [
        Icon(icon, color: color, size: 24),
        SizedBox(height: 8),
        Text(
          value,
          style: GoogleFonts.roboto(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: colorScheme.onSurface,
          ),
        ),
        Text(
          label,
          style: GoogleFonts.roboto(
            fontSize: 12,
            color: colorScheme.onSurface.withOpacity(0.7),
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildCategoryFilters(ColorScheme colorScheme, String languageCode) {
    final selectedCategory = ref.watch(selectedCategoryFilterProvider);
    final categories = ['All', 'Irrigation', 'Monitoring', 'Equipment', 'Energy', 'Environment', 'Protection'];
    
    return AnimatedBuilder(
      animation: _cardStaggerAnimation,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, 20 * (1 - _cardStaggerAnimation.value)),
          child: Opacity(
            opacity: _cardStaggerAnimation.value,
            child: SizedBox(
              height: 50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  final category = categories[index];
                  final isSelected = category == selectedCategory;
                  
                  return Padding(
                    padding: EdgeInsets.only(right: 8),
                    child: FilterChip(
                      label: Text(category),
                      selected: isSelected,
                      onSelected: (selected) {
                        ref.read(selectedCategoryFilterProvider.notifier).state = category;
                      },
                      backgroundColor: colorScheme.surface,
                      selectedColor: colorScheme.primary.withOpacity(0.2),
                      labelStyle: TextStyle(
                        color: isSelected ? colorScheme.primary : colorScheme.onSurface,
                        fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildDevicesGrid(ColorScheme colorScheme, String languageCode) {
    final devices = ref.watch(iotDevicesProvider);
    final selectedCategory = ref.watch(selectedCategoryFilterProvider);
    
    final filteredDevices = selectedCategory == 'All' 
        ? devices 
        : devices.where((device) => device.category == selectedCategory).toList();

    return AnimatedBuilder(
      animation: _cardStaggerAnimation,
      builder: (context, child) {
        return GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: MediaQuery.of(context).size.width > 600 ? 2 : 1,
            childAspectRatio: 1.4,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
          ),
          itemCount: filteredDevices.length,
          itemBuilder: (context, index) {
            final delay = index * 0.1;
            return TweenAnimationBuilder<double>(
              duration: Duration(milliseconds: 500 + (index * 100)),
              tween: Tween(begin: 0, end: 1),
              builder: (context, value, child) {
                return Transform.translate(
                  offset: Offset(0, 20 * (1 - value)),
                  child: Opacity(
                    opacity: value,
                    child: _buildDeviceCard(filteredDevices[index], colorScheme, languageCode),
                  ),
                );
              },
            );
          },
        );
      },
    );
  }

  Widget _buildDeviceCard(IoTDevice device, ColorScheme colorScheme, String languageCode) {
    return Card(
      elevation: 4,
      color: colorScheme.surface,
      child: InkWell(
        onTap: () => _showDeviceDetails(device),
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: device.statusColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      device.icon,
                      color: device.statusColor,
                      size: 24,
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          device.name,
                          style: GoogleFonts.roboto(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: colorScheme.onSurface,
                          ),
                        ),
                        Text(
                          device.type,
                          style: GoogleFonts.roboto(
                            fontSize: 12,
                            color: colorScheme.onSurface.withOpacity(0.7),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: device.isOnline ? Colors.green.withOpacity(0.1) : Colors.red.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 6,
                          height: 6,
                          decoration: BoxDecoration(
                            color: device.isOnline ? Colors.green : Colors.red,
                            shape: BoxShape.circle,
                          ),
                        ),
                        SizedBox(width: 4),
                        Text(
                          device.status,
                          style: TextStyle(
                            fontSize: 10,
                            color: device.isOnline ? Colors.green : Colors.red,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: device.parameters.entries.take(3).map((entry) {
                    return Padding(
                      padding: EdgeInsets.only(bottom: 4),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            entry.key.replaceAll('_', ' ').toUpperCase(),
                            style: GoogleFonts.roboto(
                              fontSize: 10,
                              color: colorScheme.onSurface.withOpacity(0.6),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            entry.value.toString(),
                            style: GoogleFonts.roboto(
                              fontSize: 12,
                              color: colorScheme.onSurface,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (device.isOnline && device.category == 'Irrigation')
                    ElevatedButton.icon(
                      onPressed: () => _toggleDevice(device),
                      icon: Icon(device.isActive ? Icons.stop : Icons.play_arrow, size: 16),
                      label: Text(device.isActive ? 'Stop' : 'Start', style: TextStyle(fontSize: 12)),
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        minimumSize: Size(0, 30),
                      ),
                    ),
                  Spacer(),
                  Text(
                    'Updated ${_getTimeAgo(device.lastUpdated)}',
                    style: GoogleFonts.roboto(
                      fontSize: 10,
                      color: colorScheme.onSurface.withOpacity(0.5),
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

  String _getTimeAgo(DateTime dateTime) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);
    
    if (difference.inMinutes < 1) return 'now';
    if (difference.inMinutes < 60) return '${difference.inMinutes}m ago';
    if (difference.inHours < 24) return '${difference.inHours}h ago';
    return '${difference.inDays}d ago';
  }

  Widget _buildFloatingActionButton(ColorScheme colorScheme, String languageCode) {
    return AnimatedBuilder(
      animation: _floatingAnimation,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, _floatingAnimation.value),
          child: FloatingActionButton.extended(
            onPressed: _addNewDevice,
            icon: Icon(Icons.add),
            label: Text('Add Device'),
            backgroundColor: colorScheme.primary,
            foregroundColor: Colors.white,
          ),
        );
      },
    );
  }

  Future<void> _refreshData() async {
    await Future.delayed(Duration(seconds: 1));
    _updateLiveData();
  }

  void _showDeviceDetails(IoTDevice device) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => _buildDeviceDetailsSheet(device),
    );
  }

  Widget _buildDeviceDetailsSheet(IoTDevice device) {
    final colorScheme = Theme.of(context).colorScheme;
    
    return Container(
      height: MediaQuery.of(context).size.height * 0.8,
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        children: [
          Container(
            width: 40,
            height: 4,
            margin: EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
              color: colorScheme.onSurface.withOpacity(0.3),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: device.statusColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    device.icon,
                    color: device.statusColor,
                    size: 32,
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        device.name,
                        style: GoogleFonts.roboto(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: colorScheme.onSurface,
                        ),
                      ),
                      Text(
                        '${device.type} • ${device.category}',
                        style: GoogleFonts.roboto(
                          fontSize: 14,
                          color: colorScheme.onSurface.withOpacity(0.7),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: device.isOnline ? Colors.green.withOpacity(0.1) : Colors.red.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text(
                    device.status,
                    style: TextStyle(
                      color: device.isOnline ? Colors.green : Colors.red,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 20),
              children: [
                Text(
                  'Device Parameters',
                  style: GoogleFonts.roboto(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: colorScheme.onSurface,
                  ),
                ),
                SizedBox(height: 16),
                ...device.parameters.entries.map((entry) => 
                  Card(
                    margin: EdgeInsets.only(bottom: 8),
                    child: ListTile(
                      title: Text(
                        entry.key.replaceAll('_', ' ').toUpperCase(),
                        style: GoogleFonts.roboto(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      trailing: Text(
                        entry.value.toString(),
                        style: GoogleFonts.roboto(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: colorScheme.primary,
                        ),
                      ),
                    ),
                  ),
                ).toList(),
                SizedBox(height: 20),
                if (device.isOnline)
                  ElevatedButton.icon(
                    onPressed: () => _toggleDevice(device),
                    icon: Icon(device.isActive ? Icons.stop : Icons.play_arrow),
                    label: Text(device.isActive ? 'Stop Device' : 'Start Device'),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      backgroundColor: device.isActive ? Colors.red : Colors.green,
                      foregroundColor: Colors.white,
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _toggleDevice(IoTDevice device) {
    final devices = ref.read(iotDevicesProvider.notifier);
    final deviceList = ref.read(iotDevicesProvider);
    final deviceIndex = deviceList.indexWhere((d) => d.id == device.id);
    
    if (deviceIndex != -1) {
      final updatedDevice = device.copyWith(
        isActive: !device.isActive,
        status: !device.isActive ? 'Running' : 'Stopped',
        lastUpdated: DateTime.now(),
      );
      
      final updatedList = List<IoTDevice>.from(deviceList);
      updatedList[deviceIndex] = updatedDevice;
      devices.state = updatedList;
    }
    
    Navigator.pop(context);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${device.name} ${device.isActive ? 'stopped' : 'started'}'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  void _addNewDevice() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Add Device feature coming soon!'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  void _showDeviceSettings() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Device Settings feature coming soon!'),
        duration: Duration(seconds: 2),
      ),
    );
  }
}
