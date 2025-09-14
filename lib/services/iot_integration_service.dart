import 'dart:async';
import 'dart:convert';
import 'dart:math' as math;
import 'package:flutter/material.dart';

/// Advanced IoT Integration Service for Smart Agriculture
/// Integrates with soil sensors, weather stations, irrigation controllers, livestock monitors, and drones
class IoTIntegrationService {
  static IoTIntegrationService? _instance;
  static IoTIntegrationService get instance => _instance ??= IoTIntegrationService._internal();
  IoTIntegrationService._internal();

  final List<IoTDevice> _connectedDevices = [];
  final StreamController<IoTSensorData> _sensorDataController = StreamController.broadcast();
  final Map<String, Timer> _deviceTimers = {};

  // Device simulation data
  final Map<String, Map<String, dynamic>> _deviceData = {};

  Future<void> initializeIoTService() async {
    try {
      await _simulateDeviceDiscovery();
      _startDataSimulation();
      print('IoT Service initialized with ${_connectedDevices.length} devices');
    } catch (e) {
      throw Exception('Failed to initialize IoT service: $e');
    }
  }

  // Simulate discovering IoT devices
  Future<void> _simulateDeviceDiscovery() async {
    await Future.delayed(Duration(milliseconds: 500));
    
    // Add soil moisture sensors
    _connectedDevices.addAll([
      IoTDevice(
        id: 'soil_001',
        name: 'Soil Sensor - Field A',
        type: IoTDeviceType.soilMoisture,
        connectionType: IoTConnectionType.bluetooth,
        isConnected: true,
        signalStrength: -45.0,
        batteryLevel: 85.0,
        location: LatLng(28.7041, 77.1025),
      ),
      IoTDevice(
        id: 'soil_002',
        name: 'Soil Sensor - Field B',
        type: IoTDeviceType.soilMoisture,
        connectionType: IoTConnectionType.wifi,
        isConnected: true,
        signalStrength: -38.0,
        batteryLevel: 92.0,
        location: LatLng(28.7051, 77.1035),
      ),
    ]);

    // Add weather station
    _connectedDevices.add(
      IoTDevice(
        id: 'weather_001',
        name: 'Farm Weather Station',
        type: IoTDeviceType.weatherStation,
        connectionType: IoTConnectionType.wifi,
        isConnected: true,
        signalStrength: -42.0,
        batteryLevel: 100.0,
        location: LatLng(28.7041, 77.1025),
      ),
    );

    // Add irrigation controllers
    _connectedDevices.addAll([
      IoTDevice(
        id: 'irrigation_001',
        name: 'Smart Sprinkler Zone 1',
        type: IoTDeviceType.irrigationController,
        connectionType: IoTConnectionType.wifi,
        isConnected: true,
        signalStrength: -35.0,
        batteryLevel: 100.0,
        location: LatLng(28.7041, 77.1025),
      ),
      IoTDevice(
        id: 'irrigation_002',
        name: 'Drip System Zone 2',
        type: IoTDeviceType.irrigationController,
        connectionType: IoTConnectionType.wifi,
        isConnected: true,
        signalStrength: -40.0,
        batteryLevel: 100.0,
        location: LatLng(28.7051, 77.1035),
      ),
    ]);

    // Add livestock monitors
    _connectedDevices.add(
      IoTDevice(
        id: 'livestock_001',
        name: 'Cow Monitor #247',
        type: IoTDeviceType.livestockMonitor,
        connectionType: IoTConnectionType.lora,
        isConnected: true,
        signalStrength: -55.0,
        batteryLevel: 78.0,
        location: LatLng(28.7045, 77.1020),
      ),
    );

    // Add drone
    _connectedDevices.add(
      IoTDevice(
        id: 'drone_001',
        name: 'AgriDrone Pro',
        type: IoTDeviceType.drone,
        connectionType: IoTConnectionType.wifi,
        isConnected: true,
        signalStrength: -30.0,
        batteryLevel: 65.0,
        location: LatLng(28.7041, 77.1025),
      ),
    );

    // Add greenhouse controller
    _connectedDevices.add(
      IoTDevice(
        id: 'greenhouse_001',
        name: 'Smart Greenhouse Controller',
        type: IoTDeviceType.greenhouse,
        connectionType: IoTConnectionType.wifi,
        isConnected: true,
        signalStrength: -25.0,
        batteryLevel: 100.0,
        location: LatLng(28.7041, 77.1025),
      ),
    );
  }

