import 'package:flutter/material.dart';

class TaskFormScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add/Edit Task'),
        backgroundColor: Colors.purple.shade700,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
            ),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(labelText: 'Due Date'),
            ),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(labelText: 'Status'),
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {},
              child: Text('Save'),
              style: ElevatedButton.styleFrom(minimumSize: Size(double.infinity, 48)),
            ),
          ],
        ),
      ),
    );
  }
}
