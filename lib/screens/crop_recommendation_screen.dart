import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../services/crop_database.dart';
import '../widgets/animated_widgets.dart';
import '../providers/theme_provider.dart';

// Providers for crop recommendation
final selectedSeasonProvider = StateProvider<String?>((ref) => null);
final selectedMonthProvider = StateProvider<int?>((ref) => null);
final selectedSoilTypeProvider = StateProvider<String?>((ref) => null);
final selectedWaterReqProvider = StateProvider<String?>((ref) => null);
final recommendationsProvider = StateProvider<List<Map<String, dynamic>>>((ref) => []);

class CropRecommendationScreen extends ConsumerStatefulWidget {
  const CropRecommendationScreen({super.key});

  @override
  ConsumerState<CropRecommendationScreen> createState() => _CropRecommendationScreenState();
}

class _CropRecommendationScreenState extends ConsumerState<CropRecommendationScreen>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: const Interval(0.0, 0.6, curve: Curves.easeOut),
    ));

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.5),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: const Interval(0.2, 0.8, curve: Curves.elasticOut),
    ));

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _generateRecommendations() {
    final season = ref.read(selectedSeasonProvider);
    final month = ref.read(selectedMonthProvider);
    final soilType = ref.read(selectedSoilTypeProvider);
    final waterReq = ref.read(selectedWaterReqProvider);

    final recommendations = CropDatabase.getRecommendations(
      season: season,
      month: month,
      soilType: soilType,
      waterAvailability: waterReq,
    );

    ref.read(recommendationsProvider.notifier).state = recommendations;
  }

  @override
  Widget build(BuildContext context) {
    final isDark = ref.watch(appSettingsProvider).isDarkMode;
    final screenSize = MediaQuery.of(context).size;
    final isTablet = screenSize.width > 600;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: isDark
                ? [
                    const Color(0xFF1A1A2E),
                    const Color(0xFF16213E),
                    const Color(0xFF0F3460),
                  ]
                : [
                    const Color(0xFF4CAF50),
                    const Color(0xFF45A049),
                    const Color(0xFF388E3C),
                  ],
          ),
        ),
        child: SafeArea(
          child: FadeTransition(
            opacity: _fadeAnimation,
            child: SlideTransition(
              position: _slideAnimation,
              child: SingleChildScrollView(
                padding: EdgeInsets.all(isTablet ? 24.0 : 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildHeader(isDark, isTablet),
                    const SizedBox(height: 24),
                    _buildFiltersSection(isDark, isTablet),
                    const SizedBox(height: 24),
                    _buildRecommendationsSection(isDark, isTablet),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(bool isDark, bool isTablet) {
    return Row(
      children: [
        GradientIconButton(
          icon: Icons.arrow_back,
          onPressed: () => Navigator.of(context).pop(),
          tooltip: 'Back',
          gradientColors: isDark
              ? [Colors.blue.shade400, Colors.purple.shade400]
              : [Colors.white, Colors.green.shade100],
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AnimatedFarmLogo(
                size: isTablet ? 40 : 32,
              ),
              const SizedBox(height: 8),
              Text(
                'Crop Recommendations',
                style: GoogleFonts.poppins(
                  fontSize: isTablet ? 28 : 24,
                  fontWeight: FontWeight.bold,
                  color: isDark ? Colors.white : Colors.white,
                ),
              ),
              Text(
                'Find the best crops for your farm',
                style: GoogleFonts.poppins(
                  fontSize: isTablet ? 16 : 14,
                  color: isDark ? Colors.white70 : Colors.white70,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildFiltersSection(bool isDark, bool isTablet) {
    return Container(
      padding: EdgeInsets.all(isTablet ? 24 : 20),
      decoration: BoxDecoration(
        color: isDark ? Colors.grey[900]?.withOpacity(0.8) : Colors.white.withOpacity(0.9),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              TechIconWidget(
                icon: Icons.tune,
                color: isDark ? Colors.blue : Colors.green,
              ),
              const SizedBox(width: 12),
              Text(
                'Filter Criteria',
                style: GoogleFonts.poppins(
                  fontSize: isTablet ? 20 : 18,
                  fontWeight: FontWeight.bold,
                  color: isDark ? Colors.white : Colors.black87,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: isTablet ? 2 : 1,
            childAspectRatio: isTablet ? 6 : 8,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            children: [
              _buildSeasonDropdown(isDark),
              _buildMonthDropdown(isDark),
              _buildSoilTypeDropdown(isDark),
              _buildWaterRequirementDropdown(isDark),
            ],
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: _generateRecommendations,
              style: ElevatedButton.styleFrom(
                backgroundColor: isDark ? Colors.blue : Colors.green,
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(vertical: isTablet ? 16 : 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 4,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.search),
                  const SizedBox(width: 8),
                  Text(
                    'Get Recommendations',
                    style: GoogleFonts.poppins(
                      fontSize: isTablet ? 16 : 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSeasonDropdown(bool isDark) {
    return Consumer(
      builder: (context, ref, child) {
        final selectedSeason = ref.watch(selectedSeasonProvider);
        return DropdownButtonFormField<String>(
          value: selectedSeason,
          decoration: InputDecoration(
            labelText: 'Season',
            prefixIcon: Icon(Icons.calendar_month, color: isDark ? Colors.blue : Colors.green),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            filled: true,
            fillColor: isDark ? Colors.grey[800] : Colors.grey[50],
          ),
          items: CropDatabase.getSeasons().map((season) {
            return DropdownMenuItem(
              value: season,
              child: Text(season),
            );
          }).toList(),
          onChanged: (value) {
            ref.read(selectedSeasonProvider.notifier).state = value;
          },
        );
      },
    );
  }

  Widget _buildMonthDropdown(bool isDark) {
    final months = [
      'January', 'February', 'March', 'April', 'May', 'June',
      'July', 'August', 'September', 'October', 'November', 'December'
    ];

    return Consumer(
      builder: (context, ref, child) {
        final selectedMonth = ref.watch(selectedMonthProvider);
        return DropdownButtonFormField<int>(
          value: selectedMonth,
          decoration: InputDecoration(
            labelText: 'Month',
            prefixIcon: Icon(Icons.date_range, color: isDark ? Colors.blue : Colors.green),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            filled: true,
            fillColor: isDark ? Colors.grey[800] : Colors.grey[50],
          ),
          items: months.asMap().entries.map((entry) {
            return DropdownMenuItem(
              value: entry.key + 1,
              child: Text(entry.value),
            );
          }).toList(),
          onChanged: (value) {
            ref.read(selectedMonthProvider.notifier).state = value;
          },
        );
      },
    );
  }

  Widget _buildSoilTypeDropdown(bool isDark) {
    return Consumer(
      builder: (context, ref, child) {
        final selectedSoilType = ref.watch(selectedSoilTypeProvider);
        return DropdownButtonFormField<String>(
          value: selectedSoilType,
          decoration: InputDecoration(
            labelText: 'Soil Type',
            prefixIcon: Icon(Icons.terrain, color: isDark ? Colors.blue : Colors.green),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            filled: true,
            fillColor: isDark ? Colors.grey[800] : Colors.grey[50],
          ),
          items: CropDatabase.getSoilTypes().map((soilType) {
            return DropdownMenuItem(
              value: soilType,
              child: Text(soilType),
            );
          }).toList(),
          onChanged: (value) {
            ref.read(selectedSoilTypeProvider.notifier).state = value;
          },
        );
      },
    );
  }

  Widget _buildWaterRequirementDropdown(bool isDark) {
    return Consumer(
      builder: (context, ref, child) {
        final selectedWaterReq = ref.watch(selectedWaterReqProvider);
        return DropdownButtonFormField<String>(
          value: selectedWaterReq,
          decoration: InputDecoration(
            labelText: 'Water Availability',
            prefixIcon: Icon(Icons.water_drop, color: isDark ? Colors.blue : Colors.green),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            filled: true,
            fillColor: isDark ? Colors.grey[800] : Colors.grey[50],
          ),
          items: CropDatabase.getWaterRequirements().map((waterReq) {
            return DropdownMenuItem(
              value: waterReq,
              child: Text(waterReq),
            );
          }).toList(),
          onChanged: (value) {
            ref.read(selectedWaterReqProvider.notifier).state = value;
          },
        );
      },
    );
  }

  Widget _buildRecommendationsSection(bool isDark, bool isTablet) {
    return Consumer(
      builder: (context, ref, child) {
        final recommendations = ref.watch(recommendationsProvider);

        if (recommendations.isEmpty) {
          return Container(
            padding: EdgeInsets.all(isTablet ? 48 : 32),
            decoration: BoxDecoration(
              color: isDark ? Colors.grey[900]?.withOpacity(0.8) : Colors.white.withOpacity(0.9),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: Column(
              children: [
                TechIconWidget(
                  icon: Icons.agriculture,
                  color: isDark ? Colors.blue : Colors.green,
                  size: isTablet ? 64 : 48,
                ),
                const SizedBox(height: 16),
                Text(
                  'Select criteria above to get personalized crop recommendations',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontSize: isTablet ? 16 : 14,
                    color: isDark ? Colors.white70 : Colors.black54,
                  ),
                ),
              ],
            ),
          );
        }

        return Container(
          padding: EdgeInsets.all(isTablet ? 24 : 20),
          decoration: BoxDecoration(
            color: isDark ? Colors.grey[900]?.withOpacity(0.8) : Colors.white.withOpacity(0.9),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  TechIconWidget(
                    icon: Icons.recommend,
                    color: isDark ? Colors.green : Colors.green,
                  ),
                  const SizedBox(width: 12),
                  Text(
                    'Recommended Crops',
                    style: GoogleFonts.poppins(
                      fontSize: isTablet ? 20 : 18,
                      fontWeight: FontWeight.bold,
                      color: isDark ? Colors.white : Colors.black87,
                    ),
                  ),
                  const Spacer(),
                  AnimatedCounterText(
                    targetValue: recommendations.length,
                    style: GoogleFonts.poppins(
                      fontSize: isTablet ? 16 : 14,
                      fontWeight: FontWeight.w600,
                      color: isDark ? Colors.green : Colors.green,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: isTablet ? 2 : 1,
                  childAspectRatio: isTablet ? 2.5 : 3.5,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                ),
                itemCount: recommendations.length,
                itemBuilder: (context, index) {
                  final crop = recommendations[index];
                  return _buildCropCard(crop, isDark, isTablet);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildCropCard(Map<String, dynamic> crop, bool isDark, bool isTablet) {
    return Container(
      padding: EdgeInsets.all(isTablet ? 20 : 16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: isDark
              ? [Colors.grey[800]!, Colors.grey[700]!]
              : [Colors.green.shade50, Colors.green.shade100],
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isDark ? Colors.grey[600]! : Colors.green.shade200,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              TechIconWidget(
                icon: Icons.eco,
                color: isDark ? Colors.green.shade400 : Colors.green.shade600,
                size: isTablet ? 28 : 24,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  crop['name'],
                  style: GoogleFonts.poppins(
                    fontSize: isTablet ? 18 : 16,
                    fontWeight: FontWeight.bold,
                    color: isDark ? Colors.white : Colors.black87,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            crop['description'],
            style: GoogleFonts.poppins(
              fontSize: isTablet ? 14 : 12,
              color: isDark ? Colors.white70 : Colors.black54,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const Spacer(),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Duration',
                      style: GoogleFonts.poppins(
                        fontSize: isTablet ? 12 : 10,
                        color: isDark ? Colors.white60 : Colors.black45,
                      ),
                    ),
                    Text(
                      '${crop['duration']} days',
                      style: GoogleFonts.poppins(
                        fontSize: isTablet ? 14 : 12,
                        fontWeight: FontWeight.w600,
                        color: isDark ? Colors.white : Colors.black87,
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
                      'Yield',
                      style: GoogleFonts.poppins(
                        fontSize: isTablet ? 12 : 10,
                        color: isDark ? Colors.white60 : Colors.black45,
                      ),
                    ),
                    Text(
                      '${crop['yield']['min']}-${crop['yield']['max']} q/ha',
                      style: GoogleFonts.poppins(
                        fontSize: isTablet ? 14 : 12,
                        fontWeight: FontWeight.w600,
                        color: isDark ? Colors.green.shade400 : Colors.green.shade600,
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
}
