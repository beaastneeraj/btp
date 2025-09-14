import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../providers/theme_provider.dart';
import '../services/localization_service.dart';
import 'main_navigation_screen.dart';
import 'khatabook_screen.dart';

class SimpleDashboard extends ConsumerWidget {
  const SimpleDashboard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appSettings = ref.watch(appSettingsProvider);
    final languageCode = appSettings.locale.languageCode;
    final colorScheme = Theme.of(context).colorScheme;
    
    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        backgroundColor: colorScheme.surface,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        title: Text(
          'dashboard'.tr(languageCode),
          style: GoogleFonts.roboto(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: colorScheme.onSurface,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications_outlined, color: colorScheme.onSurface),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.settings_outlined, color: colorScheme.onSurface),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SettingsScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Welcome Card
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    colorScheme.primary,
                    colorScheme.primary.withOpacity(0.8),
                  ],
                ),
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: colorScheme.primary.withOpacity(0.3),
                    blurRadius: 20,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Icon(
                          Icons.agriculture,
                          color: Colors.white,
                          size: 32,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Welcome to',
                              style: GoogleFonts.roboto(
                                color: Colors.white.withOpacity(0.9),
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              'appTitle'.tr(languageCode),
                              style: GoogleFonts.roboto(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'appSubtitle'.tr(languageCode),
                    style: GoogleFonts.roboto(
                      color: Colors.white.withOpacity(0.9),
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 24),
            
            // Quick Stats
            Text(
              'Quick Overview',
              style: GoogleFonts.roboto(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: colorScheme.onSurface,
              ),
            ),
            const SizedBox(height: 16),
            
            Row(
              children: [
                Expanded(
                  child: _buildStatCard(
                    context,
                    'totalIncome'.tr(languageCode),
                    '${appSettings.currency}45,230',
                    Icons.trending_up,
                    colorScheme.primary,
                    '+12.5%',
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildStatCard(
                    context,
                    'totalExpenses'.tr(languageCode),
                    '${appSettings.currency}32,180',
                    Icons.trending_down,
                    colorScheme.error,
                    '-5.2%',
                  ),
                ),
              ],
            ),
            
            const SizedBox(height: 12),
            
            Row(
              children: [
                Expanded(
                  child: _buildStatCard(
                    context,
                    'netProfit'.tr(languageCode),
                    '${appSettings.currency}13,050',
                    Icons.account_balance_wallet,
                    colorScheme.tertiary,
                    '+8.7%',
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildStatCard(
                    context,
                    'Active Crops',
                    '7 crops',
                    Icons.eco,
                    colorScheme.secondary,
                    '+2',
                  ),
                ),
              ],
            ),
            
            const SizedBox(height: 24),
            
            // Quick Actions
            Text(
              'Quick Actions',
              style: GoogleFonts.roboto(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: colorScheme.onSurface,
              ),
            ),
            const SizedBox(height: 16),
            
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 1.5,
              children: [
                _buildActionCard(
                  context,
                  'khatabook'.tr(languageCode),
                  'Manage your farm finances',
                  Icons.book,
                  colorScheme.primary,
                  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const KhatabookScreen(),
                      ),
                    );
                  },
                ),
                _buildActionCard(
                  context,
                  'weather'.tr(languageCode),
                  'Check weather forecast',
                  Icons.cloud,
                  colorScheme.secondary,
                  () {},
                ),
                _buildActionCard(
                  context,
                  'market'.tr(languageCode),
                  'View market prices',
                  Icons.trending_up,
                  colorScheme.tertiary,
                  () {},
                ),
                _buildActionCard(
                  context,
                  'Crop Planning',
                  'Plan your next season',
                  Icons.calendar_month,
                  colorScheme.error,
                  () {},
                ),
              ],
            ),
            
            const SizedBox(height: 24),
            
            // Recent Activity
            Card(
              elevation: 0,
              color: colorScheme.surfaceContainerHigh,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Recent Activity',
                      style: GoogleFonts.roboto(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: colorScheme.onSurface,
                      ),
                    ),
                    const SizedBox(height: 16),
                    _buildActivityItem(
                      context,
                      'Fertilizer Purchase',
                      '${appSettings.currency}2,500',
                      '2 hours ago',
                      Icons.scatter_plot,
                      colorScheme.error,
                    ),
                    const Divider(),
                    _buildActivityItem(
                      context,
                      'Wheat Sale',
                      '+${appSettings.currency}8,750',
                      '1 day ago',
                      Icons.agriculture,
                      colorScheme.primary,
                    ),
                    const Divider(),
                    _buildActivityItem(
                      context,
                      'Irrigation Setup',
                      '${appSettings.currency}1,200',
                      '3 days ago',
                      Icons.water_drop,
                      colorScheme.secondary,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(
    BuildContext context,
    String title,
    String value,
    IconData icon,
    Color color,
    String change,
  ) {
    final colorScheme = Theme.of(context).colorScheme;
    
    return Card(
      elevation: 0,
      color: colorScheme.surfaceContainerHigh,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(icon, color: color, size: 20),
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: change.startsWith('+') 
                        ? colorScheme.primary.withOpacity(0.1)
                        : colorScheme.error.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    change,
                    style: GoogleFonts.roboto(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: change.startsWith('+') 
                          ? colorScheme.primary
                          : colorScheme.error,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              value,
              style: GoogleFonts.roboto(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: colorScheme.onSurface,
              ),
            ),
            Text(
              title,
              style: GoogleFonts.roboto(
                fontSize: 12,
                color: colorScheme.onSurface.withOpacity(0.7),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionCard(
    BuildContext context,
    String title,
    String subtitle,
    IconData icon,
    Color color,
    VoidCallback onTap,
  ) {
    final colorScheme = Theme.of(context).colorScheme;
    
    return Card(
      elevation: 0,
      color: colorScheme.surfaceContainerHigh,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: color, size: 24),
              ),
              const SizedBox(height: 12),
              Text(
                title,
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: colorScheme.onSurface,
                ),
              ),
              Text(
                subtitle,
                style: GoogleFonts.roboto(
                  fontSize: 12,
                  color: colorScheme.onSurface.withOpacity(0.7),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildActivityItem(
    BuildContext context,
    String title,
    String amount,
    String time,
    IconData icon,
    Color color,
  ) {
    final colorScheme = Theme.of(context).colorScheme;
    
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: color, size: 20),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.roboto(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: colorScheme.onSurface,
                  ),
                ),
                Text(
                  time,
                  style: GoogleFonts.roboto(
                    fontSize: 12,
                    color: colorScheme.onSurface.withOpacity(0.6),
                  ),
                ),
              ],
            ),
          ),
          Text(
            amount,
            style: GoogleFonts.roboto(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: amount.startsWith('+') ? colorScheme.primary : colorScheme.error,
            ),
          ),
        ],
      ),
    );
  }
}
