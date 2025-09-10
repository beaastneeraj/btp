import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'enhanced_dashboard_screen.dart';
import 'khatabook_analytics_screen.dart';
import 'weather_screen.dart';
import 'market_prices_screen.dart';
import 'crop_planning_screen.dart';
import 'fields_screen.dart';
import 'tasks_screen.dart';
import 'inventory_screen.dart';
import 'reports_screen.dart';
import 'profile_screen.dart';
import '../providers/theme_provider.dart';
import '../services/localization_service.dart';

class MainNavigationScreen extends ConsumerStatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  ConsumerState<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends ConsumerState<MainNavigationScreen> {
  int _currentIndex = 0;
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final appSettings = ref.watch(appSettingsProvider);
    final languageCode = appSettings.locale.languageCode;
    final colorScheme = Theme.of(context).colorScheme;

    final List<Widget> screens = [
      const EnhancedDashboardScreen(),
      const InventoryScreen(),
      const CropPlanningScreen(),
      const KhatabookAnalyticsScreen(),
      const ProfileScreen(),
    ];

    final List<NavigationDestination> destinations = [
      NavigationDestination(
        icon: const Icon(Icons.dashboard_outlined),
        selectedIcon: const Icon(Icons.dashboard),
        label: 'dashboard'.tr(languageCode),
      ),
      NavigationDestination(
        icon: const Icon(Icons.inventory_2_outlined),
        selectedIcon: const Icon(Icons.inventory_2),
        label: 'inventory'.tr(languageCode),
      ),
      NavigationDestination(
        icon: const Icon(Icons.eco_outlined),
        selectedIcon: const Icon(Icons.eco),
        label: 'planning'.tr(languageCode),
      ),
      NavigationDestination(
        icon: const Icon(Icons.analytics_outlined),
        selectedIcon: const Icon(Icons.analytics),
        label: 'analytics'.tr(languageCode),
      ),
      NavigationDestination(
        icon: const Icon(Icons.person_outlined),
        selectedIcon: const Icon(Icons.person),
        label: 'profile'.tr(languageCode),
      ),
    ];

    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        children: screens,
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: colorScheme.surface,
          border: Border(
            top: BorderSide(
              color: colorScheme.outline.withOpacity(0.2),
              width: 0.5,
            ),
          ),
        ),
        child: SafeArea(
          child: NavigationBar(
            selectedIndex: _currentIndex,
            onDestinationSelected: _onTabTapped,
            backgroundColor: colorScheme.surface,
            indicatorColor: colorScheme.primaryContainer,
            surfaceTintColor: Colors.transparent,
            elevation: 0,
            height: 80,
            labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
            destinations: destinations,
          ),
        ),
      ),
      floatingActionButton: _currentIndex == 1 // Show FAB only on Khatabook screen
          ? FloatingActionButton.extended(
              onPressed: () {
                // Navigate to add transaction screen
                Navigator.pushNamed(context, '/add_transaction');
              },
              backgroundColor: colorScheme.primary,
              foregroundColor: colorScheme.onPrimary,
              icon: const Icon(Icons.add),
              label: Text(
                'addTransaction'.tr(languageCode),
                style: GoogleFonts.roboto(
                  fontWeight: FontWeight.w500,
                ),
              ),
            )
          : null,
    );
  }
}

// Settings Screen for theme and language management
class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appSettings = ref.watch(appSettingsProvider);
    final languageCode = appSettings.locale.languageCode;
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text('settings'.tr(languageCode)),
        backgroundColor: colorScheme.surface,
        surfaceTintColor: Colors.transparent,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Appearance Section
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'appearance'.tr(languageCode),
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  const SizedBox(height: 16),
                  SwitchListTile(
                    title: Text('darkMode'.tr(languageCode)),
                    subtitle: Text(
                      appSettings.isDarkMode 
                          ? 'darkMode'.tr(languageCode)
                          : 'lightMode'.tr(languageCode),
                    ),
                    value: appSettings.isDarkMode,
                    onChanged: (value) {
                      ref.read(appSettingsProvider.notifier).toggleDarkMode();
                    },
                    secondary: Icon(
                      appSettings.isDarkMode 
                          ? Icons.dark_mode 
                          : Icons.light_mode,
                    ),
                  ),
                ],
              ),
            ),
          ),
          
          const SizedBox(height: 16),
          
          // Language Section
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'language'.tr(languageCode),
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  const SizedBox(height: 16),
                  ...LocalizationService.getLanguageNames().entries.map(
                    (entry) => RadioListTile<String>(
                      title: Text(entry.value),
                      value: entry.key,
                      groupValue: languageCode,
                      onChanged: (value) {
                        if (value != null) {
                          ref.read(appSettingsProvider.notifier)
                              .setLanguage(Locale(value));
                        }
                      },
                    ),
                  ).toList(),
                ],
              ),
            ),
          ),
          
          const SizedBox(height: 16),
          
          // Currency Section
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'currency'.tr(languageCode),
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  const SizedBox(height: 16),
                  DropdownButtonFormField<String>(
                    value: appSettings.currency,
                    decoration: InputDecoration(
                      labelText: 'currency'.tr(languageCode),
                      border: const OutlineInputBorder(),
                    ),
                    items: const [
                      DropdownMenuItem(value: '₹', child: Text('₹ Indian Rupee')),
                      DropdownMenuItem(value: '\$', child: Text('\$ US Dollar')),
                      DropdownMenuItem(value: '€', child: Text('€ Euro')),
                      DropdownMenuItem(value: '£', child: Text('£ British Pound')),
                    ],
                    onChanged: (value) {
                      if (value != null) {
                        ref.read(appSettingsProvider.notifier).setCurrency(value);
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
          
          const SizedBox(height: 16),
          
          // Notifications Section
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'notifications'.tr(languageCode),
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  const SizedBox(height: 16),
                  SwitchListTile(
                    title: Text('notifications'.tr(languageCode)),
                    subtitle: Text('Enable push notifications'),
                    value: appSettings.enableNotifications,
                    onChanged: (value) {
                      final newSettings = appSettings.copyWith(
                        enableNotifications: value,
                      );
                      ref.read(appSettingsProvider.notifier)
                          .updateSettings(newSettings);
                    },
                    secondary: const Icon(Icons.notifications),
                  ),
                  SwitchListTile(
                    title: Text('showTips'.tr(languageCode)),
                    subtitle: Text('Show farming tips and advice'),
                    value: appSettings.showTips,
                    onChanged: (value) {
                      final newSettings = appSettings.copyWith(showTips: value);
                      ref.read(appSettingsProvider.notifier)
                          .updateSettings(newSettings);
                    },
                    secondary: const Icon(Icons.lightbulb),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
