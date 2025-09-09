class InventoryModel {
  final String id;
  final String userId;
  final String itemName;
  final String category;
  final int stock;
  final double unitPrice;
  final int reorderLevel;

  InventoryModel({
    required this.id,
    required this.userId,
    required this.itemName,
    required this.category,
    required this.stock,
    required this.unitPrice,
    required this.reorderLevel,
  });
}
