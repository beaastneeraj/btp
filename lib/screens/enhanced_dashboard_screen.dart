import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart';
import '../widgets/animated_widgets.dart';
import 'dart:math' as math;

// Enhanced Dashboard with Animations and Mobile Optimization
class EnhancedDashboardScreen extends ConsumerStatefulWidget {
  const EnhancedDashboardScreen({super.key});

  @override
  ConsumerState<EnhancedDashboardScreen> createState() => _EnhancedDashboardScreenState();
}

class _EnhancedDashboardScreenState extends ConsumerState<EnhancedDashboardScreen>
    with TickerProviderStateMixin {
  late AnimationController _headerAnimationController;
  late AnimationController _cardAnimationController;
  late AnimationController _floatingAnimationController;
  
  late Animation<double> _headerSlideAnimation;
  late Animation<double> _headerFadeAnimation;
  late Animation<double> _cardStaggerAnimation;
  late Animation<double> _floatingAnimation;

  int _selectedIndex = 0;
  
  @override
  void initState() {
    super.initState();
    _setupAnimations();
    _startAnimations();
  }

  void _setupAnimations() {
    _headerAnimationController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );
    
    _cardAnimationController = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );
    
    _floatingAnimationController = AnimationController(
      duration: const Duration(milliseconds: 3000),
      vsync: this,
    );

    _headerSlideAnimation = Tween<double>(
      begin: -100,
      end: 0,
    ).animate(CurvedAnimation(
      parent: _headerAnimationController,
      curve: Curves.elasticOut,
    ));

    _headerFadeAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(
      parent: _headerAnimationController,
      curve: Curves.easeInOut,
    ));

    _cardStaggerAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(
      parent: _cardAnimationController,
      curve: Curves.easeOutBack,
    ));

    _floatingAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(
      parent: _floatingAnimationController,
      curve: Curves.easeInOut,
    ));
  }

  void _startAnimations() {
    _headerAnimationController.forward();
    Future.delayed(const Duration(milliseconds: 300), () {
      _cardAnimationController.forward();
    });
    _floatingAnimationController.repeat(reverse: true);
  }

  @override
  void dispose() {
    _headerAnimationController.dispose();
    _cardAnimationController.dispose();
    _floatingAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final screenSize = MediaQuery.of(context).size;
    final isTablet = screenSize.width > 600;
    
    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            // Animated Header
            SliverAppBar(
              expandedHeight: isTablet ? 200 : 160,
              floating: false,
              pinned: true,
              backgroundColor: Colors.transparent,
              flexibleSpace: FlexibleSpaceBar(
                background: AnimatedBuilder(
                  animation: _headerAnimationController,
                  builder: (context, child) {
                    return Transform.translate(
                      offset: Offset(0, _headerSlideAnimation.value),
                      child: Opacity(
                        opacity: _headerFadeAnimation.value,
                        child: _buildAnimatedHeader(colorScheme, isTablet),
                      ),
                    );
                  },
                ),
              ),
            ),

            // Quick Stats Cards
            SliverToBoxAdapter(
              child: AnimatedBuilder(
                animation: _cardAnimationController,
                builder: (context, child) {
                  return Transform.scale(
                    scale: 0.8 + (0.2 * _cardStaggerAnimation.value),
                    child: Opacity(
                      opacity: _cardStaggerAnimation.value,
                      child: _buildQuickStatsSection(colorScheme, isTablet),
                    ),
                  );
                },
              ),
            ),

            // Feature Cards Grid
            SliverPadding(
              padding: const EdgeInsets.all(16),
              sliver: SliverGrid(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: isTablet ? 3 : 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: isTablet ? 1.1 : 0.9,
                ),
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return AnimatedBuilder(
                      animation: _cardAnimationController,
                      builder: (context, child) {
                        final delay = index * 0.1;
                        final animation = Tween<double>(
                          begin: 0,
                          end: 1,
                        ).animate(CurvedAnimation(
                          parent: _cardAnimationController,
                          curve: Interval(delay, 1.0, curve: Curves.elasticOut),
                        ));
                        
                        return Transform.scale(
                          scale: 0.8 + (0.2 * animation.value),
                          child: Opacity(
                            opacity: animation.value,
                            child: _buildFeatureCard(
                              _getFeatureData()[index],
                              colorScheme,
                              index,
                            ),
                          ),
                        );
                      },
                    );
                  },
                  childCount: _getFeatureData().length,
                ),
              ),
            ),

            // Recent Activity Section
            SliverToBoxAdapter(
              child: AnimatedBuilder(
                animation: _cardAnimationController,
                builder: (context, child) {
                  return Transform.translate(
                    offset: Offset(0, 50 * (1 - _cardStaggerAnimation.value)),
                    child: Opacity(
                      opacity: _cardStaggerAnimation.value,
                      child: _buildRecentActivitySection(colorScheme),
                    ),
                  );
                },
              ),
            ),

            // Bottom spacing
            const SliverToBoxAdapter(
              child: SizedBox(height: 100),
            ),
          ],
        ),
      ),
      floatingActionButton: AnimatedBuilder(
        animation: _floatingAnimation,
        builder: (context, child) {
          return Transform.scale(
            scale: 1.0 + (0.1 * math.sin(_floatingAnimation.value * math.pi * 2)),
            child: FloatingActionButton.extended(
              onPressed: () => _showQuickActions(context),
              backgroundColor: colorScheme.primary,
              foregroundColor: colorScheme.onPrimary,
              elevation: 8,
              icon: const Icon(Icons.add_rounded),
              label: Text(
                'Quick Add',
                style: GoogleFonts.roboto(fontWeight: FontWeight.w600),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildAnimatedHeader(ColorScheme colorScheme, bool isTablet) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            colorScheme.primary,
            colorScheme.secondary,
            colorScheme.tertiary,
          ],
        ),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(32),
          bottomRight: Radius.circular(32),
        ),
        boxShadow: [
          BoxShadow(
            color: colorScheme.primary.withOpacity(0.3),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(isTablet ? 32 : 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                // Animated Logo
                AnimatedFarmLogo(
                  size: isTablet ? 60 : 50,
                  animate: true,
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _getGreeting(),
                        style: GoogleFonts.roboto(
                          fontSize: isTablet ? 28 : 24,
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'Your farm is looking great today!',
                        style: GoogleFonts.roboto(
                          fontSize: isTablet ? 16 : 14,
                          color: Colors.white.withOpacity(0.9),
                        ),
                      ),
                    ],
                  ),
                ),
                // Notification Bell
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: IconButton(
                    onPressed: () => _showNotifications(context),
                    icon: Stack(
                      children: [
                        Icon(
                          Icons.notifications_rounded,
                          color: Colors.white,
                          size: isTablet ? 28 : 24,
                        ),
                        Positioned(
                          right: 0,
                          top: 0,
                          child: Container(
                            width: 12,
                            height: 12,
                            decoration: const BoxDecoration(
                              color: Colors.red,
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Text(
                                '3',
                                style: GoogleFonts.roboto(
                                  fontSize: 8,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickStatsSection(ColorScheme colorScheme, bool isTablet) {
    return Container(
      margin: const EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(
            child: _buildStatCard(
              'Total Fields',
              '12',
              Icons.landscape_rounded,
              Colors.green,
              '+2 this month',
              colorScheme,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: _buildStatCard(
              'Active Crops',
              '8',
              Icons.eco_rounded,
              Colors.orange,
              '3 ready to harvest',
              colorScheme,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: _buildStatCard(
              'Tasks Today',
              '5',
              Icons.task_rounded,
              Colors.blue,
              '2 completed',
              colorScheme,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard(
    String title,
    String value,
    IconData icon,
    Color color,
    String subtitle,
    ColorScheme colorScheme,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            color.withOpacity(0.1),
            color.withOpacity(0.05),
          ],
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: color.withOpacity(0.3),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(icon, color: color, size: 20),
              ),
              Icon(
                Icons.trending_up_rounded,
                color: Colors.green,
                size: 16,
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            value,
            style: GoogleFonts.roboto(
              fontSize: 24,
              fontWeight: FontWeight.w800,
              color: colorScheme.onSurface,
            ),
          ),
          Text(
            title,
            style: GoogleFonts.roboto(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: colorScheme.onSurface.withOpacity(0.7),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            subtitle,
            style: GoogleFonts.roboto(
              fontSize: 10,
              color: Colors.green,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureCard(Map<String, dynamic> feature, ColorScheme colorScheme, int index) {
    return Hero(
      tag: 'feature_$index',
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              colorScheme.surface,
              feature['color'].withOpacity(0.05),
            ],
          ),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: feature['color'].withOpacity(0.3),
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: feature['color'].withOpacity(0.1),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              HapticFeedback.lightImpact();
              _navigateToFeature(feature['route']);
            },
            borderRadius: BorderRadius.circular(20),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Animated Icon
                  TweenAnimationBuilder<double>(
                    duration: Duration(milliseconds: 500 + (index * 100)),
                    tween: Tween(begin: 0, end: 1),
                    builder: (context, value, child) {
                      return Transform.scale(
                        scale: 0.5 + (0.5 * value),
                        child: Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                feature['color'],
                                feature['color'].withOpacity(0.7),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                color: feature['color'].withOpacity(0.3),
                                blurRadius: 8,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Icon(
                            feature['icon'],
                            color: Colors.white,
                            size: 28,
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 16),
                  Text(
                    feature['title'],
                    style: GoogleFonts.roboto(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: colorScheme.onSurface,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    feature['subtitle'],
                    style: GoogleFonts.roboto(
                      fontSize: 12,
                      color: colorScheme.onSurface.withOpacity(0.6),
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 12),
                  if (feature['badge'] != null)
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: feature['color'].withOpacity(0.2),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        feature['badge'],
                        style: GoogleFonts.roboto(
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                          color: feature['color'],
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRecentActivitySection(ColorScheme colorScheme) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: colorScheme.outline.withOpacity(0.2),
        ),
        boxShadow: [
          BoxShadow(
            color: colorScheme.shadow.withOpacity(0.1),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.history_rounded,
                color: colorScheme.primary,
                size: 24,
              ),
              const SizedBox(width: 12),
              Text(
                'Recent Activity',
                style: GoogleFonts.roboto(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: colorScheme.onSurface,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          ..._getRecentActivities().map((activity) => _buildActivityItem(activity, colorScheme)),
        ],
      ),
    );
  }

  Widget _buildActivityItem(Map<String, dynamic> activity, ColorScheme colorScheme) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: activity['color'].withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: activity['color'].withOpacity(0.3),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: activity['color'].withOpacity(0.2),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              activity['icon'],
              color: activity['color'],
              size: 20,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  activity['title'],
                  style: GoogleFonts.roboto(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: colorScheme.onSurface,
                  ),
                ),
                Text(
                  activity['time'],
                  style: GoogleFonts.roboto(
                    fontSize: 12,
                    color: colorScheme.onSurface.withOpacity(0.6),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<Map<String, dynamic>> _getFeatureData() {
    return [
      {
        'title': 'Smart Fields',
        'subtitle': 'Manage your agricultural fields',
        'icon': Icons.landscape_rounded,
        'color': Colors.green,
        'badge': '12 Active',
        'route': '/fields',
      },
      {
        'title': 'Crop Planning',
        'subtitle': 'Plan and track crop growth',
        'icon': Icons.eco_rounded,
        'color': Colors.orange,
        'badge': '8 Crops',
        'route': '/crops',
      },
      {
        'title': 'Smart Inventory',
        'subtitle': 'Track supplies and equipment',
        'icon': Icons.inventory_2_rounded,
        'color': Colors.blue,
        'badge': '3 Low Stock',
        'route': '/inventory',
      },
      {
        'title': 'Weather Insights',
        'subtitle': 'Get weather forecasts',
        'icon': Icons.wb_sunny_rounded,
        'color': Colors.amber,
        'badge': 'Live Data',
        'route': '/weather',
      },
      {
        'title': 'Crop Advisor',
        'subtitle': 'AI-powered crop recommendations',
        'icon': Icons.psychology_rounded,
        'color': Colors.indigo,
        'badge': 'Smart AI',
        'route': '/crop-recommendation',
      },
      {
        'title': 'Market Prices',
        'subtitle': 'Live commodity prices',
        'icon': Icons.trending_up_rounded,
        'color': Colors.red,
        'badge': 'Live Updates',
        'route': '/market-prices',
      },
      {
        'title': 'Khatabook',
        'subtitle': 'Financial management',
        'icon': Icons.account_balance_wallet_rounded,
        'color': Colors.purple,
        'badge': 'New Entry',
        'route': '/expenses',
      },
      {
        'title': 'Analytics',
        'subtitle': 'Performance insights',
        'icon': Icons.analytics_rounded,
        'color': Colors.teal,
        'badge': 'Updated',
        'route': '/reports',
      },
    ];
  }

  List<Map<String, dynamic>> _getRecentActivities() {
    return [
      {
        'title': 'Watered tomato field',
        'time': '2 hours ago',
        'icon': Icons.water_drop_rounded,
        'color': Colors.blue,
      },
      {
        'title': 'Added fertilizer to corn field',
        'time': '4 hours ago',
        'icon': Icons.grass_rounded,
        'color': Colors.green,
      },
      {
        'title': 'Harvested wheat (Field A)',
        'time': '1 day ago',
        'icon': Icons.agriculture_rounded,
        'color': Colors.orange,
      },
    ];
  }

  String _getGreeting() {
    final hour = DateTime.now().hour;
    if (hour < 12) return 'Good Morning';
    if (hour < 17) return 'Good Afternoon';
    return 'Good Evening';
  }

  void _navigateToFeature(String route) {
    // Navigate to respective screens
    switch (route) {
      case '/inventory':
      case '/fields':
      case '/crops':
      case '/weather':
      case '/crop-recommendation':
      case '/market-prices':
      case '/expenses':
      case '/reports':
        Navigator.pushNamed(context, route);
        break;
      default:
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Route $route not found'),
            backgroundColor: Colors.red,
          ),
        );
    }
  }

  void _showNotifications(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        margin: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Notifications',
                style: GoogleFonts.roboto(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 16),
              ListTile(
                leading: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.orange.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(Icons.warning, color: Colors.orange),
                ),
                title: const Text('Low inventory alert'),
                subtitle: const Text('Pesticide spray is running low'),
                trailing: const Text('2h ago'),
              ),
              ListTile(
                leading: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.blue.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(Icons.wb_cloudy, color: Colors.blue),
                ),
                title: const Text('Weather update'),
                subtitle: const Text('Rain expected tomorrow'),
                trailing: const Text('4h ago'),
              ),
              ListTile(
                leading: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.green.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(Icons.task_alt, color: Colors.green),
                ),
                title: const Text('Task completed'),
                subtitle: const Text('Irrigation task finished'),
                trailing: const Text('6h ago'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showQuickActions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        margin: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Quick Actions',
                style: GoogleFonts.roboto(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: _buildQuickActionButton(
                      'Add Task',
                      Icons.add_task_rounded,
                      Colors.blue,
                      () {
                        Navigator.pop(context);
                        // Navigate to task management or create task
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Task management coming soon!')),
                        );
                      },
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _buildQuickActionButton(
                      'Add Expense',
                      Icons.add_card_rounded,
                      Colors.purple,
                      () {
                        Navigator.pop(context);
                        Navigator.pushNamed(context, '/expenses');
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: _buildQuickActionButton(
                      'Add Item',
                      Icons.inventory_rounded,
                      Colors.orange,
                      () {
                        Navigator.pop(context);
                        Navigator.pushNamed(context, '/inventory');
                      },
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _buildQuickActionButton(
                      'Log Activity',
                      Icons.note_add_rounded,
                      Colors.green,
                      () {
                        Navigator.pop(context);
                        Navigator.pushNamed(context, '/reports');
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildQuickActionButton(
    String title,
    IconData icon,
    Color color,
    VoidCallback onTap,
  ) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [color, color.withOpacity(0.7)],
        ),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.3),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(12),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Icon(icon, color: Colors.white, size: 24),
                const SizedBox(height: 8),
                Text(
                  title,
                  style: GoogleFonts.roboto(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
