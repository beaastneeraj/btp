class ExpenseModel {
  final String id;
  final String fieldId;
  final String category;
  final double amount;
  final String description;
  final DateTime date;
  final String supplier;

  ExpenseModel({
    required this.id,
    required this.fieldId,
    required this.category,
    required this.amount,
    required this.description,
    required this.date,
    required this.supplier,
  });

  factory ExpenseModel.fromJson(Map<String, dynamic> json) {
    return ExpenseModel(
      id: json['id'],
      fieldId: json['fieldId'],
      category: json['category'],
      amount: (json['amount'] as num).toDouble(),
      description: json['description'],
      date: DateTime.parse(json['date']),
      supplier: json['supplier'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'fieldId': fieldId,
      'category': category,
      'amount': amount,
      'description': description,
      'date': date.toIso8601String(),
      'supplier': supplier,
    };
  }

  ExpenseModel copyWith({
    String? id,
    String? fieldId,
    String? category,
    double? amount,
    String? description,
    DateTime? date,
    String? supplier,
  }) {
    return ExpenseModel(
      id: id ?? this.id,
      fieldId: fieldId ?? this.fieldId,
      category: category ?? this.category,
      amount: amount ?? this.amount,
      description: description ?? this.description,
      date: date ?? this.date,
      supplier: supplier ?? this.supplier,
    );
  }
}
