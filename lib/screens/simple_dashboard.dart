import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'weather_screen.dart';
import 'crop_advice_screen.dart';
import 'market_prices_screen.dart';

class SimpleDashboard extends StatefulWidget {
  const SimpleDashboard({super.key});

  @override
  State<SimpleDashboard> createState() => _SimpleDashboardState();
}

class _SimpleDashboardState extends State<SimpleDashboard> 
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late List<AnimationController> _cardAnimations;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    
    _cardAnimations = List.generate(
      6,
      (index) => AnimationController(
        duration: Duration(milliseconds: 600 + (index * 100)),
        vsync: this,
      ),
    );
    
    _animationController.forward();
    for (int i = 0; i < _cardAnimations.length; i++) {
      Future.delayed(Duration(milliseconds: i * 100), () {
        if (mounted) _cardAnimations[i].forward();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    
    final List<Map<String, dynamic>> features = [
      {
        'hindiTitle': 'मौसम जानकारी',
        'englishTitle': 'Weather Info',
        'icon': Icons.wb_sunny,
        'color': const Color(0xFFFF6B35),
        'gradient': const [Color(0xFFFF6B35), Color(0xFFFF8E3C)],
        'onTap': () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const WeatherScreen()),
        ),
      },
      {
        'hindiTitle': 'फसल सलाह',
        'englishTitle': 'Crop Advice',
        'icon': Icons.grass,
        'color': const Color(0xFF4CAF50),
        'gradient': const [Color(0xFF4CAF50), Color(0xFF66BB6A)],
        'onTap': () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const CropAdviceScreen()),
        ),
      },
      {
        'hindiTitle': 'बाजार भाव',
        'englishTitle': 'Market Prices',
        'icon': Icons.trending_up,
        'color': const Color(0xFF2196F3),
        'gradient': const [Color(0xFF2196F3), Color(0xFF42A5F5)],
        'onTap': () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const MarketPricesScreen()),
        ),
      },
      {
        'hindiTitle': 'किसान सहायता',
        'englishTitle': 'Farmer Support',
        'icon': Icons.support_agent,
        'color': const Color(0xFF9C27B0),
        'gradient': const [Color(0xFF9C27B0), Color(0xFFBA68C8)],
        'onTap': () => _showComingSoon('किसान सहायता'),
      },
      {
        'hindiTitle': 'कृषि तकनीक',
        'englishTitle': 'Farm Tech',
        'icon': Icons.engineering,
        'color': const Color(0xFF009688),
        'gradient': const [Color(0xFF009688), Color(0xFF4DB6AC)],
        'onTap': () => _showComingSoon('कृषि तकनीक'),
      },
      {
        'hindiTitle': 'समुदाय',
        'englishTitle': 'Community',
        'icon': Icons.people,
        'color': const Color(0xFF3F51B5),
        'gradient': const [Color(0xFF3F51B5), Color(0xFF7986CB)],
        'onTap': () => _showComingSoon('समुदाय'),
      },
    ];
    
    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: CustomScrollView(
        slivers: [
          // Modern App Bar with Material You design
          SliverAppBar.large(
            backgroundColor: colorScheme.primary,
            foregroundColor: colorScheme.onPrimary,
            title: Text(
              'भारतीय कृषि',
              style: GoogleFonts.roboto(
                fontSize: 28,
                fontWeight: FontWeight.w400,
                letterSpacing: 0,
              ),
            ),
            expandedHeight: 220,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      colorScheme.primary,
                      colorScheme.primaryContainer,
                    ],
                  ),
                ),
                child: AnimatedBuilder(
                  animation: _animationController,
                  builder: (context, child) {
                    return Transform.scale(
                      scale: 0.8 + (_animationController.value * 0.2),
                      child: Opacity(
                        opacity: _animationController.value,
                        child: const Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(height: 80),
                              Text(
                                '🌾',
                                style: TextStyle(fontSize: 72),
                              ),
                              SizedBox(height: 8),
                              Text(
                                'किसानों के लिए डिजिटल समाधान',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white70,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          
          // Content
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: [
                  // Welcome Card
                  _buildWelcomeCard(colorScheme),
                  const SizedBox(height: 32),
                  
                  // Features Grid
                  _buildFeaturesGrid(features, colorScheme),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _showHelpDialog(context),
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.onPrimary,
        icon: const Icon(Icons.help),
        label: Text(
          'सहायता',
          style: GoogleFonts.roboto(fontWeight: FontWeight.w600),
        ),
      ),
    );
  }

  Widget _buildWelcomeCard(ColorScheme colorScheme) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, 50 * (1 - _animationController.value)),
          child: Opacity(
            opacity: _animationController.value,
            child: Card(
              elevation: 0,
              color: colorScheme.primaryContainer,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 56,
                          height: 56,
                          decoration: BoxDecoration(
                            color: colorScheme.primary,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Icon(
                            Icons.agriculture,
                            size: 32,
                            color: colorScheme.onPrimary,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'स्वागत है',
                                style: GoogleFonts.roboto(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: colorScheme.onPrimaryContainer,
                                ),
                              ),
                              Text(
                                'आधुनिक कृषि समाधान के लिए',
                                style: GoogleFonts.roboto(
                                  fontSize: 14,
                                  color: colorScheme.onPrimaryContainer.withOpacity(0.8),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: colorScheme.surface.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.verified,
                            color: colorScheme.primary,
                            size: 20,
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              'आप गेस्ट मोड में हैं। सभी सुविधाओं का आनंद लें!',
                              style: GoogleFonts.roboto(
                                fontSize: 14,
                                color: colorScheme.onPrimaryContainer,
                                fontWeight: FontWeight.w500,
                              ),
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
      },
    );
  }

  Widget _buildFeaturesGrid(List<Map<String, dynamic>> features, ColorScheme colorScheme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'सुविधाएं',
          style: GoogleFonts.roboto(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: colorScheme.onSurface,
          ),
        ),
        const SizedBox(height: 20),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 1.1,
          ),
          itemCount: features.length,
          itemBuilder: (context, index) {
            return AnimatedBuilder(
              animation: _cardAnimations[index],
              builder: (context, child) {
                return Transform.scale(
                  scale: 0.8 + (_cardAnimations[index].value * 0.2),
                  child: Opacity(
                    opacity: _cardAnimations[index].value,
                    child: _buildFeatureCard(features[index], colorScheme),
                  ),
                );
              },
            );
          },
        ),
      ],
    );
  }

  Widget _buildFeatureCard(Map<String, dynamic> feature, ColorScheme colorScheme) {
    return Card(
      elevation: 0,
      color: colorScheme.surfaceContainerHigh,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      child: InkWell(
        onTap: feature['onTap'],
        borderRadius: BorderRadius.circular(24),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                (feature['gradient'][0] as Color).withOpacity(0.1),
                (feature['gradient'][1] as Color).withOpacity(0.05),
              ],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: feature['gradient'] as List<Color>,
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Icon(
                  feature['icon'] as IconData,
                  size: 28,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                feature['hindiTitle'] as String,
                style: GoogleFonts.roboto(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: colorScheme.onSurface,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 4),
              Text(
                feature['englishTitle'] as String,
                style: GoogleFonts.roboto(
                  fontSize: 12,
                  color: colorScheme.onSurface.withOpacity(0.7),
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showComingSoon(String featureName) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Theme.of(context).colorScheme.surfaceContainerHigh,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
          title: Row(
            children: [
              Icon(
                Icons.construction,
                color: Theme.of(context).colorScheme.primary,
              ),
              const SizedBox(width: 12),
              Text(
                'जल्द आ रहा है',
                style: GoogleFonts.roboto(fontWeight: FontWeight.w600),
              ),
            ],
          ),
          content: Text(
            '$featureName सुविधा पर काम चल रहा है। जल्द ही उपलब्ध होगी!',
            style: GoogleFonts.roboto(),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(
                'समझ गया',
                style: GoogleFonts.roboto(fontWeight: FontWeight.w600),
              ),
            ),
          ],
        );
      },
    );
  }

  void _showHelpDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Theme.of(context).colorScheme.surfaceContainerHigh,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
          title: Row(
            children: [
              Icon(
                Icons.help,
                color: Theme.of(context).colorScheme.primary,
              ),
              const SizedBox(width: 12),
              Text(
                'सहायता',
                style: GoogleFonts.roboto(fontWeight: FontWeight.w600),
              ),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'उपलब्ध सुविधाएं:',
                style: GoogleFonts.roboto(fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 12),
              _buildHelpItem('🌤️ मौसम जानकारी - वर्तमान मौसम और पूर्वानुमान'),
              _buildHelpItem('🌾 फसल सलाह - विस्तृत कृषि गाइड'),
              _buildHelpItem('📈 बाजार भाव - लाइव कीमतें और ट्रेंड'),
              const SizedBox(height: 12),
              Text(
                'अधिक सुविधाएं जल्द ही जोड़ी जाएंगी!',
                style: GoogleFonts.roboto(
                  fontSize: 12,
                  color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(
                'बंद करें',
                style: GoogleFonts.roboto(fontWeight: FontWeight.w600),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildHelpItem(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        text,
        style: GoogleFonts.roboto(fontSize: 14),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    for (var controller in _cardAnimations) {
      controller.dispose();
    }
    super.dispose();
  }
}