  // Start simulating real-time data from devices
  void _startDataSimulation() {
    for (final device in _connectedDevices) {
      _deviceTimers[device.id] = Timer.periodic(
        Duration(seconds: 5 + (device.id.hashCode % 10)), // Varied intervals
        (timer) => _generateDeviceData(device),
      );
    }
  }

  // Generate realistic sensor data
  void _generateDeviceData(IoTDevice device) {
    final now = DateTime.now();
    final random = math.Random();

    switch (device.type) {
      case IoTDeviceType.soilMoisture:
        final baseData = _deviceData[device.id] ?? {};
        final previousMoisture = baseData['moisture'] ?? 45.0;
        
        // Simulate gradual moisture changes
        final moistureChange = (random.nextDouble() - 0.5) * 2; // -1 to +1
        final newMoisture = (previousMoisture + moistureChange).clamp(20.0, 80.0);
        
        final data = SoilMoistureReading(
          deviceId: device.id,
          moistureLevel: newMoisture,
          temperature: 25.0 + (random.nextDouble() * 10), // 25-35°C
          ph: 6.5 + (random.nextDouble() * 1.5), // 6.5-8.0
          ec: 0.5 + (random.nextDouble() * 1.0), // 0.5-1.5 mS/cm
          timestamp: now,
          batteryLevel: device.batteryLevel - (random.nextDouble() * 0.1),
          nutrients: NutrientLevels(
            nitrogen: 50 + (random.nextDouble() * 50),
            phosphorus: 30 + (random.nextDouble() * 40),
            potassium: 80 + (random.nextDouble() * 60),
          ),
        );
        
        _deviceData[device.id] = {'moisture': newMoisture};
        _sensorDataController.add(data);
        break;

      case IoTDeviceType.weatherStation:
        final data = WeatherStationReading(
          deviceId: device.id,
          temperature: 25.0 + (random.nextDouble() * 15),
          humidity: 50.0 + (random.nextDouble() * 40),
          pressure: 1010.0 + (random.nextDouble() * 20),
          windSpeed: random.nextDouble() * 20,
          windDirection: random.nextDouble() * 360,
          rainfall: random.nextDouble() * 5,
          uvIndex: random.nextDouble() * 12,
          solarRadiation: 200 + (random.nextDouble() * 800),
          timestamp: now,
        );
        _sensorDataController.add(data);
        break;

      case IoTDeviceType.livestockMonitor:
        final data = LivestockData(
          deviceId: device.id,
          animalId: 'COW_247',
          heartRate: 60 + (random.nextDouble() * 40),
          bodyTemperature: 38.5 + (random.nextDouble() * 2),
          activityLevel: random.nextDouble() * 100,
          location: LatLng(
            device.location.latitude + (random.nextDouble() - 0.5) * 0.001,
            device.location.longitude + (random.nextDouble() - 0.5) * 0.001,
          ),
          healthStatus: _calculateHealthStatus(60 + (random.nextDouble() * 40)),
          timestamp: now,
          rumination: 6 + (random.nextDouble() * 4), // hours per day
          milkProduction: 15 + (random.nextDouble() * 10), // liters per day
        );
        _sensorDataController.add(data);
        break;

      default:
        break;
    }
  }

