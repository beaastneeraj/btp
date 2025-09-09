import 'package:flutter/material.dart';

class ReportsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Reports & Analytics'), backgroundColor: Colors.red[700]),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.bar_chart, size: 80, color: Colors.red),
            SizedBox(height: 24),
            Text('Reports & Analytics', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text('Charts and data export coming soon...', style: TextStyle(fontSize: 16, color: Colors.red[600])),
          ],
        ),
      ),
    );
  }
}
