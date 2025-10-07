import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'screens/comprehensive_agriculture_app.dart';

void main() {
  runApp(SmartAgricultureApp());
}

class SmartAgricultureApp extends StatelessWidget {
  const SmartAgricultureApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart Agriculture Intelligence Platform',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: Color(0xFF0F1419),
        fontFamily: 'Roboto',
        
        // Dark theme optimized for agricultural app
        brightness: Brightness.dark,
        
        // App bar theme
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          systemOverlayStyle: SystemUiOverlayStyle.light,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
          iconTheme: IconThemeData(color: Colors.white),
        ),
        
        // Card theme for glassmorphic effects
        cardTheme: CardTheme(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          color: Colors.white.withOpacity(0.1),
        ),
        
        // Text theme optimized for readability
        textTheme: TextTheme(
          displayLarge: TextStyle(
            color: Colors.white,
            fontSize: 32,
            fontWeight: FontWeight.bold,
            letterSpacing: -0.5,
          ),
          bodyLarge: TextStyle(
            color: Colors.white,
            fontSize: 16,
            height: 1.5,
          ),
          bodyMedium: TextStyle(
            color: Colors.white,
            fontSize: 14,
            height: 1.4,
          ),
        ),
        
        // Color scheme for Material 3
        colorScheme: ColorScheme.dark(
          primary: Colors.green,
          primaryContainer: Colors.green.withOpacity(0.3),
          secondary: Colors.blue,
          secondaryContainer: Colors.blue.withOpacity(0.3),
          surface: Colors.white.withOpacity(0.1),
          error: Colors.red,
          onPrimary: Colors.white,
          onSecondary: Colors.white,
          onSurface: Colors.white,
          onError: Colors.white,
          brightness: Brightness.dark,
        ),
      ),
      
      home: ComprehensiveAgricultureApp(),
      
      // Routes for navigation
      routes: {
        '/home': (context) => ComprehensiveAgricultureApp(),
      },
    );
  }
}
