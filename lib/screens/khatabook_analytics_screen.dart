import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/khatabook_models.dart';

class KhatabookAnalyticsScreen extends StatefulWidget {
  const KhatabookAnalyticsScreen({Key? key}) : super(key: key);

  @override
  State<KhatabookAnalyticsScreen> createState() => _KhatabookAnalyticsScreenState();
}

class _KhatabookAnalyticsScreenState extends State<KhatabookAnalyticsScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;
  String _selectedPeriod = 'This Year';
  
  // Sample data for demonstration
  final Map<String, double> _monthlyProfit = {
    'Jan': 15000,
    'Feb': 12000,
    'Mar': 18000,
    'Apr': 22000,
    'May': 25000,
    'Jun': 20000,
    'Jul': 28000,
    'Aug': 35000,
    'Sep': 30000,
    'Oct': 27000,
    'Nov': 32000,
    'Dec': 29000,
  };

  final Map<String, double> _cropProfitability = {
    'Wheat': 45000,
    'Rice': 38000,
    'Corn': 22000,
    'Cotton': 35000,
    'Sugarcane': 55000,
  };

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
    final theme = Theme.of(context);
    
    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      body: CustomScrollView(
        slivers: [
          SliverAppBar.large(
            backgroundColor: Colors.blue.shade600,
            foregroundColor: Colors.white,
            title: const Text(
              'Farm Analytics & Insights',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            centerTitle: false,
            pinned: true,
            actions: [
              IconButton(
                icon: const Icon(Icons.download),
                onPressed: _exportReport,
              ),
              IconButton(
                icon: const Icon(Icons.share),
                onPressed: _shareReport,
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                // Period Selector
                Container(
                  margin: const EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Performance Analytics',
                        style: theme.textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      OutlinedButton.icon(
                        icon: const Icon(Icons.calendar_today),
                        label: Text(_selectedPeriod),
                        onPressed: _showPeriodSelector,
                      ),
                    ],
                  ),
                ),
                
                // Key Metrics Cards
                _buildKeyMetrics(),
                
                // Tab Bar
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  child: TabBar(
                    controller: _tabController,
                    tabs: const [
                      Tab(text: 'Trends'),
                      Tab(text: 'Crops'),
                      Tab(text: 'Insights'),
                      Tab(text: 'Forecasts'),
                    ],
                  ),
                ),
                
                const SizedBox(height: 16),
                
                // Tab Views
                SizedBox(
                  height: 800,
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      _buildTrendsTab(),
                      _buildCropsTab(),
                      _buildInsightsTab(),
                      _buildForecastsTab(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildKeyMetrics() {
    return Container(
      height: 120,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _buildMetricCard(
            'ROI',
            '34.5%',
            Icons.trending_up,
            Colors.green,
            '+5.2% from last period',
          ),
          _buildMetricCard(
            'Profit Margin',
            '42.8%',
            Icons.pie_chart,
            Colors.blue,
            '+3.1% improvement',
          ),
          _buildMetricCard(
            'Cost per Acre',
            '₹18,450',
            Icons.agriculture,
            Colors.orange,
            '-2.5% reduction',
          ),
          _buildMetricCard(
            'Yield Efficiency',
            '87.3%',
            Icons.speed,
            Colors.purple,
            '+8.7% increase',
          ),
        ],
      ),
    );
  }

  Widget _buildMetricCard(String title, String value, IconData icon, Color color, String change) {
    return Container(
      width: 180,
      height: 120, // Fixed height to prevent overflow
      margin: const EdgeInsets.only(right: 12),
      child: Card(
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(12), // Reduced padding
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween, // Distribute space evenly
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(icon, color: color, size: 20), // Smaller icon
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 1),
                    decoration: BoxDecoration(
                      color: Colors.green.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Icon(
                      Icons.arrow_upward,
                      color: Colors.green,
                      size: 10, // Smaller arrow
                    ),
                  ),
                ],
              ),
              Flexible(
                child: Text(
                  value,
                  style: const TextStyle(
                    fontSize: 18, // Slightly smaller
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Flexible(
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 11,
                    color: Colors.grey.shade600,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Flexible(
                child: Text(
                  change,
                  style: TextStyle(
                    fontSize: 9,
                    color: Colors.green.shade600,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTrendsTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Monthly Profit Trend
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Monthly Profit Trend',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    height: 200,
                    child: _buildProfitChart(),
                  ),
                ],
              ),
            ),
          ),
          
          const SizedBox(height: 16),
          
          // Revenue vs Expenses
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Revenue vs Expenses Comparison',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildRevenueExpenseComparison(),
                ],
              ),
            ),
          ),
          
          const SizedBox(height: 16),
          
          // Seasonal Analysis
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Seasonal Performance',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildSeasonalAnalysis(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCropsTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Crop Profitability Ranking
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Crop Profitability Ranking',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildCropRanking(),
                ],
              ),
            ),
          ),
          
          const SizedBox(height: 16),
          
          // Yield vs Investment Analysis
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Yield vs Investment Analysis',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    height: 200,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Center(
                      child: Text(
                        'Scatter Plot: Investment vs Yield\n(Interactive Chart)',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          
          const SizedBox(height: 16),
          
          // Crop Performance Matrix
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Crop Performance Matrix',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildPerformanceMatrix(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInsightsTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // AI-Powered Insights
          Card(
            color: Colors.blue.shade50,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.psychology, color: Colors.blue.shade600, size: 32),
                      const SizedBox(width: 12),
                      Text(
                        'AI-Powered Insights',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue.shade800,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  _buildInsightCard(
                    '🌾 Crop Optimization',
                    'Consider increasing wheat acreage by 15% next season. Analysis shows 23% higher profit potential.',
                    Colors.green,
                  ),
                  _buildInsightCard(
                    '💰 Cost Reduction',
                    'Fertilizer expenses can be reduced by 12% through soil testing and precise application.',
                    Colors.orange,
                  ),
                  _buildInsightCard(
                    '⏰ Timing Optimization',
                    'Planting rice 2 weeks earlier could increase yield by 8% based on weather patterns.',
                    Colors.blue,
                  ),
                ],
              ),
            ),
          ),
          
          const SizedBox(height: 16),
          
          // Market Trends & Recommendations
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Market Trends & Recommendations',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildMarketTrendItem(
                    'Organic Wheat',
                    'High Demand',
                    '+35% price premium',
                    Colors.green,
                  ),
                  _buildMarketTrendItem(
                    'Basmati Rice',
                    'Export Opportunity',
                    '+28% export demand',
                    Colors.blue,
                  ),
                  _buildMarketTrendItem(
                    'Cotton',
                    'Price Volatility',
                    'Consider hedging',
                    Colors.orange,
                  ),
                ],
              ),
            ),
          ),
          
          const SizedBox(height: 16),
          
          // Benchmarking
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Performance Benchmarking',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildBenchmarkItem('Profit per Acre', '₹12,500', '₹15,000', 83.3),
                  _buildBenchmarkItem('Yield Efficiency', '87.3%', '92.0%', 94.9),
                  _buildBenchmarkItem('Cost Efficiency', '78.5%', '85.0%', 92.4),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildForecastsTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Revenue Forecast
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Revenue Forecast (Next 6 Months)',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    height: 200,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Center(
                      child: Text(
                        'Revenue Forecast Chart\n(Predictive Analytics)',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildForecastMetric('Expected Revenue', '₹3,25,000'),
                      _buildForecastMetric('Confidence', '87%'),
                      _buildForecastMetric('Growth Rate', '+12.5%'),
                    ],
                  ),
                ],
              ),
            ),
          ),
          
          const SizedBox(height: 16),
          
          // Weather Impact Analysis
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Weather Impact Analysis',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildWeatherImpactItem(
                    'Monsoon Forecast',
                    'Normal Rainfall Expected',
                    'Positive impact on Kharif crops',
                    Colors.green,
                  ),
                  _buildWeatherImpactItem(
                    'Temperature Trends',
                    '2°C Above Average',
                    'May affect wheat quality',
                    Colors.orange,
                  ),
                  _buildWeatherImpactItem(
                    'Drought Risk',
                    'Low Risk (15%)',
                    'Adequate water availability',
                    Colors.blue,
                  ),
                ],
              ),
            ),
          ),
          
          const SizedBox(height: 16),
          
          // Investment Recommendations
          Card(
            color: Colors.green.shade50,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.attach_money, color: Colors.green.shade600, size: 32),
                      const SizedBox(width: 12),
                      Text(
                        'Investment Recommendations',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.green.shade800,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  _buildInvestmentRecommendation(
                    'Drip Irrigation System',
                    '₹1,50,000',
                    'Expected ROI: 45% in 2 years',
                    'Water savings: 40%',
                  ),
                  _buildInvestmentRecommendation(
                    'Soil Health Improvement',
                    '₹35,000',
                    'Expected yield increase: 15%',
                    'Organic matter boost',
                  ),
                  _buildInvestmentRecommendation(
                    'Storage Infrastructure',
                    '₹2,25,000',
                    'Reduce post-harvest losses',
                    'Better price realization',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfitChart() {
    // Simplified chart representation
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.green.shade100, Colors.green.shade50],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: _monthlyProfit.entries.map((entry) {
                final height = (entry.value / 40000) * 150; // Scale to fit container
                return Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      width: 20,
                      height: height,
                      decoration: BoxDecoration(
                        color: Colors.green.shade600,
                        borderRadius: const BorderRadius.vertical(top: Radius.circular(4)),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      entry.key,
                      style: const TextStyle(fontSize: 10),
                    ),
                  ],
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRevenueExpenseComparison() {
    return Column(
      children: [
        _buildComparisonBar('Revenue', 85000, Colors.green),
        const SizedBox(height: 8),
        _buildComparisonBar('Expenses', 52000, Colors.red),
        const SizedBox(height: 8),
        _buildComparisonBar('Profit', 33000, Colors.blue),
      ],
    );
  }

  Widget _buildComparisonBar(String label, double amount, Color color) {
    final percentage = amount / 85000; // Scale against maximum revenue
    return Row(
      children: [
        SizedBox(
          width: 80,
          child: Text(label),
        ),
        Expanded(
          child: Container(
            height: 20,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(10),
            ),
            child: FractionallySizedBox(
              alignment: Alignment.centerLeft,
              widthFactor: percentage,
              child: Container(
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 8),
        SizedBox(
          width: 80,
          child: Text(
            '₹${NumberFormat('#,##,###').format(amount)}',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

  Widget _buildSeasonalAnalysis() {
    final seasons = [
      {'name': 'Kharif', 'profit': 45000, 'color': Colors.green},
      {'name': 'Rabi', 'profit': 38000, 'color': Colors.orange},
      {'name': 'Zaid', 'profit': 22000, 'color': Colors.blue},
    ];

    return Column(
      children: seasons.map((season) {
        return Container(
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: (season['color'] as Color).withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                season['name'] as String,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                '₹${NumberFormat('#,##,###').format(season['profit'])}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: season['color'] as Color,
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _buildCropRanking() {
    final sortedCrops = _cropProfitability.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));

    return Column(
      children: sortedCrops.asMap().entries.map((entry) {
        final index = entry.key;
        final crop = entry.value;
        final colors = [Colors.amber, Colors.grey, Colors.brown, Colors.blue, Colors.purple];
        
        return Container(
          margin: const EdgeInsets.only(bottom: 8),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: colors[index % colors.length].withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  color: colors[index % colors.length],
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    '${index + 1}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  crop.key,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Text(
                '₹${NumberFormat('#,##,###').format(crop.value)}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: colors[index % colors.length],
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _buildPerformanceMatrix() {
    final crops = [
      {'name': 'Wheat', 'yield': 92, 'cost': 78, 'profit': 85},
      {'name': 'Rice', 'yield': 88, 'cost': 82, 'profit': 80},
      {'name': 'Corn', 'yield': 76, 'cost': 74, 'profit': 72},
      {'name': 'Cotton', 'yield': 84, 'cost': 86, 'profit': 78},
    ];

    return Table(
      children: [
        const TableRow(
          decoration: BoxDecoration(color: Colors.grey),
          children: [
            Padding(
              padding: EdgeInsets.all(8),
              child: Text('Crop', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: Text('Yield %', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: Text('Cost %', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: Text('Profit %', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
            ),
          ],
        ),
        ...crops.map((crop) => TableRow(
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: Text(crop['name'] as String),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Text('${crop['yield']}%'),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Text('${crop['cost']}%'),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Text('${crop['profit']}%'),
            ),
          ],
        )),
      ],
    );
  }

  Widget _buildInsightCard(String title, String description, Color color) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: color.withOpacity(0.8),
            ),
          ),
          const SizedBox(height: 4),
          Text(description),
        ],
      ),
    );
  }

  Widget _buildMarketTrendItem(String commodity, String trend, String detail, Color color) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: color.withOpacity(0.1),
        child: Icon(Icons.trending_up, color: color),
      ),
      title: Text(commodity),
      subtitle: Text(detail),
      trailing: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Text(
          trend,
          style: TextStyle(
            color: color,
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
        ),
      ),
    );
  }

  Widget _buildBenchmarkItem(String metric, String yourValue, String benchmark, double score) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            metric,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Your Value: $yourValue'),
              Text('Benchmark: $benchmark'),
            ],
          ),
          const SizedBox(height: 8),
          LinearProgressIndicator(
            value: score / 100,
            backgroundColor: Colors.grey.shade300,
            valueColor: AlwaysStoppedAnimation<Color>(
              score >= 90 ? Colors.green : score >= 70 ? Colors.orange : Colors.red,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Score: ${score.toStringAsFixed(1)}%',
            style: TextStyle(
              fontSize: 12,
              color: score >= 90 ? Colors.green : score >= 70 ? Colors.orange : Colors.red,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildForecastMetric(String label, String value) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey.shade600,
          ),
        ),
      ],
    );
  }

  Widget _buildWeatherImpactItem(String title, String forecast, String impact, Color color) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(Icons.wb_sunny, color: color),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(forecast),
                Text(
                  impact,
                  style: TextStyle(
                    color: color,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInvestmentRecommendation(String title, String cost, String roi, String benefit) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.green.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                cost,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.green.shade600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(roi),
          Text(
            benefit,
            style: TextStyle(
              color: Colors.grey.shade600,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  void _showPeriodSelector() {
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Select Analysis Period',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            ...['This Month', 'Last 3 Months', 'This Year', 'Last Year', 'All Time'].map(
              (period) => ListTile(
                title: Text(period),
                trailing: _selectedPeriod == period
                    ? const Icon(Icons.check, color: Colors.green)
                    : null,
                onTap: () {
                  setState(() {
                    _selectedPeriod = period;
                  });
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _exportReport() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Exporting analytics report...'),
        backgroundColor: Colors.blue,
      ),
    );
  }

  void _shareReport() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Sharing analytics report...'),
        backgroundColor: Colors.blue,
      ),
    );
  }
}
