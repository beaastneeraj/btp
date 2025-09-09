import 'package:flutter/material.dart';

class CalendarWidget extends StatelessWidget {
  final List<DateTime> taskDates;
  const CalendarWidget({required this.taskDates});

  @override
  Widget build(BuildContext context) {
    // Placeholder for calendar view
    return Card(
      margin: EdgeInsets.all(16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Task Calendar', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 12),
            Wrap(
              spacing: 8,
              children: taskDates.map((date) => Chip(label: Text('${date.day}/${date.month}/${date.year}'))).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
