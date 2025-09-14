import 'dart:async';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../services/iot_integration_service.dart';

class IoTDashboardScreen extends StatefulWidget {
  @override
  _IoTDashboardScreenState createState() => _IoTDashboardScreenState();
}

class _IoTDashboardScreenState extends State<IoTDashboardScreen>
    with TickerProviderStateMixin {
  final IoTIntegrationService _iotService = IoTIntegrationService.instance;
  late AnimationController _rotationController;
  late AnimationController _pulseController;
  late StreamSubscription _sensorDataSubscription;

  List<IoTDevice> _devices = [];
  Map<String, IoTSensorData> _latestData = {};
  bool _isLoading = true;
  String _selectedDeviceId = '';

  @override
  void initState() {
    super.initState();
    _rotationController = AnimationController(
      duration: Duration(seconds: 3),
      vsync: this,
    )..repeat();
    
    _pulseController = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);

    _initializeIoTService();
  }

  Future<void> _initializeIoTService() async {
    try {
      await _iotService.initializeIoTService();
      
      setState(() {
        _devices = _iotService.connectedDevices;
        _isLoading = false;
        if (_devices.isNotEmpty) {
          _selectedDeviceId = _devices.first.id;
        }
      });

      // Listen to real-time sensor data
      _sensorDataSubscription = _iotService.sensorDataStream.listen((data) {
        setState(() {
          _latestData[data.deviceId] = data;
        });
      });

    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      _showErrorSnackBar('Failed to initialize IoT service: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF1E3C72),
              Color(0xFF2A5298),
              Color(0xFF1E3C72),
            ],
          ),
        ),
        child: SafeArea(
          child: _isLoading ? _buildLoadingScreen() : _buildDashboard(),
        ),
      ),
    );
  }

  Widget _buildLoadingScreen() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedBuilder(
            animation: _rotationController,
            builder: (context, child) {
              return Transform.rotate(
                angle: _rotationController.value * 2 * math.pi,
                child: Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    gradient: RadialGradient(
                      colors: [Colors.cyan, Colors.blue],
                    ),
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Icon(
                    Icons.settings_input_antenna,
                    color: Colors.white,
                    size: 40,
                  ),
                ),
              );
            },
          ),
          SizedBox(height: 24),
          Text(
            'Initializing IoT Network',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Connecting to agricultural sensors...',
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
    return CustomScrollView(
      slivers: [
        _buildAppBar(),
        SliverPadding(
          padding: EdgeInsets.all(16),
          sliver: SliverList(
            delegate: SliverChildListDelegate([
              _buildDeviceOverview(),
              SizedBox(height: 20),
              _buildQuickControls(),
              SizedBox(height: 20),
              _buildDeviceGrid(),
              SizedBox(height: 20),
              _buildRealtimeDataSection(),
              SizedBox(height: 20),
              _buildAutomationSection(),
            ]),
          ),
        ),
      ],
    );
  }

  Widget _buildAppBar() {
    return SliverAppBar(
      expandedHeight: 120,
      floating: false,
      pinned: true,
      backgroundColor: Colors.transparent,
      flexibleSpace: FlexibleSpaceBar(
        title: Row(
          children: [
            AnimatedBuilder(
              animation: _pulseController,
              builder: (context, child) {
                return Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.green.withOpacity(0.3 + _pulseController.value * 0.4),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    Icons.cloud_done_outlined,
                    color: Colors.white,
                    size: 24,
                  ),
                );
              },
            ),
            SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Smart Farm IoT',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '${_devices.length} devices connected',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ],
        ),
        background: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.indigo.withOpacity(0.8),
                Colors.purple.withOpacity(0.6),
              ],
            ),
          ),
        ),
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.search, color: Colors.white),
          onPressed: _scanForDevices,
        ),
        IconButton(
          icon: Icon(Icons.settings, color: Colors.white),
          onPressed: () => _showSettingsDialog(),
        ),
      ],
    );
  }

  Widget _buildDeviceOverview() {
    final connectedCount = _devices.where((d) => d.isConnected).length;
    final offlineCount = _devices.length - connectedCount;

    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.white.withOpacity(0.15), Colors.white.withOpacity(0.05)],
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withOpacity(0.2)),
      ),
      child: Row(
        children: [
          Expanded(
            child: _buildOverviewCard(
              'Connected',
              connectedCount.toString(),
              Icons.link,
              Colors.green,
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: _buildOverviewCard(
              'Offline',
              offlineCount.toString(),
              Icons.link_off,
              Colors.orange,
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: _buildOverviewCard(
              'Alerts',
              '2',
              Icons.warning,
              Colors.red,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOverviewCard(String title, String value, IconData icon, Color color) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: color.withOpacity(0.2),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: color, size: 24),
        ),
        SizedBox(height: 8),
        Text(
          value,
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          title,
          style: TextStyle(
            color: Colors.white70,
            fontSize: 12,
          ),
        ),
      ],
    );
  }

  Widget _buildQuickControls() {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.white.withOpacity(0.15), Colors.white.withOpacity(0.05)],
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withOpacity(0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.touch_app, color: Colors.white, size: 20),
              SizedBox(width: 8),
              Text(
                'Quick Controls',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: _buildQuickControlButton(
                  'Start Irrigation',
                  Icons.water_drop,
                  Colors.blue,
                  () => _startIrrigation(),
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: _buildQuickControlButton(
                  'Launch Drone',
                  Icons.flight_takeoff,
                  Colors.purple,
                  () => _launchDrone(),
                ),
              ),
            ],
          ),
          SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: _buildQuickControlButton(
                  'Check Livestock',
                  Icons.pets,
                  Colors.orange,
                  () => _checkLivestock(),
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: _buildQuickControlButton(
                  'Auto Mode',
                  Icons.auto_awesome,
                  Colors.green,
                  () => _enableAutoMode(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildQuickControlButton(String label, IconData icon, Color color, VoidCallback onPressed) {
    return InkWell(
      onTap: () {
        HapticFeedback.lightImpact();
        onPressed();
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        decoration: BoxDecoration(
          color: color.withOpacity(0.2),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: color.withOpacity(0.4)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: color, size: 18),
            SizedBox(width: 8),
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
      ),
    );
  }

  Widget _buildDeviceGrid() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(Icons.devices, color: Colors.white, size: 20),
            SizedBox(width: 8),
            Text(
              'Connected Devices',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        SizedBox(height: 16),
        GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 1.2,
          ),
          itemCount: _devices.length,
          itemBuilder: (context, index) {
            final device = _devices[index];
            return _buildDeviceCard(device);
          },
        ),
      ],
    );
  }

  Widget _buildDeviceCard(IoTDevice device) {
    final isSelected = device.id == _selectedDeviceId;
    final latestData = _latestData[device.id];

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedDeviceId = device.id;
        });
        HapticFeedback.selectionClick();
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: isSelected
                ? [Colors.cyan.withOpacity(0.3), Colors.blue.withOpacity(0.2)]
                : [Colors.white.withOpacity(0.15), Colors.white.withOpacity(0.05)],
          ),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected ? Colors.cyan.withOpacity(0.6) : Colors.white.withOpacity(0.2),
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: _getDeviceTypeColor(device.type).withOpacity(0.2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    _getDeviceTypeIcon(device.type),
                    color: _getDeviceTypeColor(device.type),
                    size: 20,
                  ),
                ),
                Spacer(),
                Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: device.isConnected ? Colors.green : Colors.red,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ],
            ),
            SizedBox(height: 12),
            Text(
              device.name,
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 4),
            Text(
              _getDeviceTypeLabel(device.type),
              style: TextStyle(
                color: Colors.white70,
                fontSize: 12,
              ),
            ),
            Spacer(),
            if (latestData != null) _buildLatestDataPreview(latestData),
            if (latestData == null)
              Row(
                children: [
                  Icon(Icons.battery_std, color: Colors.white70, size: 14),
                  SizedBox(width: 4),
                  Text(
                    '${device.batteryLevel.toInt()}%',
                    style: TextStyle(color: Colors.white70, fontSize: 12),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildLatestDataPreview(IoTSensorData data) {
    if (data is SoilMoistureReading) {
      return Row(
        children: [
          Icon(Icons.water_drop, color: Colors.blue, size: 14),
          SizedBox(width: 4),
          Text(
            '${data.moistureLevel.toInt()}%',
            style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w500),
          ),
        ],
      );
    } else if (data is WeatherStationReading) {
      return Row(
        children: [
          Icon(Icons.thermostat, color: Colors.orange, size: 14),
          SizedBox(width: 4),
          Text(
            '${data.temperature.toInt()}°C',
            style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w500),
          ),
        ],
      );
    } else if (data is LivestockData) {
      return Row(
        children: [
          Icon(Icons.favorite, color: Colors.red, size: 14),
          SizedBox(width: 4),
          Text(
            '${data.heartRate.toInt()} BPM',
            style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w500),
          ),
        ],
      );
    }
    return SizedBox();
  }

  Widget _buildRealtimeDataSection() {
    if (_selectedDeviceId.isEmpty) return SizedBox();
    
    final device = _devices.firstWhere((d) => d.id == _selectedDeviceId);
    final latestData = _latestData[_selectedDeviceId];

    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.white.withOpacity(0.15), Colors.white.withOpacity(0.05)],
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withOpacity(0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.timeline, color: Colors.white, size: 20),
              SizedBox(width: 8),
              Text(
                'Real-time Data',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Spacer(),
              Text(
                device.name,
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 14,
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          if (latestData != null) _buildDetailedDataView(latestData),
          if (latestData == null) _buildNoDataView(),
        ],
      ),
    );
  }

  Widget _buildDetailedDataView(IoTSensorData data) {
    if (data is SoilMoistureReading) {
      return _buildSoilMoistureView(data);
    } else if (data is WeatherStationReading) {
      return _buildWeatherStationView(data);
    } else if (data is LivestockData) {
      return _buildLivestockView(data);
    } else if (data is IrrigationStatus) {
      return _buildIrrigationView(data);
    }
    return _buildGenericDataView(data);
  }

  Widget _buildSoilMoistureView(SoilMoistureReading data) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: _buildDataTile(
                'Moisture',
                '${data.moistureLevel.toStringAsFixed(1)}%',
                Icons.water_drop,
                Colors.blue,
                data.moistureLevel / 100,
              ),
            ),
            SizedBox(width: 12),
            Expanded(
              child: _buildDataTile(
                'Temperature',
                '${data.temperature.toStringAsFixed(1)}°C',
                Icons.thermostat,
                Colors.orange,
                (data.temperature - 20) / 20,
              ),
            ),
          ],
        ),
        SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: _buildDataTile(
                'pH Level',
                data.ph.toStringAsFixed(1),
                Icons.science,
                Colors.green,
                (data.ph - 6) / 2,
              ),
            ),
            SizedBox(width: 12),
            Expanded(
              child: _buildDataTile(
                'EC',
                '${data.ec.toStringAsFixed(1)} mS/cm',
                Icons.electrical_services,
                Colors.purple,
                data.ec / 2,
              ),
            ),
          ],
        ),
        SizedBox(height: 16),
        _buildNutrientLevels(data.nutrients),
      ],
    );
  }

  Widget _buildWeatherStationView(WeatherStationReading data) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: _buildDataTile(
                'Temperature',
                '${data.temperature.toStringAsFixed(1)}°C',
                Icons.thermostat,
                Colors.orange,
                (data.temperature - 10) / 30,
              ),
            ),
            SizedBox(width: 12),
            Expanded(
              child: _buildDataTile(
                'Humidity',
                '${data.humidity.toStringAsFixed(1)}%',
                Icons.water_drop,
                Colors.blue,
                data.humidity / 100,
              ),
            ),
          ],
        ),
        SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: _buildDataTile(
                'Wind Speed',
                '${data.windSpeed.toStringAsFixed(1)} km/h',
                Icons.air,
                Colors.cyan,
                data.windSpeed / 30,
              ),
            ),
            SizedBox(width: 12),
            Expanded(
              child: _buildDataTile(
                'Rainfall',
                '${data.rainfall.toStringAsFixed(1)} mm',
                Icons.grain,
                Colors.indigo,
                data.rainfall / 10,
              ),
            ),
          ],
        ),
        SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: _buildDataTile(
                'UV Index',
                data.uvIndex.toStringAsFixed(1),
                Icons.wb_sunny,
                Colors.yellow,
                data.uvIndex / 12,
              ),
            ),
            SizedBox(width: 12),
            Expanded(
              child: _buildDataTile(
                'Pressure',
                '${data.pressure.toStringAsFixed(0)} hPa',
                Icons.compress,
                Colors.grey,
                (data.pressure - 990) / 40,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildLivestockView(LivestockData data) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: _buildDataTile(
                'Heart Rate',
                '${data.heartRate.toStringAsFixed(0)} BPM',
                Icons.favorite,
                Colors.red,
                (data.heartRate - 40) / 80,
              ),
            ),
            SizedBox(width: 12),
            Expanded(
              child: _buildDataTile(
                'Body Temp',
                '${data.bodyTemperature.toStringAsFixed(1)}°C',
                Icons.thermostat,
                Colors.orange,
                (data.bodyTemperature - 37) / 4,
              ),
            ),
          ],
        ),
        SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: _buildDataTile(
                'Activity',
                '${data.activityLevel.toStringAsFixed(0)}%',
                Icons.directions_run,
                Colors.green,
                data.activityLevel / 100,
              ),
            ),
            SizedBox(width: 12),
            Expanded(
              child: _buildDataTile(
                'Health',
                data.healthStatus,
                Icons.health_and_safety,
                _getHealthStatusColor(data.healthStatus),
                0.8,
              ),
            ),
          ],
        ),
        SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: _buildDataTile(
                'Rumination',
                '${data.rumination.toStringAsFixed(1)}h',
                Icons.dining,
                Colors.brown,
                data.rumination / 10,
              ),
            ),
            SizedBox(width: 12),
            Expanded(
              child: _buildDataTile(
                'Milk Production',
                '${data.milkProduction.toStringAsFixed(1)}L',
                Icons.local_drink,
                Colors.white,
                data.milkProduction / 30,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildIrrigationView(IrrigationStatus data) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: data.isActive ? Colors.green.withOpacity(0.2) : Colors.grey.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    Icon(
                      data.isActive ? Icons.water_drop : Icons.water_drop_outlined,
                      color: data.isActive ? Colors.green : Colors.grey,
                      size: 32,
                    ),
                    SizedBox(height: 8),
                    Text(
                      data.isActive ? 'ACTIVE' : 'INACTIVE',
                      style: TextStyle(
                        color: data.isActive ? Colors.green : Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(width: 12),
            Expanded(
              child: Column(
                children: [
                  _buildDataTile(
                    'Flow Rate',
                    '${data.flowRate.toStringAsFixed(1)} L/min',
                    Icons.speed,
                    Colors.blue,
                    data.flowRate / 20,
                  ),
                  SizedBox(height: 8),
                  _buildDataTile(
                    'Water Used',
                    '${data.waterUsed.toStringAsFixed(0)} L',
                    Icons.water,
                    Colors.cyan,
                    data.waterUsed / 1000,
                  ),
                ],
              ),
            ),
          ],
        ),
        if (data.currentZones.isNotEmpty) ...[
          SizedBox(height: 12),
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.blue.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Icon(Icons.location_on, color: Colors.blue, size: 16),
                SizedBox(width: 8),
                Text(
                  'Active Zones: ${data.currentZones.join(", ")}',
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildDataTile(String label, String value, IconData icon, Color color, double progress) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: color, size: 18),
              SizedBox(width: 8),
              Text(
                label,
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 12,
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          Text(
            value,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          LinearProgressIndicator(
            value: progress.clamp(0.0, 1.0),
            backgroundColor: Colors.white.withOpacity(0.2),
            valueColor: AlwaysStoppedAnimation<Color>(color),
          ),
        ],
      ),
    );
  }

  Widget _buildNutrientLevels(NutrientLevels nutrients) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Nutrient Levels',
          style: TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: _buildNutrientBar('N', nutrients.nitrogen, Colors.green),
            ),
            SizedBox(width: 8),
            Expanded(
              child: _buildNutrientBar('P', nutrients.phosphorus, Colors.orange),
            ),
            SizedBox(width: 8),
            Expanded(
              child: _buildNutrientBar('K', nutrients.potassium, Colors.purple),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildNutrientBar(String label, double value, Color color) {
    return Column(
      children: [
        Text(
          label,
          style: TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 4),
        Container(
          height: 40,
          width: 20,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                height: (value / 100) * 40,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 4),
        Text(
          '${value.toInt()}',
          style: TextStyle(
            color: Colors.white70,
            fontSize: 10,
          ),
        ),
      ],
    );
  }

  Widget _buildNoDataView() {
    return Center(
      child: Column(
        children: [
          Icon(
            Icons.hourglass_empty,
            color: Colors.white54,
            size: 48,
          ),
          SizedBox(height: 16),
          Text(
            'Waiting for sensor data...',
            style: TextStyle(
              color: Colors.white70,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGenericDataView(IoTSensorData data) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Text(
            'Device ID: ${data.deviceId}',
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
          SizedBox(height: 8),
          Text(
            'Last Update: ${_formatTimestamp(data.timestamp)}',
            style: TextStyle(color: Colors.white70, fontSize: 12),
          ),
        ],
      ),
    );
  }

  Widget _buildAutomationSection() {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.white.withOpacity(0.15), Colors.white.withOpacity(0.05)],
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withOpacity(0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.auto_awesome, color: Colors.white, size: 20),
              SizedBox(width: 8),
              Text(
                'Smart Automation',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          _buildAutomationRule(
            'Auto Irrigation',
            'Moisture < 30%',
            true,
            () => _toggleAutomation('irrigation'),
          ),
          SizedBox(height: 8),
          _buildAutomationRule(
            'Livestock Health Alerts',
            'Heart rate anomalies',
            true,
            () => _toggleAutomation('livestock'),
          ),
          SizedBox(height: 8),
          _buildAutomationRule(
            'Weather Alerts',
            'Extreme conditions',
            false,
            () => _toggleAutomation('weather'),
          ),
        ],
      ),
    );
  }

  Widget _buildAutomationRule(String title, String condition, bool isEnabled, VoidCallback onToggle) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: isEnabled ? Colors.green.withOpacity(0.1) : Colors.grey.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: isEnabled ? Colors.green.withOpacity(0.3) : Colors.grey.withOpacity(0.3),
        ),
      ),
      child: Row(
        children: [
          Icon(
            isEnabled ? Icons.check_circle : Icons.circle_outlined,
            color: isEnabled ? Colors.green : Colors.grey,
            size: 20,
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  condition,
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          Switch(
            value: isEnabled,
            onChanged: (_) => onToggle(),
            activeColor: Colors.green,
          ),
        ],
      ),
    );
  }

  // Helper methods
  IconData _getDeviceTypeIcon(IoTDeviceType type) {
    switch (type) {
      case IoTDeviceType.soilMoisture:
        return Icons.grass;
      case IoTDeviceType.weatherStation:
        return Icons.cloud;
      case IoTDeviceType.irrigationController:
        return Icons.water_drop;
      case IoTDeviceType.livestockMonitor:
        return Icons.pets;
      case IoTDeviceType.drone:
        return Icons.flight;
      case IoTDeviceType.greenhouse:
        return Icons.home_work;
      default:
        return Icons.device_unknown;
    }
  }

  Color _getDeviceTypeColor(IoTDeviceType type) {
    switch (type) {
      case IoTDeviceType.soilMoisture:
        return Colors.green;
      case IoTDeviceType.weatherStation:
        return Colors.blue;
      case IoTDeviceType.irrigationController:
        return Colors.cyan;
      case IoTDeviceType.livestockMonitor:
        return Colors.orange;
      case IoTDeviceType.drone:
        return Colors.purple;
      case IoTDeviceType.greenhouse:
        return Colors.teal;
      default:
        return Colors.grey;
    }
  }

  String _getDeviceTypeLabel(IoTDeviceType type) {
    switch (type) {
      case IoTDeviceType.soilMoisture:
        return 'Soil Sensor';
      case IoTDeviceType.weatherStation:
        return 'Weather Station';
      case IoTDeviceType.irrigationController:
        return 'Irrigation';
      case IoTDeviceType.livestockMonitor:
        return 'Livestock';
      case IoTDeviceType.drone:
        return 'Drone';
      case IoTDeviceType.greenhouse:
        return 'Greenhouse';
      default:
        return 'Unknown';
    }
  }

  Color _getHealthStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'healthy':
        return Colors.green;
      case 'monitor':
        return Colors.orange;
      case 'alert':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  String _formatTimestamp(DateTime timestamp) {
    final now = DateTime.now();
    final difference = now.difference(timestamp);
    
    if (difference.inSeconds < 60) {
      return '${difference.inSeconds}s ago';
    } else if (difference.inMinutes < 60) {
      return '${difference.inMinutes}m ago';
    } else {
      return '${difference.inHours}h ago';
    }
  }

  // Action methods
  Future<void> _scanForDevices() async {
    HapticFeedback.mediumImpact();
    _showLoadingDialog('Scanning for devices...');
    
    try {
      final newDevices = await _iotService.scanForDevices();
      Navigator.pop(context);
      
      if (newDevices.isNotEmpty) {
        _showDeviceDiscoveryDialog(newDevices);
      } else {
        _showInfoSnackBar('No new devices found');
      }
    } catch (e) {
      Navigator.pop(context);
      _showErrorSnackBar('Scan failed: $e');
    }
  }

  Future<void> _startIrrigation() async {
    final irrigationDevices = _devices.where((d) => d.type == IoTDeviceType.irrigationController).toList();
    if (irrigationDevices.isEmpty) {
      _showErrorSnackBar('No irrigation controllers found');
      return;
    }

    try {
      final command = IrrigationCommand(
        action: IrrigationAction.start,
        duration: Duration(minutes: 15),
        zones: ['Zone 1', 'Zone 2'],
        flowRate: 10.0,
      );

      final success = await _iotService.controlIrrigationSystem(irrigationDevices.first.id, command);
      if (success) {
        _showSuccessSnackBar('💧 Irrigation started successfully');
      } else {
        _showErrorSnackBar('Failed to start irrigation');
      }
    } catch (e) {
      _showErrorSnackBar('Irrigation control failed: $e');
    }
  }

  Future<void> _launchDrone() async {
    final droneDevices = _devices.where((d) => d.type == IoTDeviceType.drone).toList();
    if (droneDevices.isEmpty) {
      _showErrorSnackBar('No drones available');
      return;
    }

    try {
      final command = DroneCommand(
        missionType: DroneMissionType.surveillance,
        waypoints: [
          LatLng(28.7041, 77.1025),
          LatLng(28.7051, 77.1035),
          LatLng(28.7041, 77.1045),
        ],
        altitude: 50.0,
      );

      final flightData = await _iotService.controlDrone(droneDevices.first.id, command);
      _showSuccessSnackBar('🚁 Drone mission started: ${flightData.missionId}');
    } catch (e) {
      _showErrorSnackBar('Drone launch failed: $e');
    }
  }

  Future<void> _checkLivestock() async {
    final livestockDevices = _devices.where((d) => d.type == IoTDeviceType.livestockMonitor).toList();
    if (livestockDevices.isEmpty) {
      _showErrorSnackBar('No livestock monitors found');
      return;
    }

    try {
      final data = await _iotService.getLivestockData(livestockDevices.first.id);
      _showInfoSnackBar('🐄 ${data.animalId}: ${data.healthStatus} (${data.heartRate.toInt()} BPM)');
    } catch (e) {
      _showErrorSnackBar('Livestock check failed: $e');
    }
  }

  Future<void> _enableAutoMode() async {
    try {
      final soilSensors = _devices.where((d) => d.type == IoTDeviceType.soilMoisture).toList();
      final irrigationControllers = _devices.where((d) => d.type == IoTDeviceType.irrigationController).toList();

      if (soilSensors.isNotEmpty && irrigationControllers.isNotEmpty) {
        final rules = AutoIrrigationRules(
          minimumMoisture: 30.0,
          maximumMoisture: 70.0,
          irrigationDuration: 15,
          zones: ['Zone 1', 'Zone 2'],
          flowRate: 10.0,
        );

        await _iotService.setupAutomaticIrrigation(
          soilSensors.first.id,
          irrigationControllers.first.id,
          rules,
        );

        _showSuccessSnackBar('🤖 Automatic irrigation enabled');
      } else {
        _showErrorSnackBar('Required sensors not available for automation');
      }
    } catch (e) {
      _showErrorSnackBar('Auto mode setup failed: $e');
    }
  }

  void _toggleAutomation(String type) {
    HapticFeedback.selectionClick();
    _showInfoSnackBar('$type automation toggled');
  }

  // Dialog methods
  void _showDeviceDiscoveryDialog(List<IoTDevice> devices) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Color(0xFF1E3C72),
        title: Text('New Devices Found', style: TextStyle(color: Colors.white)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: devices.map((device) => ListTile(
            leading: Icon(_getDeviceTypeIcon(device.type), color: _getDeviceTypeColor(device.type)),
            title: Text(device.name, style: TextStyle(color: Colors.white)),
            subtitle: Text(_getDeviceTypeLabel(device.type), style: TextStyle(color: Colors.white70)),
            trailing: ElevatedButton(
              onPressed: () async {
                final success = await _iotService.connectToDevice(device);
                if (success) {
                  setState(() {
                    _devices = _iotService.connectedDevices;
                  });
                  Navigator.pop(context);
                  _showSuccessSnackBar('Connected to ${device.name}');
                }
              },
              child: Text('Connect'),
            ),
          )).toList(),
        ),
      ),
    );
  }

  void _showSettingsDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Color(0xFF1E3C72),
        title: Text('IoT Settings', style: TextStyle(color: Colors.white)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: Icon(Icons.wifi, color: Colors.blue),
              title: Text('Network Settings', style: TextStyle(color: Colors.white)),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: Icon(Icons.security, color: Colors.green),
              title: Text('Security Settings', style: TextStyle(color: Colors.white)),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: Icon(Icons.backup, color: Colors.orange),
              title: Text('Data Backup', style: TextStyle(color: Colors.white)),
              onTap: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
    );
  }

  void _showLoadingDialog(String message) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        backgroundColor: Color(0xFF1E3C72),
        content: Row(
          children: [
            CircularProgressIndicator(),
            SizedBox(width: 20),
            Text(message, style: TextStyle(color: Colors.white)),
          ],
        ),
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
    _rotationController.dispose();
    _pulseController.dispose();
    _sensorDataSubscription.cancel();
    super.dispose();
  }
}
