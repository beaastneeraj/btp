import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math' as math;

import '../services/satellite_data_service.dart';
import '../services/voice_command_service.dart';
import '../services/iot_integration_service.dart';
import '../screens/satellite_data_dashboard.dart';
import '../screens/iot_dashboard_screen.dart';
import '../components/revolutionary_ui_components.dart';

class ComprehensiveAgricultureApp extends StatefulWidget {
  const ComprehensiveAgricultureApp({super.key});

  @override
  _ComprehensiveAgricultureAppState createState() => _ComprehensiveAgricultureAppState();
}

class _ComprehensiveAgricultureAppState extends State<ComprehensiveAgricultureApp>
    with TickerProviderStateMixin {
  late AnimationController _heroController;
  late AnimationController _backgroundController;
  late Animation<double> _heroAnimation;
  
  final VoiceCommandService _voiceService = VoiceCommandService.instance;
  bool _isVoiceListening = false;
  String _voiceStatus = 'Ready to listen';

  @override
  void initState() {
    super.initState();
    
    _heroController = AnimationController(
      duration: Duration(seconds: 3),
      vsync: this,
    );
    
    _backgroundController = AnimationController(
      duration: Duration(seconds: 20),
      vsync: this,
    )..repeat();

    _heroAnimation = CurvedAnimation(
      parent: _heroController,
      curve: Curves.easeOutCubic,
    );

    _heroController.forward();
    _initializeServices();
  }

  Future<void> _initializeServices() async {
    try {
      await _voiceService.initializeVoiceService();
      print('🎤 Voice service initialized');
    } catch (e) {
      print('❌ Voice service initialization failed: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF0F4C75),
              Color(0xFF3282B8),
              Color(0xFF0F4C75),
            ],
          ),
        ),
        child: Stack(
          children: [
            // Animated background particles
            Positioned.fill(
              child: ParticleField(
                particleCount: 100,
                particleColor: Colors.white.withOpacity(0.1),
                maxParticleSize: 3,
                minParticleSize: 1,
              ),
            ),
            
            // Main content
            SafeArea(
              child: CustomScrollView(
                slivers: [
                  _buildHeroSection(),
                  SliverPadding(
                    padding: EdgeInsets.all(20),
                    sliver: SliverList(
                      delegate: SliverChildListDelegate([
                        _buildFeatureShowcase(),
                        SizedBox(height: 30),
                        _buildQuickActions(),
                        SizedBox(height: 30),
                        _buildStatisticsSection(),
                        SizedBox(height: 30),
                        _buildVoiceControlSection(),
                        SizedBox(height: 30),
                        _buildFooter(),
                        SizedBox(height: 50),
                      ]),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: _buildVoiceFloatingButton(),
    );
  }

  Widget _buildHeroSection() {
    return SliverAppBar(
      expandedHeight: 250,
      floating: false,
      pinned: true,
      backgroundColor: Colors.transparent,
      flexibleSpace: FlexibleSpaceBar(
        background: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.black.withOpacity(0.3),
                Colors.transparent,
              ],
            ),
          ),
          child: Center(
            child: AnimatedBuilder(
              animation: _heroAnimation,
              builder: (context, child) {
                return Transform.translate(
                  offset: Offset(0, 50 * (1 - _heroAnimation.value)),
                  child: Opacity(
                    opacity: _heroAnimation.value,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        BreathingCard(
                          child: Container(
                            padding: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              gradient: RadialGradient(
                                colors: [
                                  Colors.green.withOpacity(0.3),
                                  Colors.transparent,
                                ],
                              ),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.agriculture,
                              size: 60,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Text(
                          'Smart Agriculture',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.2,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Revolutionary IoT • Satellite Intelligence • Voice Control',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFeatureShowcase() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '🚀 Revolutionary Features',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 20),
        GridView.count(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 1.1,
          children: [
            _buildFeatureCard(
              '🛰️ Satellite Data',
              'Real-time NDVI, weather integration, and crop monitoring',
              Icons.satellite_alt,
              Colors.blue,
              () => _navigateToSatelliteData(),
            ),
            _buildFeatureCard(
              '🤖 IoT Integration',
              'Smart sensors, irrigation control, livestock monitoring',
              Icons.sensors,
              Colors.green,
              () => _navigateToIoTDashboard(),
            ),
            _buildFeatureCard(
              '🎤 Voice Control',
              'Multi-language commands in 12+ Indian languages',
              Icons.mic,
              Colors.purple,
              () => _testVoiceCommands(),
            ),
            _buildFeatureCard(
              '🎨 3D UI',
              'Neumorphic design, glassmorphic effects, animations',
              Icons.auto_awesome,
              Colors.orange,
              () => _showUIDemo(),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildFeatureCard(String title, String description, IconData icon, Color color, VoidCallback onTap) {
    return Parallax3DCard(
      onTap: onTap,
      child: GlassmorphicCard(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: color.withOpacity(0.2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: color, size: 24),
            ),
            SizedBox(height: 12),
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              description,
              style: TextStyle(
                color: Colors.white70,
                fontSize: 12,
                height: 1.3,
              ),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickActions() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '⚡ Quick Actions',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 20),
        Row(
          children: [
            Expanded(
              child: _buildActionButton(
                'Check Crops',
                Icons.grass,
                Colors.green,
                () => _checkCropHealth(),
              ),
            ),
            SizedBox(width: 12),
            Expanded(
              child: _buildActionButton(
                'Weather Alert',
                Icons.cloud,
                Colors.blue,
                () => _getWeatherAlert(),
              ),
            ),
          ],
        ),
        SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: _buildActionButton(
                'Start Irrigation',
                Icons.water_drop,
                Colors.cyan,
                () => _startIrrigation(),
              ),
            ),
            SizedBox(width: 12),
            Expanded(
              child: _buildActionButton(
                'Launch Drone',
                Icons.flight_takeoff,
                Colors.purple,
                () => _launchDrone(),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildActionButton(String label, IconData icon, Color color, VoidCallback onPressed) {
    return NeumorphicContainer(
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
      backgroundColor: Color(0xFF2A3A52),
      onTap: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: color.withOpacity(0.2),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: color, size: 18),
          ),
          SizedBox(width: 8),
          Text(
            label,
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatisticsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '📊 Live Statistics',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 20),
        Row(
          children: [
            Expanded(
              child: AnimatedCounterCard(
                title: 'Soil Moisture',
                value: 67.5,
                unit: '%',
                icon: Icons.water_drop,
                color: Colors.blue,
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: AnimatedCounterCard(
                title: 'NDVI Index',
                value: 0.82,
                unit: '',
                icon: Icons.eco,
                color: Colors.green,
              ),
            ),
          ],
        ),
        SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: AnimatedCounterCard(
                title: 'Temperature',
                value: 28.5,
                unit: '°C',
                icon: Icons.thermostat,
                color: Colors.orange,
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: AnimatedCounterCard(
                title: 'Humidity',
                value: 74.2,
                unit: '%',
                icon: Icons.water_drop,
                color: Colors.cyan,
              ),
            ),
          ],
        ),
        SizedBox(height: 20),
        GlassmorphicCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Crop Health Progress',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 16),
              LiquidProgressIndicator(
                value: 0.78,
                valueColor: Colors.green,
                backgroundColor: Color(0xFF2A2A2A),
                height: 12,
                label: 'Overall Health Score',
              ),
              SizedBox(height: 12),
              LiquidProgressIndicator(
                value: 0.65,
                valueColor: Colors.blue,
                backgroundColor: Color(0xFF2A2A2A),
                height: 12,
                label: 'Water Efficiency',
              ),
              SizedBox(height: 12),
              LiquidProgressIndicator(
                value: 0.89,
                valueColor: Colors.orange,
                backgroundColor: Color(0xFF2A2A2A),
                height: 12,
                label: 'Nutrient Levels',
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildVoiceControlSection() {
    return GlassmorphicCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  gradient: RadialGradient(
                    colors: [
                      Colors.purple.withOpacity(0.3),
                      Colors.purple.withOpacity(0.1),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(Icons.mic, color: Colors.purple, size: 24),
              ),
              SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Voice Control',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      _voiceStatus,
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          Text(
            'Try saying:',
            style: TextStyle(
              color: Colors.white70,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              _buildVoiceCommand('मौसम कैसा है?'),
              _buildVoiceCommand('फसल की जांच करो'),
              _buildVoiceCommand('सिंचाई शुरू करो'),
              _buildVoiceCommand('What is the weather?'),
              _buildVoiceCommand('Check soil moisture'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildVoiceCommand(String command) {
    return GestureDetector(
      onTap: () => _simulateVoiceCommand(command),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: Colors.purple.withOpacity(0.2),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.purple.withOpacity(0.3)),
        ),
        child: Text(
          command,
          style: TextStyle(
            color: Colors.white,
            fontSize: 12,
          ),
        ),
      ),
    );
  }

  Widget _buildFooter() {
    return GlassmorphicCard(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildFooterStat('IoT Devices', '12'),
              _buildFooterStat('Active Sensors', '24'),
              _buildFooterStat('Data Points', '1.2K'),
            ],
          ),
          SizedBox(height: 16),
          Text(
            'Powered by Advanced Agricultural Intelligence',
            style: TextStyle(
              color: Colors.white70,
              fontSize: 12,
              fontStyle: FontStyle.italic,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildFooterStat(String label, String value) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          label,
          style: TextStyle(
            color: Colors.white70,
            fontSize: 12,
          ),
        ),
      ],
    );
  }

  Widget _buildVoiceFloatingButton() {
    return PulsingButton(
      onPressed: _toggleVoiceListening,
      color: _isVoiceListening ? Colors.red : Colors.purple,
      size: 65,
      child: Icon(
        _isVoiceListening ? Icons.mic : Icons.mic_none,
        color: Colors.white,
        size: 28,
      ),
    );
  }

  // Action methods
  void _navigateToSatelliteData() {
    HapticFeedback.mediumImpact();
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, _) => SatelliteDataDashboard(),
        transitionsBuilder: (context, animation, _, child) {
          return SlideTransition(
            position: Tween<Offset>(
              begin: Offset(1.0, 0.0),
              end: Offset.zero,
            ).animate(CurvedAnimation(
              parent: animation,
              curve: Curves.easeOutCubic,
            )),
            child: child,
          );
        },
        transitionDuration: Duration(milliseconds: 500),
      ),
    );
  }

  void _navigateToIoTDashboard() {
    HapticFeedback.mediumImpact();
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, _) => IoTDashboardScreen(),
        transitionsBuilder: (context, animation, _, child) {
          return SlideTransition(
            position: Tween<Offset>(
              begin: Offset(0.0, 1.0),
              end: Offset.zero,
            ).animate(CurvedAnimation(
              parent: animation,
              curve: Curves.easeOutCubic,
            )),
            child: child,
          );
        },
        transitionDuration: Duration(milliseconds: 500),
      ),
    );
  }

  void _testVoiceCommands() {
    HapticFeedback.mediumImpact();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Color(0xFF1E3C72),
        title: Text('Voice Commands Demo', style: TextStyle(color: Colors.white)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Voice commands support:\n\n'
              '• Hindi: "मौसम कैसा है?"\n'
              '• English: "Check soil moisture"\n'
              '• Punjabi: "ਫਸਲ ਦੀ ਜਾਂਚ ਕਰੋ"\n'
              '• Tamil: "வானிலை எப்படி இருக்கிறது?"\n'
              '• And 8+ more languages!',
              style: TextStyle(color: Colors.white70, height: 1.5),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Got it!', style: TextStyle(color: Colors.blue)),
          ),
        ],
      ),
    );
  }

  void _showUIDemo() {
    HapticFeedback.mediumImpact();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Color(0xFF1E3C72),
        title: Text('Revolutionary UI Demo', style: TextStyle(color: Colors.white)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            NeumorphicContainer(
              padding: EdgeInsets.all(16),
              child: Row(
                children: [
                  Icon(Icons.auto_awesome, color: Colors.orange),
                  SizedBox(width: 8),
                  Text('Neumorphic Effect', style: TextStyle(color: Colors.white)),
                ],
              ),
            ),
            SizedBox(height: 12),
            GlassmorphicCard(
              child: Row(
                children: [
                  Icon(Icons.blur_on, color: Colors.blue),
                  SizedBox(width: 8),
                  Text('Glassmorphic Effect', style: TextStyle(color: Colors.white)),
                ],
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Amazing!', style: TextStyle(color: Colors.green)),
          ),
        ],
      ),
    );
  }

  Future<void> _checkCropHealth() async {
    HapticFeedback.lightImpact();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('🌱 Analyzing crop health via satellite data...'),
        backgroundColor: Colors.green,
        behavior: SnackBarBehavior.floating,
      ),
    );
    
    // Simulate checking crop health
    await Future.delayed(Duration(seconds: 2));
    
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('✅ Crop health: Excellent (NDVI: 0.82)'),
        backgroundColor: Colors.green,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  Future<void> _getWeatherAlert() async {
    HapticFeedback.lightImpact();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('🌤️ Fetching weather data...'),
        backgroundColor: Colors.blue,
        behavior: SnackBarBehavior.floating,
      ),
    );
    
    await Future.delayed(Duration(seconds: 1));
    
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('☀️ Weather: 28°C, Sunny, Perfect for field work!'),
        backgroundColor: Colors.blue,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  Future<void> _startIrrigation() async {
    HapticFeedback.lightImpact();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('💧 Starting smart irrigation system...'),
        backgroundColor: Colors.cyan,
        behavior: SnackBarBehavior.floating,
      ),
    );
    
    await Future.delayed(Duration(seconds: 1));
    
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('✅ Irrigation started for Zone 1 & 2'),
        backgroundColor: Colors.cyan,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  Future<void> _launchDrone() async {
    HapticFeedback.lightImpact();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('🚁 Launching agricultural drone...'),
        backgroundColor: Colors.purple,
        behavior: SnackBarBehavior.floating,
      ),
    );
    
    await Future.delayed(Duration(seconds: 2));
    
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('✅ Drone mission started: Field surveillance'),
        backgroundColor: Colors.purple,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  Future<void> _toggleVoiceListening() async {
    HapticFeedback.mediumImpact();
    setState(() {
      _isVoiceListening = !_isVoiceListening;
      _voiceStatus = _isVoiceListening ? 'Listening...' : 'Ready to listen';
    });

    if (_isVoiceListening) {
      // Simulate listening
      await Future.delayed(Duration(seconds: 3));
      if (mounted) {
        setState(() {
          _isVoiceListening = false;
          _voiceStatus = 'Processing command...';
        });
        
        await Future.delayed(Duration(seconds: 1));
        if (mounted) {
          setState(() {
            _voiceStatus = 'Ready to listen';
          });
          
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('🎤 Voice command processed successfully!'),
              backgroundColor: Colors.purple,
              behavior: SnackBarBehavior.floating,
            ),
          );
        }
      }
    }
  }

  Future<void> _simulateVoiceCommand(String command) async {
    HapticFeedback.lightImpact();
    try {
      final response = await _voiceService.processCommand(command);
      
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('🎤 Voice: $command\n💬 Response: ${response.spokenResponse}'),
          backgroundColor: Colors.purple,
          behavior: SnackBarBehavior.floating,
          duration: Duration(seconds: 4),
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('❌ Voice processing failed: $e'),
          backgroundColor: Colors.red,
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  @override
  void dispose() {
    _heroController.dispose();
    _backgroundController.dispose();
    super.dispose();
  }
}