  // Get current soil moisture reading
  Future<SoilMoistureReading> getSoilMoistureReading(String deviceId) async {
    final device = _connectedDevices.firstWhere(
      (d) => d.id == deviceId,
      orElse: () => throw Exception('Device not found'),
    );
    
    if (device.type != IoTDeviceType.soilMoisture) {
      throw Exception('Device is not a soil moisture sensor');
    }

    final random = math.Random();
    return SoilMoistureReading(
      deviceId: deviceId,
      moistureLevel: 30.0 + (random.nextDouble() * 50),
      temperature: 22.0 + (random.nextDouble() * 8),
      ph: 6.0 + (random.nextDouble() * 2),
      ec: 0.5 + (random.nextDouble() * 1.5),
      timestamp: DateTime.now(),
      batteryLevel: device.batteryLevel,
      nutrients: NutrientLevels(
        nitrogen: 40 + (random.nextDouble() * 60),
        phosphorus: 25 + (random.nextDouble() * 50),
        potassium: 70 + (random.nextDouble() * 80),
      ),
    );
  }

  // Get weather station reading
  Future<WeatherStationReading> getWeatherStationReading(String deviceId) async {
    final device = _connectedDevices.firstWhere(
      (d) => d.id == deviceId,
      orElse: () => throw Exception('Device not found'),
    );
    
    if (device.type != IoTDeviceType.weatherStation) {
      throw Exception('Device is not a weather station');
    }

    final random = math.Random();
    return WeatherStationReading(
      deviceId: deviceId,
      temperature: 25.0 + (random.nextDouble() * 15),
      humidity: 45.0 + (random.nextDouble() * 40),
      pressure: 1000.0 + (random.nextDouble() * 50),
      windSpeed: random.nextDouble() * 25,
      windDirection: random.nextDouble() * 360,
      rainfall: random.nextDouble() * 10,
      uvIndex: random.nextDouble() * 12,
      solarRadiation: 300 + (random.nextDouble() * 700),
      timestamp: DateTime.now(),
    );
  }

  // Control irrigation system
  Future<bool> controlIrrigationSystem(String deviceId, IrrigationCommand command) async {
    final device = _connectedDevices.firstWhere(
      (d) => d.id == deviceId,
      orElse: () => throw Exception('Device not found'),
    );
    
    if (device.type != IoTDeviceType.irrigationController) {
      throw Exception('Device is not an irrigation controller');
    }

    try {
      // Simulate command execution
      await Future.delayed(Duration(milliseconds: 500));
      
      print('🚿 Irrigation Command Executed:');
      print('   Device: ${device.name}');
      print('   Action: ${command.action.name}');
      print('   Duration: ${command.duration?.inMinutes ?? 0} minutes');
      print('   Zones: ${command.zones.join(", ")}');
      print('   Flow Rate: ${command.flowRate} L/min');
      
      // Generate irrigation status data
      final status = IrrigationStatus(
        deviceId: deviceId,
        isActive: command.action == IrrigationAction.start,
        currentZones: command.action == IrrigationAction.start ? command.zones : [],
        flowRate: command.action == IrrigationAction.start ? command.flowRate : 0.0,
        totalRuntime: command.duration ?? Duration.zero,
        waterUsed: (command.duration?.inMinutes ?? 0) * command.flowRate,
        timestamp: DateTime.now(),
      );
      
      _sensorDataController.add(status);
      return true;
    } catch (e) {
      print('❌ Irrigation control failed: $e');
      return false;
    }
  }

