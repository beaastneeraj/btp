import 'package:flutter/material.dart';
import '../services/satellite_data_service.dart';

/// Simple demo app to showcase the Satellite Data Service
class SatelliteServiceDemo extends StatefulWidget {
  const SatelliteServiceDemo({Key? key}) : super(key: key);

  @override
  _SatelliteServiceDemoState createState() => _SatelliteServiceDemoState();
}

class _SatelliteServiceDemoState extends State<SatelliteServiceDemo> {
  final SatelliteDataService _satelliteService = SatelliteDataService.instance;
  
  NDVIData? _ndviData;
  SatelliteWeatherData? _weatherData;
  bool _isLoading = false;

  // Demo coordinates (New Delhi, India)
  final double _lat = 28.7041;
  final double _lon = 77.1025;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0A0E27),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Satellite Data Demo',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildHeaderCard(),
            SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: _isLoading ? null : _loadNDVIData,
              icon: _isLoading 
                  ? SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        valueColor: AlwaysStoppedAnimation(Colors.white),
                      ),
                    )
                  : Icon(Icons.satellite_alt),
              label: Text(_isLoading ? 'Loading...' : 'Get NDVI Data'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: _isLoading ? null : _loadWeatherData,
              icon: _isLoading 
                  ? SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        valueColor: AlwaysStoppedAnimation(Colors.white),
                      ),
                    )
                  : Icon(Icons.cloud),
              label: Text(_isLoading ? 'Loading...' : 'Get Weather Data'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 30),
            if (_ndviData != null) _buildNDVICard(),
            if (_weatherData != null) ...[
              SizedBox(height: 20),
              _buildWeatherCard(),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderCard() {
    return Container(
      padding: EdgeInsets.all(25),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF667eea),
            Color(0xFF764ba2),
          ],
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            offset: Offset(0, 10),
            blurRadius: 20,
          ),
        ],
      ),
      child: Column(
        children: [
          Icon(
            Icons.satellite_alt,
            color: Colors.white,
            size: 50,
          ),
          SizedBox(height: 15),
          Text(
            'Advanced Satellite Intelligence',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 8),
          Text(
            'Real-time Earth observation data for precision agriculture',
            style: TextStyle(
              color: Colors.white.withOpacity(0.9),
              fontSize: 14,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 15),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.location_on, color: Colors.white, size: 16),
                SizedBox(width: 8),
                Text(
                  'New Delhi, India',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNDVICard() {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF11998e),
            Color(0xFF38ef7d),
          ],
        ),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            offset: Offset(0, 8),
            blurRadius: 15,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.grass, color: Colors.white, size: 24),
              SizedBox(width: 12),
              Text(
                'Vegetation Health (NDVI)',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${(_ndviData!.ndviValue * 100).toInt()}%',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 36,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  Text(
                    _ndviData!.vegetationHealth,
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.9),
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.eco,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Container(
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Data Source: ${_ndviData!.dataSource}',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.8),
                    fontSize: 12,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  'Confidence: ${(_ndviData!.confidenceLevel * 100).toInt()}%',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.8),
                    fontSize: 12,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Recommendations:',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 5),
                ..._ndviData!.recommendedActions.take(3).map((action) => Padding(
                  padding: EdgeInsets.only(top: 3),
                  child: Text(
                    '• $action',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.9),
                      fontSize: 12,
                    ),
                  ),
                )),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWeatherCard() {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF4facfe),
            Color(0xFF00f2fe),
          ],
        ),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            offset: Offset(0, 8),
            blurRadius: 15,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.wb_sunny, color: Colors.white, size: 24),
              SizedBox(width: 12),
              Text(
                'Satellite Weather Data',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildWeatherMetric(
                'Temperature',
                '${_weatherData!.temperature.toInt()}°C',
                Icons.thermostat,
              ),
              _buildWeatherMetric(
                'Humidity',
                '${_weatherData!.humidity.toInt()}%',
                Icons.water_drop,
              ),
            ],
          ),
          SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildWeatherMetric(
                'Wind Speed',
                '${_weatherData!.windSpeed.toInt()} km/h',
                Icons.air,
              ),
              _buildWeatherMetric(
                'UV Index',
                '${_weatherData!.uvIndex.toInt()}',
                Icons.wb_sunny,
              ),
            ],
          ),
          SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildWeatherMetric(
                'Soil Moisture',
                '${_weatherData!.soilMoisture.toInt()}%',
                Icons.grass,
              ),
              _buildWeatherMetric(
                'Cloud Cover',
                '${_weatherData!.cloudCover.toInt()}%',
                Icons.cloud,
              ),
            ],
          ),
          SizedBox(height: 15),
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Icon(Icons.info_outline, color: Colors.white70, size: 16),
                SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'Data Quality: ${(_weatherData!.dataQuality * 100).toInt()}% • Source: ${_weatherData!.source}',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWeatherMetric(String label, String value, IconData icon) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(12),
        margin: EdgeInsets.symmetric(horizontal: 4),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            Icon(icon, color: Colors.white, size: 20),
            SizedBox(height: 8),
            Text(
              value,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                color: Colors.white.withOpacity(0.8),
                fontSize: 10,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _loadNDVIData() async {
    setState(() => _isLoading = true);
    
    try {
      final ndviData = await _satelliteService.getNDVIData(_lat, _lon, 1.0);
      setState(() {
        _ndviData = ndviData;
        _isLoading = false;
      });
      
      _showSuccessSnackBar('NDVI data loaded successfully!');
    } catch (e) {
      setState(() => _isLoading = false);
      _showErrorSnackBar('Failed to load NDVI data: $e');
    }
  }

  Future<void> _loadWeatherData() async {
    setState(() => _isLoading = true);
    
    try {
      final weatherData = await _satelliteService.getSatelliteWeatherData(_lat, _lon);
      setState(() {
        _weatherData = weatherData;
        _isLoading = false;
      });
      
      _showSuccessSnackBar('Weather data loaded successfully!');
    } catch (e) {
      setState(() => _isLoading = false);
      _showErrorSnackBar('Failed to load weather data: $e');
    }
  }

  void _showSuccessSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.green,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }

  void _showErrorSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
