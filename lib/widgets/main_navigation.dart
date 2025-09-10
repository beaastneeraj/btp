import 'package:flutter/material.dart';
import '../screens/dashboard_screen.dart';
import '../screens/fields_screen.dart';
import '../screens/cattle_screen.dart';
import '../screens/irrigation_screen.dart';
import '../screens/analytics_screen.dart';
import '../screens/crop_planning_screen.dart';
import '../themes/app_theme.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _currentIndex = 0;
  
  final List<Widget> _screens = [
    const DashboardScreen(),
    const FieldsScreen(),
    const CattleScreen(),
    const IrrigationScreen(),
    const AnalyticsScreen(),
    const CropPlanningScreen(),
  ];

  final List<NavigationItem> _navigationItems = [
    NavigationItem(
      icon: Icons.dashboard_rounded,
      activeIcon: Icons.dashboard,
      label: 'Dashboard',
      color: AppTheme.primaryGreen,
    ),
    NavigationItem(
      icon: Icons.agriculture_outlined,
      activeIcon: Icons.agriculture,
      label: 'Fields',
      color: AppTheme.accentGreen,
    ),
    NavigationItem(
      icon: Icons.pets_outlined,
      activeIcon: Icons.pets,
      label: 'Cattle',
      color: AppTheme.primaryBlue,
    ),
    NavigationItem(
      icon: Icons.water_drop_outlined,
      activeIcon: Icons.water_drop,
      label: 'Irrigation',
      color: AppTheme.accentBlue,
    ),
    NavigationItem(
      icon: Icons.analytics_outlined,
      activeIcon: Icons.analytics,
      label: 'Analytics',
      color: AppTheme.warningOrange,
    ),
    NavigationItem(
      icon: Icons.eco_outlined,
      activeIcon: Icons.eco,
      label: 'Planning',
      color: AppTheme.primaryGreen,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 16,
              offset: const Offset(0, -4),
            ),
          ],
        ),
        child: SafeArea(
          child: Container(
            height: 80,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: _navigationItems.asMap().entries.map((entry) {
                final index = entry.key;
                final item = entry.value;
                final isSelected = index == _currentIndex;
                
                return GestureDetector(
                  onTap: () => _onItemTapped(index),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: isSelected 
                          ? item.color.withOpacity(0.1)
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        AnimatedSwitcher(
                          duration: const Duration(milliseconds: 200),
                          child: Icon(
                            isSelected ? item.activeIcon : item.icon,
                            key: ValueKey(isSelected),
                            color: isSelected 
                                ? item.color 
                                : Colors.grey.shade600,
                            size: 24,
                          ),
                        ),
                        const SizedBox(height: 4),
                        AnimatedDefaultTextStyle(
                          duration: const Duration(milliseconds: 200),
                          style: TextStyle(
                            fontSize: isSelected ? 12 : 11,
                            fontWeight: isSelected 
                                ? FontWeight.w600 
                                : FontWeight.w400,
                            color: isSelected 
                                ? item.color 
                                : Colors.grey.shade600,
                          ),
                          child: Text(item.label),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ),
      floatingActionButton: _buildFloatingActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  Widget? _buildFloatingActionButton() {
    // Show FAB only on specific screens
    if (_currentIndex == 0) { // Dashboard
      return FloatingActionButton.extended(
        onPressed: () => _showQuickActions(context),
        icon: const Icon(Icons.add),
        label: const Text('Quick Add'),
        backgroundColor: AppTheme.primaryGreen,
        foregroundColor: Colors.white,
        elevation: 8,
      );
    } else if (_currentIndex == 1) { // Fields
      return FloatingActionButton(
        onPressed: () => _navigateToAddField(),
        child: const Icon(Icons.add),
        backgroundColor: AppTheme.accentGreen,
        foregroundColor: Colors.white,
      );
    } else if (_currentIndex == 2) { // Cattle
      return FloatingActionButton(
        onPressed: () => _navigateToAddCattle(),
        child: const Icon(Icons.add),
        backgroundColor: AppTheme.primaryBlue,
        foregroundColor: Colors.white,
      );
    } else if (_currentIndex == 3) { // Irrigation
      return FloatingActionButton(
        onPressed: () => _navigateToAddIrrigation(),
        child: const Icon(Icons.add),
        backgroundColor: AppTheme.accentBlue,
        foregroundColor: Colors.white,
      );
    }
    return null;
  }

  void _showQuickActions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Quick Actions',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            GridView.count(
              shrinkWrap: true,
              crossAxisCount: 3,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              children: [
                _QuickActionCard(
                  icon: Icons.agriculture,
                  label: 'Add Field',
                  color: AppTheme.accentGreen,
                  onTap: _navigateToAddField,
                ),
                _QuickActionCard(
                  icon: Icons.pets,
                  label: 'Add Cattle',
                  color: AppTheme.primaryBlue,
                  onTap: _navigateToAddCattle,
                ),
                _QuickActionCard(
                  icon: Icons.eco,
                  label: 'Crop Plan',
                  color: AppTheme.primaryGreen,
                  onTap: _navigateToCropPlanning,
                ),
                _QuickActionCard(
                  icon: Icons.assignment,
                  label: 'Add Task',
                  color: AppTheme.warningOrange,
                  onTap: _navigateToAddTask,
                ),
                _QuickActionCard(
                  icon: Icons.inventory,
                  label: 'Add Item',
                  color: AppTheme.primaryGreen,
                  onTap: _navigateToAddInventory,
                ),
                _QuickActionCard(
                  icon: Icons.receipt,
                  label: 'Add Expense',
                  color: AppTheme.errorRed,
                  onTap: _navigateToAddExpense,
                ),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  void _navigateToAddField() {
    Navigator.pop(context);
    // Navigate to add field screen
  }

  void _navigateToAddCattle() {
    Navigator.pop(context);
    // Navigate to add cattle screen
  }

  void _navigateToCropPlanning() {
    Navigator.pop(context);
    setState(() {
      _currentIndex = 5; // Crop Planning screen index
    });
  }

  void _navigateToAddTask() {
    Navigator.pop(context);
    // Navigate to add task screen
  }

  void _navigateToAddInventory() {
    Navigator.pop(context);
    // Navigate to add inventory screen
  }

  void _navigateToAddExpense() {
    Navigator.pop(context);
    // Navigate to add expense screen
  }

  void _navigateToAddIrrigation() {
    Navigator.pop(context);
    // Navigate to add irrigation screen
  }
}

class NavigationItem {
  final IconData icon;
  final IconData activeIcon;
  final String label;
  final Color color;

  NavigationItem({
    required this.icon,
    required this.activeIcon,
    required this.label,
    required this.color,
  });
}

class _QuickActionCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback onTap;

  const _QuickActionCard({
    required this.icon,
    required this.label,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: color.withOpacity(0.2),
            width: 1,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 32,
              color: color,
            ),
            const SizedBox(height: 8),
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: color,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