  // Get livestock data
  Future<LivestockData> getLivestockData(String deviceId) async {
    final device = _connectedDevices.firstWhere(
      (d) => d.id == deviceId,
      orElse: () => throw Exception('Device not found'),
    );
    
    if (device.type != IoTDeviceType.livestockMonitor) {
      throw Exception('Device is not a livestock monitor');
    }

    final random = math.Random();
    final heartRate = 60 + (random.nextDouble() * 40);
    
    return LivestockData(
      deviceId: deviceId,
      animalId: 'COW_${deviceId.split('_').last}',
      heartRate: heartRate,
      bodyTemperature: 38.5 + (random.nextDouble() * 2),
      activityLevel: random.nextDouble() * 100,
      location: LatLng(
        device.location.latitude + (random.nextDouble() - 0.5) * 0.001,
        device.location.longitude + (random.nextDouble() - 0.5) * 0.001,
      ),
      healthStatus: _calculateHealthStatus(heartRate),
      timestamp: DateTime.now(),
      rumination: 6 + (random.nextDouble() * 4),
      milkProduction: 15 + (random.nextDouble() * 10),
    );
  }

  // Control drone operations
  Future<DroneFlightData> controlDrone(String deviceId, DroneCommand command) async {
    final device = _connectedDevices.firstWhere(
      (d) => d.id == deviceId,
      orElse: () => throw Exception('Device not found'),
    );
    
    if (device.type != IoTDeviceType.drone) {
      throw Exception('Device is not a drone');
    }

    try {
      // Simulate mission execution
      await Future.delayed(Duration(seconds: 1));
      
      print('🚁 Drone Mission Started:');
      print('   Device: ${device.name}');
      print('   Mission: ${command.missionType.name}');
      print('   Waypoints: ${command.waypoints.length}');
      print('   Altitude: ${command.altitude}m');
      
      return DroneFlightData(
        deviceId: deviceId,
        missionId: 'MISSION_${DateTime.now().millisecondsSinceEpoch}',
        missionType: command.missionType,
        status: DroneStatus.inFlight,
        startTime: DateTime.now(),
        waypoints: command.waypoints,
        currentWaypoint: 0,
        altitude: command.altitude,
        batteryRemaining: device.batteryLevel,
        estimatedFlightTime: Duration(minutes: command.waypoints.length * 3),
      );
    } catch (e) {
      print('❌ Drone control failed: $e');
      throw Exception('Failed to control drone: $e');
    }
  }

  // Control greenhouse environment
  Future<bool> controlGreenhouse(String deviceId, GreenhouseSettings settings) async {
    final device = _connectedDevices.firstWhere(
      (d) => d.id == deviceId,
      orElse: () => throw Exception('Device not found'),
    );
    
    if (device.type != IoTDeviceType.greenhouse) {
      throw Exception('Device is not a greenhouse controller');
    }

    try {
      await Future.delayed(Duration(milliseconds: 300));
      
      print('🏠 Greenhouse Settings Updated:');
      print('   Target Temperature: ${settings.targetTemperature}°C');
      print('   Target Humidity: ${settings.targetHumidity}%');
      print('   Ventilation: ${settings.ventilationMode.name}');
      print('   CO2 Level: ${settings.co2Level} ppm');
      
      // Generate greenhouse status
      final status = GreenhouseStatus(
        deviceId: deviceId,
        currentTemperature: settings.targetTemperature + (math.Random().nextDouble() - 0.5) * 2,
        currentHumidity: settings.targetHumidity + (math.Random().nextDouble() - 0.5) * 5,
        co2Level: settings.co2Level + (math.Random().nextDouble() - 0.5) * 50,
        lightLevel: 60 + (math.Random().nextDouble() * 40),
        ventilationSpeed: settings.ventilationMode == VentilationMode.auto ? 75.0 : 50.0,
        timestamp: DateTime.now(),
      );
      
      _sensorDataController.add(status);
      return true;
    } catch (e) {
      print('❌ Greenhouse control failed: $e');
      return false;
    }
  }

