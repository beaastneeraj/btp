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
}
