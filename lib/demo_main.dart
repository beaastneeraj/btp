import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'screens/comprehensive_agriculture_app.dart';

void main() {
  runApp(SmartAgricultureDemoApp());
}

class SmartAgricultureDemoApp extends StatelessWidget {
  const SmartAgricultureDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart Agriculture Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.green,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Color(0xFF0F1419),
        colorScheme: ColorScheme.dark(
          primary: Colors.green,
          secondary: Colors.blue,
          surface: Colors.white.withOpacity(0.1),
          onPrimary: Colors.white,
          onSecondary: Colors.white,
          onSurface: Colors.white,
        ),
      ),
      home: ComprehensiveAgricultureApp(),
    );
  }
}
