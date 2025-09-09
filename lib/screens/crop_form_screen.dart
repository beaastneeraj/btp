import 'package:flutter/material.dart';

class CropFormScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add/Edit Crop'),
        backgroundColor: Colors.green.shade700,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Crop Name'),
            ),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(labelText: 'Variety'),
            ),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(labelText: 'Planting Date'),
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
