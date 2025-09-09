import 'package:flutter/material.dart';

class TasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tasks'), backgroundColor: Colors.purple[700]),
      body: ListView.builder(
        itemCount: 3, // Placeholder
        itemBuilder: (context, index) => Card(
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: ListTile(
            leading: Icon(Icons.task, color: Colors.purple),
            title: Text('Task ${index + 1}'),
            subtitle: Text('Due: Tomorrow'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {},
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purple,
        child: Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }
}
