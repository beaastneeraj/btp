import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:fl_chart/fl_chart.dart';
import '../services/indian_market_price_service.dart';
import '../services/indian_weather_service.dart';
import '../services/scientific_recommendation_engine.dart';

class ComprehensiveAgriculturalDashboard extends ConsumerStatefulWidget {
  const ComprehensiveAgriculturalDashboard({super.key});

  @override
  ConsumerState<ComprehensiveAgriculturalDashboard> createState() => _ComprehensiveAgriculturalDashboardState();
}

class _ComprehensiveAgriculturalDashboardState extends ConsumerState<ComprehensiveAgriculturalDashboard>
    with TickerProviderStateMixin {
  late TabController _tabController;
  Position? _currentPosition;
  MarketPriceData? _marketData;
  ComprehensiveWeatherData? _weatherData;
  ScientificRecommendations? _recommendations;
  bool _isLoading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
    _initializeData();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Future<void> _initializeData() async {
    try {
      setState(() {
        _isLoading = true;
        _error = null;
      });

      // Get current location
      _currentPosition = await _getCurrentPosition();
      
      // Initialize services
      await ScientificRecommendationEngine.instance.initializeScientificData();
      
      // Fetch data in parallel
      final futures = await Future.wait([
        _fetchMarketData(),
        _fetchWeatherData(),
      ]);
      
      _marketData = futures[0] as MarketPriceData?;
      _weatherData = futures[1] as ComprehensiveWeatherData?;
      
      // Generate scientific recommendations
      if (_currentPosition != null && _marketData != null && _weatherData != null) {
        _recommendations = await _generateRecommendations();
      }
      
      setState(() {
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _error = e.toString();
        _isLoading = false;
      });
    }
  }

  Future<Position> _getCurrentPosition() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw Exception('Location services are disabled.');
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw Exception('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      throw Exception('Location permissions are permanently denied');
    }

    return await Geolocator.getCurrentPosition();
  }

  Future<MarketPriceData?> _fetchMarketData() async {
    if (_currentPosition == null) return null;
    
    try {
      return await IndianMarketPriceService.instance.getRealTimeMarketPrices(
        'Maharashtra', // This should be determined from location
        'Pune',
        ['wheat', 'rice', 'maize', 'cotton', 'sugarcane'],
      );
    } catch (e) {
      print('Market data error: $e');
      return null;
    }
  }

  Future<ComprehensiveWeatherData?> _fetchWeatherData() async {
    if (_currentPosition == null) return null;
    
    try {
      return await IndianWeatherService.instance.getComprehensiveWeatherData(
        _currentPosition!.latitude,
        _currentPosition!.longitude,
      );
    } catch (e) {
      print('Weather data error: $e');
      return null;
    }
  }

  Future<ScientificRecommendations?> _generateRecommendations() async {
    if (_currentPosition == null || _marketData == null || _weatherData == null) return null;
    
    try {
      final farmProfile = UserFarmProfile(
        soilType: 'Black Soil',
        landSize: 2.5,
        irrigationType: 'Drip',
        currentCrops: ['wheat', 'rice'],
      );
      
      return await ScientificRecommendationEngine.instance.generateScientificRecommendations(
        _currentPosition!,
        _marketData!,
        _weatherData!,
        farmProfile,
      );
    } catch (e) {
      print('Recommendations error: $e');
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agricultural Intelligence Dashboard'),
        elevation: 0,
        backgroundColor: Colors.green.shade700,
        foregroundColor: Colors.white,
        bottom: TabBar(
          controller: _tabController,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white70,
          indicatorColor: Colors.white,
          tabs: const [
            Tab(icon: Icon(Icons.dashboard), text: 'Overview'),
            Tab(icon: Icon(Icons.trending_up), text: 'Market'),
            Tab(icon: Icon(Icons.wb_sunny), text: 'Weather'),
            Tab(icon: Icon(Icons.science), text: 'Recommendations'),
            Tab(icon: Icon(Icons.calendar_today), text: 'Calendar'),
          ],
        ),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _error != null
              ? _buildErrorWidget()
              : TabBarView(
                  controller: _tabController,
                  children: [
                    _buildOverviewTab(),
                    _buildMarketTab(),
                    _buildWeatherTab(),
                    _buildRecommendationsTab(),
                    _buildCalendarTab(),
                  ],
                ),
      floatingActionButton: FloatingActionButton(
        onPressed: _initializeData,
        backgroundColor: Colors.green.shade700,
        child: const Icon(Icons.refresh, color: Colors.white),
      ),
    );
  }

  Widget _buildErrorWidget() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.error_outline, size: 64, color: Colors.red.shade400),
          const SizedBox(height: 16),
          Text(
            'Error loading data',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 8),
          Text(
            _error ?? 'Unknown error',
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: _initializeData,
            child: const Text('Retry'),
          ),
        ],
      ),
    );
  }

  Widget _buildOverviewTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildLocationCard(),
          const SizedBox(height: 16),
          _buildQuickStatsGrid(),
          const SizedBox(height: 16),
          _buildRecentAlertsCard(),
          const SizedBox(height: 16),
          _buildTopRecommendationsCard(),
        ],
      ),
    );
  }

  Widget _buildLocationCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Icon(Icons.location_on, color: Colors.green.shade700, size: 32),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Current Location',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    _currentPosition != null
                        ? 'Lat: ${_currentPosition!.latitude.toStringAsFixed(4)}, '
                          'Lng: ${_currentPosition!.longitude.toStringAsFixed(4)}'
                        : 'Location not available',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickStatsGrid() {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      childAspectRatio: 1.5,
      mainAxisSpacing: 16,
      crossAxisSpacing: 16,
      children: [
        _buildStatCard(
          'Temperature',
          '${_weatherData?.currentWeather.temperature.toStringAsFixed(1) ?? '--'}°C',
          Icons.thermostat,
          Colors.orange,
        ),
        _buildStatCard(
          'Humidity',
          '${_weatherData?.currentWeather.humidity.toStringAsFixed(0) ?? '--'}%',
          Icons.water_drop,
          Colors.blue,
        ),
        _buildStatCard(
          'Top Crop',
          _recommendations?.cropRecommendations.isNotEmpty == true
              ? _recommendations!.cropRecommendations.first.cropName
              : 'No data',
          Icons.agriculture,
          Colors.green,
        ),
        _buildStatCard(
          'Market Trend',
          _marketData?.analytics.trends.isNotEmpty == true
              ? _marketData!.analytics.trends.values.first
              : 'No data',
          Icons.trending_up,
          Colors.purple,
        ),
      ],
    );
  }

  Widget _buildStatCard(String title, String value, IconData icon, Color color) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: color, size: 32),
            const SizedBox(height: 8),
            Text(
              title,
              style: Theme.of(context).textTheme.bodySmall,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 4),
            Text(
              value,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: color,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRecentAlertsCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Weather Alerts',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 12),
            _weatherData?.alerts.isNotEmpty == true
                ? Column(
                    children: _weatherData!.alerts.take(3).map((alert) => 
                      ListTile(
                        leading: Icon(Icons.warning, color: Colors.orange),
                        title: Text(alert.type),
                        subtitle: Text(alert.message),
                        dense: true,
                      ),
                    ).toList(),
                  )
                : const Text('No active alerts'),
          ],
        ),
      ),
    );
  }

  Widget _buildTopRecommendationsCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Top Crop Recommendations',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 12),
            _recommendations?.cropRecommendations.isNotEmpty == true
                ? Column(
                    children: _recommendations!.cropRecommendations.take(3).map((crop) => 
                      ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.green.shade100,
                          child: Icon(Icons.agriculture, color: Colors.green.shade700),
                        ),
                        title: Text(crop.cropName.toUpperCase()),
                        subtitle: Text('Score: ${(crop.overallScore * 100).toStringAsFixed(0)}%'),
                        trailing: Icon(Icons.arrow_forward_ios, size: 16),
                        onTap: () => _tabController.animateTo(3),
                      ),
                    ).toList(),
                  )
                : const Text('No recommendations available'),
          ],
        ),
      ),
    );
  }

  Widget _buildMarketTab() {
    if (_marketData == null) {
      return const Center(child: Text('No market data available'));
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildMarketSummaryCard(),
          const SizedBox(height: 16),
          _buildCommodityPricesCard(),
          const SizedBox(height: 16),
          _buildPriceTrendsChart(),
          const SizedBox(height: 16),
          _buildNearestMandisCard(),
        ],
      ),
    );
  }

  Widget _buildMarketSummaryCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Market Summary',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 12),
            Text('Data Source: ${_marketData!.dataSource}'),
            Text('Last Updated: ${_formatDateTime(_marketData!.lastUpdated)}'),
            Text('Total Commodities: ${_marketData!.commodityPrices.length}'),
          ],
        ),
      ),
    );
  }

  Widget _buildCommodityPricesCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Current Prices (₹/Quintal)',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 12),
            ...(_marketData!.commodityPrices.take(5).map((price) => 
              ListTile(
                title: Text(price.commodity.toUpperCase()),
                subtitle: Text('${price.variety} - ${price.marketName}'),
                trailing: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '₹${price.modalPrice.toStringAsFixed(0)}',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '₹${price.minPrice.toStringAsFixed(0)} - ₹${price.maxPrice.toStringAsFixed(0)}',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
            ).toList()),
          ],
        ),
      ),
    );
  }

  Widget _buildPriceTrendsChart() {
    if (_marketData!.priceHistory.isEmpty) {
      return const Card(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Text('No price history available'),
        ),
      );
    }

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Price Trends (Last 30 Days)',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 200,
              child: LineChart(
                LineChartData(
                  gridData: FlGridData(show: true),
                  titlesData: FlTitlesData(show: true),
                  borderData: FlBorderData(show: true),
                  lineBarsData: _buildPriceChartData(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<LineChartBarData> _buildPriceChartData() {
    final commodities = _marketData!.priceHistory
        .map((p) => p.commodity)
        .toSet()
        .take(3)
        .toList();
    
    final colors = [Colors.blue, Colors.red, Colors.green];
    
    return commodities.asMap().entries.map((entry) {
      final commodity = entry.value;
      final color = colors[entry.key % colors.length];
      
      final spots = _marketData!.priceHistory
          .where((p) => p.commodity == commodity)
          .map((p) => FlSpot(
                p.date.millisecondsSinceEpoch.toDouble(),
                p.price,
              ))
          .toList();
      
      return LineChartBarData(
        spots: spots,
        isCurved: true,
        color: color,
        barWidth: 2,
        dotData: FlDotData(show: false),
      );
    }).toList();
  }

  Widget _buildNearestMandisCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nearest Mandis',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 12),
            ...(_marketData!.nearestMandis.take(3).map((mandi) => 
              ListTile(
                leading: Icon(Icons.store, color: Colors.green.shade700),
                title: Text(mandi.name),
                subtitle: Text('${mandi.district}, ${mandi.state}'),
                trailing: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(mandi.type),
                    Text(
                      mandi.operatingHours,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
            ).toList()),
          ],
        ),
      ),
    );
  }

  Widget _buildWeatherTab() {
    if (_weatherData == null) {
      return const Center(child: Text('No weather data available'));
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildCurrentWeatherCard(),
          const SizedBox(height: 16),
          _buildWeatherForecastCard(),
          const SizedBox(height: 16),
          _buildAgriculturalIndicesCard(),
          const SizedBox(height: 16),
          _buildAgriculturalWeatherCard(),
        ],
      ),
    );
  }

  Widget _buildCurrentWeatherCard() {
    final current = _weatherData!.currentWeather;
    
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Current Weather',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Text(
                  'Source: ${current.source}',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        '${current.temperature.toStringAsFixed(1)}°C',
                        style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.orange,
                        ),
                      ),
                      Text('Feels like ${current.feelsLike.toStringAsFixed(1)}°C'),
                      Text(current.weatherCondition),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildWeatherDetailRow('Humidity', '${current.humidity.toStringAsFixed(0)}%'),
                      _buildWeatherDetailRow('Wind', '${current.windSpeed.toStringAsFixed(1)} km/h'),
                      _buildWeatherDetailRow('Pressure', '${current.pressure.toStringAsFixed(0)} hPa'),
                      _buildWeatherDetailRow('UV Index', current.uvIndex.toStringAsFixed(1)),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWeatherDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label),
          Text(value, style: const TextStyle(fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }

  Widget _buildWeatherForecastCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '5-Day Forecast',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 120,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: math.min(5, _weatherData!.forecast.length),
                itemBuilder: (context, index) {
                  final forecast = _weatherData!.forecast[index];
                  return Container(
                    width: 100,
                    margin: const EdgeInsets.only(right: 12),
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              _formatDate(forecast.date),
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            const SizedBox(height: 4),
                            Icon(
                              _getWeatherIcon(forecast.weatherCondition),
                              color: Colors.blue,
                            ),
                            const SizedBox(height: 4),
                            Text(
                              '${forecast.maxTemperature.toStringAsFixed(0)}°',
                              style: const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '${forecast.minTemperature.toStringAsFixed(0)}°',
                              style: Theme.of(context).textTheme.bodySmall,
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

  Widget _buildAgriculturalIndicesCard() {
    final indices = _weatherData!.agriculturalIndices;
    
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Agricultural Indices',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 12),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              childAspectRatio: 2.5,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              children: [
                _buildIndexCard('Heat Index', '${indices.heatIndex.toStringAsFixed(1)}°C'),
                _buildIndexCard('Disease Risk', '${(indices.diseasePressureIndex * 100).toStringAsFixed(0)}%'),
                _buildIndexCard('Spray Conditions', '${(indices.sprayConditionsIndex * 100).toStringAsFixed(0)}%'),
                _buildIndexCard('Field Work', '${(indices.fieldWorkabilityIndex * 100).toStringAsFixed(0)}%'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIndexCard(String title, String value) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.bodySmall,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildAgriculturalWeatherCard() {
    final agriWeather = _weatherData!.agriculturalWeather;
    
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Agricultural Weather Data',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 12),
            _buildWeatherDetailRow('Soil Temperature', '${agriWeather.soilTemperature.toStringAsFixed(1)}°C'),
            _buildWeatherDetailRow('Evapotranspiration', '${agriWeather.evapotranspiration.toStringAsFixed(1)} mm/day'),
            _buildWeatherDetailRow('Frost Risk', '${(agriWeather.frostRisk * 100).toStringAsFixed(0)}%'),
            _buildWeatherDetailRow('Field Workability', agriWeather.fieldWorkability),
            const SizedBox(height: 12),
            if (agriWeather.irrigationRecommendations.isNotEmpty) ...[
              Text(
                'Irrigation Recommendations:',
                style: Theme.of(context).textTheme.titleSmall,
              ),
              ...agriWeather.irrigationRecommendations.map((rec) => 
                Padding(
                  padding: const EdgeInsets.only(left: 16, top: 4),
                  child: Text('• $rec'),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildRecommendationsTab() {
    if (_recommendations == null) {
      return const Center(child: Text('No recommendations available'));
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildRecommendationsSummaryCard(),
          const SizedBox(height: 16),
          _buildCropRecommendationsCard(),
          const SizedBox(height: 16),
          _buildSoilAnalysisCard(),
          const SizedBox(height: 16),
          _buildInputRecommendationsCard(),
        ],
      ),
    );
  }

  Widget _buildRecommendationsSummaryCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Scientific Recommendations',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 12),
            Text('Confidence Score: ${(_recommendations!.confidenceScore * 100).toStringAsFixed(0)}%'),
            Text('Based on: ${_recommendations!.scientificBasis}'),
            Text('Generated: ${_formatDateTime(_recommendations!.generatedAt)}'),
            Text('Valid until: ${_formatDateTime(_recommendations!.validUntil)}'),
          ],
        ),
      ),
    );
  }

  Widget _buildCropRecommendationsCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Top Crop Recommendations',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 12),
            ...(_recommendations!.cropRecommendations.take(3).map((crop) => 
              ExpansionTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.green.shade100,
                  child: Text('${(crop.overallScore * 100).toStringAsFixed(0)}%'),
                ),
                title: Text(crop.cropName.toUpperCase()),
                subtitle: Text('${crop.variety} - ${crop.plantingWindow}'),
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Expected Yield: ${crop.expectedYield.toStringAsFixed(1)} tonnes/ha'),
                        Text('Expected Income: ₹${crop.expectedIncome.toStringAsFixed(0)}'),
                        Text('Input Cost: ₹${crop.inputCost.toStringAsFixed(0)}'),
                        Text('Water Requirement: ${crop.waterRequirement.toStringAsFixed(0)} mm'),
                        Text('Growing Period: ${crop.growingPeriod} days'),
                        const SizedBox(height: 8),
                        Text('Scientific Reasons:', style: Theme.of(context).textTheme.titleSmall),
                        ...crop.scientificReasons.map((reason) => 
                          Padding(
                            padding: const EdgeInsets.only(left: 16, top: 2),
                            child: Text('• $reason'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ).toList()),
          ],
        ),
      ),
    );
  }

  Widget _buildSoilAnalysisCard() {
    final soil = _recommendations!.soilAnalysis;
    
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Soil Analysis',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 12),
            Text('Soil Type: ${soil.soilType}'),
            Text('pH Level: ${soil.phLevel.toStringAsFixed(1)}'),
            Text('Organic Carbon: ${soil.organicCarbon.toStringAsFixed(2)}%'),
            Text('Nitrogen: ${soil.nitrogen.toStringAsFixed(0)} kg/ha'),
            Text('Phosphorus: ${soil.phosphorus.toStringAsFixed(0)} kg/ha'),
            Text('Potassium: ${soil.potassium.toStringAsFixed(0)} kg/ha'),
            const SizedBox(height: 12),
            Text('Recommendations:', style: Theme.of(context).textTheme.titleSmall),
            ...soil.recommendations.map((rec) => 
              Padding(
                padding: const EdgeInsets.only(left: 16, top: 2),
                child: Text('• $rec'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInputRecommendationsCard() {
    final inputs = _recommendations!.inputRecommendations;
    
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Input Recommendations',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 12),
            Text('Irrigation Schedule: ${inputs.irrigationSchedule}'),
            const SizedBox(height: 12),
            Text('Cost Estimates:', style: Theme.of(context).textTheme.titleSmall),
            ...inputs.costEstimates.entries.map((entry) => 
              Padding(
                padding: const EdgeInsets.only(left: 16, top: 2),
                child: Text('${entry.key}: ₹${entry.value.toStringAsFixed(0)}'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCalendarTab() {
    if (_recommendations?.plantingCalendar == null) {
      return const Center(child: Text('No calendar data available'));
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Agricultural Calendar',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 16),
          ...(_recommendations!.plantingCalendar.monthlyActivities.entries.map((entry) => 
            Card(
              child: ExpansionTile(
                title: Text(entry.key),
                subtitle: Text('${entry.value.length} activities'),
                children: entry.value.map((activity) => 
                  ListTile(
                    leading: Icon(
                      activity.activity == 'Planting' ? Icons.eco : Icons.agriculture,
                      color: Colors.green.shade700,
                    ),
                    title: Text('${activity.activity} - ${activity.cropName}'),
                    subtitle: Text(activity.variety),
                    trailing: Text(activity.optimalDates.join(', ')),
                  ),
                ).toList(),
              ),
            ),
          ).toList()),
        ],
      ),
    );
  }

  String _formatDateTime(DateTime dateTime) {
    return '${dateTime.day}/${dateTime.month}/${dateTime.year} ${dateTime.hour}:${dateTime.minute.toString().padLeft(2, '0')}';
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}';
  }

  IconData _getWeatherIcon(String condition) {
    switch (condition.toLowerCase()) {
      case 'clear':
        return Icons.wb_sunny;
      case 'clouds':
        return Icons.cloud;
      case 'rain':
        return Icons.umbrella;
      case 'snow':
        return Icons.ac_unit;
      default:
        return Icons.wb_cloudy;
    }
  }
}
