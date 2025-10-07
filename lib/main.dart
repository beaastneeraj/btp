import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'screens/main_navigation_screen.dart';
import 'screens/inventory_screen.dart';
import 'screens/fields_screen.dart';
import 'screens/crop_planning_screen.dart';
import 'screens/enhanced_crop_planning_screen.dart';
import 'screens/weather_screen.dart';
import 'screens/khatabook_analytics_screen.dart';
import 'screens/reports_screen.dart';
import 'screens/enhanced_crop_recommendation_screen.dart';
import 'screens/market_price_screen.dart';
import 'providers/theme_provider.dart';
import 'themes/material3_theme.dart';

void main() {
  runApp(const ProviderScope(child: IndianFarmingApp()));
}

class IndianFarmingApp extends ConsumerWidget {
  const IndianFarmingApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appSettings = ref.watch(appSettingsProvider);
    final themeMode = appSettings.isDarkMode ? ThemeMode.dark : ThemeMode.light;
    final locale = appSettings.locale;

    return DynamicColorBuilder(
      builder: (ColorScheme? lightDynamic, ColorScheme? darkDynamic) {
        return MaterialApp(
          title: 'Smart Farming',
          debugShowCheckedModeBanner: false,
          themeMode: themeMode,
          theme: lightDynamic != null 
              ? Material3Theme.lightTheme.copyWith(colorScheme: lightDynamic)
              : Material3Theme.lightTheme,
          darkTheme: darkDynamic != null 
              ? Material3Theme.darkTheme.copyWith(colorScheme: darkDynamic)
              : Material3Theme.darkTheme,
          locale: locale,
          supportedLocales: const [
            Locale('en', 'US'),
            Locale('hi', 'IN'),
          ],
          initialRoute: '/main',
          routes: {
            '/main': (context) => const MainNavigationScreen(),
            '/inventory': (context) => const InventoryScreen(),
            '/fields': (context) => const FieldsScreen(),
            '/crop-planning': (context) => const CropPlanningScreen(),
            '/enhanced-crop-planning': (context) => const EnhancedCropPlanningScreen(),
            '/weather': (context) => const WeatherScreen(),
            '/analytics': (context) => KhatabookAnalyticsScreen(),
            '/reports': (context) => const ReportsScreen(),
            '/crop-recommendation': (context) => const EnhancedCropRecommendationScreen(),
            '/market-prices': (context) => const MarketPriceScreen(),
          },
        );
      },
    );
  }
}
