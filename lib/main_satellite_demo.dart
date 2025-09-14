import 'package:flutter/material.dart';
import 'screens/satellite_service_demo.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Satellite Data Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.dark,
      ),
      home: SatelliteServiceDemo(),
      debugShowCheckedModeBanner: false,
    );
  }
}
