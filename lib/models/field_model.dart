class FieldModel {
  final String id;
  final String userId;
  final String name;
  final double sizeHectares;
  final String soilType;
  final String gpsCoordinates;

  FieldModel({
    required this.id,
    required this.userId,
    required this.name,
    required this.sizeHectares,
    required this.soilType,
    required this.gpsCoordinates,
  });

  factory FieldModel.fromJson(Map<String, dynamic> json) {
    return FieldModel(
      id: json['id'],
      userId: json['userId'],
      name: json['name'],
      sizeHectares: (json['sizeHectares'] as num).toDouble(),
      soilType: json['soilType'],
      gpsCoordinates: json['gpsCoordinates'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'name': name,
      'sizeHectares': sizeHectares,
      'soilType': soilType,
      'gpsCoordinates': gpsCoordinates,
    };
  }

  FieldModel copyWith({
    String? id,
    String? userId,
    String? name,
    double? sizeHectares,
    String? soilType,
    String? gpsCoordinates,
  }) {
    return FieldModel(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      name: name ?? this.name,
      sizeHectares: sizeHectares ?? this.sizeHectares,
      soilType: soilType ?? this.soilType,
      gpsCoordinates: gpsCoordinates ?? this.gpsCoordinates,
    );
  }
}
