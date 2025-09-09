import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[50],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.agriculture, size: 100, color: Colors.green[700]),
            SizedBox(height: 24),
            Text(
              'Farm Management',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.green[800],
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Digitize your farm, maximize your yield!',
              style: TextStyle(fontSize: 18, color: Colors.green[600]),
            ),
          ],
        ),
      ),
    );
  }
}
