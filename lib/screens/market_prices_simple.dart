import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../providers/theme_provider.dart';
import '../services/localization_service.dart';

class MarketPricesScreen extends ConsumerWidget {
  const MarketPricesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appSettings = ref.watch(appSettingsProvider);
    final languageCode = appSettings.locale.languageCode;
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text('market'.tr(languageCode)),
        backgroundColor: colorScheme.surface,
        surfaceTintColor: Colors.transparent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.trending_up,
              size: 80,
              color: colorScheme.primary,
            ),
            const SizedBox(height: 16),
            Text(
              'comingSoon'.tr(languageCode),
              style: GoogleFonts.roboto(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: colorScheme.onSurface,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'featureInDevelopment'.tr(languageCode),
              style: GoogleFonts.roboto(
                fontSize: 16,
                color: colorScheme.onSurface.withOpacity(0.7),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
