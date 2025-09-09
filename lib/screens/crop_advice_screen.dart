import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CropAdviceScreen extends StatefulWidget {
  const CropAdviceScreen({super.key});

  @override
  State<CropAdviceScreen> createState() => _CropAdviceScreenState();
}

class _CropAdviceScreenState extends State<CropAdviceScreen> 
    with TickerProviderStateMixin {
  late TabController _tabController;
  String selectedCrop = 'गेहूं';
  
  final Map<String, Map<String, dynamic>> cropData = {
    'गेहूं': {
      'icon': '🌾',
      'color': Color(0xFFD4AF37),
      'season': 'रबी',
      'duration': '120-150 दिन',
      'yield': '40-50 क्विंटल/हेक्टेयर',
      'tips': [
        'बुआई का सही समय: नवंबर-दिसंबर',
        'मिट्टी का pH: 6.0-7.5',
        'सिंचाई: 4-6 बार',
        'उर्वरक: NPK 120:60:40 किग्रा/हेक्टेयर'
      ],
      'stages': [
        {'name': 'बुआई', 'days': '0-7', 'desc': 'बीज बोना और पानी देना'},
        {'name': 'अंकुरण', 'days': '7-15', 'desc': 'पौधे का निकलना'},
        {'name': 'कल्ले निकलना', 'days': '20-40', 'desc': 'नई शाखाओं का विकास'},
        {'name': 'बाली आना', 'days': '60-90', 'desc': 'फूल और दाने का विकास'},
        {'name': 'पकना', 'days': '100-120', 'desc': 'कटाई की तैयारी'},
      ]
    },
    'धान': {
      'icon': '🌾',
      'color': Color(0xFF4CAF50),
      'season': 'खरीफ',
      'duration': '90-120 दिन',
      'yield': '50-60 क्विंटल/हेक्टेयर',
      'tips': [
        'बुआई का सही समय: जून-जुलाई',
        'मिट्टी का pH: 5.5-6.5',
        'पानी की आवश्यकता: अधिक',
        'उर्वरक: NPK 100:50:50 किग्रा/हेक्टेयर'
      ],
      'stages': [
        {'name': 'नर्सरी', 'days': '0-30', 'desc': 'पौधे तैयार करना'},
        {'name': 'रोपाई', 'days': '30-35', 'desc': 'खेत में पौधे लगाना'},
        {'name': 'कल्ले निकलना', 'days': '35-60', 'desc': 'नई शाखाओं का विकास'},
        {'name': 'बाली आना', 'days': '60-85', 'desc': 'फूल और दाने का विकास'},
        {'name': 'पकना', 'days': '85-120', 'desc': 'कटाई की तैयारी'},
      ]
    },
    'मक्का': {
      'icon': '🌽',
      'color': Color(0xFFFFB74D),
      'season': 'खरीफ/रबी',
      'duration': '80-110 दिन',
      'yield': '60-80 क्विंटल/हेक्टेयर',
      'tips': [
        'बुआई का सही समय: जून-जुलाई, फरवरी-मार्च',
        'मिट्टी का pH: 6.0-7.5',
        'सिंचाई: नियमित आवश्यक',
        'उर्वरक: NPK 150:75:60 किग्रा/हेक्टेयर'
      ],
      'stages': [
        {'name': 'बुआई', 'days': '0-7', 'desc': 'बीज बोना'},
        {'name': 'अंकुरण', 'days': '7-15', 'desc': 'पौधे का निकलना'},
        {'name': 'घुटने की ऊंचाई', 'days': '30-45', 'desc': 'पौधे का बढ़ना'},
        {'name': 'फूल आना', 'days': '50-70', 'desc': 'पराग और रेशम'},
        {'name': 'दाना भरना', 'days': '70-100', 'desc': 'भुट्टे का विकास'},
      ]
    },
  };

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final currentCrop = cropData[selectedCrop]!;
    
    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: CustomScrollView(
        slivers: [
          // Modern SliverAppBar with Material You design
          SliverAppBar.large(
            backgroundColor: currentCrop['color'],
            foregroundColor: Colors.white,
            title: Text(
              'फसल सलाह',
              style: GoogleFonts.roboto(
                fontSize: 28,
                fontWeight: FontWeight.w400,
                letterSpacing: 0,
              ),
            ),
            expandedHeight: 200,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      currentCrop['color'],
                      (currentCrop['color'] as Color).withOpacity(0.7),
                    ],
                  ),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 60),
                      Text(
                        currentCrop['icon'],
                        style: const TextStyle(fontSize: 72),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        selectedCrop,
                        style: GoogleFonts.roboto(
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
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
                  // Crop Selector Card
                  _buildCropSelector(colorScheme),
                  const SizedBox(height: 24),
                  
                  // Tab Bar
                  _buildTabBar(colorScheme),
                  const SizedBox(height: 24),
                  
                  // Tab Content
                  SizedBox(
                    height: 500,
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        _buildOverviewTab(currentCrop, colorScheme),
                        _buildStagesTab(currentCrop, colorScheme),
                        _buildTipsTab(currentCrop, colorScheme),
                      ],
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

  Widget _buildCropSelector(ColorScheme colorScheme) {
    return Card(
      elevation: 0,
      color: colorScheme.surfaceContainerHighest,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'फसल चुनें',
              style: GoogleFonts.roboto(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: colorScheme.onSurface,
              ),
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: cropData.keys.map((crop) {
                final isSelected = crop == selectedCrop;
                final cropColor = cropData[crop]!['color'] as Color;
                
                return FilterChip(
                  selected: isSelected,
                  label: Text(
                    '${cropData[crop]!['icon']} $crop',
                    style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w500,
                      color: isSelected ? Colors.white : colorScheme.onSurface,
                    ),
                  ),
                  backgroundColor: colorScheme.surfaceContainerHigh,
                  selectedColor: cropColor,
                  checkmarkColor: Colors.white,
                  side: BorderSide.none,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  onSelected: (selected) {
                    if (selected) {
                      setState(() {
                        selectedCrop = crop;
                      });
                    }
                  },
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabBar(ColorScheme colorScheme) {
    return Container(
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerHigh,
        borderRadius: BorderRadius.circular(32),
      ),
      child: TabBar(
        controller: _tabController,
        indicatorSize: TabBarIndicatorSize.tab,
        indicator: BoxDecoration(
          color: colorScheme.primary,
          borderRadius: BorderRadius.circular(32),
        ),
        labelColor: colorScheme.onPrimary,
        unselectedLabelColor: colorScheme.onSurface,
        labelStyle: GoogleFonts.roboto(
          fontWeight: FontWeight.w500,
          fontSize: 14,
        ),
        tabs: const [
          Tab(text: 'विवरण'),
          Tab(text: 'चरण'),
          Tab(text: 'सुझाव'),
        ],
      ),
    );
  }

  Widget _buildOverviewTab(Map<String, dynamic> crop, ColorScheme colorScheme) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildInfoCard('मौसम', crop['season'], Icons.wb_sunny, colorScheme),
          const SizedBox(height: 16),
          _buildInfoCard('अवधि', crop['duration'], Icons.schedule, colorScheme),
          const SizedBox(height: 16),
          _buildInfoCard('उत्पादन', crop['yield'], Icons.agriculture, colorScheme),
        ],
      ),
    );
  }

  Widget _buildStagesTab(Map<String, dynamic> crop, ColorScheme colorScheme) {
    final stages = crop['stages'] as List;
    
    return ListView.builder(
      itemCount: stages.length,
      itemBuilder: (context, index) {
        final stage = stages[index];
        final isLast = index == stages.length - 1;
        
        return Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Timeline indicator
              Column(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: colorScheme.primary,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        '${index + 1}',
                        style: GoogleFonts.roboto(
                          color: colorScheme.onPrimary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  if (!isLast)
                    Container(
                      width: 2,
                      height: 60,
                      color: colorScheme.outline,
                    ),
                ],
              ),
              const SizedBox(width: 16),
              
              // Stage content
              Expanded(
                child: Card(
                  elevation: 0,
                  color: colorScheme.surfaceContainerHigh,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          stage['name'],
                          style: GoogleFonts.roboto(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: colorScheme.onSurface,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          stage['days'],
                          style: GoogleFonts.roboto(
                            fontSize: 14,
                            color: colorScheme.primary,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          stage['desc'],
                          style: GoogleFonts.roboto(
                            fontSize: 14,
                            color: colorScheme.onSurface.withOpacity(0.7),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildTipsTab(Map<String, dynamic> crop, ColorScheme colorScheme) {
    final tips = crop['tips'] as List<String>;
    
    return ListView.builder(
      itemCount: tips.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: Card(
            elevation: 0,
            color: colorScheme.surfaceContainerHigh,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.all(16),
              leading: Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: colorScheme.primary,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.lightbulb,
                  color: colorScheme.onPrimary,
                  size: 18,
                ),
              ),
              title: Text(
                tips[index],
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: colorScheme.onSurface,
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildInfoCard(String title, String value, IconData icon, ColorScheme colorScheme) {
    return Card(
      elevation: 0,
      color: colorScheme.surfaceContainerHigh,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Row(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: colorScheme.primary,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Icon(
                icon,
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
                    title,
                    style: GoogleFonts.roboto(
                      fontSize: 14,
                      color: colorScheme.onSurface.withOpacity(0.7),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    value,
                    style: GoogleFonts.roboto(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: colorScheme.onSurface,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