  // Setup automatic irrigation based on sensor data
  Future<void> setupAutomaticIrrigation(
    String soilSensorId,
    String irrigationControllerId,
    AutoIrrigationRules rules,
  ) async {
    print('🤖 Setting up automatic irrigation...');
    print('   Soil Sensor: $soilSensorId');
    print('   Controller: $irrigationControllerId');
    print('   Min Moisture: ${rules.minimumMoisture}%');
    print('   Max Moisture: ${rules.maximumMoisture}%');
    
    // Listen to soil moisture data
    sensorDataStream.listen((data) async {
      if (data.deviceId == soilSensorId && data is SoilMoistureReading) {
        final moistureLevel = data.moistureLevel;
        
        if (moistureLevel < rules.minimumMoisture && !rules.isIrrigating) {
          print('💧 Auto-irrigation triggered: Moisture at ${moistureLevel.toStringAsFixed(1)}%');
          
          await controlIrrigationSystem(
            irrigationControllerId,
            IrrigationCommand(
              action: IrrigationAction.start,
              duration: Duration(minutes: rules.irrigationDuration),
              zones: rules.zones,
              flowRate: rules.flowRate,
            ),
          );
          rules.isIrrigating = true;
          
        } else if (moistureLevel > rules.maximumMoisture && rules.isIrrigating) {
          print('🛑 Auto-irrigation stopped: Moisture at ${moistureLevel.toStringAsFixed(1)}%');
          
          await controlIrrigationSystem(
            irrigationControllerId,
            IrrigationCommand(action: IrrigationAction.stop),
          );
          rules.isIrrigating = false;
        }
      }
    });
  }

  // Get device health status
  Future<DeviceHealthStatus> getDeviceHealth(String deviceId) async {
    final device = _connectedDevices.firstWhere(
      (d) => d.id == deviceId,
      orElse: () => throw Exception('Device not found'),
    );

    final random = math.Random();
    return DeviceHealthStatus(
      deviceId: deviceId,
      batteryLevel: device.batteryLevel,
      signalStrength: device.signalStrength,
      lastSeen: DateTime.now().subtract(Duration(seconds: random.nextInt(60))),
      status: device.isConnected ? DeviceStatus.online : DeviceStatus.offline,
      errorCodes: _generateRandomErrors(device),
      uptime: Duration(hours: random.nextInt(720)), // Up to 30 days
      dataTransmissionRate: 95.0 + (random.nextDouble() * 5), // 95-100%
    );
  }

  // Get all connected devices
  List<IoTDevice> get connectedDevices => List.unmodifiable(_connectedDevices);

  // Real-time sensor data stream
  Stream<IoTSensorData> get sensorDataStream => _sensorDataController.stream;

  // Search for new devices
  Future<List<IoTDevice>> scanForDevices() async {
    print('🔍 Scanning for IoT devices...');
    await Future.delayed(Duration(seconds: 2));
    
    // Simulate finding new devices
    final newDevices = <IoTDevice>[
      IoTDevice(
        id: 'new_sensor_${DateTime.now().millisecondsSinceEpoch}',
        name: 'New Soil Sensor',
        type: IoTDeviceType.soilMoisture,
        connectionType: IoTConnectionType.bluetooth,
        isConnected: false,
        signalStrength: -60.0,
        batteryLevel: 100.0,
        location: LatLng(28.7041, 77.1025),
      ),
    ];
    
    print('📱 Found ${newDevices.length} new devices');
    return newDevices;
  }

  // Connect to a discovered device
  Future<bool> connectToDevice(IoTDevice device) async {
    try {
      print('🔗 Connecting to ${device.name}...');
      await Future.delayed(Duration(seconds: 1));
      
      device.isConnected = true;
      _connectedDevices.add(device);
      
      // Start data simulation for new device
      _deviceTimers[device.id] = Timer.periodic(
        Duration(seconds: 5),
        (timer) => _generateDeviceData(device),
      );
      
      print('✅ Connected to ${device.name}');
      return true;
    } catch (e) {
      print('❌ Failed to connect to ${device.name}: $e');
      return false;
    }
  }

  // Helper methods
  String _calculateHealthStatus(double heartRate) {
    if (heartRate < 50 || heartRate > 120) return 'Alert';
    if (heartRate < 60 || heartRate > 100) return 'Monitor';
    return 'Healthy';
  }

