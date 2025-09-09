import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> 
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  String selectedCity = 'दिल्ली';
  
  Map<String, Map<String, dynamic>> weatherData = {
    'दिल्ली': {
      'temp': '28°C',
      'condition': 'धूप',
      'humidity': '65%',
      'wind': '15 km/h',
      'pressure': '1013 hPa',
      'visibility': '10 km',
      'icon': Icons.wb_sunny,
      'color': Color(0xFFFF6B35),
      'gradient': [Color(0xFFFF6B35), Color(0xFFFF8E3C)],
      'forecast': [
        {'day': 'आज', 'temp': '28°C', 'icon': Icons.wb_sunny, 'desc': 'धूप'},
        {'day': 'कल', 'temp': '30°C', 'icon': Icons.wb_sunny, 'desc': 'साफ'},
        {'day': 'परसों', 'temp': '26°C', 'icon': Icons.cloud, 'desc': 'बादल'},
        {'day': '4 दिन', 'temp': '24°C', 'icon': Icons.grain, 'desc': 'बारिश'},
        {'day': '5 दिन', 'temp': '27°C', 'icon': Icons.wb_sunny, 'desc': 'धूप'},
      ]
    },
    'मुंबई': {
      'temp': '32°C',
      'condition': 'बादल',
      'humidity': '78%',
      'wind': '12 km/h',
      'pressure': '1010 hPa',
      'visibility': '8 km',
      'icon': Icons.cloud,
      'color': Color(0xFF607D8B),
      'gradient': [Color(0xFF607D8B), Color(0xFF78909C)],
      'forecast': [
        {'day': 'आज', 'temp': '32°C', 'icon': Icons.cloud, 'desc': 'बादल'},
        {'day': 'कल', 'temp': '31°C', 'icon': Icons.cloud, 'desc': 'बादल'},
        {'day': 'परसों', 'temp': '29°C', 'icon': Icons.grain, 'desc': 'बारिश'},
        {'day': '4 दिन', 'temp': '28°C', 'icon': Icons.grain, 'desc': 'बारिश'},
        {'day': '5 दिन', 'temp': '30°C', 'icon': Icons.cloud, 'desc': 'बादल'},
      ]
    },
    'जयपुर': {
      'temp': '35°C',
      'condition': 'गर्म',
      'humidity': '45%',
      'wind': '18 km/h',
      'pressure': '1015 hPa',
      'visibility': '12 km',
      'icon': Icons.wb_sunny,
      'color': Color(0xFFD32F2F),
      'gradient': [Color(0xFFD32F2F), Color(0xFFF44336)],
      'forecast': [
        {'day': 'आज', 'temp': '35°C', 'icon': Icons.wb_sunny, 'desc': 'गर्म'},
        {'day': 'कल', 'temp': '37°C', 'icon': Icons.wb_sunny, 'desc': 'अधिक गर्म'},
        {'day': 'परसों', 'temp': '34°C', 'icon': Icons.wb_sunny, 'desc': 'धूप'},
        {'day': '4 दिन', 'temp': '33°C', 'icon': Icons.cloud, 'desc': 'बादल'},
        {'day': '5 दिन', 'temp': '36°C', 'icon': Icons.wb_sunny, 'desc': 'गर्म'},
      ]
    },
  };

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final currentWeather = weatherData[selectedCity]!;
    
    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: CustomScrollView(
        slivers: [
          // Beautiful Weather Header
          SliverAppBar.large(
            backgroundColor: currentWeather['color'],
            foregroundColor: Colors.white,
            title: Text(
              'मौसम जानकारी',
              style: GoogleFonts.roboto(
                fontSize: 28,
                fontWeight: FontWeight.w400,
                letterSpacing: 0,
              ),
            ),
            expandedHeight: 300,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: currentWeather['gradient'],
                  ),
                ),
                child: AnimatedBuilder(
                  animation: _animationController,
                  builder: (context, child) {
                    return Transform.scale(
                      scale: 0.8 + (_animationController.value * 0.2),
                      child: Opacity(
                        opacity: _animationController.value,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const SizedBox(height: 80),
                              Icon(
                                currentWeather['icon'] as IconData,
                                size: 80,
                                color: Colors.white,
                              ),
                              const SizedBox(height: 16),
                              Text(
                                currentWeather['temp'] as String,
                                style: GoogleFonts.roboto(
                                  fontSize: 48,
                                  fontWeight: FontWeight.w300,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                currentWeather['condition'] as String,
                                style: GoogleFonts.roboto(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white.withOpacity(0.9),
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                selectedCity,
                                style: GoogleFonts.roboto(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white.withOpacity(0.8),
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
                  // City Selector
                  _buildCitySelector(colorScheme),
                  const SizedBox(height: 24),
                  
                  // Weather Details Grid
                  _buildWeatherDetails(currentWeather, colorScheme),
                  const SizedBox(height: 24),
                  
                  // 5-Day Forecast
                  _buildForecast(currentWeather, colorScheme),
                  const SizedBox(height: 24),
                  
                  // Farming Tips
                  _buildFarmingTips(currentWeather, colorScheme),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCitySelector(ColorScheme colorScheme) {
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
              'शहर चुनें',
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
              children: weatherData.keys.map((city) {
                final isSelected = city == selectedCity;
                final cityWeather = weatherData[city]!;
                
                return FilterChip(
                  selected: isSelected,
                  avatar: isSelected ? null : Icon(
                    cityWeather['icon'],
                    size: 18,
                    color: colorScheme.onSurface,
                  ),
                  label: Text(
                    city,
                    style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w500,
                      color: isSelected ? Colors.white : colorScheme.onSurface,
                    ),
                  ),
                  backgroundColor: colorScheme.surfaceContainerHigh,
                  selectedColor: cityWeather['color'],
                  checkmarkColor: Colors.white,
                  side: BorderSide.none,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  onSelected: (selected) {
                    if (selected) {
                      setState(() {
                        selectedCity = city;
                      });
                      _animationController.reset();
                      _animationController.forward();
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

  Widget _buildWeatherDetails(Map<String, dynamic> weather, ColorScheme colorScheme) {
    final details = [
      {'label': 'नमी', 'value': weather['humidity'], 'icon': Icons.water_drop},
      {'label': 'हवा', 'value': weather['wind'], 'icon': Icons.air},
      {'label': 'दबाव', 'value': weather['pressure'], 'icon': Icons.compress},
      {'label': 'दृश्यता', 'value': weather['visibility'], 'icon': Icons.visibility},
    ];
    
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 1.2,
      ),
      itemCount: details.length,
      itemBuilder: (context, index) {
        final detail = details[index];
        return Card(
          elevation: 0,
          color: colorScheme.surfaceContainerHigh,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: colorScheme.primary,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Icon(
                    detail['icon'] as IconData,
                    color: colorScheme.onPrimary,
                    size: 24,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  detail['label'] as String,
                  style: GoogleFonts.roboto(
                    fontSize: 14,
                    color: colorScheme.onSurface.withOpacity(0.7),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  detail['value'] as String,
                  style: GoogleFonts.roboto(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: colorScheme.onSurface,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildForecast(Map<String, dynamic> weather, ColorScheme colorScheme) {
    final forecast = weather['forecast'] as List;
    
    return Card(
      elevation: 0,
      color: colorScheme.surfaceContainerHighest,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '5 दिन का पूर्वानुमान',
              style: GoogleFonts.roboto(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: colorScheme.onSurface,
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 120,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: forecast.length,
                itemBuilder: (context, index) {
                  final day = forecast[index];
                  return Container(
                    width: 80,
                    margin: const EdgeInsets.only(right: 16),
                    child: Card(
                      elevation: 0,
                      color: colorScheme.surfaceContainerHigh,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              day['day'],
                              style: GoogleFonts.roboto(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: colorScheme.onSurface,
                              ),
                            ),
                            Icon(
                              day['icon'] as IconData,
                              size: 28,
                              color: colorScheme.primary,
                            ),
                            Text(
                              day['temp'],
                              style: GoogleFonts.roboto(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: colorScheme.onSurface,
                              ),
                            ),
                            Text(
                              day['desc'],
                              style: GoogleFonts.roboto(
                                fontSize: 10,
                                color: colorScheme.onSurface.withOpacity(0.7),
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFarmingTips(Map<String, dynamic> weather, ColorScheme colorScheme) {
    final condition = weather['condition'] as String;
    final tips = _getWeatherTips(condition);
    
    return Card(
      elevation: 0,
      color: colorScheme.primaryContainer,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: colorScheme.primary,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    Icons.lightbulb,
                    color: colorScheme.onPrimary,
                    size: 20,
                  ),
                ),
                const SizedBox(width: 16),
                Text(
                  'मौसम के अनुसार सुझाव',
                  style: GoogleFonts.roboto(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: colorScheme.onPrimaryContainer,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            ...tips.map((tip) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 6,
                    height: 6,
                    margin: const EdgeInsets.only(top: 6, right: 12),
                    decoration: BoxDecoration(
                      color: colorScheme.primary,
                      shape: BoxShape.circle,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      tip,
                      style: GoogleFonts.roboto(
                        fontSize: 14,
                        color: colorScheme.onPrimaryContainer,
                        height: 1.4,
                      ),
                    ),
                  ),
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }

  List<String> _getWeatherTips(String condition) {
    switch (condition) {
      case 'धूप':
        return [
          'फसलों की सिंचाई का सही समय है',
          'दोपहर में छाया में काम करें',
          'पानी की मात्रा बढ़ाएं',
          'मल्चिंग करके मिट्टी की नमी बनाए रखें'
        ];
      case 'बादल':
        return [
          'बारिश की संभावना - खाद डालने का अच्छा समय',
          'कीटनाशक का छिड़काव न करें',
          'फसल की कटाई स्थगित करें',
          'जल निकासी की व्यवस्था करें'
        ];
      case 'गर्म':
        return [
          'सुबह जल्दी या शाम को काम करें',
          'पौधों पर मल्चिंग करें',
          'अधिक पानी दें और छायादार जगह बनाएं',
          'हीट स्ट्रेस से बचने के लिए स्प्रे करें'
        ];
      default:
        return [
          'मौसम के अनुसार उचित कार्य योजना बनाएं',
          'फसल की नियमित देखभाल करते रहें',
          'स्थानीय मौसम विभाग की सलाह लें'
        ];
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
