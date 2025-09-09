import 'package:flutter/material.dart';

class CropsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Crops'), backgroundColor: Colors.green[700]),
      body: ListView.builder(
        itemCount: 3, // Placeholder
        itemBuilder: (context, index) => Card(
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: ListTile(
            leading: Icon(Icons.eco, color: Colors.green),
            title: Text('Crop ${index + 1}'),
            subtitle: Text('Variety: Wheat'),
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
