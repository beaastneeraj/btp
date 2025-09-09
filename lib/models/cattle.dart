import 'package:cloud_firestore/cloud_firestore.dart';

class Cattle {
  final String id;
  final String tagNumber;
  final String name;
  final CattleType type;
  final CattleBreed breed;
  final DateTime birthDate;
  final Gender gender;
  final double weight;
  final HealthStatus healthStatus;
  final String? parentId;
  final DateTime? lastVaccination;
  final DateTime? nextVaccination;
  final Map<String, dynamic> medicalHistory;
  final Map<String, dynamic> breedingHistory;
  final double? dailyMilkYield;
  final DateTime? lastMilking;
  final String notes;
  final DateTime createdAt;
  final DateTime updatedAt;

  Cattle({
    required this.id,
    required this.tagNumber,
    required this.name,
    required this.type,
    required this.breed,
    required this.birthDate,
    required this.gender,
    required this.weight,
    required this.healthStatus,
    this.parentId,
    this.lastVaccination,
    this.nextVaccination,
    this.medicalHistory = const {},
    this.breedingHistory = const {},
    this.dailyMilkYield,
    this.lastMilking,
    this.notes = '',
    required this.createdAt,
    required this.updatedAt,
  });

  factory Cattle.fromJson(Map<String, dynamic> json) {
    return Cattle(
      id: json['id'] ?? '',
      tagNumber: json['tagNumber'] ?? '',
      name: json['name'] ?? '',
      type: CattleType.values.firstWhere(
        (e) => e.toString() == json['type'],
        orElse: () => CattleType.cow,
      ),
      breed: CattleBreed.values.firstWhere(
        (e) => e.toString() == json['breed'],
        orElse: () => CattleBreed.holstein,
      ),
      birthDate: (json['birthDate'] as Timestamp).toDate(),
      gender: Gender.values.firstWhere(
        (e) => e.toString() == json['gender'],
        orElse: () => Gender.female,
      ),
      weight: (json['weight'] ?? 0.0).toDouble(),
      healthStatus: HealthStatus.values.firstWhere(
        (e) => e.toString() == json['healthStatus'],
        orElse: () => HealthStatus.healthy,
      ),
      parentId: json['parentId'],
      lastVaccination: json['lastVaccination'] != null
          ? (json['lastVaccination'] as Timestamp).toDate()
          : null,
      nextVaccination: json['nextVaccination'] != null
          ? (json['nextVaccination'] as Timestamp).toDate()
          : null,
      medicalHistory: json['medicalHistory'] ?? {},
      breedingHistory: json['breedingHistory'] ?? {},
      dailyMilkYield: json['dailyMilkYield']?.toDouble(),
      lastMilking: json['lastMilking'] != null
          ? (json['lastMilking'] as Timestamp).toDate()
          : null,
      notes: json['notes'] ?? '',
      createdAt: (json['createdAt'] as Timestamp).toDate(),
      updatedAt: (json['updatedAt'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'tagNumber': tagNumber,
      'name': name,
      'type': type.toString(),
      'breed': breed.toString(),
      'birthDate': Timestamp.fromDate(birthDate),
      'gender': gender.toString(),
      'weight': weight,
      'healthStatus': healthStatus.toString(),
      'parentId': parentId,
      'lastVaccination': lastVaccination != null 
          ? Timestamp.fromDate(lastVaccination!) 
          : null,
      'nextVaccination': nextVaccination != null 
          ? Timestamp.fromDate(nextVaccination!) 
          : null,
      'medicalHistory': medicalHistory,
      'breedingHistory': breedingHistory,
      'dailyMilkYield': dailyMilkYield,
      'lastMilking': lastMilking != null 
          ? Timestamp.fromDate(lastMilking!) 
          : null,
      'notes': notes,
      'createdAt': Timestamp.fromDate(createdAt),
      'updatedAt': Timestamp.fromDate(updatedAt),
    };
  }

  Cattle copyWith({
    String? tagNumber,
    String? name,
    CattleType? type,
    CattleBreed? breed,
    DateTime? birthDate,
    Gender? gender,
    double? weight,
    HealthStatus? healthStatus,
    String? parentId,
    DateTime? lastVaccination,
    DateTime? nextVaccination,
    Map<String, dynamic>? medicalHistory,
    Map<String, dynamic>? breedingHistory,
    double? dailyMilkYield,
    DateTime? lastMilking,
    String? notes,
  }) {
    return Cattle(
      id: id,
      tagNumber: tagNumber ?? this.tagNumber,
      name: name ?? this.name,
      type: type ?? this.type,
      breed: breed ?? this.breed,
      birthDate: birthDate ?? this.birthDate,
      gender: gender ?? this.gender,
      weight: weight ?? this.weight,
      healthStatus: healthStatus ?? this.healthStatus,
      parentId: parentId ?? this.parentId,
      lastVaccination: lastVaccination ?? this.lastVaccination,
      nextVaccination: nextVaccination ?? this.nextVaccination,
      medicalHistory: medicalHistory ?? this.medicalHistory,
      breedingHistory: breedingHistory ?? this.breedingHistory,
      dailyMilkYield: dailyMilkYield ?? this.dailyMilkYield,
      lastMilking: lastMilking ?? this.lastMilking,
      notes: notes ?? this.notes,
      createdAt: createdAt,
      updatedAt: DateTime.now(),
    );
  }

  int get ageInDays => DateTime.now().difference(birthDate).inDays;
  int get ageInMonths => (ageInDays / 30).floor();
  
  bool get isLactating => 
    type == CattleType.cow && 
    gender == Gender.female && 
    ageInMonths >= 24;
    
  bool get needsVaccination => 
    nextVaccination != null && 
    DateTime.now().isAfter(nextVaccination!);
    
  String get displayAge {
    if (ageInDays < 30) {
      return '$ageInDays days';
    } else if (ageInMonths < 12) {
      return '$ageInMonths months';
    } else {
      final years = (ageInMonths / 12).floor();
      final remainingMonths = ageInMonths % 12;
      return remainingMonths > 0 
          ? '$years years $remainingMonths months'
          : '$years years';
    }
  }
}

enum CattleType {
  cow,
  bull,
  calf,
  heifer,
  steer,
}

enum CattleBreed {
  holstein,
  jersey,
  angus,
  hereford,
  brahman,
  simmental,
  charolais,
  limousin,
  gir,
  sahiwal,
  redSindhi,
  tharparkar,
}

enum Gender {
  male,
  female,
}

enum HealthStatus {
  healthy,
  sick,
  injured,
  pregnant,
  recovered,
  quarantine,
}

extension CattleTypeExtension on CattleType {
  String get displayName {
    switch (this) {
      case CattleType.cow:
        return 'Cow';
      case CattleType.bull:
        return 'Bull';
      case CattleType.calf:
        return 'Calf';
      case CattleType.heifer:
        return 'Heifer';
      case CattleType.steer:
        return 'Steer';
    }
  }
}

extension CattleBreedExtension on CattleBreed {
  String get displayName {
    switch (this) {
      case CattleBreed.holstein:
        return 'Holstein';
      case CattleBreed.jersey:
        return 'Jersey';
      case CattleBreed.angus:
        return 'Angus';
      case CattleBreed.hereford:
        return 'Hereford';
      case CattleBreed.brahman:
        return 'Brahman';
      case CattleBreed.simmental:
        return 'Simmental';
      case CattleBreed.charolais:
        return 'Charolais';
      case CattleBreed.limousin:
        return 'Limousin';
      case CattleBreed.gir:
        return 'Gir';
      case CattleBreed.sahiwal:
        return 'Sahiwal';
      case CattleBreed.redSindhi:
        return 'Red Sindhi';
      case CattleBreed.tharparkar:
        return 'Tharparkar';
    }
  }
}

extension HealthStatusExtension on HealthStatus {
  String get displayName {
    switch (this) {
      case HealthStatus.healthy:
        return 'Healthy';
      case HealthStatus.sick:
        return 'Sick';
      case HealthStatus.injured:
        return 'Injured';
      case HealthStatus.pregnant:
        return 'Pregnant';
      case HealthStatus.recovered:
        return 'Recovered';
      case HealthStatus.quarantine:
        return 'Quarantine';
    }
  }
}
