import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/app_provider.dart';
import '../models/irrigation_system.dart';
import '../themes/app_theme.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/irrigation_calculator.dart';

class IrrigationScreen extends StatefulWidget {
  const IrrigationScreen({super.key});

  @override
  State<IrrigationScreen> createState() => _IrrigationScreenState();
}

class _IrrigationScreenState extends State<IrrigationScreen> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF1976D2),
              Color(0xFF42A5F5),
              Color(0xFF81D4FA),
            ],
          ),
        ),
        child: Column(
          children: [
            CustomAppBar(
              title: 'Irrigation Management',
              subtitle: 'Optimize water usage and reduce costs',
              actions: [
                IconButton(
                  onPressed: _showIrrigationCalculator,
                  icon: const Icon(Icons.calculate, color: Colors.white),
                ),
                IconButton(
                  onPressed: _showScheduleManager,
                  icon: const Icon(Icons.schedule, color: Colors.white),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.15),
                borderRadius: BorderRadius.circular(16),
              ),
              child: TabBar(
                controller: _tabController,
                labelColor: Colors.white,
                unselectedLabelColor: Colors.white.withOpacity(0.7),
                indicator: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                indicatorPadding: const EdgeInsets.all(4),
                tabs: const [
                  Tab(text: 'Systems'),
                  Tab(text: 'Schedules'),
                  Tab(text: 'Analytics'),
                  Tab(text: 'Calculator'),
                ],
              ),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(top: 16),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                ),
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    _buildSystemsTab(),
                    _buildSchedulesTab(),
                    _buildAnalyticsTab(),
                    _buildCalculatorTab(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSystemsTab() {
    return Consumer<AppProvider>(
      builder: (context, provider, child) {
        final systems = _getMockIrrigationSystems();
        
        return Column(
          children: [
            _buildSystemsOverview(systems),
            Expanded(
              child: systems.isEmpty
                  ? _buildEmptyState()
                  : ListView.builder(
                      padding: const EdgeInsets.all(16),
                      itemCount: systems.length,
                      itemBuilder: (context, index) {
                        final system = systems[index];
                        return _buildSystemCard(system);
                      },
                    ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildSystemsOverview(List<IrrigationSystem> systems) {
    final totalSystems = systems.length;
    final activeSystems = systems.where((s) => s.isActive).length;
    final totalCoverage = systems.fold<double>(0, (sum, s) => sum + s.coverageArea);
    final avgEfficiency = systems.isEmpty 
        ? 0.0 
        : systems.fold<double>(0, (sum, s) => sum + s.efficiency) / systems.length;

    return Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(
            child: _buildOverviewCard(
              'Total Systems',
              totalSystems.toString(),
              Icons.water_drop,
              AppTheme.primaryBlue,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: _buildOverviewCard(
              'Active',
              activeSystems.toString(),
              Icons.play_circle,
              AppTheme.successGreen,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: _buildOverviewCard(
              'Coverage',
              '${totalCoverage.toStringAsFixed(1)} ha',
              Icons.grid_on,
              AppTheme.accentBlue,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: _buildOverviewCard(
              'Efficiency',
              '${avgEfficiency.toStringAsFixed(1)}%',
              Icons.eco,
              AppTheme.primaryGreen,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOverviewCard(String title, String value, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.2)),
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: 20),
          const SizedBox(height: 4),
          Text(
            value,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          Text(
            title,
            style: TextStyle(
              fontSize: 10,
              color: Colors.grey.shade600,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildSystemCard(IrrigationSystem system) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: AppTheme.cardShadow,
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        AppTheme.primaryBlue,
                        AppTheme.accentBlue,
                      ],
                    ),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Icon(
                    _getSystemIcon(system.type),
                    color: Colors.white,
                    size: 32,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            system.name,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: system.isActive 
                                  ? AppTheme.successGreen 
                                  : Colors.grey,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              system.isActive ? 'Active' : 'Inactive',
                              style: const TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        system.type.displayName,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey.shade600,
                        ),
                      ),
                      Text(
                        'Coverage: ${system.coverageArea} ha • Efficiency: ${system.efficiency.toStringAsFixed(1)}%',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey.shade500,
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    if (system.needsMaintenance)
                      Icon(
                        Icons.warning,
                        color: AppTheme.warningOrange,
                        size: 20,
                      ),
                    const SizedBox(height: 8),
                    Icon(
                      Icons.chevron_right,
                      color: Colors.grey.shade400,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: AppTheme.primaryBlue.withOpacity(0.05),
              borderRadius: const BorderRadius.vertical(
                bottom: Radius.circular(16),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: _buildSystemStat(
                    'Flow Rate',
                    '${system.waterFlowRate.toInt()} L/h',
                    Icons.speed,
                  ),
                ),
                Expanded(
                  child: _buildSystemStat(
                    'Total Cost',
                    '₹${system.totalCost.toStringAsFixed(0)}',
                    Icons.currency_rupee,
                  ),
                ),
                Expanded(
                  child: _buildSystemStat(
                    'Schedules',
                    '${system.schedules.length}',
                    Icons.schedule,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSystemStat(String label, String value, IconData icon) {
    return Column(
      children: [
        Icon(
          icon,
          size: 16,
          color: AppTheme.primaryBlue,
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: 10,
            color: Colors.grey.shade600,
          ),
        ),
      ],
    );
  }

  Widget _buildSchedulesTab() {
    return const Center(
      child: Text('Irrigation schedules coming soon...'),
    );
  }

  Widget _buildAnalyticsTab() {
    return const Center(
      child: Text('Water usage analytics coming soon...'),
    );
  }

  Widget _buildCalculatorTab() {
    return const IrrigationCalculator();
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.water_drop_outlined,
            size: 80,
            color: Colors.grey.shade400,
          ),
          const SizedBox(height: 16),
          Text(
            'No irrigation systems found',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.grey.shade600,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Set up your first irrigation system',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey.shade500,
            ),
          ),
        ],
      ),
    );
  }

  void _showIrrigationCalculator() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.8,
        maxChildSize: 0.95,
        minChildSize: 0.5,
        builder: (context, scrollController) => Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
          ),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    const Text(
                      'Irrigation Cost Calculator',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.close),
                    ),
                  ],
                ),
              ),
              const Expanded(
                child: IrrigationCalculator(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showScheduleManager() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Schedule manager coming soon!'),
        backgroundColor: AppTheme.primaryBlue,
      ),
    );
  }

  IconData _getSystemIcon(IrrigationType type) {
    switch (type) {
      case IrrigationType.drip:
        return Icons.water_drop;
      case IrrigationType.sprinkler:
        return Icons.grain;
      case IrrigationType.furrow:
        return Icons.linear_scale;
      case IrrigationType.flood:
        return Icons.waves;
      case IrrigationType.centerPivot:
        return Icons.rotate_right;
      case IrrigationType.microSpray:
        return Icons.scatter_plot;
    }
  }

  List<IrrigationSystem> _getMockIrrigationSystems() {
    final now = DateTime.now();
    return [
      IrrigationSystem(
        id: '1',
        name: 'Field A Drip System',
        type: IrrigationType.drip,
        fieldId: 'field_1',
        coverageArea: 2.5,
        waterFlowRate: 500,
        efficiency: 90.0,
        installationDate: now.subtract(const Duration(days: 365)),
        totalCost: 75000,
        maintenanceCost: 5000,
        schedules: [],
        createdAt: now,
        updatedAt: now,
      ),
      IrrigationSystem(
        id: '2',
        name: 'Field B Sprinkler',
        type: IrrigationType.sprinkler,
        fieldId: 'field_2',
        coverageArea: 5.0,
        waterFlowRate: 1200,
        efficiency: 75.0,
        installationDate: now.subtract(const Duration(days: 200)),
        totalCost: 120000,
        schedules: [],
        createdAt: now,
        updatedAt: now,
      ),
    ];
  }
}
