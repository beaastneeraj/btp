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
}
