class CropModel {
  final String id;
  final String fieldId;
  final String cropName;
  final String variety;
  final DateTime plantingDate;
  final DateTime? harvestDate;
  final double? yield;

  CropModel({
    required this.id,
    required this.fieldId,
    required this.cropName,
    required this.variety,
    required this.plantingDate,
    this.harvestDate,
    this.yield,
  });

  factory CropModel.fromJson(Map<String, dynamic> json) {
    return CropModel(
      id: json['id'],
      fieldId: json['fieldId'],
      cropName: json['cropName'],
      variety: json['variety'],
      plantingDate: DateTime.parse(json['plantingDate']),
      harvestDate: json['harvestDate'] != null ? DateTime.parse(json['harvestDate']) : null,
      yield: json['yield']?.toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'fieldId': fieldId,
      'cropName': cropName,
      'variety': variety,
      'plantingDate': plantingDate.toIso8601String(),
      'harvestDate': harvestDate?.toIso8601String(),
      'yield': yield,
    };
  }

  CropModel copyWith({
    String? id,
    String? fieldId,
    String? cropName,
    String? variety,
    DateTime? plantingDate,
    DateTime? harvestDate,
    double? yield,
  }) {
    return CropModel(
      id: id ?? this.id,
      fieldId: fieldId ?? this.fieldId,
      cropName: cropName ?? this.cropName,
      variety: variety ?? this.variety,
      plantingDate: plantingDate ?? this.plantingDate,
      harvestDate: harvestDate ?? this.harvestDate,
      yield: yield ?? this.yield,
    );
  }
}
