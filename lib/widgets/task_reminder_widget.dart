import 'package:flutter/material.dart';

class TaskReminderWidget extends StatelessWidget {
  final String title;
  final String dueDate;

  const TaskReminderWidget({
    required this.title,
    required this.dueDate,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.purple.shade100,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 4,
      margin: EdgeInsets.all(12),
      child: ListTile(
        leading: Icon(Icons.alarm, color: Colors.purple.shade700),
        title: Text('Task Reminder'),
        subtitle: Text('$title\nDue: $dueDate'),
      ),
    );
  }
}
