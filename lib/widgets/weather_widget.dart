import 'package:flutter/material.dart';

class WeatherWidget extends StatelessWidget {
  final String location;
  final String condition;
  final double temperature;
  final String iconUrl;

  const WeatherWidget({
    required this.location,
    required this.condition,
    required this.temperature,
    required this.iconUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      elevation: 8,
      margin: EdgeInsets.all(16),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue.shade200, Colors.green.shade100],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        padding: EdgeInsets.all(24),
        child: Row(
          children: [
            Image.network(iconUrl, width: 64, height: 64),
            SizedBox(width: 24),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(location, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                Text(condition, style: TextStyle(fontSize: 16)),
                Text('${temperature.toStringAsFixed(1)}°C', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
