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

  factory InventoryModel.fromJson(Map<String, dynamic> json) {
    return InventoryModel(
      id: json['id'],
      userId: json['userId'],
      itemName: json['itemName'],
      category: json['category'],
      stock: json['stock'],
      unitPrice: (json['unitPrice'] as num).toDouble(),
      reorderLevel: json['reorderLevel'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'itemName': itemName,
      'category': category,
      'stock': stock,
      'unitPrice': unitPrice,
      'reorderLevel': reorderLevel,
    };
  }

  InventoryModel copyWith({
    String? id,
    String? userId,
    String? itemName,
    String? category,
    int? stock,
    double? unitPrice,
    int? reorderLevel,
  }) {
    return InventoryModel(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      itemName: itemName ?? this.itemName,
      category: category ?? this.category,
      stock: stock ?? this.stock,
      unitPrice: unitPrice ?? this.unitPrice,
      reorderLevel: reorderLevel ?? this.reorderLevel,
    );
  }

  bool get isLowStock => stock <= reorderLevel;
}
