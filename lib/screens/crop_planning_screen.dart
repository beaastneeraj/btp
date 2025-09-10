import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../providers/theme_provider.dart';
import '../services/crop_planning_service.dart';
import '../services/localization_service.dart';

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
    with TickerProviderStateMixin {
  late TabController _tabController;
  final PageController _pageController = PageController();
  int _currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _loadRecommendations();
  }

  @override
  void dispose() {
    _tabController.dispose();
    _pageController.dispose();
    super.dispose();
  }

  Future<void> _loadRecommendations() async {
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
      
      ref.read(cropRecommendationsProvider.notifier).state = recommendations;
    } catch (e) {
      // Handle error
      print('Error loading recommendations: $e');
    } finally {
      ref.read(loadingProvider.notifier).state = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = ref.watch(themeModeProvider) == ThemeMode.dark;
    final isLoading = ref.watch(loadingProvider);
    final recommendations = ref.watch(cropRecommendationsProvider);

    return Scaffold(
      backgroundColor: isDarkMode ? Colors.grey[900] : Colors.grey[50],
      appBar: AppBar(
        title: Text(
          'Crop Planning',
          style: GoogleFonts.inter(fontWeight: FontWeight.w600),
        ),
        backgroundColor: isDarkMode ? Colors.grey[850] : Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: _loadRecommendations,
            icon: Icon(isLoading ? Icons.hourglass_empty : Icons.refresh),
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Recommendations', icon: Icon(Icons.lightbulb_outline)),
            Tab(text: 'Calendar', icon: Icon(Icons.calendar_month)),
            Tab(text: 'Analysis', icon: Icon(Icons.analytics)),
            Tab(text: 'Planning', icon: Icon(Icons.schedule)),
          ],
        ),
      ),
      body: isLoading && recommendations == null
          ? const Center(child: CircularProgressIndicator())
          : recommendations == null
              ? _buildErrorState()
              : TabBarView(
                  controller: _tabController,
                  children: [
                    _buildRecommendationsTab(recommendations),
                    _buildCalendarTab(recommendations),
                    _buildAnalysisTab(recommendations),
                    _buildPlanningTab(recommendations),
                  ],
                ),
    );
  }

  Widget _buildErrorState() {
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
    // Implement schedule calculator
  }

  void _showFieldPlanner() {
    // Implement field planner
  }

  void _showResourceCalculator() {
    // Implement resource calculator
  }

  void _showPriceTracker() {
    // Implement price tracker
  }
}