  List<String> _generateRandomErrors(IoTDevice device) {
    final random = math.Random();
    final errors = <String>[];
    
    if (device.batteryLevel < 20) errors.add('LOW_BATTERY');
    if (device.signalStrength < -70) errors.add('WEAK_SIGNAL');
    if (random.nextDouble() < 0.1) errors.add('SENSOR_DRIFT');
    
    return errors;
  }

  void dispose() {
    _deviceTimers.forEach((_, timer) => timer.cancel());
    _deviceTimers.clear();
    _sensorDataController.close();
  }
}

// Data Models for IoT Integration

class IoTDevice {
  final String id;
  final String name;
  final IoTDeviceType type;
  final IoTConnectionType connectionType;
  bool isConnected;
  final double signalStrength;
  final double batteryLevel;
  final LatLng location;
  final DateTime? lastSeen;

  IoTDevice({
    required this.id,
    required this.name,
    required this.type,
    required this.connectionType,
    required this.isConnected,
    required this.signalStrength,
    required this.batteryLevel,
    required this.location,
    this.lastSeen,
  });
}

abstract class IoTSensorData {
  final String deviceId;
  final DateTime timestamp;

  IoTSensorData({
    required this.deviceId,
    required this.timestamp,
  });
}

class SoilMoistureReading extends IoTSensorData {
  final double moistureLevel;
  final double temperature;
  final double ph;
  final double ec;
  final double batteryLevel;
  final NutrientLevels nutrients;

  SoilMoistureReading({
    required String deviceId,
    required this.moistureLevel,
    required this.temperature,
    required this.ph,
    required this.ec,
    required DateTime timestamp,
    required this.batteryLevel,
    required this.nutrients,
  }) : super(deviceId: deviceId, timestamp: timestamp);
}

class WeatherStationReading extends IoTSensorData {
  final double temperature;
  final double humidity;
  final double pressure;
  final double windSpeed;
  final double windDirection;
  final double rainfall;
  final double uvIndex;
  final double solarRadiation;

  WeatherStationReading({
    required String deviceId,
    required this.temperature,
    required this.humidity,
    required this.pressure,
    required this.windSpeed,
    required this.windDirection,
    required this.rainfall,
    required this.uvIndex,
    required this.solarRadiation,
    required DateTime timestamp,
  }) : super(deviceId: deviceId, timestamp: timestamp);
}

class LivestockData extends IoTSensorData {
  final String animalId;
  final double heartRate;
  final double bodyTemperature;
  final double activityLevel;
  final LatLng location;
  final String healthStatus;
  final double rumination;
  final double milkProduction;

  LivestockData({
    required String deviceId,
    required this.animalId,
    required this.heartRate,
    required this.bodyTemperature,
    required this.activityLevel,
    required this.location,
    required this.healthStatus,
    required DateTime timestamp,
    required this.rumination,
    required this.milkProduction,
  }) : super(deviceId: deviceId, timestamp: timestamp);
}

class IrrigationStatus extends IoTSensorData {
  final bool isActive;
  final List<String> currentZones;
  final double flowRate;
  final Duration totalRuntime;
  final double waterUsed;

  IrrigationStatus({
    required String deviceId,
    required this.isActive,
    required this.currentZones,
    required this.flowRate,
    required this.totalRuntime,
    required this.waterUsed,
    required DateTime timestamp,
  }) : super(deviceId: deviceId, timestamp: timestamp);
}

class GreenhouseStatus extends IoTSensorData {
  final double currentTemperature;
  final double currentHumidity;
  final double co2Level;
  final double lightLevel;
  final double ventilationSpeed;

  GreenhouseStatus({
    required String deviceId,
    required this.currentTemperature,
    required this.currentHumidity,
    required this.co2Level,
    required this.lightLevel,
    required this.ventilationSpeed,
    required DateTime timestamp,
  }) : super(deviceId: deviceId, timestamp: timestamp);
}

