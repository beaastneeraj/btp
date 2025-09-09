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

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      id: json['id'],
      fieldId: json['fieldId'],
      title: json['title'],
      description: json['description'],
      dueDate: DateTime.parse(json['dueDate']),
      status: json['status'],
      assignedTo: json['assignedTo'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'fieldId': fieldId,
      'title': title,
      'description': description,
      'dueDate': dueDate.toIso8601String(),
      'status': status,
      'assignedTo': assignedTo,
    };
  }

  TaskModel copyWith({
    String? id,
    String? fieldId,
    String? title,
    String? description,
    DateTime? dueDate,
    String? status,
    String? assignedTo,
  }) {
    return TaskModel(
      id: id ?? this.id,
      fieldId: fieldId ?? this.fieldId,
      title: title ?? this.title,
      description: description ?? this.description,
      dueDate: dueDate ?? this.dueDate,
      status: status ?? this.status,
      assignedTo: assignedTo ?? this.assignedTo,
    );
  }

  bool get isPending => status == 'pending';
  bool get isCompleted => status == 'completed';
  bool get isOverdue => dueDate.isBefore(DateTime.now()) && !isCompleted;
}
