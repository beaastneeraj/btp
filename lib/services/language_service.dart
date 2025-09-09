import 'package:flutter/material.dart';

class LanguageService {
  static final supportedLocales = [
    const Locale('en'),
    const Locale('hi'),
    const Locale('mr'),
    const Locale('pa'),
  ];

  static String getLanguageName(String code) {
    switch (code) {
      case 'en': return 'English';
      case 'hi': return 'Hindi';
      case 'mr': return 'Marathi';
      case 'pa': return 'Punjabi';
      default: return 'Unknown';
    }
  }
}
