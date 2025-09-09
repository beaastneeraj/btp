import 'package:flutter/material.dart';

class FieldsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Fields'), backgroundColor: Colors.green[700]),
      body: ListView.builder(
        itemCount: 3, // Placeholder
        itemBuilder: (context, index) => Card(
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: ListTile(
            leading: Icon(Icons.grass, color: Colors.green),
            title: Text('Field ${index + 1}'),
            subtitle: Text('Size: ${2 + index} hectares'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {},
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        child: Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }
}
