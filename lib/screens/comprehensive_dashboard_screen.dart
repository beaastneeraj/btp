import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../services/enhanced_weather_service.dart';
import '../themes/material3_theme.dart';
import 'enhanced_crop_form_screen.dart';
import 'enhanced_weather_screen.dart';
import 'enhanced_analytics_screen.dart';
import 'inventory_screen.dart';

// Comprehensive Enhanced Dashboard for Indian Farmers
class ComprehensiveDashboardScreen extends ConsumerStatefulWidget {
  const ComprehensiveDashboardScreen({super.key});

  @override
  ConsumerState<ComprehensiveDashboardScreen> createState() => _ComprehensiveDashboardScreenState();
}

class _ComprehensiveDashboardScreenState extends ConsumerState<ComprehensiveDashboardScreen>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;
  
  final EnhancedWeatherService _weatherService = EnhancedWeatherService();
  WeatherData? _currentWeather;
  bool _isLoadingWeather = true;
  
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: Duration(milliseconds: 1200),
      vsync: this,
    );
    
    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
    );
    
    _slideAnimation = Tween<Offset>(
      begin: Offset(0, 0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _animationController, curve: Curves.easeOutCubic));
    
    _loadDashboardData();
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Future<void> _loadDashboardData() async {
    setState(() => _isLoadingWeather = true);
    
    try {
      final weather = await _weatherService.getCurrentWeather(cityName: 'Delhi');
      setState(() {
        _currentWeather = weather;
        _isLoadingWeather = false;
      });
    } catch (e) {
      setState(() => _isLoadingWeather = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          return FadeTransition(
            opacity: _fadeAnimation,
            child: SlideTransition(
              position: _slideAnimation,
              child: CustomScrollView(
                slivers: [
                  _buildSliverAppBar(colorScheme),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildWelcomeCard(colorScheme),
                          SizedBox(height: 16),
                          _buildWeatherOverview(colorScheme),
                          SizedBox(height: 20),
                          _buildQuickActions(colorScheme),
                          SizedBox(height: 20),
                          _buildFarmOverview(colorScheme),
                          SizedBox(height: 20),
                          _buildUpcomingTasks(colorScheme),
                          SizedBox(height: 20),
                          _buildMarketPrices(colorScheme),
                          SizedBox(height: 20),
                          _buildFarmingTips(colorScheme),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _showQuickAddDialog(context),
        icon: Icon(Icons.add),
        label: Text('Quick Add'),
        tooltip: 'Add crops, inventory, or tasks',
      ),
    );
  }

  Widget _buildSliverAppBar(ColorScheme colorScheme) {
    return SliverAppBar(
      expandedHeight: 200,
      floating: false,
      pinned: true,
      backgroundColor: colorScheme.primary,
      foregroundColor: colorScheme.onPrimary,
      flexibleSpace: FlexibleSpaceBar(
        title: Text(
          'Farm Dashboard',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            color: colorScheme.onPrimary,
            fontWeight: FontWeight.w600,
          ),
        ),
        background: Container(
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
          ),
          child: Stack(
            children: [
              Positioned(
                right: -50,
                top: -30,
                child: Icon(
                  Icons.agriculture,
                  size: 150,
                  color: colorScheme.onPrimary.withOpacity(0.1),
                ),
              ),
            ],
          ),
        ),
      ),
      actions: [
        IconButton(
          onPressed: () => _showNotifications(context),
          icon: Stack(
            children: [
              Icon(Icons.notifications),
              Positioned(
                right: 0,
                top: 0,
                child: Container(
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  constraints: BoxConstraints(minWidth: 12, minHeight: 12),
                  child: Text(
                    '3',
                    style: TextStyle(color: Colors.white, fontSize: 8),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
          tooltip: 'Notifications',
        ),
        IconButton(
          onPressed: () => _showProfile(context),
          icon: Icon(Icons.account_circle),
          tooltip: 'Profile',
        ),
      ],
    );
  }

  Widget _buildWelcomeCard(ColorScheme colorScheme) {
    final hour = DateTime.now().hour;
    String greeting;
    IconData greetingIcon;
    
    if (hour < 12) {
      greeting = 'Good Morning, Farmer!';
      greetingIcon = Icons.wb_sunny;
    } else if (hour < 17) {
      greeting = 'Good Afternoon!';
      greetingIcon = Icons.wb_sunny_outlined;
    } else {
      greeting = 'Good Evening!';
      greetingIcon = Icons.nights_stay;
    }

    return M3Card(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              colorScheme.primaryContainer,
              colorScheme.secondaryContainer,
            ],
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        padding: EdgeInsets.all(20),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(greetingIcon, color: colorScheme.primary),
                      SizedBox(width: 8),
                      Text(
                        greeting,
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Today is ${DateFormat('EEEE, MMMM dd').format(DateTime.now())}',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Ready to make your farm thrive?',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
            Icon(
              Icons.agriculture,
              size: 48,
              color: colorScheme.primary.withOpacity(0.7),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWeatherOverview(ColorScheme colorScheme) {
    if (_isLoadingWeather) {
      return M3Card(
        child: Container(
          height: 100,
          child: Center(child: CircularProgressIndicator()),
        ),
      );
    }

    if (_currentWeather == null) {
      return M3Card(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Text('Weather data unavailable'),
        ),
      );
    }

    return M3Card(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => EnhancedWeatherScreen()),
      ),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Weather Today',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'View Details →',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: colorScheme.primary,
                  ),
                ),
              ],
            ),
            SizedBox(height: 12),
            Row(
              children: [
                Icon(
                  _getWeatherIcon(_currentWeather!.condition),
                  size: 32,
                  color: colorScheme.primary,
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${_currentWeather!.temperature.toStringAsFixed(1)}°C',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        _currentWeather!.condition,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text('Humidity: ${_currentWeather!.humidity}%'),
                    Text('Wind: ${_currentWeather!.windSpeed.toStringAsFixed(1)} km/h'),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickActions(ColorScheme colorScheme) {
    final actions = [
      QuickAction(
        icon: Icons.grass,
        label: 'Add Crop',
        color: Colors.green,
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => EnhancedCropFormScreen(
            onSave: (crop) {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Crop added successfully!')),
              );
            },
          )),
        ),
      ),
      QuickAction(
        icon: Icons.inventory,
        label: 'Inventory',
        color: Colors.blue,
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => InventoryScreen()),
        ),
      ),
      QuickAction(
        icon: Icons.analytics,
        label: 'Analytics',
        color: Colors.purple,
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => EnhancedAnalyticsScreen()),
        ),
      ),
      QuickAction(
        icon: Icons.cloud,
        label: 'Weather',
        color: Colors.orange,
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => EnhancedWeatherScreen()),
        ),
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Quick Actions',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 12),
        GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            childAspectRatio: 1,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
          ),
          itemCount: actions.length,
          itemBuilder: (context, index) {
            final action = actions[index];
            return _buildQuickActionCard(action, colorScheme);
          },
        ),
      ],
    );
  }

  Widget _buildQuickActionCard(QuickAction action, ColorScheme colorScheme) {
    return M3Card(
      onTap: action.onTap,
      child: Container(
        padding: EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: action.color.withOpacity(0.2),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                action.icon,
                color: action.color,
                size: 24,
              ),
            ),
            SizedBox(height: 8),
            Text(
              action.label,
              style: Theme.of(context).textTheme.labelSmall,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFarmOverview(ColorScheme colorScheme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Farm Overview',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: _buildOverviewCard(
                'Total Crops',
                '8',
                Icons.grass,
                Colors.green,
                colorScheme,
              ),
            ),
            SizedBox(width: 12),
            Expanded(
              child: _buildOverviewCard(
                'Inventory Items',
                '24',
                Icons.inventory,
                Colors.blue,
                colorScheme,
              ),
            ),
          ],
        ),
        SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: _buildOverviewCard(
                'Revenue This Month',
                '₹25,340',
                Icons.trending_up,
                Colors.purple,
                colorScheme,
              ),
            ),
            SizedBox(width: 12),
            Expanded(
              child: _buildOverviewCard(
                'Expenses',
                '₹12,100',
                Icons.trending_down,
                Colors.red,
                colorScheme,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildOverviewCard(
    String title,
    String value,
    IconData icon,
    Color color,
    ColorScheme colorScheme,
  ) {
    return M3Card(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: color, size: 20),
                SizedBox(width: 8),
                Expanded(
                  child: Text(
                    title,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            Text(
              value,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildUpcomingTasks(ColorScheme colorScheme) {
    final tasks = [
      FarmTask('Watering', 'Water the tomato plants', Icons.water_drop, DateTime.now()),
      FarmTask('Fertilizing', 'Apply fertilizer to wheat crop', Icons.scatter_plot, DateTime.now().add(Duration(days: 1))),
      FarmTask('Harvesting', 'Harvest potatoes', Icons.agriculture, DateTime.now().add(Duration(days: 3))),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Upcoming Tasks',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            TextButton(
              onPressed: () => _showAllTasks(context),
              child: Text('View All'),
            ),
          ],
        ),
        SizedBox(height: 12),
        ...tasks.take(3).map((task) => _buildTaskCard(task, colorScheme)),
      ],
    );
  }

  Widget _buildTaskCard(FarmTask task, ColorScheme colorScheme) {
    final isToday = DateFormat('yyyy-MM-dd').format(task.dueDate) == 
                   DateFormat('yyyy-MM-dd').format(DateTime.now());
    
    return M3Card(
      margin: EdgeInsets.only(bottom: 8),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: isToday ? Colors.orange.withOpacity(0.2) : colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                task.icon,
                color: isToday ? Colors.orange : colorScheme.primary,
                size: 20,
              ),
            ),
            SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    task.title,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    task.description,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
            Text(
              isToday ? 'Today' : DateFormat('MMM dd').format(task.dueDate),
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: isToday ? Colors.orange : colorScheme.onSurfaceVariant,
                fontWeight: isToday ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMarketPrices(ColorScheme colorScheme) {
    final marketPrices = [
      MarketPrice('Rice', '₹2,850/quintal', 2.5, true),
      MarketPrice('Wheat', '₹2,100/quintal', -1.8, false),
      MarketPrice('Tomato', '₹45/kg', 8.2, true),
      MarketPrice('Onion', '₹38/kg', -3.1, false),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Market Prices',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            TextButton(
              onPressed: () => _showAllPrices(context),
              child: Text('View All'),
            ),
          ],
        ),
        SizedBox(height: 12),
        ...marketPrices.map((price) => _buildMarketPriceCard(price, colorScheme)),
      ],
    );
  }

  Widget _buildMarketPriceCard(MarketPrice price, ColorScheme colorScheme) {
    return M3Card(
      margin: EdgeInsets.only(bottom: 8),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    price.commodity,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    price.price,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Icon(
                  price.isIncreasing ? Icons.trending_up : Icons.trending_down,
                  color: price.isIncreasing ? Colors.green : Colors.red,
                  size: 16,
                ),
                Text(
                  '${price.changePercent.abs()}%',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: price.isIncreasing ? Colors.green : Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFarmingTips(ColorScheme colorScheme) {
    final tips = [
      'Early morning is the best time for watering plants to reduce water loss',
      'Crop rotation helps maintain soil health and prevent pest buildup',
      'Monitor weather forecasts to plan irrigation and harvesting activities',
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Today\'s Farming Tips',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 12),
        M3Card(
          child: Column(
            children: tips.asMap().entries.map((entry) {
              final index = entry.key;
              final tip = entry.value;
              return Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(16),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.lightbulb,
                          color: Colors.amber,
                          size: 20,
                        ),
                        SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            tip,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (index < tips.length - 1)
                    Divider(height: 1),
                ],
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  IconData _getWeatherIcon(String condition) {
    switch (condition.toLowerCase()) {
      case 'clear':
      case 'sunny':
        return Icons.wb_sunny;
      case 'clouds':
      case 'cloudy':
      case 'partly cloudy':
        return Icons.wb_cloudy;
      case 'rain':
      case 'drizzle':
        return Icons.grain;
      case 'thunderstorm':
        return Icons.flash_on;
      case 'snow':
        return Icons.ac_unit;
      case 'mist':
      case 'fog':
        return Icons.blur_on;
      default:
        return Icons.wb_cloudy;
    }
  }

  void _showQuickAddDialog(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Quick Add',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            SizedBox(height: 16),
            ListTile(
              leading: Icon(Icons.grass),
              title: Text('Add Crop'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EnhancedCropFormScreen(
                    onSave: (crop) {
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Crop added successfully!')),
                      );
                    },
                  )),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.inventory),
              title: Text('Add Inventory Item'),
              onTap: () {
                Navigator.pop(context);
                // Navigate to inventory form
              },
            ),
            ListTile(
              leading: Icon(Icons.task),
              title: Text('Add Task'),
              onTap: () {
                Navigator.pop(context);
                // Navigate to task form
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showNotifications(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Notifications'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: Icon(Icons.warning, color: Colors.orange),
              title: Text('Weather Alert'),
              subtitle: Text('Heavy rain expected tomorrow'),
            ),
            ListTile(
              leading: Icon(Icons.schedule, color: Colors.blue),
              title: Text('Task Reminder'),
              subtitle: Text('Water tomato plants today'),
            ),
            ListTile(
              leading: Icon(Icons.trending_up, color: Colors.green),
              title: Text('Market Update'),
              subtitle: Text('Rice prices increased by 2.5%'),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  void _showProfile(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Profile'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              radius: 40,
              child: Icon(Icons.person, size: 40),
            ),
            SizedBox(height: 16),
            Text('Farmer Name', style: Theme.of(context).textTheme.titleMedium),
            Text('farmer@example.com'),
            SizedBox(height: 16),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: Icon(Icons.help),
              title: Text('Help & Support'),
              onTap: () => Navigator.pop(context),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Close'),
          ),
        ],
      ),
    );
  }

  void _showAllTasks(BuildContext context) {
    // Implement all tasks screen
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('All tasks view coming soon!')),
    );
  }

  void _showAllPrices(BuildContext context) {
    // Implement all market prices screen
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Market prices view coming soon!')),
    );
  }
}

// Data models for dashboard
class QuickAction {
  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback onTap;

  QuickAction({
    required this.icon,
    required this.label,
    required this.color,
    required this.onTap,
  });
}

class FarmTask {
  final String title;
  final String description;
  final IconData icon;
  final DateTime dueDate;

  FarmTask(this.title, this.description, this.icon, this.dueDate);
}

class MarketPrice {
  final String commodity;
  final String price;
  final double changePercent;
  final bool isIncreasing;

  MarketPrice(this.commodity, this.price, this.changePercent, this.isIncreasing);
}