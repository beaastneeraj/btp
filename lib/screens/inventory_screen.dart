import 'package:flutter/material.dart';

class InventoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Inventory'), backgroundColor: Colors.blue[700]),
      body: ListView.builder(
        itemCount: 3, // Placeholder
        itemBuilder: (context, index) => Card(
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: ListTile(
            leading: Icon(Icons.inventory, color: Colors.blue),
            title: Text('Item ${index + 1}'),
            subtitle: Text('Stock: ${10 + index}'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {},
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        child: Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }
}
