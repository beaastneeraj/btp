import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../providers/theme_provider.dart';
import '../services/enhanced_crop_planning_service.dart';
import '../themes/material3_theme.dart';

// Enhanced Crop Planning Screen with comprehensive tools
class EnhancedCropPlanningScreen extends ConsumerStatefulWidget {
  const EnhancedCropPlanningScreen({super.key});

  @override
  ConsumerState<EnhancedCropPlanningScreen> createState() => _EnhancedCropPlanningScreenState();
}

class _EnhancedCropPlanningScreenState extends ConsumerState<EnhancedCropPlanningScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  
  final EnhancedCropPlanningService _cropService = EnhancedCropPlanningService();
  
  // Form state
  String _selectedState = 'Punjab';
  String _selectedSoilType = 'loamy';
  double _fieldSize = 1.0;
  double _budget = 100000.0;
  WaterAvailability _waterAvailability = WaterAvailability.adequate;
  
  // Results
  CropRecommendation? _recommendations;
  CropCalendar? _cropCalendar;
  bool _isLoading = false;
  
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _animationController = AnimationController(
      duration: Duration(milliseconds: 800),
      vsync: this,
    );
    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
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
    final appSettings = ref.watch(appSettingsProvider);
    final languageCode = appSettings.locale.languageCode;
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        title: Text(
          'Crop Planning Tools',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        backgroundColor: colorScheme.surface,
        elevation: 0,
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: 'Recommendations', icon: Icon(Icons.recommend)),
            Tab(text: 'Calendar', icon: Icon(Icons.calendar_month)),
            Tab(text: 'Cost Analysis', icon: Icon(Icons.analytics)),
            Tab(text: 'Planning', icon: Icon(Icons.assignment)),
          ],
        ),
      ),
      body: FadeTransition(
        opacity: _fadeAnimation,
        child: TabBarView(
          controller: _tabController,
          children: [
            _buildRecommendationsTab(colorScheme, languageCode),
            _buildCalendarTab(colorScheme, languageCode),
            _buildCostAnalysisTab(colorScheme, languageCode),
            _buildPlanningTab(colorScheme, languageCode),
          ],
        ),
      ),
    );
  }

  Widget _buildRecommendationsTab(ColorScheme colorScheme, String languageCode) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          _buildInputForm(colorScheme),
          SizedBox(height: 20),
          if (_isLoading)
            Center(child: CircularProgressIndicator())
          else if (_recommendations != null)
            _buildRecommendationsResults(colorScheme),
        ],
      ),
    );
  }

  Widget _buildInputForm(ColorScheme colorScheme) {
    return M3Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Farm Details',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          SizedBox(height: 16),
          
          // State Selection
          DropdownButtonFormField<String>(
            value: _selectedState,
            decoration: InputDecoration(
              labelText: 'State/Region',
              prefixIcon: Icon(Icons.location_on),
            ),
            items: ['Punjab', 'Uttar Pradesh', 'Maharashtra', 'Gujarat', 'Karnataka']
                .map((state) => DropdownMenuItem(value: state, child: Text(state)))
                .toList(),
            onChanged: (value) => setState(() => _selectedState = value!),
          ),
          SizedBox(height: 16),
          
          // Soil Type Selection
          DropdownButtonFormField<String>(
            value: _selectedSoilType,
            decoration: InputDecoration(
              labelText: 'Soil Type',
              prefixIcon: Icon(Icons.terrain),
            ),
            items: ['loamy', 'clay-loam', 'sandy-loam', 'clay', 'sandy']
                .map((soil) => DropdownMenuItem(value: soil, child: Text(soil.toUpperCase())))
                .toList(),
            onChanged: (value) => setState(() => _selectedSoilType = value!),
          ),
          SizedBox(height: 16),
          
          // Field Size
          Row(
            children: [
              Icon(Icons.crop_free),
              SizedBox(width: 8),
              Text('Field Size: ${_fieldSize.toStringAsFixed(1)} hectares'),
            ],
          ),
          Slider(
            value: _fieldSize,
            min: 0.1,
            max: 50.0,
            divisions: 499,
            onChanged: (value) => setState(() => _fieldSize = value),
          ),
          SizedBox(height: 16),
          
          // Budget
          Row(
            children: [
              Icon(Icons.currency_rupee),
              SizedBox(width: 8),
              Text('Budget: ₹${NumberFormat('#,##,###').format(_budget.toInt())}'),
            ],
          ),
          Slider(
            value: _budget,
            min: 10000,
            max: 1000000,
            divisions: 99,
            onChanged: (value) => setState(() => _budget = value),
          ),
          SizedBox(height: 16),
          
          // Water Availability
          DropdownButtonFormField<WaterAvailability>(
            value: _waterAvailability,
            decoration: InputDecoration(
              labelText: 'Water Availability',
              prefixIcon: Icon(Icons.water_drop),
            ),
            items: WaterAvailability.values
                .map((water) => DropdownMenuItem(
                  value: water,
                  child: Text(water.name.toUpperCase()),
                ))
                .toList(),
            onChanged: (value) => setState(() => _waterAvailability = value!),
          ),
          SizedBox(height: 20),
          
          SizedBox(
            width: double.infinity,
            child: FilledButton.icon(
              onPressed: _isLoading ? null : _getCropRecommendations,
              icon: Icon(Icons.search),
              label: Text('Get Recommendations'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRecommendationsResults(ColorScheme colorScheme) {
    if (_recommendations == null) return SizedBox.shrink();
    
    return Column(
      children: [
        // Best Crop Recommendation
        if (_recommendations!.bestCrop != null)
          M3Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.eco, color: colorScheme.primary),
                    SizedBox(width: 8),
                    Text(
                      'Best Recommendation',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ],
                ),
                SizedBox(height: 12),
                _buildCropCard(_recommendations!.bestCrop!, colorScheme, isPrimary: true),
              ],
            ),
          ),
        
        SizedBox(height: 16),
        
        // Alternative Crops
        if (_recommendations!.alternativeCrops.isNotEmpty) ...[
          Text(
            'Alternative Options',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          SizedBox(height: 12),
          ...(_recommendations!.alternativeCrops.map((crop) => 
            Padding(
              padding: EdgeInsets.only(bottom: 8),
              child: _buildCropCard(crop, colorScheme),
            )
          )),
        ],
      ],
    );
  }

  Widget _buildCropCard(CropSuitability crop, ColorScheme colorScheme, {bool isPrimary = false}) {
    return M3Card(
      elevated: isPrimary,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      crop.crop.name,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: isPrimary ? colorScheme.primary : null,
                        fontWeight: isPrimary ? FontWeight.bold : null,
                      ),
                    ),
                    Text(
                      '${crop.crop.category.name.toUpperCase()} • ${crop.crop.duration} days',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
              M3Chip(
                label: '${(crop.suitabilityScore * 100).toInt()}%',
                selected: isPrimary,
                icon: Icons.trending_up,
              ),
            ],
          ),
          SizedBox(height: 12),
          
          // Key metrics
          Row(
            children: [
              Expanded(
                child: _buildMetricItem(
                  'Expected Yield',
                  '${crop.expectedYield.toStringAsFixed(0)} kg',
                  Icons.agriculture,
                  colorScheme,
                ),
              ),
              Expanded(
                child: _buildMetricItem(
                  'Revenue',
                  '₹${NumberFormat('#,##,###').format(crop.expectedRevenue.toInt())}',
                  Icons.currency_rupee,
                  colorScheme,
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: _buildMetricItem(
                  'Investment',
                  '₹${NumberFormat('#,##,###').format(crop.investmentRequired.toInt())}',
                  Icons.account_balance_wallet,
                  colorScheme,
                ),
              ),
              Expanded(
                child: _buildMetricItem(
                  'Risk Level',
                  crop.riskLevel.name.toUpperCase(),
                  Icons.warning,
                  colorScheme,
                  color: crop.riskLevel == RiskLevel.low ? Colors.green :
                         crop.riskLevel == RiskLevel.medium ? Colors.orange : Colors.red,
                ),
              ),
            ],
          ),
          
          // Crop details
          SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 4,
            children: [
              ...crop.crop.seasons.map((season) => M3Chip(
                label: season,
                icon: Icons.wb_sunny,
              )),
              M3Chip(
                label: '${crop.crop.waterRequirement.name} water',
                icon: Icons.water_drop,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMetricItem(String label, String value, IconData icon, ColorScheme colorScheme, {Color? color}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, size: 16, color: color ?? colorScheme.onSurfaceVariant),
            SizedBox(width: 4),
            Text(
              label,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
        SizedBox(height: 2),
        Text(
          value,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w500,
            color: color,
          ),
        ),
      ],
    );
  }

  Widget _buildCalendarTab(ColorScheme colorScheme, String languageCode) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          M3Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Crop Calendar',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                SizedBox(height: 8),
                Text(
                  'Select a crop to view detailed farming calendar',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                SizedBox(height: 16),
                FilledButton.icon(
                  onPressed: () {
                    // This would open crop selection
                    _showComingSoonSnackBar();
                  },
                  icon: Icon(Icons.calendar_month),
                  label: Text('Generate Calendar'),
                ),
              ],
            ),
          ),
          if (_cropCalendar != null) ...[
            SizedBox(height: 16),
            // Calendar display would go here
          ],
        ],
      ),
    );
  }

  Widget _buildCostAnalysisTab(ColorScheme colorScheme, String languageCode) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          M3Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Input Cost Analysis',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                SizedBox(height: 8),
                Text(
                  'Detailed breakdown of farming costs',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                SizedBox(height: 16),
                FilledButton.icon(
                  onPressed: () {
                    _showComingSoonSnackBar();
                  },
                  icon: Icon(Icons.analytics),
                  label: Text('Analyze Costs'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPlanningTab(ColorScheme colorScheme, String languageCode) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          M3Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Seasonal Planning',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                SizedBox(height: 8),
                Text(
                  'Plan your crops for different seasons',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                SizedBox(height: 16),
                FilledButton.icon(
                  onPressed: () {
                    _showComingSoonSnackBar();
                  },
                  icon: Icon(Icons.assignment),
                  label: Text('Create Plan'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _getCropRecommendations() async {
    setState(() => _isLoading = true);
    
    try {
      final recommendations = await _cropService.getCropRecommendations(
        state: _selectedState,
        soilType: _selectedSoilType,
        fieldSize: _fieldSize,
        budget: _budget,
        currentMonth: DateTime.now().month,
        waterAvailability: _waterAvailability,
      );
      
      setState(() {
        _recommendations = recommendations;
        _isLoading = false;
      });
      
      _showSuccessSnackBar('Recommendations generated successfully!');
    } catch (e) {
      setState(() => _isLoading = false);
      _showErrorSnackBar('Failed to generate recommendations: $e');
    }
  }

  void _showSuccessSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
    );
  }

  void _showErrorSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Theme.of(context).colorScheme.error,
      ),
    );
  }

  void _showComingSoonSnackBar() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Feature coming soon!'),
        backgroundColor: Theme.of(context).colorScheme.secondary,
      ),
    );
  }
}