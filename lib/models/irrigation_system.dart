import 'package:cloud_firestore/cloud_firestore.dart';

class IrrigationSystem {
  final String id;
  final String name;
  final IrrigationType type;
  final String fieldId;
  final double coverageArea;
  final double waterFlowRate; // liters per hour
  final double efficiency; // percentage
  final DateTime installationDate;
  final bool isActive;
  final Map<String, dynamic> specifications;
  final double totalCost;
  final double maintenanceCost;
  final DateTime? lastMaintenance;
  final DateTime? nextMaintenance;
  final List<IrrigationSchedule> schedules;
  final DateTime createdAt;
  final DateTime updatedAt;

  IrrigationSystem({
    required this.id,
    required this.name,
    required this.type,
    required this.fieldId,
    required this.coverageArea,
    required this.waterFlowRate,
    required this.efficiency,
    required this.installationDate,
    this.isActive = true,
    this.specifications = const {},
    required this.totalCost,
    this.maintenanceCost = 0.0,
    this.lastMaintenance,
    this.nextMaintenance,
    this.schedules = const [],
    required this.createdAt,
    required this.updatedAt,
  });

  factory IrrigationSystem.fromJson(Map<String, dynamic> json) {
    return IrrigationSystem(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      type: IrrigationType.values.firstWhere(
        (e) => e.toString() == json['type'],
        orElse: () => IrrigationType.drip,
      ),
      fieldId: json['fieldId'] ?? '',
      coverageArea: (json['coverageArea'] ?? 0.0).toDouble(),
      waterFlowRate: (json['waterFlowRate'] ?? 0.0).toDouble(),
      efficiency: (json['efficiency'] ?? 0.0).toDouble(),
      installationDate: (json['installationDate'] as Timestamp).toDate(),
      isActive: json['isActive'] ?? true,
      specifications: json['specifications'] ?? {},
      totalCost: (json['totalCost'] ?? 0.0).toDouble(),
      maintenanceCost: (json['maintenanceCost'] ?? 0.0).toDouble(),
      lastMaintenance: json['lastMaintenance'] != null
          ? (json['lastMaintenance'] as Timestamp).toDate()
          : null,
      nextMaintenance: json['nextMaintenance'] != null
          ? (json['nextMaintenance'] as Timestamp).toDate()
          : null,
      schedules: (json['schedules'] as List<dynamic>?)
              ?.map((s) => IrrigationSchedule.fromJson(s))
              .toList() ??
          [],
      createdAt: (json['createdAt'] as Timestamp).toDate(),
      updatedAt: (json['updatedAt'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'type': type.toString(),
      'fieldId': fieldId,
      'coverageArea': coverageArea,
      'waterFlowRate': waterFlowRate,
      'efficiency': efficiency,
      'installationDate': Timestamp.fromDate(installationDate),
      'isActive': isActive,
      'specifications': specifications,
      'totalCost': totalCost,
      'maintenanceCost': maintenanceCost,
      'lastMaintenance': lastMaintenance != null 
          ? Timestamp.fromDate(lastMaintenance!) 
          : null,
      'nextMaintenance': nextMaintenance != null 
          ? Timestamp.fromDate(nextMaintenance!) 
          : null,
      'schedules': schedules.map((s) => s.toJson()).toList(),
      'createdAt': Timestamp.fromDate(createdAt),
      'updatedAt': Timestamp.fromDate(updatedAt),
    };
  }

  double calculateWaterUsage(Duration duration) {
    return waterFlowRate * duration.inHours * (efficiency / 100);
  }

  double calculateOperationCost(Duration duration, double waterCostPerLiter, double electricityCostPerHour) {
    final waterUsed = calculateWaterUsage(duration);
    final waterCost = waterUsed * waterCostPerLiter;
    final electricityCost = duration.inHours * electricityCostPerHour;
    return waterCost + electricityCost;
  }

  bool get needsMaintenance =>
      nextMaintenance != null && DateTime.now().isAfter(nextMaintenance!);
}

class IrrigationSchedule {
  final String id;
  final DateTime startTime;
  final Duration duration;
  final List<int> daysOfWeek; // 1-7 (Monday-Sunday)
  final bool isActive;
  final double waterAmount; // liters
  final String? notes;

  IrrigationSchedule({
    required this.id,
    required this.startTime,
    required this.duration,
    required this.daysOfWeek,
    this.isActive = true,
    required this.waterAmount,
    this.notes,
  });

  factory IrrigationSchedule.fromJson(Map<String, dynamic> json) {
    return IrrigationSchedule(
      id: json['id'] ?? '',
      startTime: (json['startTime'] as Timestamp).toDate(),
      duration: Duration(minutes: json['durationMinutes'] ?? 0),
      daysOfWeek: List<int>.from(json['daysOfWeek'] ?? []),
      isActive: json['isActive'] ?? true,
      waterAmount: (json['waterAmount'] ?? 0.0).toDouble(),
      notes: json['notes'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'startTime': Timestamp.fromDate(startTime),
      'durationMinutes': duration.inMinutes,
      'daysOfWeek': daysOfWeek,
      'isActive': isActive,
      'waterAmount': waterAmount,
      'notes': notes,
    };
  }
}

enum IrrigationType {
  drip,
  sprinkler,
  furrow,
  flood,
  centerPivot,
  microSpray,
}

extension IrrigationTypeExtension on IrrigationType {
  String get displayName {
    switch (this) {
      case IrrigationType.drip:
        return 'Drip Irrigation';
      case IrrigationType.sprinkler:
        return 'Sprinkler System';
      case IrrigationType.furrow:
        return 'Furrow Irrigation';
      case IrrigationType.flood:
        return 'Flood Irrigation';
      case IrrigationType.centerPivot:
        return 'Center Pivot';
      case IrrigationType.microSpray:
        return 'Micro Spray';
    }
  }

  String get description {
    switch (this) {
      case IrrigationType.drip:
        return 'Water-efficient system delivering water directly to plant roots';
      case IrrigationType.sprinkler:
        return 'Overhead water distribution system mimicking rainfall';
      case IrrigationType.furrow:
        return 'Traditional method using channels between crop rows';
      case IrrigationType.flood:
        return 'Field flooding method for rice and similar crops';
      case IrrigationType.centerPivot:
        return 'Rotating sprinkler system for large circular fields';
      case IrrigationType.microSpray:
        return 'Low-pressure spray system for orchards and nurseries';
    }
  }

  double get typicalEfficiency {
    switch (this) {
      case IrrigationType.drip:
        return 90.0;
      case IrrigationType.sprinkler:
        return 75.0;
      case IrrigationType.furrow:
        return 60.0;
      case IrrigationType.flood:
        return 40.0;
      case IrrigationType.centerPivot:
        return 80.0;
      case IrrigationType.microSpray:
        return 85.0;
    }
  }

  double get installationCostPerSqMeter {
    switch (this) {
      case IrrigationType.drip:
        return 150.0;
      case IrrigationType.sprinkler:
        return 100.0;
      case IrrigationType.furrow:
        return 25.0;
      case IrrigationType.flood:
        return 15.0;
      case IrrigationType.centerPivot:
        return 120.0;
      case IrrigationType.microSpray:
        return 130.0;
    }
  }
}
