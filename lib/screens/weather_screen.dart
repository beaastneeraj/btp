import 'package:flutter/material.dart';

class WeatherScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Weather'), backgroundColor: Colors.teal[700]),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.cloud, size: 80, color: Colors.teal),
            SizedBox(height: 24),
            Text('Current Weather', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text('Sunny, 32°C', style: TextStyle(fontSize: 18)),
            SizedBox(height: 16),
            Text('7-day forecast coming soon...', style: TextStyle(fontSize: 16, color: Colors.teal[600])),
          ],
        ),
      ),
    );
  }
}
