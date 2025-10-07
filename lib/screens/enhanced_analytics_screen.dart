import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fl_chart/fl_chart.dart';
import '../themes/material3_theme.dart';

// Enhanced Analytics Screen with Material 3 Design
class EnhancedAnalyticsScreen extends ConsumerStatefulWidget {
  const EnhancedAnalyticsScreen({super.key});

  @override
  ConsumerState<EnhancedAnalyticsScreen> createState() => _EnhancedAnalyticsScreenState();
}

class _EnhancedAnalyticsScreenState extends ConsumerState<EnhancedAnalyticsScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;
  late AnimationController _animationController;
  late Animation<double> _slideAnimation;
  
  String _selectedPeriod = 'This Month';
  final List<String> _periods = ['This Week', 'This Month', 'This Quarter', 'This Year'];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _animationController = AnimationController(
      duration: Duration(milliseconds: 600),
      vsync: this,
    );
    _slideAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOutCubic),
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _tabController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: _buildAppBar(colorScheme),
      body: SlideTransition(
        position: Tween<Offset>(
          begin: Offset(0, 0.1),
          end: Offset.zero,
        ).animate(_slideAnimation),
        child: FadeTransition(
          opacity: _slideAnimation,
          child: Column(
            children: [
              _buildPeriodSelector(colorScheme),
              _buildTabBar(colorScheme),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    _buildOverviewTab(colorScheme),
                    _buildCropsTab(colorScheme),
                    _buildFinancialTab(colorScheme),
                    _buildProductivityTab(colorScheme),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(ColorScheme colorScheme) {
    return AppBar(
      title: Text(
        'Farm Analytics',
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
          fontWeight: FontWeight.w600,
        ),
      ),
      backgroundColor: colorScheme.surface,
      elevation: 0,
      actions: [
        IconButton(
          onPressed: () => _showExportOptions(colorScheme),
          icon: Icon(Icons.download),
          tooltip: 'Export data',
        ),
      ],
    );
  }

  Widget _buildPeriodSelector(ColorScheme colorScheme) {
    return M3Card(
      margin: EdgeInsets.all(16),
      child: Row(
        children: [
          Icon(Icons.date_range, color: colorScheme.onSurfaceVariant),
          SizedBox(width: 8),
          Text(
            'Period:',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          SizedBox(width: 16),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: _periods.map((period) {
                  final isSelected = _selectedPeriod == period;
                  return Padding(
                    padding: EdgeInsets.only(right: 8),
                    child: M3Chip(
                      label: period,
                      selected: isSelected,
                      onTap: () => setState(() => _selectedPeriod = period),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabBar(ColorScheme colorScheme) {
    return TabBar(
      controller: _tabController,
      labelColor: colorScheme.primary,
      unselectedLabelColor: colorScheme.onSurfaceVariant,
      indicatorColor: colorScheme.primary,
      isScrollable: true,
      tabs: [
        Tab(text: 'Overview', icon: Icon(Icons.dashboard)),
        Tab(text: 'Crops', icon: Icon(Icons.eco)),
        Tab(text: 'Financial', icon: Icon(Icons.attach_money)),
        Tab(text: 'Productivity', icon: Icon(Icons.trending_up)),
      ],
    );
  }

  Widget _buildOverviewTab(ColorScheme colorScheme) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          // Key Metrics Grid
          GridView.count(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 1.5,
            children: [
              _buildMetricCard(
                'Total Area',
                '25.5 ha',
                Icons.crop_free,
                colorScheme.primaryContainer,
                colorScheme.onPrimaryContainer,
                colorScheme,
              ),
              _buildMetricCard(
                'Active Crops',
                '8',
                Icons.eco,
                colorScheme.secondaryContainer,
                colorScheme.onSecondaryContainer,
                colorScheme,
              ),
              _buildMetricCard(
                'Revenue',
                '₹2,45,000',
                Icons.currency_rupee,
                colorScheme.tertiaryContainer,
                colorScheme.onTertiaryContainer,
                colorScheme,
              ),
              _buildMetricCard(
                'Profit Margin',
                '23.5%',
                Icons.trending_up,
                Colors.green.withOpacity(0.2),
                Colors.green.shade700,
                colorScheme,
              ),
            ],
          ),
          SizedBox(height: 16),
          
          // Weather Impact Chart
          M3Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Weather Impact on Yield',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                SizedBox(height: 16),
                Container(
                  height: 200,
                  child: LineChart(
                    LineChartData(
                      lineBarsData: [
                        LineChartBarData(
                          spots: [
                            FlSpot(0, 3),
                            FlSpot(1, 4),
                            FlSpot(2, 3.5),
                            FlSpot(3, 5),
                            FlSpot(4, 4.5),
                            FlSpot(5, 6),
                          ],
                          isCurved: true,
                          color: colorScheme.primary,
                          barWidth: 3,
                          dotData: FlDotData(show: true),
                        ),
                      ],
                      borderData: FlBorderData(show: false),
                      gridData: FlGridData(show: true),
                      titlesData: FlTitlesData(
                        leftTitles: AxisTitles(
                          sideTitles: SideTitles(showTitles: true, reservedSize: 40),
                        ),
                        bottomTitles: AxisTitles(
                          sideTitles: SideTitles(showTitles: true, reservedSize: 30),
                        ),
                        topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                        rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCropsTab(ColorScheme colorScheme) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          // Crop Distribution Pie Chart
          M3Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Crop Distribution by Area',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                SizedBox(height: 16),
                Container(
                  height: 250,
                  child: PieChart(
                    PieChartData(
                      sections: [
                        PieChartSectionData(
                          value: 40,
                          title: 'Rice\n40%',
                          color: colorScheme.primary,
                          radius: 100,
                        ),
                        PieChartSectionData(
                          value: 30,
                          title: 'Wheat\n30%',
                          color: colorScheme.secondary,
                          radius: 100,
                        ),
                        PieChartSectionData(
                          value: 20,
                          title: 'Vegetables\n20%',
                          color: colorScheme.tertiary,
                          radius: 100,
                        ),
                        PieChartSectionData(
                          value: 10,
                          title: 'Others\n10%',
                          color: colorScheme.outline,
                          radius: 100,
                        ),
                      ],
                      centerSpaceRadius: 0,
                      sectionsSpace: 2,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
          
          // Crop Performance List
          M3Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Crop Performance',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                SizedBox(height: 16),
                ..._sampleCropPerformance.map((crop) => _buildCropPerformanceItem(crop, colorScheme)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFinancialTab(ColorScheme colorScheme) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          // Revenue vs Expenses Chart
          M3Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Revenue vs Expenses',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                SizedBox(height: 16),
                Container(
                  height: 200,
                  child: BarChart(
                    BarChartData(
                      barGroups: [
                        BarChartGroupData(x: 0, barRods: [
                          BarChartRodData(toY: 8, color: Colors.green),
                          BarChartRodData(toY: 6, color: Colors.red),
                        ]),
                        BarChartGroupData(x: 1, barRods: [
                          BarChartRodData(toY: 10, color: Colors.green),
                          BarChartRodData(toY: 7, color: Colors.red),
                        ]),
                        BarChartGroupData(x: 2, barRods: [
                          BarChartRodData(toY: 12, color: Colors.green),
                          BarChartRodData(toY: 8, color: Colors.red),
                        ]),
                      ],
                      borderData: FlBorderData(show: false),
                      gridData: FlGridData(show: true),
                      titlesData: FlTitlesData(
                        leftTitles: AxisTitles(
                          sideTitles: SideTitles(showTitles: true, reservedSize: 40),
                        ),
                        bottomTitles: AxisTitles(
                          sideTitles: SideTitles(showTitles: true, reservedSize: 30),
                        ),
                        topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                        rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildLegendItem('Revenue', Colors.green),
                    _buildLegendItem('Expenses', Colors.red),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
          
          // Financial Summary
          M3Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Financial Summary',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                SizedBox(height: 16),
                _buildFinancialItem('Total Revenue', '₹2,45,000', Icons.trending_up, Colors.green),
                _buildFinancialItem('Total Expenses', '₹1,87,500', Icons.trending_down, Colors.red),
                _buildFinancialItem('Net Profit', '₹57,500', Icons.account_balance, colorScheme.primary),
                _buildFinancialItem('ROI', '23.5%', Icons.percent, Colors.orange),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductivityTab(ColorScheme colorScheme) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          M3Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Productivity Metrics',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                SizedBox(height: 16),
                Text(
                  'Detailed productivity analysis coming soon...',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMetricCard(String title, String value, IconData icon, 
      Color backgroundColor, Color foregroundColor, ColorScheme colorScheme) {
    return M3Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: foregroundColor, size: 24),
          ),
          SizedBox(height: 8),
          Text(
            value,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            title,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildCropPerformanceItem(Map<String, dynamic> crop, ColorScheme colorScheme) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  crop['name'],
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  '${crop['area']} ha • ${crop['yield']} kg/ha',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: crop['performance'] == 'Good' ? Colors.green.withOpacity(0.2) : Colors.orange.withOpacity(0.2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              crop['performance'],
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: crop['performance'] == 'Good' ? Colors.green : Colors.orange,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLegendItem(String label, Color color) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 16,
          height: 16,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        SizedBox(width: 8),
        Text(label, style: Theme.of(context).textTheme.bodySmall),
      ],
    );
  }

  Widget _buildFinancialItem(String title, String value, IconData icon, Color color) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Icon(icon, color: color, size: 20),
          SizedBox(width: 12),
          Expanded(
            child: Text(
              title,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          Text(
            value,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w600,
              color: color,
            ),
          ),
        ],
      ),
    );
  }

  void _showExportOptions(ColorScheme colorScheme) {
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Export Options', style: Theme.of(context).textTheme.titleMedium),
            SizedBox(height: 16),
            ListTile(
              leading: Icon(Icons.picture_as_pdf),
              title: Text('Export as PDF'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: Icon(Icons.table_chart),
              title: Text('Export as Excel'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: Icon(Icons.share),
              title: Text('Share Report'),
              onTap: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
    );
  }
}

// Sample data
final List<Map<String, dynamic>> _sampleCropPerformance = [
  {'name': 'Rice (Basmati)', 'area': '10.5', 'yield': '4500', 'performance': 'Good'},
  {'name': 'Wheat (HD2967)', 'area': '8.0', 'yield': '3800', 'performance': 'Average'},
  {'name': 'Tomato (Hybrid)', 'area': '3.5', 'yield': '25000', 'performance': 'Good'},
  {'name': 'Onion (Nasik Red)', 'area': '2.5', 'yield': '18000', 'performance': 'Good'},
];