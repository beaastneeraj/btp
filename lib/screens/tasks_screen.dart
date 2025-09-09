import 'package:flutter/material.dart';

class TasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tasks', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.purple.shade700,
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(24)),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.purple.shade400, Colors.blue.shade200],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: ListView(
          padding: EdgeInsets.all(20),
          children: [
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              elevation: 4,
              child: ListTile(
                leading: Icon(Icons.task_alt, color: Colors.purple.shade700),
                title: Text('Irrigation'),
                subtitle: Text('Due: 2025-09-10 | Status: Pending'),
                trailing: Icon(Icons.edit),
                onTap: () {},
              ),
            ),
            // ...more tasks, add CRUD logic here...
            SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {},
              icon: Icon(Icons.add),
              label: Text('Add Task'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple.shade700,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                padding: EdgeInsets.symmetric(vertical: 16),
                elevation: 4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
