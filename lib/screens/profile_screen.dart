import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart';
import '../providers/theme_provider.dart';
import '../services/localization_service.dart';
import '../widgets/animated_widgets.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: const Interval(0.0, 0.6, curve: Curves.easeOut),
    ));

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.5),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: const Interval(0.2, 0.8, curve: Curves.elasticOut),
    ));

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final appSettings = ref.watch(appSettingsProvider);
    final colorScheme = Theme.of(context).colorScheme;
    final screenSize = MediaQuery.of(context).size;
    final isTablet = screenSize.width > 600;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: appSettings.isDarkMode
                ? [
                    const Color(0xFF1A1A2E),
                    const Color(0xFF16213E),
                    const Color(0xFF0F3460),
                  ]
                : [
                    const Color(0xFF4CAF50),
                    const Color(0xFF45A049),
                    const Color(0xFF388E3C),
                  ],
          ),
        ),
        child: SafeArea(
          child: FadeTransition(
            opacity: _fadeAnimation,
            child: SlideTransition(
              position: _slideAnimation,
              child: SingleChildScrollView(
                padding: EdgeInsets.all(isTablet ? 24.0 : 16.0),
                child: Column(
                  children: [
                    _buildProfileHeader(appSettings, isTablet),
                    const SizedBox(height: 24),
                    _buildStatsCards(appSettings, isTablet),
                    const SizedBox(height: 24),
                    _buildSettingsSection(appSettings, isTablet),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProfileHeader(AppSettings appSettings, bool isTablet) {
    return Container(
      padding: EdgeInsets.all(isTablet ? 32 : 24),
      decoration: BoxDecoration(
        color: appSettings.isDarkMode 
            ? Colors.grey[900]?.withOpacity(0.8) 
            : Colors.white.withOpacity(0.9),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        children: [
          // Profile Avatar
          Container(
            padding: EdgeInsets.all(isTablet ? 24 : 20),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: appSettings.isDarkMode
                    ? [Colors.blue.shade400, Colors.purple.shade400]
                    : [Colors.green.shade400, Colors.green.shade600],
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 16,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Icon(
              Icons.person,
              size: isTablet ? 64 : 48,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 16),
          
          // Name and Title
          Text(
            'John Doe',
            style: GoogleFonts.poppins(
              fontSize: isTablet ? 28 : 24,
              fontWeight: FontWeight.bold,
              color: appSettings.isDarkMode ? Colors.white : Colors.black87,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Smart Farmer',
            style: GoogleFonts.poppins(
              fontSize: isTablet ? 16 : 14,
              color: appSettings.isDarkMode ? Colors.white70 : Colors.black54,
            ),
          ),
          const SizedBox(height: 16),
          
          // Location
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: appSettings.isDarkMode 
                  ? Colors.grey[800] 
                  : Colors.grey[100],
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.location_on,
                  size: 16,
                  color: appSettings.isDarkMode ? Colors.blue : Colors.green,
                ),
                const SizedBox(width: 8),
                Text(
                  'Punjab, India',
                  style: GoogleFonts.poppins(
                    fontSize: isTablet ? 14 : 12,
                    fontWeight: FontWeight.w500,
                    color: appSettings.isDarkMode ? Colors.white70 : Colors.black87,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatsCards(AppSettings appSettings, bool isTablet) {
    final stats = [
      {'label': 'Total Crops', 'value': '12', 'icon': Icons.eco},
      {'label': 'Active Fields', 'value': '5', 'icon': Icons.landscape},
      {'label': 'This Month', 'value': '₹24K', 'icon': Icons.trending_up},
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: isTablet ? 3 : 3,
        childAspectRatio: isTablet ? 1.2 : 1.0,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: stats.length,
      itemBuilder: (context, index) {
        final stat = stats[index];
        return Container(
          padding: EdgeInsets.all(isTablet ? 20 : 16),
          decoration: BoxDecoration(
            color: appSettings.isDarkMode 
                ? Colors.grey[900]?.withOpacity(0.8) 
                : Colors.white.withOpacity(0.9),
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(isTablet ? 12 : 8),
                decoration: BoxDecoration(
                  color: appSettings.isDarkMode 
                      ? Colors.blue.withOpacity(0.2) 
                      : Colors.green.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  stat['icon'] as IconData,
                  color: appSettings.isDarkMode ? Colors.blue : Colors.green,
                  size: isTablet ? 28 : 24,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                stat['value'] as String,
                style: GoogleFonts.poppins(
                  fontSize: isTablet ? 20 : 16,
                  fontWeight: FontWeight.bold,
                  color: appSettings.isDarkMode ? Colors.white : Colors.black87,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                stat['label'] as String,
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontSize: isTablet ? 12 : 10,
                  color: appSettings.isDarkMode ? Colors.white70 : Colors.black54,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildSettingsSection(AppSettings appSettings, bool isTablet) {
    return Container(
      padding: EdgeInsets.all(isTablet ? 24 : 20),
      decoration: BoxDecoration(
        color: appSettings.isDarkMode 
            ? Colors.grey[900]?.withOpacity(0.8) 
            : Colors.white.withOpacity(0.9),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Settings Header
          Row(
            children: [
              TechIconWidget(
                icon: Icons.settings,
                color: appSettings.isDarkMode ? Colors.blue : Colors.green,
              ),
              const SizedBox(width: 12),
              Text(
                'Settings',
                style: GoogleFonts.poppins(
                  fontSize: isTablet ? 20 : 18,
                  fontWeight: FontWeight.bold,
                  color: appSettings.isDarkMode ? Colors.white : Colors.black87,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),

          // Dark Mode Toggle
          _buildSettingsTile(
            icon: Icons.dark_mode,
            title: 'Dark Mode',
            subtitle: 'Switch between light and dark themes',
            trailing: Switch(
              value: appSettings.isDarkMode,
              onChanged: (value) {
                ref.read(appSettingsProvider.notifier).toggleDarkMode();
                HapticFeedback.lightImpact();
              },
              activeColor: appSettings.isDarkMode ? Colors.blue : Colors.green,
            ),
            appSettings: appSettings,
          ),

          const SizedBox(height: 16),

          // Language Selection
          _buildSettingsTile(
            icon: Icons.language,
            title: 'Language',
            subtitle: 'Choose your preferred language',
            trailing: DropdownButton<String>(
              value: appSettings.locale.languageCode,
              underline: const SizedBox(),
              items: const [
                DropdownMenuItem(value: 'en', child: Text('English')),
                DropdownMenuItem(value: 'hi', child: Text('हिंदी')),
              ],
              onChanged: (String? value) {
                if (value != null) {
                  // Note: setLocale method needs to be implemented in AppSettingsNotifier
                  HapticFeedback.lightImpact();
                }
              },
            ),
            appSettings: appSettings,
          ),

          const SizedBox(height: 16),

          // Notifications
          _buildSettingsTile(
            icon: Icons.notifications,
            title: 'Notifications',
            subtitle: 'Manage your notification preferences',
            trailing: Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: appSettings.isDarkMode ? Colors.white54 : Colors.black54,
            ),
            onTap: () => _showNotificationSettings(),
            appSettings: appSettings,
          ),

          const SizedBox(height: 16),

          // Account Settings
          _buildSettingsTile(
            icon: Icons.account_circle,
            title: 'Account',
            subtitle: 'Manage your account settings',
            trailing: Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: appSettings.isDarkMode ? Colors.white54 : Colors.black54,
            ),
            onTap: () => _showAccountSettings(),
            appSettings: appSettings,
          ),

          const SizedBox(height: 16),

          // Data Sync
          _buildSettingsTile(
            icon: Icons.sync,
            title: 'Data Sync',
            subtitle: 'Sync your data across devices',
            trailing: Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: appSettings.isDarkMode ? Colors.white54 : Colors.black54,
            ),
            onTap: () => _syncData(),
            appSettings: appSettings,
          ),

          const SizedBox(height: 24),

          // Account Actions
          Column(
            children: [
              // Edit Profile
              _buildActionTile(
                icon: Icons.edit,
                title: 'Edit Profile',
                color: appSettings.isDarkMode ? Colors.blue : Colors.green,
                onTap: () => _editProfile(),
                appSettings: appSettings,
              ),
              
              const SizedBox(height: 12),
              
              // Privacy & Security
              _buildActionTile(
                icon: Icons.security,
                title: 'Privacy & Security',
                color: appSettings.isDarkMode ? Colors.orange : Colors.orange,
                onTap: () => _showPrivacySettings(),
                appSettings: appSettings,
              ),
              
              const SizedBox(height: 12),
              
              // Help & Support
              _buildActionTile(
                icon: Icons.help,
                title: 'Help & Support',
                color: appSettings.isDarkMode ? Colors.purple : Colors.purple,
                onTap: () => _showHelpSupport(),
                appSettings: appSettings,
              ),
              
              const SizedBox(height: 12),
              
              // About
              _buildActionTile(
                icon: Icons.info,
                title: 'About',
                color: appSettings.isDarkMode ? Colors.teal : Colors.teal,
                onTap: () => _showAbout(),
                appSettings: appSettings,
              ),
              
              const SizedBox(height: 20),
              
              // Sign Out
              _buildActionTile(
                icon: Icons.logout,
                title: 'Sign Out',
                color: Colors.red,
                onTap: () => _showSignOutDialog(),
                appSettings: appSettings,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSettingsTile({
    required IconData icon,
    required String title,
    required String subtitle,
    required Widget trailing,
    required AppSettings appSettings,
    VoidCallback? onTap,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: appSettings.isDarkMode 
                      ? Colors.blue.withOpacity(0.2) 
                      : Colors.green.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  icon,
                  color: appSettings.isDarkMode ? Colors.blue : Colors.green,
                  size: 20,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: appSettings.isDarkMode ? Colors.white : Colors.black87,
                      ),
                    ),
                    Text(
                      subtitle,
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        color: appSettings.isDarkMode ? Colors.white70 : Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),
              trailing,
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildActionTile({
    required IconData icon,
    required String title,
    required Color color,
    required VoidCallback onTap,
    required AppSettings appSettings,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: color.withOpacity(0.3),
            ),
          ),
          child: Row(
            children: [
              Icon(
                icon,
                color: color,
                size: 20,
              ),
              const SizedBox(width: 16),
              Text(
                title,
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: appSettings.isDarkMode ? Colors.white : Colors.black87,
                ),
              ),
              const Spacer(),
              Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: color,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showNotificationSettings() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Notification settings opened')),
    );
  }

  void _syncData() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Syncing data...')),
    );
  }

  void _editProfile() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Edit profile opened')),
    );
  }

  void _showPrivacySettings() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Privacy settings opened')),
    );
  }

  void _showHelpSupport() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Help & Support opened')),
    );
  }

  void _showAccountSettings() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Account settings opened')),
    );
  }

  void _showAbout() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('About Smart Farm'),
        content: const Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Version: 1.0.0'),
            SizedBox(height: 8),
            Text('A comprehensive farming management app'),
            SizedBox(height: 8),
            Text('© 2025 Smart Farm Technologies'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  void _showSignOutDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Sign Out'),
        content: const Text('Are you sure you want to sign out?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Signed out successfully')),
              );
            },
            child: const Text('Sign Out'),
          ),
        ],
      ),
    );
  }
}
