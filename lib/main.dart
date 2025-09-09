import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screens/authentication_screen.dart';

void main() {
  runApp(const ProviderScope(child: IndianFarmingApp()));
}

class IndianFarmingApp extends StatelessWidget {
  const IndianFarmingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(
      builder: (ColorScheme? lightDynamic, ColorScheme? darkDynamic) {
        // Modern Material You color schemes
        ColorScheme lightScheme = lightDynamic ?? ColorScheme.fromSeed(
          seedColor: const Color(0xFF4CAF50),
          brightness: Brightness.light,
        );

        ColorScheme darkScheme = darkDynamic ?? ColorScheme.fromSeed(
          seedColor: const Color(0xFF4CAF50),
          brightness: Brightness.dark,
        );

        return MaterialApp(
          title: 'भारतीय कृषि - Indian Farming',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            useMaterial3: true,
            colorScheme: lightScheme,
            textTheme: GoogleFonts.robotoTextTheme().copyWith(
              // Modern typography scale
              displayLarge: GoogleFonts.roboto(
                fontSize: 57,
                fontWeight: FontWeight.w400,
                letterSpacing: -0.25,
              ),
              displayMedium: GoogleFonts.roboto(
                fontSize: 45,
                fontWeight: FontWeight.w400,
              ),
              displaySmall: GoogleFonts.roboto(
                fontSize: 36,
                fontWeight: FontWeight.w400,
              ),
              headlineLarge: GoogleFonts.roboto(
                fontSize: 32,
                fontWeight: FontWeight.w400,
              ),
              headlineMedium: GoogleFonts.roboto(
                fontSize: 28,
                fontWeight: FontWeight.w400,
              ),
              headlineSmall: GoogleFonts.roboto(
                fontSize: 24,
                fontWeight: FontWeight.w400,
              ),
              titleLarge: GoogleFonts.roboto(
                fontSize: 22,
                fontWeight: FontWeight.w500,
              ),
              titleMedium: GoogleFonts.roboto(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                letterSpacing: 0.15,
              ),
              titleSmall: GoogleFonts.roboto(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                letterSpacing: 0.1,
              ),
              bodyLarge: GoogleFonts.roboto(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                letterSpacing: 0.5,
              ),
              bodyMedium: GoogleFonts.roboto(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                letterSpacing: 0.25,
              ),
              bodySmall: GoogleFonts.roboto(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                letterSpacing: 0.4,
              ),
              labelLarge: GoogleFonts.roboto(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                letterSpacing: 0.1,
              ),
              labelMedium: GoogleFonts.roboto(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                letterSpacing: 0.5,
              ),
              labelSmall: GoogleFonts.roboto(
                fontSize: 11,
                fontWeight: FontWeight.w500,
                letterSpacing: 0.5,
              ),
            ),
            cardTheme: CardThemeData(
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
              color: lightScheme.surfaceContainerHigh,
            ),
            appBarTheme: AppBarTheme(
              elevation: 0,
              centerTitle: false,
              scrolledUnderElevation: 0,
              titleTextStyle: GoogleFonts.roboto(
                fontSize: 22,
                fontWeight: FontWeight.w400,
                color: lightScheme.onSurface,
              ),
            ),
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                elevation: 0,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                textStyle: GoogleFonts.roboto(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.1,
                ),
              ),
            ),
            filledButtonTheme: FilledButtonThemeData(
              style: FilledButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                textStyle: GoogleFonts.roboto(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.1,
                ),
              ),
            ),
            outlinedButtonTheme: OutlinedButtonThemeData(
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                side: BorderSide(color: lightScheme.outline),
                textStyle: GoogleFonts.roboto(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.1,
                ),
              ),
            ),
            inputDecorationTheme: InputDecorationTheme(
              filled: true,
              fillColor: lightScheme.surfaceContainerHighest,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide.none,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(color: lightScheme.primary, width: 2),
              ),
              labelStyle: GoogleFonts.roboto(
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
            chipTheme: ChipThemeData(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              backgroundColor: lightScheme.surfaceContainerHigh,
              selectedColor: lightScheme.primary,
              labelStyle: GoogleFonts.roboto(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
              side: BorderSide.none,
            ),
          ),
          darkTheme: ThemeData(
            useMaterial3: true,
            colorScheme: darkScheme,
            textTheme: GoogleFonts.robotoTextTheme(ThemeData.dark().textTheme),
            cardTheme: CardThemeData(
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
              color: darkScheme.surfaceContainerHigh,
            ),
            appBarTheme: AppBarTheme(
              elevation: 0,
              centerTitle: false,
              scrolledUnderElevation: 0,
              titleTextStyle: GoogleFonts.roboto(
                fontSize: 22,
                fontWeight: FontWeight.w400,
                color: darkScheme.onSurface,
              ),
            ),
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                elevation: 0,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                textStyle: GoogleFonts.roboto(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.1,
                ),
              ),
            ),
            inputDecorationTheme: InputDecorationTheme(
              filled: true,
              fillColor: darkScheme.surfaceContainerHighest,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide.none,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(color: darkScheme.primary, width: 2),
              ),
              labelStyle: GoogleFonts.roboto(
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          home: const SplashScreen(),
        );
      },
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Navigate to authentication screen after a brief delay
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => AuthenticationScreen(),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    
    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              colorScheme.primary,
              colorScheme.primaryContainer,
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Modern App Icon with animation
              Container(
                padding: const EdgeInsets.all(32),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(32),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: Icon(
                  Icons.agriculture,
                  size: 80,
                  color: colorScheme.primary,
                ),
              ),
              const SizedBox(height: 48),
              
              // App Title with modern typography
              Text(
                'भारतीय कृषि',
                style: GoogleFonts.roboto(
                  fontSize: 36,
                  fontWeight: FontWeight.w300,
                  color: Colors.white,
                  letterSpacing: -0.5,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Indian Farming App',
                style: GoogleFonts.roboto(
                  fontSize: 18,
                  color: Colors.white.withOpacity(0.8),
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.5,
                ),
              ),
              const SizedBox(height: 64),
              
              // Modern Loading Indicator
              SizedBox(
                width: 48,
                height: 48,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  strokeWidth: 3,
                ),
              ),
              const SizedBox(height: 24),
              Text(
                'किसानों के लिए आधुनिक समाधान',
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  color: Colors.white.withOpacity(0.7),
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.25,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
