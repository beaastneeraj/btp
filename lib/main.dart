import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'screens/modern_farm_dashboard.dart';
import 'models/indian_agriculture_models.dart';
import 'services/ai_farming_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize Firebase
  await Firebase.initializeApp();
  
  // Initialize Sentry for error tracking
  await SentryFlutter.init(
    (options) {
      options.dsn = 'YOUR_SENTRY_DSN'; // Replace with actual DSN
      options.tracesSampleRate = 1.0;
    },
    appRunner: () => runApp(
      ProviderScope(
        child: MyApp(),
      ),
    ),
  );
}

class MyApp extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DynamicColorBuilder(
      builder: (ColorScheme? lightDynamic, ColorScheme? darkDynamic) {
        ColorScheme lightScheme;
        ColorScheme darkScheme;

        if (lightDynamic != null && darkDynamic != null) {
          lightScheme = lightDynamic.harmonized();
          darkScheme = darkDynamic.harmonized();
        } else {
          // Fallback colors inspired by Indian agriculture
          lightScheme = ColorScheme.fromSeed(
            seedColor: const Color(0xFF4CAF50), // Agriculture green
            brightness: Brightness.light,
          );
          darkScheme = ColorScheme.fromSeed(
            seedColor: const Color(0xFF4CAF50),
            brightness: Brightness.dark,
          );
        }

        return MaterialApp(
          title: 'भारतीय किसान ऐप - Indian Farmer App',
          debugShowCheckedModeBanner: false,
          
          // Light Theme
          theme: ThemeData(
            useMaterial3: true,
            colorScheme: lightScheme,
            textTheme: GoogleFonts.hindTextTheme(),
            appBarTheme: AppBarTheme(
              centerTitle: false,
              elevation: 0,
              scrolledUnderElevation: 4,
            ),
            cardTheme: CardTheme(
              elevation: 2,
              margin: EdgeInsets.symmetric(vertical: 4, horizontal: 0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            filledButtonTheme: FilledButtonThemeData(
              style: FilledButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            floatingActionButtonTheme: FloatingActionButtonThemeData(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            navigationBarTheme: NavigationBarThemeData(
              labelTextStyle: WidgetStateProperty.resolveWith((states) {
                return GoogleFonts.hind(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                );
              }),
            ),
            inputDecorationTheme: InputDecorationTheme(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              filled: true,
            ),
          ),
          
          // Dark Theme
          darkTheme: ThemeData(
            useMaterial3: true,
            colorScheme: darkScheme,
            textTheme: GoogleFonts.hindTextTheme().apply(
              bodyColor: darkScheme.onSurface,
              displayColor: darkScheme.onSurface,
            ),
            appBarTheme: AppBarTheme(
              centerTitle: false,
              elevation: 0,
              scrolledUnderElevation: 4,
            ),
            cardTheme: CardTheme(
              elevation: 2,
              margin: EdgeInsets.symmetric(vertical: 4, horizontal: 0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            filledButtonTheme: FilledButtonThemeData(
              style: FilledButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            floatingActionButtonTheme: FloatingActionButtonThemeData(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            navigationBarTheme: NavigationBarThemeData(
              labelTextStyle: WidgetStateProperty.resolveWith((states) {
                return GoogleFonts.hind(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                );
              }),
            ),
            inputDecorationTheme: InputDecorationTheme(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              filled: true,
            ),
          ),
          
          themeMode: ThemeMode.system,
          home: SplashScreen(),
        );
      },
    );
  }
}

class SplashScreen extends ConsumerStatefulWidget {
  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _logoController;
  late AnimationController _textController;
  late Animation<double> _logoAnimation;
  late Animation<double> _textAnimation;

  @override
  void initState() {
    super.initState();
    
    _logoController = AnimationController(
      duration: Duration(milliseconds: 1500),
      vsync: this,
    );
    
    _textController = AnimationController(
      duration: Duration(milliseconds: 1000),
      vsync: this,
    );

    _logoAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _logoController,
      curve: Curves.elasticOut,
    ));

    _textAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _textController,
      curve: Curves.easeInOut,
    ));

    _startAnimation();
  }

  void _startAnimation() async {
    await Future.delayed(Duration(milliseconds: 500));
    _logoController.forward();
    
    await Future.delayed(Duration(milliseconds: 500));
    _textController.forward();
    
    await Future.delayed(Duration(milliseconds: 2000));
    _navigateToMain();
  }

  void _navigateToMain() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => ModernFarmDashboard(
          farm: _createSampleFarm(),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _logoController.dispose();
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              colorScheme.primary.withAlpha(100),
              colorScheme.secondary.withAlpha(50),
              colorScheme.tertiary.withAlpha(30),
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedBuilder(
                animation: _logoAnimation,
                builder: (context, child) {
                  return Transform.scale(
                    scale: _logoAnimation.value,
                    child: Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        color: colorScheme.primary,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: colorScheme.primary.withAlpha(100),
                            blurRadius: 20,
                            spreadRadius: 5,
                          ),
                        ],
                      ),
                      child: Icon(
                        Icons.agriculture,
                        size: 60,
                        color: colorScheme.onPrimary,
                      ),
                    ),
                  );
                },
              ),
              
              SizedBox(height: 32),
              
              AnimatedBuilder(
                animation: _textAnimation,
                builder: (context, child) {
                  return Opacity(
                    opacity: _textAnimation.value,
                    child: Column(
                      children: [
                        Text(
                          'भारतीय किसान ऐप',
                          style: GoogleFonts.hind(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: colorScheme.onSurface,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Indian Farmer App',
                          style: GoogleFonts.roboto(
                            fontSize: 18,
                            color: colorScheme.onSurfaceVariant,
                          ),
                        ),
                        SizedBox(height: 16),
                        Text(
                          'आधुनिक तकनीक के साथ खेती',
                          style: GoogleFonts.hind(
                            fontSize: 14,
                            color: colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
              
              SizedBox(height: 64),
              
              AnimatedBuilder(
                animation: _textAnimation,
                builder: (context, child) {
                  return Opacity(
                    opacity: _textAnimation.value,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        colorScheme.primary,
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  FarmProfile _createSampleFarm() {
    return FarmProfile(
      id: 'farm_001',
      ownerName: 'राम सिंह',
      farmName: 'श्री राम फार्म',
      location: 'सीकर, राजस्थान',
      state: IndianState.rajasthan,
      totalLandArea: 5.5,
      soilType: SoilType.alluvial,
      irrigationSource: IrrigationSource.tubewell,
      farmType: FarmType.cropFarming,
      establishedDate: DateTime(2015, 4, 15),
      contactNumber: '+91-9876543210',
      email: 'ramsingh@farmer.in',
      aadhaarNumber: '1234-5678-9012',
      
      cropFields: [
        CropField(
          id: 'field_001',
          cropName: 'Wheat',
          variety: 'HD 3086',
          areaInHectares: 2.5,
          sowingDate: DateTime(2024, 11, 15),
          expectedYield: 45.0,
          season: CropSeason.rabi,
          soilType: SoilType.alluvial,
          irrigationMethod: IrrigationMethod.sprinkler,
          expenses: [],
          activities: [],
        ),
        CropField(
          id: 'field_002',
          cropName: 'Mustard',
          variety: 'Varuna',
          areaInHectares: 1.5,
          sowingDate: DateTime(2024, 10, 20),
          expectedYield: 18.0,
          season: CropSeason.rabi,
          soilType: SoilType.alluvial,
          irrigationMethod: IrrigationMethod.drip,
          expenses: [],
          activities: [],
        ),
      ],
      
      instruments: [
        FarmInstrumentDetail(
          id: 'tractor_001',
          type: FarmInstrument.tractor,
          name: 'Mahindra 575 DI',
          hindiName: 'महिंद्रा 575 डीआई',
          description: '47 HP Tractor for all farming operations',
          brand: 'Mahindra',
          model: '575 DI',
          purchasePrice: 850000.0,
          purchaseDate: DateTime(2022, 3, 15),
          condition: 'Good',
          powerSource: 'Diesel',
          size: 'Medium',
          suitableCrops: ['Wheat', 'Mustard', 'Barley'],
          features: ['4WD', 'Power Steering', 'Hydraulic Lift'],
          maintenance: MaintenanceInfo(
            frequency: 'Every 250 hours',
            checklist: ['Engine Oil', 'Filters', 'Belts'],
            estimatedCost: 8000.0,
            lastMaintenance: DateTime(2024, 6, 1),
            nextMaintenance: DateTime(2024, 12, 1),
            commonIssues: ['Engine overheating', 'Hydraulic problems'],
            spareParts: ['Oil filter', 'Air filter', 'Belts'],
          ),
          maintenanceHistory: [],
          usageHistory: [],
        ),
      ],
      
      livestock: [
        LivestockRecord(
          id: 'cow_001',
          type: LivestockType.cow,
          breed: 'Gir',
          age: 36,
          weight: 450.0,
          healthStatus: 'Healthy',
          milkProductionPerDay: 12.0,
          feedType: 'Mixed feed + Grass',
          monthlyFeedCost: 3500.0,
          vaccinationDate: DateTime(2024, 6, 15),
          nextVaccinationDate: DateTime(2024, 12, 15),
          vetContact: 'Dr. Sharma - 9876543210',
          acquisitionDate: DateTime(2022, 1, 10),
          acquisitionCost: 45000.0,
        ),
      ],
      
      expenses: [
        FarmExpense(
          id: 'exp_001',
          amount: 15000.0,
          category: ExpenseCategory.fertilizers,
          description: 'DAP और यूरिया खरीदी',
          date: DateTime(2024, 11, 1),
          paymentMethod: PaymentMethod.digital,
          relatedCropFieldId: 'field_001',
        ),
        FarmExpense(
          id: 'exp_002',
          amount: 8000.0,
          category: ExpenseCategory.seeds,
          description: 'गेहूं के बीज',
          date: DateTime(2024, 10, 28),
          paymentMethod: PaymentMethod.cash,
          relatedCropFieldId: 'field_001',
        ),
      ],
      
      incomes: [
        FarmIncome(
          id: 'inc_001',
          amount: 125000.0,
          source: IncomeSource.cropSale,
          description: 'खरीफ मक्का की बिक्री',
          date: DateTime(2024, 10, 15),
          buyerName: 'राजस्थान अनाज मंडी',
          quantity: 50.0,
          rate: 2500.0,
          relatedCropFieldId: 'field_002',
        ),
      ],
      
      loans: [],
      subsidies: [],
      createdAt: DateTime(2024, 1, 1),
      lastUpdated: DateTime.now(),
    );
  }
}
