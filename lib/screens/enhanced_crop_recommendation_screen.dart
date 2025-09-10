import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../services/ai_recommendation_engine.dart';
import '../services/regional_data_service.dart';

class EnhancedCropRecommendationScreen extends ConsumerStatefulWidget {
  const EnhancedCropRecommendationScreen({super.key});

  @override
  ConsumerState<EnhancedCropRecommendationScreen> createState() =>
      _EnhancedCropRecommendationScreenState();
}

class _EnhancedCropRecommendationScreenState
    extends ConsumerState<EnhancedCropRecommendationScreen> {
  final AIRecommendationEngine _aiEngine = AIRecommendationEngine.instance;
  final RegionalDataService _dataService = RegionalDataService.instance;

  // Form controllers
  final _stateController = TextEditingController();
  final _districtController = TextEditingController();
  final _farmSizeController = TextEditingController();
  final _budgetController = TextEditingController();

  String _selectedExperience = 'intermediate';
  String _selectedMarketPreference = 'local';
  List<String> _selectedPreviousCrops = [];
  
  Map<String, dynamic>? _recommendations;
  bool _isLoading = false;
  bool _showResults = false;

  final List<String> _experienceLevels = ['beginner', 'intermediate', 'expert'];
  final List<String> _marketPreferences = ['local', 'export', 'processing'];
  final List<String> _availableCrops = [
    'Rice', 'Wheat', 'Maize', 'Cotton', 'Sugarcane', 
    'Soybean', 'Groundnut', 'Millet', 'Barley', 'Mustard'
  ];

  @override
  void initState() {
    super.initState();
    _initializeData();
  }

  Future<void> _initializeData() async {
    if (!_dataService.isInitialized) {
      await _dataService.initializeData();
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    
    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        title: Text(
          'AI Crop Advisor',
          style: GoogleFonts.inter(
            fontWeight: FontWeight.bold,
            color: colorScheme.onSurface,
          ),
        ),
        backgroundColor: colorScheme.surface,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_rounded, color: colorScheme.onSurface),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: _showResults ? _buildResultsView(colorScheme) : _buildFormView(colorScheme),
    );
  }

  Widget _buildFormView(ColorScheme colorScheme) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeaderSection(colorScheme),
          const SizedBox(height: 24),
          _buildLocationSection(colorScheme),
          const SizedBox(height: 24),
          _buildFarmDetailsSection(colorScheme),
          const SizedBox(height: 24),
          _buildExperienceSection(colorScheme),
          const SizedBox(height: 24),
          _buildPreviousCropsSection(colorScheme),
          const SizedBox(height: 24),
          _buildMarketPreferenceSection(colorScheme),
          const SizedBox(height: 32),
          _buildAnalyzeButton(colorScheme),
        ],
      ).animate().fadeIn(duration: 600.ms).slideY(begin: 0.1, end: 0),
    );
  }

  Widget _buildHeaderSection(ColorScheme colorScheme) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            colorScheme.primary.withOpacity(0.1),
            colorScheme.secondary.withOpacity(0.1),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: colorScheme.outline.withOpacity(0.1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: colorScheme.primary,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  Icons.psychology_rounded,
                  color: colorScheme.onPrimary,
                  size: 24,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'AI-Powered Crop Recommendations',
                      style: GoogleFonts.inter(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: colorScheme.onSurface,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Get personalized crop suggestions based on your location, soil, weather, and farming experience',
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        color: colorScheme.onSurface.withOpacity(0.7),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildLocationSection(ColorScheme colorScheme) {
    return _buildSection(
      title: 'Farm Location',
      icon: Icons.location_on_rounded,
      colorScheme: colorScheme,
      child: Column(
        children: [
          _buildTextField(
            controller: _stateController,
            label: 'State',
            hint: 'e.g., Punjab, Maharashtra',
            icon: Icons.map_rounded,
            colorScheme: colorScheme,
          ),
          const SizedBox(height: 16),
          _buildTextField(
            controller: _districtController,
            label: 'District',
            hint: 'e.g., Ludhiana, Pune',
            icon: Icons.location_city_rounded,
            colorScheme: colorScheme,
          ),
        ],
      ),
    );
  }

  Widget _buildFarmDetailsSection(ColorScheme colorScheme) {
    return _buildSection(
      title: 'Farm Details',
      icon: Icons.agriculture_rounded,
      colorScheme: colorScheme,
      child: Column(
        children: [
          _buildTextField(
            controller: _farmSizeController,
            label: 'Farm Size (Hectares)',
            hint: 'e.g., 2.5',
            icon: Icons.crop_landscape_rounded,
            keyboardType: TextInputType.number,
            colorScheme: colorScheme,
          ),
          const SizedBox(height: 16),
          _buildTextField(
            controller: _budgetController,
            label: 'Budget (₹)',
            hint: 'e.g., 50000',
            icon: Icons.currency_rupee_rounded,
            keyboardType: TextInputType.number,
            colorScheme: colorScheme,
          ),
        ],
      ),
    );
  }

  Widget _buildExperienceSection(ColorScheme colorScheme) {
    return _buildSection(
      title: 'Experience Level',
      icon: Icons.school_rounded,
      colorScheme: colorScheme,
      child: Column(
        children: _experienceLevels.map((level) {
          return RadioListTile<String>(
            value: level,
            groupValue: _selectedExperience,
            onChanged: (value) {
              setState(() {
                _selectedExperience = value!;
              });
            },
            title: Text(
              level.split('').first.toUpperCase() + level.substring(1),
              style: GoogleFonts.inter(
                color: colorScheme.onSurface,
                fontWeight: FontWeight.w500,
              ),
            ),
            activeColor: colorScheme.primary,
          );
        }).toList(),
      ),
    );
  }

  Widget _buildPreviousCropsSection(ColorScheme colorScheme) {
    return _buildSection(
      title: 'Previous Crops (Optional)',
      icon: Icons.history_rounded,
      colorScheme: colorScheme,
      child: Wrap(
        spacing: 8,
        runSpacing: 8,
        children: _availableCrops.map((crop) {
          final isSelected = _selectedPreviousCrops.contains(crop);
          return FilterChip(
            label: Text(crop),
            selected: isSelected,
            onSelected: (selected) {
              setState(() {
                if (selected) {
                  _selectedPreviousCrops.add(crop);
                } else {
                  _selectedPreviousCrops.remove(crop);
                }
              });
            },
            backgroundColor: colorScheme.surface,
            selectedColor: colorScheme.primary.withOpacity(0.2),
            checkmarkColor: colorScheme.primary,
            labelStyle: GoogleFonts.inter(
              color: isSelected ? colorScheme.primary : colorScheme.onSurface,
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildMarketPreferenceSection(ColorScheme colorScheme) {
    return _buildSection(
      title: 'Market Preference',
      icon: Icons.trending_up_rounded,
      colorScheme: colorScheme,
      child: Column(
        children: _marketPreferences.map((preference) {
          return RadioListTile<String>(
            value: preference,
            groupValue: _selectedMarketPreference,
            onChanged: (value) {
              setState(() {
                _selectedMarketPreference = value!;
              });
            },
            title: Text(
              preference.split('').first.toUpperCase() + preference.substring(1),
              style: GoogleFonts.inter(
                color: colorScheme.onSurface,
                fontWeight: FontWeight.w500,
              ),
            ),
            activeColor: colorScheme.primary,
          );
        }).toList(),
      ),
    );
  }

  Widget _buildSection({
    required String title,
    required IconData icon,
    required Widget child,
    required ColorScheme colorScheme,
  }) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: colorScheme.outline.withOpacity(0.2)),
        boxShadow: [
          BoxShadow(
            color: colorScheme.shadow.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: colorScheme.primary, size: 20),
              const SizedBox(width: 8),
              Text(
                title,
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: colorScheme.onSurface,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          child,
        ],
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
    required IconData icon,
    required ColorScheme colorScheme,
    TextInputType? keyboardType,
  }) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      style: GoogleFonts.inter(color: colorScheme.onSurface),
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        prefixIcon: Icon(icon, color: colorScheme.primary),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: colorScheme.outline.withOpacity(0.3)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: colorScheme.outline.withOpacity(0.3)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: colorScheme.primary, width: 2),
        ),
        filled: true,
        fillColor: colorScheme.surface.withOpacity(0.5),
        labelStyle: GoogleFonts.inter(color: colorScheme.onSurface.withOpacity(0.7)),
        hintStyle: GoogleFonts.inter(color: colorScheme.onSurface.withOpacity(0.5)),
      ),
    );
  }

  Widget _buildAnalyzeButton(ColorScheme colorScheme) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        onPressed: _isLoading ? null : _analyzeRecommendations,
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.primary,
          foregroundColor: colorScheme.onPrimary,
          elevation: 8,
          shadowColor: colorScheme.primary.withOpacity(0.3),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: _isLoading
            ? SizedBox(
                height: 24,
                width: 24,
                child: CircularProgressIndicator(
                  color: colorScheme.onPrimary,
                  strokeWidth: 2,
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.psychology_rounded, size: 24),
                  const SizedBox(width: 8),
                  Text(
                    'Analyze & Get Recommendations',
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  Widget _buildResultsView(ColorScheme colorScheme) {
    if (_recommendations == null) {
      return const Center(child: CircularProgressIndicator());
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildResultsHeader(colorScheme),
          const SizedBox(height: 24),
          _buildRecommendedCrops(colorScheme),
          const SizedBox(height: 24),
          _buildSoilAnalysis(colorScheme),
          const SizedBox(height: 24),
          _buildEconomicAnalysis(colorScheme),
          const SizedBox(height: 24),
          _buildRiskAssessment(colorScheme),
          const SizedBox(height: 24),
          _buildActionButtons(colorScheme),
        ],
      ).animate().fadeIn(duration: 600.ms).slideY(begin: 0.1, end: 0),
    );
  }

  Widget _buildResultsHeader(ColorScheme colorScheme) {
    final successRate = _recommendations!['success_probability'] ?? 75;
    
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            colorScheme.primary.withOpacity(0.1),
            colorScheme.secondary.withOpacity(0.1),
          ],
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.check_circle_rounded, color: Colors.green, size: 28),
              const SizedBox(width: 12),
              Text(
                'Analysis Complete',
                style: GoogleFonts.inter(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: colorScheme.onSurface,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            'Success Probability: ${successRate.toInt()}%',
            style: GoogleFonts.inter(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: colorScheme.primary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRecommendedCrops(ColorScheme colorScheme) {
    final crops = _recommendations!['recommended_crops'] as List<Map<String, dynamic>>;
    
    return _buildResultSection(
      title: 'Recommended Crops',
      icon: Icons.eco_rounded,
      colorScheme: colorScheme,
      child: Column(
        children: crops.take(3).map((crop) => _buildCropCard(crop, colorScheme)).toList(),
      ),
    );
  }

  Widget _buildCropCard(Map<String, dynamic> crop, ColorScheme colorScheme) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: colorScheme.outline.withOpacity(0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                crop['crop_name'],
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: colorScheme.onSurface,
                ),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: _getScoreColor(crop['score']).withOpacity(0.2),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  'Score: ${crop['score']}',
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: _getScoreColor(crop['score']),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            'Confidence: ${crop['confidence_level']}',
            style: GoogleFonts.inter(
              fontSize: 14,
              color: colorScheme.onSurface.withOpacity(0.7),
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Icon(Icons.trending_up_rounded, size: 16, color: Colors.green),
              const SizedBox(width: 4),
              Text(
                'Est. Profit: ₹${crop['estimated_profit']['profit_per_hectare']}',
                style: GoogleFonts.inter(
                  fontSize: 12,
                  color: Colors.green,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSoilAnalysis(ColorScheme colorScheme) {
    final soilAnalysis = _recommendations!['soil_analysis'] as Map<String, dynamic>;
    
    return _buildResultSection(
      title: 'Soil Analysis',
      icon: Icons.terrain_rounded,
      colorScheme: colorScheme,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildInfoRow('Soil Type', soilAnalysis['soil_type'] ?? 'N/A', colorScheme),
          _buildInfoRow('pH Level', '${soilAnalysis['ph_analysis']['value']} (${soilAnalysis['ph_analysis']['status']})', colorScheme),
          _buildInfoRow('Organic Matter', soilAnalysis['organic_matter']['status'] ?? 'N/A', colorScheme),
          _buildInfoRow('Drainage', soilAnalysis['drainage'] ?? 'N/A', colorScheme),
        ],
      ),
    );
  }

  Widget _buildEconomicAnalysis(ColorScheme colorScheme) {
    final economicAnalysis = _recommendations!['economic_analysis'] as Map<String, dynamic>;
    
    return _buildResultSection(
      title: 'Economic Analysis',
      icon: Icons.monetization_on_rounded,
      colorScheme: colorScheme,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildInfoRow('Cost per Hectare', '₹${economicAnalysis['cost_per_hectare']?.toInt()}', colorScheme),
          _buildInfoRow('Budget Status', economicAnalysis['budget_status'] ?? 'N/A', colorScheme),
          _buildInfoRow('Recommended Area', '${economicAnalysis['recommended_area']?.toStringAsFixed(1)} hectares', colorScheme),
        ],
      ),
    );
  }

  Widget _buildRiskAssessment(ColorScheme colorScheme) {
    final riskAssessment = _recommendations!['risk_assessment'] as Map<String, dynamic>;
    final weatherRisks = riskAssessment['weather_risks'] as Map<String, dynamic>;
    
    return _buildResultSection(
      title: 'Risk Assessment',
      icon: Icons.security_rounded,
      colorScheme: colorScheme,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildRiskRow('Drought Risk', weatherRisks['drought_risk'], colorScheme),
          _buildRiskRow('Flood Risk', weatherRisks['flood_risk'], colorScheme),
          _buildRiskRow('Temperature Stress', weatherRisks['temperature_stress'], colorScheme),
        ],
      ),
    );
  }

  Widget _buildResultSection({
    required String title,
    required IconData icon,
    required Widget child,
    required ColorScheme colorScheme,
  }) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: colorScheme.outline.withOpacity(0.2)),
        boxShadow: [
          BoxShadow(
            color: colorScheme.shadow.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: colorScheme.primary, size: 20),
              const SizedBox(width: 8),
              Text(
                title,
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: colorScheme.onSurface,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          child,
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value, ColorScheme colorScheme) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Text(
            '$label: ',
            style: GoogleFonts.inter(
              fontSize: 14,
              color: colorScheme.onSurface.withOpacity(0.7),
            ),
          ),
          Text(
            value,
            style: GoogleFonts.inter(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: colorScheme.onSurface,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRiskRow(String label, String risk, ColorScheme colorScheme) {
    final Color riskColor = _getRiskColor(risk);
    
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Text(
            '$label: ',
            style: GoogleFonts.inter(
              fontSize: 14,
              color: colorScheme.onSurface.withOpacity(0.7),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            decoration: BoxDecoration(
              color: riskColor.withOpacity(0.2),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              risk.toUpperCase(),
              style: GoogleFonts.inter(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: riskColor,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButtons(ColorScheme colorScheme) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              setState(() {
                _showResults = false;
                _recommendations = null;
              });
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: colorScheme.surface,
              foregroundColor: colorScheme.onSurface,
              side: BorderSide(color: colorScheme.outline),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Text('Analyze Again'),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              // Save recommendations or navigate to crop planning
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Recommendations saved!')),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: colorScheme.primary,
              foregroundColor: colorScheme.onPrimary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Text('Save & Plan'),
          ),
        ),
      ],
    );
  }

  Color _getScoreColor(int score) {
    if (score >= 90) return Colors.green;
    if (score >= 75) return Colors.lightGreen;
    if (score >= 60) return Colors.orange;
    return Colors.red;
  }

  Color _getRiskColor(String risk) {
    switch (risk.toLowerCase()) {
      case 'high':
        return Colors.red;
      case 'medium':
        return Colors.orange;
      case 'low':
        return Colors.green;
      default:
        return Colors.grey;
    }
  }

  Future<void> _analyzeRecommendations() async {
    if (_stateController.text.isEmpty || _districtController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter state and district')),
      );
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      final farmSize = double.tryParse(_farmSizeController.text) ?? 1.0;
      final budget = double.tryParse(_budgetController.text) ?? 50000.0;

      final recommendations = await _aiEngine.getAICropRecommendations(
        state: _stateController.text,
        district: _districtController.text,
        farmSize: farmSize,
        budget: budget,
        experienceLevel: _selectedExperience,
        previousCrops: _selectedPreviousCrops,
        marketPreference: _selectedMarketPreference,
      );

      setState(() {
        _recommendations = recommendations;
        _showResults = true;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error generating recommendations: $e')),
      );
    }
  }

  @override
  void dispose() {
    _stateController.dispose();
    _districtController.dispose();
    _farmSizeController.dispose();
    _budgetController.dispose();
    super.dispose();
  }
}
