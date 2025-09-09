import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:figma_squircle/figma_squircle.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../design_system/figma_components.dart';

/// Modern animated dashboard with AI integration
class ModernDashboardScreen extends ConsumerStatefulWidget {
  const ModernDashboardScreen({super.key});

  @override
  ConsumerState<ModernDashboardScreen> createState() => _ModernDashboardScreenState();
}

class _ModernDashboardScreenState extends ConsumerState<ModernDashboardScreen>
    with TickerProviderStateMixin {
  late AnimationController _headerController;
  late AnimationController _cardsController;
  late AnimationController _fabController;

  @override
  void initState() {
    super.initState();
    _headerController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _cardsController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );
    _fabController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );

    // Staggered animations
    _headerController.forward();
    Future.delayed(const Duration(milliseconds: 200), () {
      _cardsController.forward();
    });
    Future.delayed(const Duration(milliseconds: 800), () {
      _fabController.forward();
    });
  }

  @override
  void dispose() {
    _headerController.dispose();
    _cardsController.dispose();
    _fabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.background,
      body: CustomScrollView(
        slivers: [
          // Modern animated app bar
          SliverAppBar(
            expandedHeight: 200,
            pinned: true,
            backgroundColor: Colors.transparent,
            elevation: 0,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      colorScheme.primary,
                      colorScheme.secondary,
                    ],
                  ),
                ),
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(FigmaDesignSystem.spaceL),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Farm Dashboard',
                              style: FigmaDesignSystem.headlineMedium.copyWith(
                                color: colorScheme.onPrimary,
                                fontWeight: FontWeight.bold,
                              ),
                            ).animate(controller: _headerController)
                              .fadeIn(duration: 600.ms)
                              .slideX(begin: -0.3),
                            Container(
                              decoration: FigmaDesignSystem.glassmorphism(
                                opacity: 0.2,
                                borderColor: colorScheme.onPrimary.withOpacity(0.3),
                              ),
                              child: IconButton(
                                icon: Icon(
                                  LucideIcons.bell,
                                  color: colorScheme.onPrimary,
                                ),
                                onPressed: () {},
                              ),
                            ).animate(controller: _headerController)
                              .fadeIn(duration: 600.ms, delay: 200.ms)
                              .scale(begin: const Offset(0.8, 0.8)),
                          ],
                        ),
                        const SizedBox(height: FigmaDesignSystem.spaceL),
                        Text(
                          'Welcome back, Farmer! 🌱',
                          style: theme.textTheme.titleLarge?.copyWith(
                            color: colorScheme.onPrimary.withOpacity(0.9),
                          ),
                        ).animate(controller: _headerController)
                          .fadeIn(duration: 600.ms, delay: 400.ms)
                          .slideY(begin: 0.3),
                        Text(
                          'Your farm is thriving today',
                          style: theme.textTheme.bodyLarge?.copyWith(
                            color: colorScheme.onPrimary.withOpacity(0.8),
                          ),
                        ).animate(controller: _headerController)
                          .fadeIn(duration: 600.ms, delay: 600.ms)
                          .slideY(begin: 0.3),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          
          // Main content
          SliverPadding(
            padding: const EdgeInsets.all(FigmaDesignSystem.spaceL),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                // Quick stats
                AnimationLimiter(
                  child: GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    crossAxisSpacing: FigmaDesignSystem.spaceM,
                    mainAxisSpacing: FigmaDesignSystem.spaceM,
                    childAspectRatio: 1.2,
                    children: [
                      _buildStatCard(
                        icon: LucideIcons.thermometer,
                        title: 'Temperature',
                        value: '24°C',
                        subtitle: 'Perfect for crops',
                        color: Colors.orange,
                        index: 0,
                      ),
                      _buildStatCard(
                        icon: LucideIcons.droplets,
                        title: 'Humidity',
                        value: '65%',
                        subtitle: 'Optimal level',
                        color: Colors.blue,
                        index: 1,
                      ),
                      _buildStatCard(
                        icon: LucideIcons.sun,
                        title: 'UV Index',
                        value: '6.2',
                        subtitle: 'High intensity',
                        color: Colors.amber,
                        index: 2,
                      ),
                      _buildStatCard(
                        icon: LucideIcons.wind,
                        title: 'Wind Speed',
                        value: '12 km/h',
                        subtitle: 'Light breeze',
                        color: Colors.teal,
                        index: 3,
                      ),
                    ],
                  ),
                ),
                
                const SizedBox(height: FigmaDesignSystem.spaceXL),
                
                // AI Insights Section
                Text(
                  'AI Insights',
                  style: FigmaDesignSystem.headlineSmall.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ).animate()
                  .fadeIn(duration: 600.ms, delay: 1000.ms)
                  .slideX(begin: -0.3),
                
                const SizedBox(height: FigmaDesignSystem.spaceL),
                
                FigmaCard(
                  backgroundColor: colorScheme.primaryContainer,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(FigmaDesignSystem.spaceS),
                            decoration: BoxDecoration(
                              color: colorScheme.primary,
                              borderRadius: BorderRadius.circular(FigmaDesignSystem.radiusS),
                            ),
                            child: Icon(
                              LucideIcons.brain,
                              color: colorScheme.onPrimary,
                              size: 20,
                            ),
                          ),
                          const SizedBox(width: FigmaDesignSystem.spaceM),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'AI Recommendation',
                                  style: theme.textTheme.titleMedium?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'Based on weather patterns',
                                  style: theme.textTheme.bodySmall?.copyWith(
                                    color: colorScheme.onSurface.withOpacity(0.7),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: FigmaDesignSystem.spaceM),
                      Text(
                        'Consider increasing irrigation for your tomato crops. Weather forecast shows dry conditions for the next 3 days.',
                        style: theme.textTheme.bodyMedium,
                      ),
                      const SizedBox(height: FigmaDesignSystem.spaceM),
                      FigmaButton(
                        text: 'View Details',
                        variant: ButtonVariant.outlined,
                        size: ButtonSize.small,
                        icon: LucideIcons.arrowRight,
                        onPressed: () {},
                      ),
                    ],
                  ),
                ).animate()
                  .fadeIn(duration: 600.ms, delay: 1200.ms)
                  .slideY(begin: 0.3),
                
                const SizedBox(height: FigmaDesignSystem.spaceXL),
                
                // Recent Activities
                Text(
                  'Recent Activities',
                  style: FigmaDesignSystem.headlineSmall.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ).animate()
                  .fadeIn(duration: 600.ms, delay: 1400.ms)
                  .slideX(begin: -0.3),
                
                const SizedBox(height: FigmaDesignSystem.spaceL),
                
                ...List.generate(3, (index) => 
                  _buildActivityItem(
                    icon: [LucideIcons.sprout, LucideIcons.droplets, LucideIcons.camera][index],
                    title: ['Planted Seeds', 'Irrigation Complete', 'Crop Inspection'][index],
                    subtitle: ['Section A - Tomatoes', 'Zone 2 - 30 minutes', 'Health Score: 95%'][index],
                    time: ['2 hours ago', '4 hours ago', '1 day ago'][index],
                    index: index + 5,
                  ),
                ),
              ]),
            ),
          ),
        ],
      ),
      
      // Modern floating action button
      floatingActionButton: ScaleTransition(
        scale: _fabController,
        child: FloatingActionButton.extended(
          onPressed: () {
            // Voice command
          },
          backgroundColor: colorScheme.secondary,
          foregroundColor: colorScheme.onSecondary,
          icon: const Icon(LucideIcons.mic),
          label: const Text('Ask AI'),
        ).animate()
          .shimmer(duration: 2000.ms, delay: 2000.ms)
          .then()
          .shake(duration: 500.ms),
      ),
    );
  }

  Widget _buildStatCard({
    required IconData icon,
    required String title,
    required String value,
    required String subtitle,
    required Color color,
    required int index,
  }) {
    return AnimationConfiguration.staggeredGrid(
      position: index,
      duration: const Duration(milliseconds: 600),
      columnCount: 2,
      child: SlideAnimation(
        verticalOffset: 50.0,
        child: FadeInAnimation(
          child: FigmaCard(
            enableHoverEffect: true,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(FigmaDesignSystem.spaceS),
                      decoration: BoxDecoration(
                        color: color.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(FigmaDesignSystem.radiusS),
                      ),
                      child: Icon(
                        icon,
                        color: color,
                        size: 20,
                      ),
                    ),
                    Icon(
                      LucideIcons.trendingUp,
                      color: Colors.green,
                      size: 16,
                    ),
                  ],
                ),
                const Spacer(),
                Text(
                  title,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
                  ),
                ),
                Text(
                  value,
                  style: FigmaDesignSystem.headlineSmall.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  subtitle,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Colors.green,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildActivityItem({
    required IconData icon,
    required String title,
    required String subtitle,
    required String time,
    required int index,
  }) {
    return AnimationConfiguration.staggeredList(
      position: index,
      duration: const Duration(milliseconds: 500),
      child: SlideAnimation(
        horizontalOffset: 100.0,
        child: FadeInAnimation(
          child: Container(
            margin: const EdgeInsets.only(bottom: FigmaDesignSystem.spaceM),
            child: FigmaCard(
              height: 80,
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(FigmaDesignSystem.spaceS),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primaryContainer,
                      borderRadius: BorderRadius.circular(FigmaDesignSystem.radiusS),
                    ),
                    child: Icon(
                      icon,
                      color: Theme.of(context).colorScheme.primary,
                      size: 20,
                    ),
                  ),
                  const SizedBox(width: FigmaDesignSystem.spaceM),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          title,
                          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          subtitle,
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    time,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context).colorScheme.onSurface.withOpacity(0.5),
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
}

/// Modern crop monitoring screen with advanced animations
class ModernCropMonitoringScreen extends StatefulWidget {
  const ModernCropMonitoringScreen({super.key});

  @override
  State<ModernCropMonitoringScreen> createState() => _ModernCropMonitoringScreenState();
}

class _ModernCropMonitoringScreenState extends State<ModernCropMonitoringScreen>
    with TickerProviderStateMixin {
  late AnimationController _pulseController;
  late Animation<double> _pulseAnimation;
  
  @override
  void initState() {
    super.initState();
    _pulseController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    _pulseAnimation = Tween<double>(
      begin: 1.0,
      end: 1.1,
    ).animate(CurvedAnimation(
      parent: _pulseController,
      curve: Curves.easeInOut,
    ));
    
    _pulseController.repeat(reverse: true);
  }

  @override
  void dispose() {
    _pulseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.background,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: const Text('Crop Monitoring'),
            backgroundColor: colorScheme.surface,
            elevation: 0,
            pinned: true,
            actions: [
              IconButton(
                icon: const Icon(LucideIcons.scan),
                onPressed: () {
                  // AI scan
                },
              ),
            ],
          ),
          
          SliverPadding(
            padding: const EdgeInsets.all(FigmaDesignSystem.spaceL),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                // Health overview card
                FigmaCard(
                  backgroundColor: colorScheme.primaryContainer,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Overall Health',
                                style: theme.textTheme.titleLarge?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'Based on AI analysis',
                                style: theme.textTheme.bodyMedium?.copyWith(
                                  color: colorScheme.onSurface.withOpacity(0.7),
                                ),
                              ),
                            ],
                          ),
                          AnimatedBuilder(
                            animation: _pulseAnimation,
                            builder: (context, child) {
                              return Transform.scale(
                                scale: _pulseAnimation.value,
                                child: Container(
                                  width: 80,
                                  height: 80,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.green,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.green.withOpacity(0.3),
                                        blurRadius: 20,
                                        spreadRadius: 5,
                                      ),
                                    ],
                                  ),
                                  child: Center(
                                    child: Text(
                                      '95%',
                                      style: theme.textTheme.headlineSmall?.copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: FigmaDesignSystem.spaceL),
                      Row(
                        children: [
                          Expanded(
                            child: _buildHealthMetric(
                              'Growth Rate',
                              '12%',
                              Colors.green,
                              LucideIcons.trendingUp,
                            ),
                          ),
                          Expanded(
                            child: _buildHealthMetric(
                              'Disease Risk',
                              'Low',
                              Colors.blue,
                              LucideIcons.shield,
                            ),
                          ),
                          Expanded(
                            child: _buildHealthMetric(
                              'Yield Forecast',
                              '85%',
                              Colors.orange,
                              LucideIcons.target,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ).animate()
                  .fadeIn(duration: 600.ms)
                  .slideY(begin: 0.3),
                
                const SizedBox(height: FigmaDesignSystem.spaceXL),
                
                // Crop sections
                Text(
                  'Crop Sections',
                  style: FigmaDesignSystem.headlineSmall.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ).animate()
                  .fadeIn(duration: 600.ms, delay: 300.ms)
                  .slideX(begin: -0.3),
                
                const SizedBox(height: FigmaDesignSystem.spaceL),
                
                AnimationLimiter(
                  child: Column(
                    children: List.generate(4, (index) => 
                      AnimationConfiguration.staggeredList(
                        position: index,
                        duration: const Duration(milliseconds: 500),
                        child: SlideAnimation(
                          horizontalOffset: 100.0,
                          child: FadeInAnimation(
                            child: _buildCropSection(
                              section: 'Section ${String.fromCharCode(65 + index)}',
                              crop: ['Tomatoes', 'Wheat', 'Corn', 'Soybeans'][index],
                              health: [95, 88, 92, 90][index],
                              area: ['2.5 ha', '5.0 ha', '3.2 ha', '4.1 ha'][index],
                              status: ['Excellent', 'Good', 'Very Good', 'Good'][index],
                              color: [Colors.red, Colors.amber, Colors.yellow, Colors.green][index],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ]),
            ),
          ),
        ],
      ),
      
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Quick AI scan
        },
        backgroundColor: colorScheme.secondary,
        child: const Icon(LucideIcons.camera),
      ).animate()
        .scale(delay: 1000.ms, duration: 300.ms)
        .then()
        .shimmer(duration: 2000.ms),
    );
  }

  Widget _buildHealthMetric(String label, String value, Color color, IconData icon) {
    return Column(
      children: [
        Icon(icon, color: color, size: 24),
        const SizedBox(height: FigmaDesignSystem.spaceXS),
        Text(
          value,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
        Text(
          label,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildCropSection({
    required String section,
    required String crop,
    required int health,
    required String area,
    required String status,
    required Color color,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: FigmaDesignSystem.spaceM),
      child: FigmaCard(
        height: 120,
        child: Row(
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                borderRadius: BorderRadius.circular(FigmaDesignSystem.radiusM),
              ),
              child: Icon(
                LucideIcons.sprout,
                color: color,
                size: 32,
              ),
            ),
            const SizedBox(width: FigmaDesignSystem.spaceM),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        section,
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: FigmaDesignSystem.spaceS,
                          vertical: FigmaDesignSystem.spaceXS,
                        ),
                        decoration: BoxDecoration(
                          color: _getStatusColor(health).withOpacity(0.1),
                          borderRadius: BorderRadius.circular(FigmaDesignSystem.radiusS),
                        ),
                        child: Text(
                          status,
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: _getStatusColor(health),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    crop,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
                    ),
                  ),
                  const SizedBox(height: FigmaDesignSystem.spaceXS),
                  Row(
                    children: [
                      Icon(
                        LucideIcons.mapPin,
                        size: 16,
                        color: Theme.of(context).colorScheme.onSurface.withOpacity(0.5),
                      ),
                      const SizedBox(width: FigmaDesignSystem.spaceXS),
                      Text(
                        area,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      const SizedBox(width: FigmaDesignSystem.spaceM),
                      Icon(
                        LucideIcons.heart,
                        size: 16,
                        color: _getStatusColor(health),
                      ),
                      const SizedBox(width: FigmaDesignSystem.spaceXS),
                      Text(
                        '$health%',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: _getStatusColor(health),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _getStatusColor(int health) {
    if (health >= 90) return Colors.green;
    if (health >= 75) return Colors.orange;
    return Colors.red;
  }
}