class NutrientLevels {
  final double nitrogen;
  final double phosphorus;
  final double potassium;

  NutrientLevels({
    required this.nitrogen,
    required this.phosphorus,
    required this.potassium,
  });
}

class IrrigationCommand {
  final IrrigationAction action;
  final Duration? duration;
  final List<String> zones;
  final double flowRate;

  IrrigationCommand({
    required this.action,
    this.duration,
    this.zones = const [],
    this.flowRate = 10.0,
  });
}

class DroneCommand {
  final DroneMissionType missionType;
  final List<LatLng> waypoints;
  final double altitude;
  final Map<String, dynamic> cameraSettings;
  final Map<String, dynamic> spraySettings;

  DroneCommand({
    required this.missionType,
    required this.waypoints,
    this.altitude = 50.0,
    this.cameraSettings = const {},
    this.spraySettings = const {},
  });
}

class DroneFlightData {
  final String deviceId;
  final String missionId;
  final DroneMissionType missionType;
  final DroneStatus status;
  final DateTime startTime;
  final List<LatLng> waypoints;
  final int currentWaypoint;
  final double altitude;
  final double batteryRemaining;
  final Duration estimatedFlightTime;

  DroneFlightData({
    required this.deviceId,
    required this.missionId,
    required this.missionType,
    required this.status,
    required this.startTime,
    required this.waypoints,
    required this.currentWaypoint,
    required this.altitude,
    required this.batteryRemaining,
    required this.estimatedFlightTime,
  });
}

class GreenhouseSettings {
  final double targetTemperature;
  final double targetHumidity;
  final VentilationMode ventilationMode;
  final double co2Level;
  final Map<String, dynamic> lightingSchedule;
  final Map<String, dynamic> irrigationSchedule;

  GreenhouseSettings({
    required this.targetTemperature,
    required this.targetHumidity,
    required this.ventilationMode,
    required this.co2Level,
    this.lightingSchedule = const {},
    this.irrigationSchedule = const {},
  });
}

class AutoIrrigationRules {
  final double minimumMoisture;
  final double maximumMoisture;
  final int irrigationDuration;
  final List<String> zones;
  final double flowRate;
  bool isIrrigating;

  AutoIrrigationRules({
    required this.minimumMoisture,
    required this.maximumMoisture,
    required this.irrigationDuration,
    required this.zones,
    required this.flowRate,
    this.isIrrigating = false,
  });
}

class DeviceHealthStatus {
  final String deviceId;
  final double batteryLevel;
  final double signalStrength;
  final DateTime lastSeen;
  final DeviceStatus status;
  final List<String> errorCodes;
  final Duration uptime;
  final double dataTransmissionRate;

  DeviceHealthStatus({
    required this.deviceId,
    required this.batteryLevel,
    required this.signalStrength,
    required this.lastSeen,
    required this.status,
    required this.errorCodes,
    required this.uptime,
    required this.dataTransmissionRate,
  });
}

class LatLng {
  final double latitude;
  final double longitude;

  LatLng(this.latitude, this.longitude);
}

// Enums
enum IoTDeviceType {
  soilMoisture,
  weatherStation,
  irrigationController,
  livestockMonitor,
  drone,
  greenhouse,
  unknown,
}

enum IoTConnectionType {
  bluetooth,
  wifi,
  lora,
  mqtt,
  zigbee,
}

enum IrrigationAction {
  start,
  stop,
  pause,
  resume,
}

enum DroneMissionType {
  surveillance,
  spraying,
  mapping,
  monitoring,
}

enum DroneStatus {
  idle,
  inFlight,
  landing,
  error,
  charging,
}

enum VentilationMode {
  auto,
  manual,
  off,
}

enum DeviceStatus {
  online,
  offline,
  error,
  maintenance,
}
