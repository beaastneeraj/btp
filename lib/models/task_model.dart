class TaskModel {
  final String id;
  final String fieldId;
  final String title;
  final String description;
  final DateTime dueDate;
  final String status;
  final String assignedTo;

  TaskModel({
    required this.id,
    required this.fieldId,
    required this.title,
    required this.description,
    required this.dueDate,
    required this.status,
    required this.assignedTo,
  });
}
