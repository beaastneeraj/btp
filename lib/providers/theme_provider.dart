import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Theme mode provider
final themeModeProvider = StateNotifierProvider<ThemeModeNotifier, ThemeMode>((ref) {
  return ThemeModeNotifier();
});

class ThemeModeNotifier extends StateNotifier<ThemeMode> {
  ThemeModeNotifier() : super(ThemeMode.system) {
    _loadThemeMode();
  }

  static const String _key = 'theme_mode';

  Future<void> _loadThemeMode() async {
    final prefs = await SharedPreferences.getInstance();
    final themeModeIndex = prefs.getInt(_key) ?? 0;
    state = ThemeMode.values[themeModeIndex];
  }

  Future<void> setThemeMode(ThemeMode themeMode) async {
    state = themeMode;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_key, themeMode.index);
  }

  void toggleTheme() {
    if (state == ThemeMode.light) {
      setThemeMode(ThemeMode.dark);
    } else {
      setThemeMode(ThemeMode.light);
    }
  }
}

// Language provider
final languageProvider = StateNotifierProvider<LanguageNotifier, Locale>((ref) {
  return LanguageNotifier();
});

class LanguageNotifier extends StateNotifier<Locale> {
  LanguageNotifier() : super(const Locale('en', 'US')) {
    _loadLanguage();
  }

  static const String _key = 'language';

  Future<void> _loadLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    final languageCode = prefs.getString(_key) ?? 'en';
    state = Locale(languageCode);
  }

  Future<void> setLanguage(Locale locale) async {
    state = locale;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_key, locale.languageCode);
  }
}

// App settings provider
final appSettingsProvider = StateNotifierProvider<AppSettingsNotifier, AppSettings>((ref) {
  return AppSettingsNotifier();
});

class AppSettings {
  final bool isDarkMode;
  final Locale locale;
  final bool showTips;
  final bool enableNotifications;
  final String currency;

  AppSettings({
    this.isDarkMode = false,
    this.locale = const Locale('en', 'US'),
    this.showTips = true,
    this.enableNotifications = true,
    this.currency = '₹',
  });

  AppSettings copyWith({
    bool? isDarkMode,
    Locale? locale,
    bool? showTips,
    bool? enableNotifications,
    String? currency,
  }) {
    return AppSettings(
      isDarkMode: isDarkMode ?? this.isDarkMode,
      locale: locale ?? this.locale,
      showTips: showTips ?? this.showTips,
      enableNotifications: enableNotifications ?? this.enableNotifications,
      currency: currency ?? this.currency,
    );
  }
}

class AppSettingsNotifier extends StateNotifier<AppSettings> {
  AppSettingsNotifier() : super(AppSettings()) {
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    final prefs = await SharedPreferences.getInstance();
    
    state = AppSettings(
      isDarkMode: prefs.getBool('isDarkMode') ?? false,
      locale: Locale(prefs.getString('language') ?? 'en'),
      showTips: prefs.getBool('showTips') ?? true,
      enableNotifications: prefs.getBool('enableNotifications') ?? true,
      currency: prefs.getString('currency') ?? '₹',
    );
  }

  Future<void> updateSettings(AppSettings settings) async {
    state = settings;
    final prefs = await SharedPreferences.getInstance();
    
    await prefs.setBool('isDarkMode', settings.isDarkMode);
    await prefs.setString('language', settings.locale.languageCode);
    await prefs.setBool('showTips', settings.showTips);
    await prefs.setBool('enableNotifications', settings.enableNotifications);
    await prefs.setString('currency', settings.currency);
  }

  Future<void> toggleDarkMode() async {
    final newSettings = state.copyWith(isDarkMode: !state.isDarkMode);
    await updateSettings(newSettings);
  }

  Future<void> setLanguage(Locale locale) async {
    final newSettings = state.copyWith(locale: locale);
    await updateSettings(newSettings);
  }

  Future<void> setCurrency(String currency) async {
    final newSettings = state.copyWith(currency: currency);
    await updateSettings(newSettings);
  }
}
