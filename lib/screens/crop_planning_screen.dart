import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../providers/theme_provider.dart';
import '../services/crop_planning_service.dart';
import '../services/localization_service.dart';
import '../widgets/shared_components.dart';

// Providers
final cropPlanningServiceProvider = Provider<CropPlanningService>((ref) => CropPlanningService());
final cropRecommendationsProvider = StateProvider<Map<String, dynamic>?>((ref) => null);
final selectedFieldSizeProvider = StateProvider<double>((ref) => 1.0);
final selectedSoilTypeProvider = StateProvider<String?>((ref) => null);
final selectedSoilPHProvider = StateProvider<double?>((ref) => null);
final loadingProvider = StateProvider<bool>((ref) => false);

class CropPlanningScreen extends ConsumerStatefulWidget {
  const CropPlanningScreen({super.key});

  @override
  ConsumerState<CropPlanningScreen> createState() => _CropPlanningScreenState();
}

class _CropPlanningScreenState extends ConsumerState<CropPlanningScreen>
    with TickerProviderStateMixin, AppAnimationMixin {
  late TabController _tabController;
  final PageController _pageController = PageController();
  int _currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    setupStandardAnimations();
    startStandardAnimations();
    // Delay the provider modification until after the widget tree is built
    Future.microtask(() => _loadRecommendations());
  }

  @override
  void dispose() {
    _tabController.dispose();
    _pageController.dispose();
    disposeStandardAnimations();
    super.dispose();
  }

  Future<void> _loadRecommendations() async {
    // Check if the widget is still mounted before modifying providers
    if (!mounted) return;
    
    ref.read(loadingProvider.notifier).state = true;
    
    try {
      final cropService = ref.read(cropPlanningServiceProvider);
      final fieldSize = ref.read(selectedFieldSizeProvider);
      final soilType = ref.read(selectedSoilTypeProvider);
      final soilPH = ref.read(selectedSoilPHProvider);
      
      // Mock coordinates for demonstration (Delhi)
      final recommendations = await cropService.getCropRecommendations(
        latitude: 28.6139,
        longitude: 77.2090,
        fieldSize: fieldSize,
        soilType: soilType,
        soilPH: soilPH,
        experienceLevel: 'intermediate',
      );
      
      if (mounted) {
        ref.read(cropRecommendationsProvider.notifier).state = recommendations;
      }
    } catch (e) {
      // Handle error
      print('Error loading recommendations: $e');
    } finally {
      if (mounted) {
        ref.read(loadingProvider.notifier).state = false;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final appSettings = ref.watch(appSettingsProvider);
    final languageCode = appSettings.locale.languageCode;
    final colorScheme = Theme.of(context).colorScheme;
    final isLoading = ref.watch(loadingProvider);
    final recommendations = ref.watch(cropRecommendationsProvider);

    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: RefreshIndicator(
        onRefresh: () async {
          await _loadRecommendations();
        },
        child: CustomScrollView(
          slivers: [
            StandardAppBar(
              title: 'Crop Planning',
              subtitle: 'Smart Recommendations & Analysis',
              icon: Icons.eco,
              statusChips: [
                StandardStatusChip(
                  label: '4 Seasons',
                  icon: Icons.calendar_month,
                  color: Colors.green,
                ),
                StandardStatusChip(
                  label: '15 Crops',
                  icon: Icons.agriculture,
                  color: Colors.blue,
                ),
                StandardStatusChip(
                  label: 'AI Ready',
                  icon: Icons.smart_toy,
                  color: Colors.purple,
                ),
              ],
              slideAnimation: headerSlideAnimation,
              fadeAnimation: headerFadeAnimation,
              colorScheme: colorScheme,
              actions: [
                IconButton(
                  onPressed: _loadRecommendations,
                  icon: Icon(isLoading ? Icons.hourglass_empty : Icons.refresh),
                ),
              ],
            ),
            SliverPadding(
              padding: const EdgeInsets.all(16),
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  if (isLoading && recommendations == null)
                    Container(
                      height: 200,
                      child: Center(child: CircularProgressIndicator()),
                    )
                  else if (recommendations == null)
                    _buildErrorState()
                  else ...[
                    _buildTabsSection(recommendations),
                    SizedBox(height: 20),
                    _buildTabContent(recommendations),
                  ],
                  const SizedBox(height: 100), // Space for FAB
                ]),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: StandardFloatingActionButton(
        label: 'New Plan',
        icon: Icons.add,
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('New Crop Plan feature coming soon!')),
          );
        },
        animation: floatingAnimation,
        colorScheme: colorScheme,
      ),
    );
  }

  Widget _buildTabsSection(Map<String, dynamic> data) {
    final colorScheme = Theme.of(context).colorScheme;
    
    return AnimatedBuilder(
      animation: cardStaggerAnimation,
      builder: (context, child) {
        return Transform.scale(
          scale: cardStaggerAnimation.value,
          child: Card(
            elevation: 2,
            color: colorScheme.surfaceVariant,
            child: TabBar(
              controller: _tabController,
              tabs: const [
                Tab(text: 'Recommendations', icon: Icon(Icons.lightbulb_outline)),
                Tab(text: 'Calendar', icon: Icon(Icons.calendar_month)),
                Tab(text: 'Analysis', icon: Icon(Icons.analytics)),
                Tab(text: 'Planning', icon: Icon(Icons.schedule)),
              ],
              labelColor: colorScheme.primary,
              unselectedLabelColor: colorScheme.onSurfaceVariant,
              indicator: BoxDecoration(
                color: colorScheme.primary.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildTabContent(Map<String, dynamic> data) {
    return Container(
      height: 600,
      child: TabBarView(
        controller: _tabController,
        children: [
          _buildRecommendationsTab(data),
          _buildCalendarTab(data),
          _buildAnalysisTab(data),
          _buildPlanningTab(data),
        ],
      ),
    );
  }

  Widget _buildErrorState() {
    final colorScheme = Theme.of(context).colorScheme;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.error_outline, size: 64, color: Colors.grey),
          const SizedBox(height: 16),
          Text(
            'Failed to load crop planning data',
            style: GoogleFonts.inter(fontSize: 18, color: Colors.grey),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: _loadRecommendations,
            child: Text('Retry'),
          ),
        ],
      ),
    );
  }

  Widget _buildRecommendationsTab(Map<String, dynamic> data) {
    final isDarkMode = ref.watch(themeModeProvider) == ThemeMode.dark;
    final recommendations = data['recommendations'] as List<dynamic>;
    final bestCrops = data['bestCrops'] as List<dynamic>;
    final seasonalAdvice = data['seasonalAdvice'] as String;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Field Configuration
          _buildFieldConfiguration(),
          
          const SizedBox(height: 24),
          
          // Seasonal Advice
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: isDarkMode
                    ? [Colors.blue[900]!, Colors.green[900]!]
                    : [Colors.blue[400]!, Colors.green[400]!],
              ),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.wb_sunny, color: Colors.white, size: 24),
                    const SizedBox(width: 12),
                    Text(
                      'Seasonal Advice',
                      style: GoogleFonts.inter(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Text(
                  seasonalAdvice,
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          
          const SizedBox(height: 24),
          
          // Best Crops
          Text(
            'Top Profitable Crops',
            style: GoogleFonts.inter(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: isDarkMode ? Colors.white : Colors.black87,
            ),
          ),
          const SizedBox(height: 16),
          
          ...bestCrops.map((crop) => _buildBestCropCard(crop)),
          
          const SizedBox(height: 24),
          
          // All Recommendations
          Text(
            'All Crop Recommendations',
            style: GoogleFonts.inter(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: isDarkMode ? Colors.white : Colors.black87,
            ),
          ),
          const SizedBox(height: 16),
          
          ...recommendations.map((rec) => _buildRecommendationCard(rec)),
        ],
      ),
    );
  }

  Widget _buildFieldConfiguration() {
    final isDarkMode = ref.watch(themeModeProvider) == ThemeMode.dark;
    final fieldSize = ref.watch(selectedFieldSizeProvider);
    final soilType = ref.watch(selectedSoilTypeProvider);
    
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: isDarkMode ? Colors.grey[800] : Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Field Configuration',
            style: GoogleFonts.inter(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: isDarkMode ? Colors.white : Colors.black87,
            ),
          ),
          const SizedBox(height: 16),
          
          // Field Size
          Row(
            children: [
              Expanded(
                child: Text(
                  'Field Size: ${fieldSize.toStringAsFixed(1)} hectares',
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    color: isDarkMode ? Colors.white70 : Colors.grey[700],
                  ),
                ),
              ),
              SizedBox(
                width: 150,
                child: Slider(
                  value: fieldSize,
                  min: 0.1,
                  max: 10.0,
                  divisions: 99,
                  onChanged: (value) {
                    ref.read(selectedFieldSizeProvider.notifier).state = value;
                  },
                ),
              ),
            ],
          ),
          
          const SizedBox(height: 16),
          
          // Soil Type
          DropdownButtonFormField<String>(
            value: soilType,
            decoration: InputDecoration(
              labelText: 'Soil Type',
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            ),
            items: ['Loamy', 'Clay', 'Sandy', 'Black Cotton', 'Alluvial']
                .map((type) => DropdownMenuItem(value: type, child: Text(type)))
                .toList(),
            onChanged: (value) {
              ref.read(selectedSoilTypeProvider.notifier).state = value;
            },
          ),
          
          const SizedBox(height: 16),
          
          // Update button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: _loadRecommendations,
              child: Text('Update Recommendations'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBestCropCard(Map<String, dynamic> crop) {
    final isDarkMode = ref.watch(themeModeProvider) == ThemeMode.dark;
    final cropId = crop['cropId'] as String;
    final profit = crop['profit'] as double;
    final roi = crop['roi'] as double;

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDarkMode ? Colors.grey[800] : Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.green, width: 2),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.green.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(Icons.eco, color: Colors.green, size: 24),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cropId.toUpperCase(),
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: isDarkMode ? Colors.white : Colors.black87,
                  ),
                ),
                Text(
                  'Expected Profit: ₹${NumberFormat('#,##,###').format(profit)}',
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    color: Colors.green,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  'ROI: ${roi.toStringAsFixed(1)}%',
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    color: isDarkMode ? Colors.white70 : Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
          Icon(Icons.trending_up, color: Colors.green),
        ],
      ),
    );
  }

  Widget _buildRecommendationCard(Map<String, dynamic> recommendation) {
    final isDarkMode = ref.watch(themeModeProvider) == ThemeMode.dark;
    final cropData = recommendation['cropData'] as Map<String, dynamic>;
    final suitabilityScore = recommendation['suitabilityScore'] as double;
    final recommendationText = recommendation['recommendation'] as String;

    Color getScoreColor(double score) {
      if (score >= 80) return Colors.green;
      if (score >= 60) return Colors.orange;
      return Colors.red;
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: isDarkMode ? Colors.grey[800] : Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    '🌾',
                    style: TextStyle(fontSize: 24),
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        cropData['name'],
                        style: GoogleFonts.inter(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: isDarkMode ? Colors.white : Colors.black87,
                        ),
                      ),
                      Text(
                        cropData['hindiName'],
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          color: isDarkMode ? Colors.white70 : Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: getScoreColor(suitabilityScore).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      '${suitabilityScore.toStringAsFixed(0)}%',
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: getScoreColor(suitabilityScore),
                      ),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    recommendationText,
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      color: getScoreColor(suitabilityScore),
                    ),
                  ),
                ],
              ),
            ],
          ),
          
          const SizedBox(height: 16),
          
          // Crop Details
          Row(
            children: [
              Expanded(
                child: _buildDetailChip(
                  'Season', 
                  cropData['season'], 
                  Icons.wb_sunny,
                  isDarkMode,
                ),
              ),
              Expanded(
                child: _buildDetailChip(
                  'Duration', 
                  '${cropData['duration']} days', 
                  Icons.schedule,
                  isDarkMode,
                ),
              ),
            ],
          ),
          
          const SizedBox(height: 12),
          
          Row(
            children: [
              Expanded(
                child: _buildDetailChip(
                  'Yield', 
                  '${cropData['yield']['average']} q/ha', 
                  Icons.agriculture,
                  isDarkMode,
                ),
              ),
              Expanded(
                child: _buildDetailChip(
                  'Price', 
                  '₹${cropData['marketPrice']['current']}/q', 
                  Icons.currency_rupee,
                  isDarkMode,
                ),
              ),
            ],
          ),
          
          const SizedBox(height: 16),
          
          // View Details Button
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              onPressed: () => _showCropDetails(cropData),
              child: Text('View Detailed Information'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailChip(String label, String value, IconData icon, bool isDarkMode) {
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        color: isDarkMode ? Colors.grey[700] : Colors.grey[100],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 16,
            color: isDarkMode ? Colors.white70 : Colors.grey[600],
          ),
          const SizedBox(width: 6),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: GoogleFonts.inter(
                  fontSize: 10,
                  color: isDarkMode ? Colors.white70 : Colors.grey[600],
                ),
              ),
              Text(
                value,
                style: GoogleFonts.inter(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: isDarkMode ? Colors.white : Colors.black87,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCalendarTab(Map<String, dynamic> data) {
    final isDarkMode = ref.watch(themeModeProvider) == ThemeMode.dark;
    final calendar = data['calendar'] as Map<String, dynamic>;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Crop Calendar',
            style: GoogleFonts.inter(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: isDarkMode ? Colors.white : Colors.black87,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Monthly planting and harvesting schedule',
            style: GoogleFonts.inter(
              fontSize: 14,
              color: isDarkMode ? Colors.white70 : Colors.grey[600],
            ),
          ),
          const SizedBox(height: 24),
          
          ...calendar.entries.map((entry) => _buildMonthCard(
            entry.key,
            entry.value as List<dynamic>,
            isDarkMode,
          )),
        ],
      ),
    );
  }

  Widget _buildMonthCard(String month, List<dynamic> activities, bool isDarkMode) {
    if (activities.isEmpty) return const SizedBox.shrink();

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: isDarkMode ? Colors.grey[800] : Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            month,
            style: GoogleFonts.inter(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: isDarkMode ? Colors.white : Colors.black87,
            ),
          ),
          const SizedBox(height: 12),
          
          ...activities.map((activity) => Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Row(
              children: [
                Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: activity['activity'] == 'Planting' 
                        ? Colors.green 
                        : Colors.orange,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    '${activity['crop']} - ${activity['activity']}',
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      color: isDarkMode ? Colors.white70 : Colors.grey[700],
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: activity['priority'] == 'High' 
                        ? Colors.red.withOpacity(0.1)
                        : Colors.blue.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    activity['priority'],
                    style: GoogleFonts.inter(
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                      color: activity['priority'] == 'High' 
                          ? Colors.red 
                          : Colors.blue,
                    ),
                  ),
                ),
              ],
            ),
          )),
        ],
      ),
    );
  }

  Widget _buildAnalysisTab(Map<String, dynamic> data) {
    final isDarkMode = ref.watch(themeModeProvider) == ThemeMode.dark;
    final profitability = data['profitability'] as Map<String, dynamic>;
    final riskAssessment = data['riskAssessment'] as Map<String, dynamic>;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Profitability Analysis',
            style: GoogleFonts.inter(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: isDarkMode ? Colors.white : Colors.black87,
            ),
          ),
          const SizedBox(height: 16),
          
          ...profitability.entries.map((entry) => 
              _buildProfitabilityCard(entry.key, entry.value, isDarkMode)),
          
          const SizedBox(height: 24),
          
          Text(
            'Risk Assessment',
            style: GoogleFonts.inter(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: isDarkMode ? Colors.white : Colors.black87,
            ),
          ),
          const SizedBox(height: 16),
          
          ...riskAssessment.entries.map((entry) => 
              _buildRiskCard(entry.key, entry.value, isDarkMode)),
        ],
      ),
    );
  }

  Widget _buildProfitabilityCard(String cropId, Map<String, dynamic> data, bool isDarkMode) {
    final revenue = data['revenue'] as double;
    final profit = data['profit'] as double;
    final roi = data['roi'] as double;

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: isDarkMode ? Colors.grey[800] : Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            cropId.toUpperCase(),
            style: GoogleFonts.inter(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: isDarkMode ? Colors.white : Colors.black87,
            ),
          ),
          const SizedBox(height: 16),
          
          Row(
            children: [
              Expanded(
                child: _buildMetricCard(
                  'Revenue',
                  '₹${NumberFormat('#,##,###').format(revenue)}',
                  Colors.blue,
                  isDarkMode,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildMetricCard(
                  'Profit',
                  '₹${NumberFormat('#,##,###').format(profit)}',
                  Colors.green,
                  isDarkMode,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildMetricCard(
                  'ROI',
                  '${roi.toStringAsFixed(1)}%',
                  Colors.orange,
                  isDarkMode,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMetricCard(String label, String value, Color color, bool isDarkMode) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Text(
            value,
            style: GoogleFonts.inter(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: color,
            ),
          ),
          Text(
            label,
            style: GoogleFonts.inter(
              fontSize: 12,
              color: isDarkMode ? Colors.white70 : Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRiskCard(String cropId, Map<String, dynamic> data, bool isDarkMode) {
    final overallRisk = data['overallRisk'] as String;
    final riskScore = data['riskScore'] as double;
    final specificRisks = data['specificRisks'] as List<dynamic>;

    Color getRiskColor(String risk) {
      switch (risk) {
        case 'Low': return Colors.green;
        case 'Medium': return Colors.orange;
        case 'High': return Colors.red;
        default: return Colors.grey;
      }
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: isDarkMode ? Colors.grey[800] : Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                cropId.toUpperCase(),
                style: GoogleFonts.inter(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: isDarkMode ? Colors.white : Colors.black87,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: getRiskColor(overallRisk).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  '$overallRisk Risk',
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: getRiskColor(overallRisk),
                  ),
                ),
              ),
            ],
          ),
          
          if (specificRisks.isNotEmpty) ...[
            const SizedBox(height: 12),
            Text(
              'Specific Risks:',
              style: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: isDarkMode ? Colors.white70 : Colors.grey[700],
              ),
            ),
            const SizedBox(height: 8),
            ...specificRisks.map((risk) => Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: Row(
                children: [
                  Icon(Icons.warning_amber, size: 16, color: Colors.orange),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      risk.toString(),
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        color: isDarkMode ? Colors.white70 : Colors.grey[600],
                      ),
                    ),
                  ),
                ],
              ),
            )),
          ],
        ],
      ),
    );
  }

  Widget _buildPlanningTab(Map<String, dynamic> data) {
    final isDarkMode = ref.watch(themeModeProvider) == ThemeMode.dark;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Crop Planning Tools',
            style: GoogleFonts.inter(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: isDarkMode ? Colors.white : Colors.black87,
            ),
          ),
          const SizedBox(height: 24),
          
          // Planning Tools
          _buildPlanningTool(
            'Crop Schedule Calculator',
            'Calculate planting and harvesting dates',
            Icons.schedule,
            () => _showScheduleCalculator(),
            isDarkMode,
          ),
          
          _buildPlanningTool(
            'Field Layout Planner',
            'Plan your field layout and crop rotation',
            Icons.grid_view,
            () => _showFieldPlanner(),
            isDarkMode,
          ),
          
          _buildPlanningTool(
            'Resource Calculator',
            'Calculate seeds, fertilizer, and labor requirements',
            Icons.calculate,
            () => _showResourceCalculator(),
            isDarkMode,
          ),
          
          _buildPlanningTool(
            'Market Price Tracker',
            'Track market prices and trends',
            Icons.trending_up,
            () => _showPriceTracker(),
            isDarkMode,
          ),
        ],
      ),
    );
  }

  Widget _buildPlanningTool(
    String title,
    String description,
    IconData icon,
    VoidCallback onTap,
    bool isDarkMode,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: isDarkMode ? Colors.grey[800] : Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: Colors.blue, size: 24),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: isDarkMode ? Colors.white : Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      description,
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        color: isDarkMode ? Colors.white70 : Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: isDarkMode ? Colors.white70 : Colors.grey[600],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showCropDetails(Map<String, dynamic> cropData) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Container(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                cropData['name'],
                style: GoogleFonts.inter(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Growing Tips:',
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 8),
              ...(cropData['tips'] as List<String>).map((tip) => Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('• ', style: TextStyle(fontSize: 16)),
                    Expanded(child: Text(tip, style: GoogleFonts.inter(fontSize: 14))),
                  ],
                ),
              )),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text('Close'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showScheduleCalculator() {
    final isDarkMode = ref.watch(themeModeProvider) == ThemeMode.dark;
    String? selectedCrop;
    DateTime plantingDate = DateTime.now();

    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) => Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Container(
            constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height * 0.8),
            padding: const EdgeInsets.all(24),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.blue.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Icon(Icons.schedule, color: Colors.blue, size: 28),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Text(
                          'Crop Schedule Calculator',
                          style: GoogleFonts.inter(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: isDarkMode ? Colors.white : Colors.black87,
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.close),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  
                  // Crop Selection
                  Text(
                    'Select Crop',
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: isDarkMode ? Colors.white70 : Colors.grey[700],
                    ),
                  ),
                  const SizedBox(height: 8),
                  DropdownButtonFormField<String>(
                    value: selectedCrop,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    ),
                    hint: Text('Choose a crop'),
                    items: ref.read(cropPlanningServiceProvider).getAllCrops()
                        .map((crop) => DropdownMenuItem(
                          value: crop['id'],
                          child: Text('${crop['name']} (${crop['hindiName']})'),
                        ))
                        .toList(),
                    onChanged: (value) {
                      setState(() => selectedCrop = value);
                    },
                  ),
                  
                  const SizedBox(height: 20),
                  
                  // Planting Date Selection
                  Text(
                    'Planting Date',
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: isDarkMode ? Colors.white70 : Colors.grey[700],
                    ),
                  ),
                  const SizedBox(height: 8),
                  InkWell(
                    onTap: () async {
                      final date = await showDatePicker(
                        context: context,
                        initialDate: plantingDate,
                        firstDate: DateTime.now().subtract(Duration(days: 30)),
                        lastDate: DateTime.now().add(Duration(days: 365)),
                      );
                      if (date != null) {
                        setState(() => plantingDate = date);
                      }
                    },
                    child: Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.calendar_today, size: 20),
                          const SizedBox(width: 12),
                          Text(
                            DateFormat('dd MMM yyyy').format(plantingDate),
                            style: GoogleFonts.inter(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ),
                  
                  const SizedBox(height: 24),
                  
                  // Calculate Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: selectedCrop == null ? null : () {
                        final schedule = ref.read(cropPlanningServiceProvider)
                            .getCropSchedule(selectedCrop!, plantingDate);
                        _showScheduleResults(schedule);
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        'Calculate Schedule',
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
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

  void _showScheduleResults(Map<String, dynamic> schedule) {
    final isDarkMode = ref.watch(themeModeProvider) == ThemeMode.dark;
    
    showDialog(
      context: context,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Container(
          constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height * 0.8),
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.check_circle, color: Colors.green, size: 32),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      '${schedule['cropName']} Schedule',
                      style: GoogleFonts.inter(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: isDarkMode ? Colors.white : Colors.black87,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.green.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Icon(Icons.info_outline, color: Colors.green),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        'Total Duration: ${schedule['totalDuration']} days\nHarvest Date: ${DateFormat('dd MMM yyyy').format(schedule['harvestDate'])}',
                        style: GoogleFonts.inter(fontSize: 14, color: Colors.green[900]),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Growth Stages',
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: isDarkMode ? Colors.white : Colors.black87,
                ),
              ),
              const SizedBox(height: 12),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: (schedule['schedule'] as List).length,
                  itemBuilder: (context, index) {
                    final stage = schedule['schedule'][index];
                    return Container(
                      margin: EdgeInsets.only(bottom: 12),
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: isDarkMode ? Colors.grey[800] : Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: isDarkMode ? Colors.grey[700]! : Colors.grey[300]!,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                decoration: BoxDecoration(
                                  color: Colors.blue.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Text(
                                  'Day ${stage['dayRange']}',
                                  style: GoogleFonts.inter(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.blue,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Text(
                                  stage['stage'],
                                  style: GoogleFonts.inter(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    color: isDarkMode ? Colors.white : Colors.black87,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Text(
                            stage['description'],
                            style: GoogleFonts.inter(
                              fontSize: 13,
                              color: isDarkMode ? Colors.white70 : Colors.grey[600],
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            '${DateFormat('dd MMM').format(stage['startDate'])} - ${DateFormat('dd MMM yyyy').format(stage['endDate'])}',
                            style: GoogleFonts.inter(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Colors.orange,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showFieldPlanner() {
    final isDarkMode = ref.watch(themeModeProvider) == ThemeMode.dark;
    double fieldArea = 1.0;
    String fieldShape = 'Rectangle';
    List<String> selectedCrops = [];

    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) => Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Container(
            constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height * 0.8),
            padding: const EdgeInsets.all(24),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.green.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Icon(Icons.grid_view, color: Colors.green, size: 28),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Text(
                          'Field Layout Planner',
                          style: GoogleFonts.inter(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: isDarkMode ? Colors.white : Colors.black87,
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.close),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  
                  // Field Area
                  Text(
                    'Field Area (hectares)',
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: isDarkMode ? Colors.white70 : Colors.grey[700],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Expanded(
                        child: Slider(
                          value: fieldArea,
                          min: 0.1,
                          max: 10.0,
                          divisions: 99,
                          label: fieldArea.toStringAsFixed(1),
                          onChanged: (value) {
                            setState(() => fieldArea = value);
                          },
                        ),
                      ),
                      Container(
                        width: 60,
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.blue.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          '${fieldArea.toStringAsFixed(1)} ha',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.inter(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ],
                  ),
                  
                  const SizedBox(height: 20),
                  
                  // Field Shape
                  Text(
                    'Field Shape',
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: isDarkMode ? Colors.white70 : Colors.grey[700],
                    ),
                  ),
                  const SizedBox(height: 8),
                  DropdownButtonFormField<String>(
                    value: fieldShape,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    ),
                    items: ['Rectangle', 'Square', 'Irregular', 'Circular']
                        .map((shape) => DropdownMenuItem(value: shape, child: Text(shape)))
                        .toList(),
                    onChanged: (value) {
                      setState(() => fieldShape = value!);
                    },
                  ),
                  
                  const SizedBox(height: 20),
                  
                  // Crop Rotation Selection
                  Text(
                    'Crops for Rotation (Select up to 3)',
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: isDarkMode ? Colors.white70 : Colors.grey[700],
                    ),
                  ),
                  const SizedBox(height: 12),
                  
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: ref.read(cropPlanningServiceProvider).getAllCrops().take(8).map((crop) {
                      final cropId = crop['id'] as String;
                      final isSelected = selectedCrops.contains(cropId);
                      return FilterChip(
                        label: Text(crop['name'] as String),
                        selected: isSelected,
                        onSelected: selectedCrops.length < 3 || isSelected ? (selected) {
                          setState(() {
                            if (selected) {
                              selectedCrops.add(cropId);
                            } else {
                              selectedCrops.remove(cropId);
                            }
                          });
                        } : null,
                      );
                    }).toList(),
                  ),
                  
                  const SizedBox(height: 24),
                  
                  // Generate Plan Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: selectedCrops.isEmpty ? null : () {
                        _showFieldPlanResults(fieldArea, fieldShape, selectedCrops);
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        'Generate Field Plan',
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
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

  void _showFieldPlanResults(double fieldArea, String fieldShape, List<String> crops) {
    final isDarkMode = ref.watch(themeModeProvider) == ThemeMode.dark;
    final cropService = ref.read(cropPlanningServiceProvider);
    final areaPerCrop = fieldArea / crops.length;
    
    showDialog(
      context: context,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Container(
          constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height * 0.8),
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.check_circle, color: Colors.green, size: 32),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      'Field Layout Plan',
                      style: GoogleFonts.inter(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: isDarkMode ? Colors.white : Colors.black87,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              
              // Field Summary
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Field Details',
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.blue[900],
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Total Area: ${fieldArea.toStringAsFixed(2)} hectares\nShape: $fieldShape\nCrops: ${crops.length}',
                      style: GoogleFonts.inter(fontSize: 14, color: Colors.blue[800]),
                    ),
                  ],
                ),
              ),
              
              const SizedBox(height: 16),
              Text(
                'Crop Allocation',
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: isDarkMode ? Colors.white : Colors.black87,
                ),
              ),
              const SizedBox(height: 12),
              
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: crops.length,
                  itemBuilder: (context, index) {
                    final cropData = cropService.getCropDetails(crops[index]);
                    if (cropData == null) return SizedBox.shrink();
                    
                    return Container(
                      margin: EdgeInsets.only(bottom: 12),
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: isDarkMode ? Colors.grey[800] : Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: isDarkMode ? Colors.grey[700]! : Colors.grey[300]!,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                decoration: BoxDecoration(
                                  color: Colors.green.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Text(
                                  'Zone ${index + 1}',
                                  style: GoogleFonts.inter(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.green,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Text(
                                  '${cropData['name']} (${cropData['hindiName']})',
                                  style: GoogleFonts.inter(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    color: isDarkMode ? Colors.white : Colors.black87,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Area Allocated',
                                      style: GoogleFonts.inter(
                                        fontSize: 12,
                                        color: isDarkMode ? Colors.white70 : Colors.grey[600],
                                      ),
                                    ),
                                    Text(
                                      '${areaPerCrop.toStringAsFixed(2)} ha',
                                      style: GoogleFonts.inter(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: isDarkMode ? Colors.white : Colors.black87,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Season',
                                      style: GoogleFonts.inter(
                                        fontSize: 12,
                                        color: isDarkMode ? Colors.white70 : Colors.grey[600],
                                      ),
                                    ),
                                    Text(
                                      cropData['season'],
                                      style: GoogleFonts.inter(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: isDarkMode ? Colors.white : Colors.black87,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Duration: ${cropData['duration']} days  •  Water: ${cropData['waterRequirement']}',
                            style: GoogleFonts.inter(
                              fontSize: 13,
                              color: isDarkMode ? Colors.white70 : Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              
              const SizedBox(height: 16),
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.orange.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Icon(Icons.lightbulb_outline, color: Colors.orange, size: 20),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'Tip: Rotate crops annually for better soil health and pest management',
                        style: GoogleFonts.inter(fontSize: 12, color: Colors.orange[900]),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showResourceCalculator() {
    final isDarkMode = ref.watch(themeModeProvider) == ThemeMode.dark;
    String? selectedCrop;
    double fieldArea = 1.0;

    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) => Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Container(
            constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height * 0.8),
            padding: const EdgeInsets.all(24),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.orange.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Icon(Icons.calculate, color: Colors.orange, size: 28),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Text(
                          'Resource Calculator',
                          style: GoogleFonts.inter(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: isDarkMode ? Colors.white : Colors.black87,
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.close),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  
                  // Crop Selection
                  Text(
                    'Select Crop',
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: isDarkMode ? Colors.white70 : Colors.grey[700],
                    ),
                  ),
                  const SizedBox(height: 8),
                  DropdownButtonFormField<String>(
                    value: selectedCrop,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    ),
                    hint: Text('Choose a crop'),
                    items: ref.read(cropPlanningServiceProvider).getAllCrops()
                        .map((crop) => DropdownMenuItem(
                          value: crop['id'],
                          child: Text('${crop['name']} (${crop['hindiName']})'),
                        ))
                        .toList(),
                    onChanged: (value) {
                      setState(() => selectedCrop = value);
                    },
                  ),
                  
                  const SizedBox(height: 20),
                  
                  // Field Area
                  Text(
                    'Field Area (hectares)',
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: isDarkMode ? Colors.white70 : Colors.grey[700],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Expanded(
                        child: Slider(
                          value: fieldArea,
                          min: 0.1,
                          max: 10.0,
                          divisions: 99,
                          label: fieldArea.toStringAsFixed(1),
                          onChanged: (value) {
                            setState(() => fieldArea = value);
                          },
                        ),
                      ),
                      Container(
                        width: 60,
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.orange.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          '${fieldArea.toStringAsFixed(1)} ha',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.inter(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.orange,
                          ),
                        ),
                      ),
                    ],
                  ),
                  
                  const SizedBox(height: 24),
                  
                  // Calculate Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: selectedCrop == null ? null : () {
                        _showResourceResults(selectedCrop!, fieldArea);
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        'Calculate Resources',
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
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

  void _showResourceResults(String cropId, double fieldArea) {
    final isDarkMode = ref.watch(themeModeProvider) == ThemeMode.dark;
    final cropData = ref.read(cropPlanningServiceProvider).getCropDetails(cropId);
    if (cropData == null) return;
    
    // Calculate resources
    final spacing = cropData['spacing'] as Map<String, dynamic>;
    final rowSpacing = (spacing['rows'] as int) / 100.0; // cm to m
    final plantSpacing = (spacing['plants'] as int) / 100.0;
    final plantsPerHectare = (10000 / (rowSpacing * plantSpacing)).round();
    final totalPlants = (plantsPerHectare * fieldArea).round();
    
    final fertilizer = cropData['fertilizer'] as Map<String, dynamic>;
    final nitrogenTotal = (fertilizer['n'] as int) * fieldArea;
    final phosphorusTotal = (fertilizer['p'] as int) * fieldArea;
    final potassiumTotal = (fertilizer['k'] as int) * fieldArea;
    
    final duration = cropData['duration'] as int;
    final irrigationFreq = cropData['irrigationFrequency'] as int;
    final waterRequirement = cropData['waterRequirement'] as String;
    
    // Estimate labor days (simplified)
    final laborDays = (duration * 0.2 * fieldArea).round();
    
    showDialog(
      context: context,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Container(
          constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height * 0.8),
          padding: const EdgeInsets.all(24),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.check_circle, color: Colors.green, size: 32),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        'Resource Requirements',
                        style: GoogleFonts.inter(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: isDarkMode ? Colors.white : Colors.black87,
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.close),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  '${cropData['name']} (${cropData['hindiName']}) - ${fieldArea.toStringAsFixed(2)} hectares',
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    color: isDarkMode ? Colors.white70 : Colors.grey[600],
                  ),
                ),
                const SizedBox(height: 20),
                
                // Seeds/Plants
                _buildResourceCard(
                  'Seeds & Planting',
                  Icons.eco,
                  Colors.green,
                  [
                    {'label': 'Plants per hectare', 'value': NumberFormat('#,###').format(plantsPerHectare)},
                    {'label': 'Total plants needed', 'value': NumberFormat('#,###').format(totalPlants)},
                    {'label': 'Row spacing', 'value': '${spacing['rows']} cm'},
                    {'label': 'Plant spacing', 'value': '${spacing['plants']} cm'},
                  ],
                  isDarkMode,
                ),
                
                // Fertilizer
                _buildResourceCard(
                  'Fertilizer Requirements',
                  Icons.agriculture,
                  Colors.brown,
                  [
                    {'label': 'Nitrogen (N)', 'value': '${nitrogenTotal.toStringAsFixed(0)} kg'},
                    {'label': 'Phosphorus (P)', 'value': '${phosphorusTotal.toStringAsFixed(0)} kg'},
                    {'label': 'Potassium (K)', 'value': '${potassiumTotal.toStringAsFixed(0)} kg'},
                    {'label': 'Application', 'value': 'Split doses recommended'},
                  ],
                  isDarkMode,
                ),
                
                // Water
                _buildResourceCard(
                  'Water & Irrigation',
                  Icons.water_drop,
                  Colors.blue,
                  [
                    {'label': 'Water requirement', 'value': waterRequirement},
                    {'label': 'Irrigation frequency', 'value': '$irrigationFreq times'},
                    {'label': 'Crop duration', 'value': '$duration days'},
                    {'label': 'Critical stages', 'value': 'Flowering & fruit set'},
                  ],
                  isDarkMode,
                ),
                
                // Labor
                _buildResourceCard(
                  'Labor Requirements',
                  Icons.groups,
                  Colors.orange,
                  [
                    {'label': 'Estimated labor days', 'value': '$laborDays days'},
                    {'label': 'Peak requirement', 'value': 'Planting & harvest'},
                    {'label': 'Activities', 'value': 'Sowing, weeding, spraying'},
                    {'label': 'Harvest period', 'value': 'Multiple pickings may be needed'},
                  ],
                  isDarkMode,
                ),
                
                const SizedBox(height: 16),
                Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.blue.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.info_outline, color: Colors.blue, size: 20),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          'These are approximate values. Actual requirements may vary based on soil type, weather, and farming practices.',
                          style: GoogleFonts.inter(fontSize: 12, color: Colors.blue[900]),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildResourceCard(
    String title,
    IconData icon,
    Color color,
    List<Map<String, String>> items,
    bool isDarkMode,
  ) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDarkMode ? Colors.grey[800] : Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isDarkMode ? Colors.grey[700]! : Colors.grey[300]!,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(icon, color: color, size: 20),
              ),
              const SizedBox(width: 12),
              Text(
                title,
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: isDarkMode ? Colors.white : Colors.black87,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          ...items.map((item) => Padding(
            padding: EdgeInsets.only(bottom: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  item['label']!,
                  style: GoogleFonts.inter(
                    fontSize: 13,
                    color: isDarkMode ? Colors.white70 : Colors.grey[600],
                  ),
                ),
                Text(
                  item['value']!,
                  style: GoogleFonts.inter(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: isDarkMode ? Colors.white : Colors.black87,
                  ),
                ),
              ],
            ),
          )),
        ],
      ),
    );
  }

  void _showPriceTracker() {
    final isDarkMode = ref.watch(themeModeProvider) == ThemeMode.dark;
    final cropService = ref.read(cropPlanningServiceProvider);
    final allCrops = cropService.getAllCrops();

    showDialog(
      context: context,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Container(
          constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height * 0.8),
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.purple.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(Icons.trending_up, color: Colors.purple, size: 28),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      'Market Price Tracker',
                      style: GoogleFonts.inter(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: isDarkMode ? Colors.white : Colors.black87,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Icon(Icons.info_outline, color: Colors.blue, size: 20),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'Prices in ₹ per quintal. Updated regularly from market sources.',
                        style: GoogleFonts.inter(fontSize: 12, color: Colors.blue[900]),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: allCrops.length,
                  itemBuilder: (context, index) {
                    final crop = allCrops[index];
                    final cropData = cropService.getCropDetails(crop['id']);
                    if (cropData == null) return SizedBox.shrink();
                    
                    final marketPrice = cropData['marketPrice'] as Map<String, dynamic>;
                    final current = marketPrice['current'] as int;
                    final min = marketPrice['min'] as int;
                    final max = marketPrice['max'] as int;
                    final trend = current > (min + max) / 2 ? 'up' : 'down';
                    final profitability = cropData['profitability'] as String;
                    
                    return Container(
                      margin: EdgeInsets.only(bottom: 12),
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: isDarkMode ? Colors.grey[800] : Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: isDarkMode ? Colors.grey[700]! : Colors.grey[300]!,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      cropData['name'],
                                      style: GoogleFonts.inter(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: isDarkMode ? Colors.white : Colors.black87,
                                      ),
                                    ),
                                    Text(
                                      cropData['hindiName'],
                                      style: GoogleFonts.inter(
                                        fontSize: 13,
                                        color: isDarkMode ? Colors.white70 : Colors.grey[600],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Icon(
                                trend == 'up' ? Icons.trending_up : Icons.trending_down,
                                color: trend == 'up' ? Colors.green : Colors.red,
                                size: 24,
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Current Price',
                                      style: GoogleFonts.inter(
                                        fontSize: 12,
                                        color: isDarkMode ? Colors.white70 : Colors.grey[600],
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      '₹$current',
                                      style: GoogleFonts.inter(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.green,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Range',
                                      style: GoogleFonts.inter(
                                        fontSize: 12,
                                        color: isDarkMode ? Colors.white70 : Colors.grey[600],
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      '₹$min - ₹$max',
                                      style: GoogleFonts.inter(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: isDarkMode ? Colors.white : Colors.black87,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          Row(
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                                decoration: BoxDecoration(
                                  color: _getProfitabilityColor(profitability).withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Text(
                                  profitability,
                                  style: GoogleFonts.inter(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: _getProfitabilityColor(profitability),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                                decoration: BoxDecoration(
                                  color: Colors.orange.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Text(
                                  cropData['season'],
                                  style: GoogleFonts.inter(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.orange,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color _getProfitabilityColor(String profitability) {
    switch (profitability) {
      case 'Very High':
        return Colors.green[700]!;
      case 'High':
        return Colors.green;
      case 'Medium':
        return Colors.orange;
      case 'Low':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }
}
