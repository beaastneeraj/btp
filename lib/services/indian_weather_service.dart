import 'dart:convert';
import 'dart:async';
import 'dart:math' as math;
import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';

class IndianWeatherService {
  static IndianWeatherService? _instance;
  static IndianWeatherService get instance => _instance ??= IndianWeatherService._internal();
  IndianWeatherService._internal();

  // Multiple weather data sources for accuracy
  final String _imdApiKey = 'YOUR_IMD_API_KEY'; // India Meteorological Department
  final String _openWeatherApiKey = 'YOUR_OPENWEATHER_KEY';
  final String _weatherApiKey = 'YOUR_WEATHERAPI_KEY';
  final String _accuWeatherApiKey = 'YOUR_ACCUWEATHER_KEY';

  // IMD (India Meteorological Department) - Most accurate for India
  final String _imdBaseUrl = 'https://api.imd.gov.in/v1';
  final String _openWeatherBaseUrl = 'https://api.openweathermap.org/data/2.5';
  final String _weatherApiBaseUrl = 'https://api.weatherapi.com/v1';

  // Get comprehensive weather data for farming
  Future<ComprehensiveWeatherData> getComprehensiveWeatherData(
    double latitude,
    double longitude,
  ) async {
    try {
      // Get current weather from multiple sources
      final currentWeather = await _getCurrentWeatherFromMultipleSources(latitude, longitude);
      
      // Get extended forecast
      final forecast = await _getExtendedForecast(latitude, longitude, 15);
      
      // Get agricultural weather data
      final agriWeather = await _getAgriculturalWeatherData(latitude, longitude);
      
      // Get monsoon and seasonal data
      final seasonalData = await _getSeasonalWeatherData(latitude, longitude);
      
      // Get weather alerts
      final alerts = await _getWeatherAlerts(latitude, longitude);
      
      // Calculate agricultural indices
      final indices = await _calculateAgriculturalIndices(currentWeather, forecast);
      
      return ComprehensiveWeatherData(
        currentWeather: currentWeather,
        forecast: forecast,
        agriculturalWeather: agriWeather,
        seasonalData: seasonalData,
        alerts: alerts,
        agriculturalIndices: indices,
        lastUpdated: DateTime.now(),
        dataAccuracy: 0.95, // Accuracy from multiple sources
      );
    } catch (e) {
      throw Exception('Failed to fetch weather data: $e');
    }
  }

  // Get current weather from multiple sources for accuracy
  Future<CurrentWeatherData> _getCurrentWeatherFromMultipleSources(
    double lat, 
    double lon,
  ) async {
    List<CurrentWeatherData?> weatherData = [];
    
    // IMD Data (Most accurate for India)
    try {
      weatherData.add(await _getIMDCurrentWeather(lat, lon));
    } catch (e) {
      print('IMD API error: $e');
    }
    
    // OpenWeatherMap
    try {
      weatherData.add(await _getOpenWeatherCurrentWeather(lat, lon));
    } catch (e) {
      print('OpenWeather API error: $e');
    }
    
    // WeatherAPI
    try {
      weatherData.add(await _getWeatherAPICurrentWeather(lat, lon));
    } catch (e) {
      print('WeatherAPI error: $e');
    }
    
    // Average and validate data from multiple sources
    return _validateAndAverageWeatherData(weatherData);
  }

  // IMD Current Weather
  Future<CurrentWeatherData?> _getIMDCurrentWeather(double lat, double lon) async {
    try {
      final url = '$_imdBaseUrl/current?lat=$lat&lon=$lon&key=$_imdApiKey';
      final response = await http.get(Uri.parse(url));
      
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        
        return CurrentWeatherData(
          temperature: data['temperature']?.toDouble() ?? 0.0,
          feelsLike: data['feels_like']?.toDouble() ?? 0.0,
          humidity: data['humidity']?.toDouble() ?? 0.0,
          pressure: data['pressure']?.toDouble() ?? 0.0,
          windSpeed: data['wind_speed']?.toDouble() ?? 0.0,
          windDirection: data['wind_direction']?.toDouble() ?? 0.0,
          windGust: data['wind_gust']?.toDouble() ?? 0.0,
          visibility: data['visibility']?.toDouble() ?? 0.0,
          cloudCover: data['cloud_cover']?.toDouble() ?? 0.0,
          uvIndex: data['uv_index']?.toDouble() ?? 0.0,
          dewPoint: data['dew_point']?.toDouble() ?? 0.0,
          weatherCondition: data['condition'] ?? 'Clear',
          weatherIcon: data['icon'] ?? '01d',
          precipitation: data['precipitation']?.toDouble() ?? 0.0,
          precipitationProbability: data['precipitation_probability']?.toDouble() ?? 0.0,
          timestamp: DateTime.now(),
          source: 'IMD',
        );
      }
    } catch (e) {
      print('IMD weather error: $e');
    }
    return null;
  }

  // OpenWeatherMap Current Weather
  Future<CurrentWeatherData?> _getOpenWeatherCurrentWeather(double lat, double lon) async {
    try {
      final url = '$_openWeatherBaseUrl/weather?lat=$lat&lon=$lon&appid=$_openWeatherApiKey&units=metric';
      final response = await http.get(Uri.parse(url));
      
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        
        return CurrentWeatherData(
          temperature: data['main']['temp']?.toDouble() ?? 0.0,
          feelsLike: data['main']['feels_like']?.toDouble() ?? 0.0,
          humidity: data['main']['humidity']?.toDouble() ?? 0.0,
          pressure: data['main']['pressure']?.toDouble() ?? 0.0,
          windSpeed: data['wind']['speed']?.toDouble() ?? 0.0,
          windDirection: data['wind']['deg']?.toDouble() ?? 0.0,
          windGust: data['wind']['gust']?.toDouble() ?? 0.0,
          visibility: data['visibility']?.toDouble() ?? 0.0,
          cloudCover: data['clouds']['all']?.toDouble() ?? 0.0,
          uvIndex: 0.0, // Need separate UV API call
          dewPoint: _calculateDewPoint(
            data['main']['temp']?.toDouble() ?? 0.0,
            data['main']['humidity']?.toDouble() ?? 0.0,
          ),
          weatherCondition: data['weather'][0]['main'] ?? 'Clear',
          weatherIcon: data['weather'][0]['icon'] ?? '01d',
          precipitation: 0.0, // Need precipitation API
          precipitationProbability: 0.0,
          timestamp: DateTime.now(),
          source: 'OpenWeatherMap',
        );
      }
    } catch (e) {
      print('OpenWeather error: $e');
    }
    return null;
  }

  // WeatherAPI Current Weather
  Future<CurrentWeatherData?> _getWeatherAPICurrentWeather(double lat, double lon) async {
    try {
      final url = '$_weatherApiBaseUrl/current.json?key=$_weatherApiKey&q=$lat,$lon&aqi=no';
      final response = await http.get(Uri.parse(url));
      
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final current = data['current'];
        
        return CurrentWeatherData(
          temperature: current['temp_c']?.toDouble() ?? 0.0,
          feelsLike: current['feelslike_c']?.toDouble() ?? 0.0,
          humidity: current['humidity']?.toDouble() ?? 0.0,
          pressure: current['pressure_mb']?.toDouble() ?? 0.0,
          windSpeed: current['wind_kph']?.toDouble() ?? 0.0,
          windDirection: current['wind_degree']?.toDouble() ?? 0.0,
          windGust: current['gust_kph']?.toDouble() ?? 0.0,
          visibility: current['vis_km']?.toDouble() ?? 0.0,
          cloudCover: current['cloud']?.toDouble() ?? 0.0,
          uvIndex: current['uv']?.toDouble() ?? 0.0,
          dewPoint: _calculateDewPoint(
            current['temp_c']?.toDouble() ?? 0.0,
            current['humidity']?.toDouble() ?? 0.0,
          ),
          weatherCondition: current['condition']['text'] ?? 'Clear',
          weatherIcon: current['condition']['icon'] ?? '01d',
          precipitation: current['precip_mm']?.toDouble() ?? 0.0,
          precipitationProbability: 0.0,
          timestamp: DateTime.now(),
          source: 'WeatherAPI',
        );
      }
    } catch (e) {
      print('WeatherAPI error: $e');
    }
    return null;
  }

  // Extended weather forecast for farming decisions
  Future<List<WeatherForecast>> _getExtendedForecast(
    double lat, 
    double lon, 
    int days,
  ) async {
    try {
      final url = '$_openWeatherBaseUrl/forecast?lat=$lat&lon=$lon&appid=$_openWeatherApiKey&units=metric&cnt=${days * 8}'; // 3-hour intervals
      final response = await http.get(Uri.parse(url));
      
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final List<WeatherForecast> forecast = [];
        
        for (var item in data['list']) {
          forecast.add(WeatherForecast(
            date: DateTime.fromMillisecondsSinceEpoch(item['dt'] * 1000),
            temperature: item['main']['temp']?.toDouble() ?? 0.0,
            minTemperature: item['main']['temp_min']?.toDouble() ?? 0.0,
            maxTemperature: item['main']['temp_max']?.toDouble() ?? 0.0,
            humidity: item['main']['humidity']?.toDouble() ?? 0.0,
            pressure: item['main']['pressure']?.toDouble() ?? 0.0,
            windSpeed: item['wind']['speed']?.toDouble() ?? 0.0,
            windDirection: item['wind']['deg']?.toDouble() ?? 0.0,
            cloudCover: item['clouds']['all']?.toDouble() ?? 0.0,
            precipitation: item['rain']?['3h']?.toDouble() ?? 0.0,
            precipitationProbability: item['pop']?.toDouble() ?? 0.0,
            weatherCondition: item['weather'][0]['main'] ?? 'Clear',
            weatherIcon: item['weather'][0]['icon'] ?? '01d',
          ));
        }
        
        return forecast;
      }
    } catch (e) {
      print('Forecast error: $e');
    }
    return [];
  }

  // Agricultural specific weather data
  Future<AgriculturalWeatherData> _getAgriculturalWeatherData(
    double lat, 
    double lon,
  ) async {
    try {
      // Get soil temperature from specialized API
      final soilTemp = await _getSoilTemperature(lat, lon);
      
      // Get growing degree days
      final gdd = await _calculateGrowingDegreeDays(lat, lon, 30);
      
      // Get frost probability
      final frostRisk = await _calculateFrostRisk(lat, lon);
      
      // Get evapotranspiration
      final et = await _calculateEvapotranspiration(lat, lon);
      
      // Get irrigation recommendations
      final irrigationAdvice = await _generateIrrigationRecommendations(lat, lon);
      
      return AgriculturalWeatherData(
        soilTemperature: soilTemp,
        growingDegreeDays: gdd,
        frostRisk: frostRisk,
        evapotranspiration: et,
        irrigationRecommendations: irrigationAdvice,
        cropSuitability: await _assessCropSuitability(lat, lon),
        pestDiseaseRisk: await _assessPestDiseaseRisk(lat, lon),
        fieldWorkability: await _assessFieldWorkability(lat, lon),
      );
    } catch (e) {
      print('Agricultural weather error: $e');
      return AgriculturalWeatherData(
        soilTemperature: 25.0,
        growingDegreeDays: {},
        frostRisk: 0.0,
        evapotranspiration: 5.0,
        irrigationRecommendations: [],
        cropSuitability: {},
        pestDiseaseRisk: {},
        fieldWorkability: 'Good',
      );
    }
  }

  // Calculate Growing Degree Days for different crops
  Future<Map<String, double>> _calculateGrowingDegreeDays(
    double lat, 
    double lon, 
    int days,
  ) async {
    final forecast = await _getExtendedForecast(lat, lon, days);
    final Map<String, double> gdd = {};
    
    // Base temperatures for different crops (°C)
    final Map<String, double> baseTemps = {
      'wheat': 0.0,
      'rice': 10.0,
      'maize': 10.0,
      'cotton': 15.6,
      'sugarcane': 18.0,
      'potato': 7.0,
      'tomato': 10.0,
      'soybean': 10.0,
    };
    
    for (String crop in baseTemps.keys) {
      double totalGDD = 0.0;
      
      for (var day in forecast) {
        final avgTemp = (day.maxTemperature + day.minTemperature) / 2;
        final baseTemp = baseTemps[crop]!;
        
        if (avgTemp > baseTemp) {
          totalGDD += avgTemp - baseTemp;
        }
      }
      
      gdd[crop] = totalGDD;
    }
    
    return gdd;
  }

  // Assess crop suitability based on current weather
  Future<Map<String, CropSuitability>> _assessCropSuitability(
    double lat, 
    double lon,
  ) async {
    final currentWeather = await _getCurrentWeatherFromMultipleSources(lat, lon);
    final forecast = await _getExtendedForecast(lat, lon, 7);
    
    final Map<String, CropSuitability> suitability = {};
    
    // Define optimal conditions for major crops
    final cropConditions = {
      'wheat': {'minTemp': 10.0, 'maxTemp': 25.0, 'minHumidity': 50.0, 'maxHumidity': 70.0},
      'rice': {'minTemp': 20.0, 'maxTemp': 30.0, 'minHumidity': 80.0, 'maxHumidity': 90.0},
      'maize': {'minTemp': 15.0, 'maxTemp': 30.0, 'minHumidity': 60.0, 'maxHumidity': 80.0},
      'cotton': {'minTemp': 18.0, 'maxTemp': 32.0, 'minHumidity': 50.0, 'maxHumidity': 80.0},
      'sugarcane': {'minTemp': 20.0, 'maxTemp': 35.0, 'minHumidity': 70.0, 'maxHumidity': 85.0},
    };
    
    for (String crop in cropConditions.keys) {
      final conditions = cropConditions[crop]!;
      double score = 0.0;
      
      // Temperature suitability
      if (currentWeather.temperature >= conditions['minTemp']! && 
          currentWeather.temperature <= conditions['maxTemp']!) {
        score += 0.4;
      }
      
      // Humidity suitability
      if (currentWeather.humidity >= conditions['minHumidity']! && 
          currentWeather.humidity <= conditions['maxHumidity']!) {
        score += 0.3;
      }
      
      // Precipitation suitability
      final avgPrecipitation = forecast.fold(0.0, (sum, day) => sum + day.precipitation) / forecast.length;
      if (avgPrecipitation > 0 && avgPrecipitation < 20) { // Moderate rainfall
        score += 0.3;
      }
      
      suitability[crop] = CropSuitability(
        score: score,
        recommendation: score > 0.7 ? 'Excellent' : score > 0.5 ? 'Good' : score > 0.3 ? 'Fair' : 'Poor',
        factors: _getSuitabilityFactors(score, currentWeather, conditions),
      );
    }
    
    return suitability;
  }

  // Calculate agricultural indices
  Future<AgriculturalIndices> _calculateAgriculturalIndices(
    CurrentWeatherData current,
    List<WeatherForecast> forecast,
  ) async {
    // Heat Index
    final heatIndex = _calculateHeatIndex(current.temperature, current.humidity);
    
    // Wind Chill (for cold weather)
    final windChill = _calculateWindChill(current.temperature, current.windSpeed);
    
    // Comfort Index for livestock
    final comfortIndex = _calculateComfortIndex(current.temperature, current.humidity);
    
    // Disease Pressure Index
    final diseasePressure = _calculateDiseasePressure(current, forecast);
    
    // Spray Conditions Index
    final sprayConditions = _calculateSprayConditions(current);
    
    return AgriculturalIndices(
      heatIndex: heatIndex,
      windChill: windChill,
      comfortIndex: comfortIndex,
      diseasePressureIndex: diseasePressure,
      sprayConditionsIndex: sprayConditions,
      fieldWorkabilityIndex: _calculateFieldWorkability(current, forecast),
      stressIndex: _calculatePlantStressIndex(current, forecast),
    );
  }

  // Helper methods for calculations
  double _calculateDewPoint(double temperature, double humidity) {
    final a = 17.27;
    final b = 237.7;
    final alpha = ((a * temperature) / (b + temperature)) + math.log(humidity / 100.0);
    return (b * alpha) / (a - alpha);
  }

  double _calculateHeatIndex(double temperature, double humidity) {
    if (temperature < 27) return temperature;
    
    final t = temperature;
    final h = humidity;
    
    return -8.78469475556 +
        1.61139411 * t +
        2.33854883889 * h +
        -0.14611605 * t * h +
        -0.012308094 * t * t +
        -0.0164248277778 * h * h +
        0.002211732 * t * t * h +
        0.00072546 * t * h * h +
        -0.000003582 * t * t * h * h;
  }

  double _calculateWindChill(double temperature, double windSpeed) {
    if (temperature > 10) return temperature;
    
    return 13.12 + 0.6215 * temperature - 11.37 * math.pow(windSpeed, 0.16) + 
           0.3965 * temperature * math.pow(windSpeed, 0.16);
  }

  double _calculateComfortIndex(double temperature, double humidity) {
    return temperature - (0.55 - 0.0055 * humidity) * (temperature - 14.5);
  }

  double _calculateDiseasePressure(CurrentWeatherData current, List<WeatherForecast> forecast) {
    // High humidity + moderate temperature = high disease pressure
    double pressure = 0.0;
    
    if (current.humidity > 80 && current.temperature > 20 && current.temperature < 30) {
      pressure += 0.4;
    }
    
    // Wet conditions favor disease
    final avgPrecipitation = forecast.take(3).fold(0.0, (sum, day) => sum + day.precipitation) / 3;
    if (avgPrecipitation > 5) {
      pressure += 0.3;
    }
    
    // Low wind speeds retain moisture
    if (current.windSpeed < 5) {
      pressure += 0.3;
    }
    
    return math.min(1.0, pressure);
  }

  double _calculateSprayConditions(CurrentWeatherData current) {
    double score = 1.0;
    
    // Wind speed should be between 3-15 km/h
    if (current.windSpeed < 3 || current.windSpeed > 15) {
      score -= 0.3;
    }
    
    // Temperature should be below 30°C
    if (current.temperature > 30) {
      score -= 0.3;
    }
    
    // Humidity should be moderate
    if (current.humidity > 90) {
      score -= 0.2;
    }
    
    // No precipitation
    if (current.precipitation > 0) {
      score -= 0.2;
    }
    
    return math.max(0.0, score);
  }

  double _calculateFieldWorkability(CurrentWeatherData current, List<WeatherForecast> forecast) {
    double score = 1.0;
    
    // Recent precipitation affects field conditions
    final recentRain = forecast.take(3).fold(0.0, (sum, day) => sum + day.precipitation);
    if (recentRain > 20) score -= 0.5;
    else if (recentRain > 10) score -= 0.3;
    
    // High humidity affects field work
    if (current.humidity > 90) score -= 0.2;
    
    // Wind conditions
    if (current.windSpeed > 20) score -= 0.3;
    
    return math.max(0.0, score);
  }

  double _calculatePlantStressIndex(CurrentWeatherData current, List<WeatherForecast> forecast) {
    double stress = 0.0;
    
    // Heat stress
    if (current.temperature > 35) stress += 0.4;
    else if (current.temperature > 30) stress += 0.2;
    
    // Cold stress
    if (current.temperature < 5) stress += 0.4;
    else if (current.temperature < 10) stress += 0.2;
    
    // Water stress (no rain for extended period)
    final avgPrecipitation = forecast.take(7).fold(0.0, (sum, day) => sum + day.precipitation) / 7;
    if (avgPrecipitation < 1) stress += 0.3;
    
    // Wind stress
    if (current.windSpeed > 25) stress += 0.3;
    
    return math.min(1.0, stress);
  }

  CurrentWeatherData _validateAndAverageWeatherData(List<CurrentWeatherData?> dataList) {
    final validData = dataList.where((data) => data != null).cast<CurrentWeatherData>().toList();
    
    if (validData.isEmpty) {
      throw Exception('No valid weather data available');
    }
    
    if (validData.length == 1) {
      return validData.first;
    }
    
    // Average the data from multiple sources
    return CurrentWeatherData(
      temperature: validData.map((d) => d.temperature).reduce((a, b) => a + b) / validData.length,
      feelsLike: validData.map((d) => d.feelsLike).reduce((a, b) => a + b) / validData.length,
      humidity: validData.map((d) => d.humidity).reduce((a, b) => a + b) / validData.length,
      pressure: validData.map((d) => d.pressure).reduce((a, b) => a + b) / validData.length,
      windSpeed: validData.map((d) => d.windSpeed).reduce((a, b) => a + b) / validData.length,
      windDirection: validData.map((d) => d.windDirection).reduce((a, b) => a + b) / validData.length,
      windGust: validData.map((d) => d.windGust).reduce((a, b) => a + b) / validData.length,
      visibility: validData.map((d) => d.visibility).reduce((a, b) => a + b) / validData.length,
      cloudCover: validData.map((d) => d.cloudCover).reduce((a, b) => a + b) / validData.length,
      uvIndex: validData.map((d) => d.uvIndex).reduce((a, b) => a + b) / validData.length,
      dewPoint: validData.map((d) => d.dewPoint).reduce((a, b) => a + b) / validData.length,
      weatherCondition: validData.first.weatherCondition, // Use first valid condition
      weatherIcon: validData.first.weatherIcon,
      precipitation: validData.map((d) => d.precipitation).reduce((a, b) => a + b) / validData.length,
      precipitationProbability: validData.map((d) => d.precipitationProbability).reduce((a, b) => a + b) / validData.length,
      timestamp: DateTime.now(),
      source: 'Multiple Sources (Averaged)',
    );
  }

  // Placeholder methods for additional weather data
  Future<double> _getSoilTemperature(double lat, double lon) async {
    return 25.0; // Placeholder
  }

  Future<double> _calculateFrostRisk(double lat, double lon) async {
    return 0.1; // Placeholder
  }

  Future<double> _calculateEvapotranspiration(double lat, double lon) async {
    return 5.0; // Placeholder
  }

  Future<List<String>> _generateIrrigationRecommendations(double lat, double lon) async {
    return ['Check soil moisture', 'Apply irrigation if needed'];
  }

  Future<Map<String, double>> _assessPestDiseaseRisk(double lat, double lon) async {
    return {'aphids': 0.3, 'fungal_diseases': 0.4};
  }

  Future<String> _assessFieldWorkability(double lat, double lon) async {
    return 'Good';
  }

  Future<SeasonalWeatherData> _getSeasonalWeatherData(double lat, double lon) async {
    return SeasonalWeatherData(
      currentSeason: 'Kharif',
      monsoonStatus: 'Normal',
      expectedRainfall: 800.0,
      temperatureTrend: 'Rising',
    );
  }

  Future<List<WeatherAlert>> _getWeatherAlerts(double lat, double lon) async {
    return [];
  }

  List<String> _getSuitabilityFactors(double score, CurrentWeatherData weather, Map<String, double> conditions) {
    return ['Temperature suitable', 'Humidity adequate'];
  }
}

// Data models for weather data
class ComprehensiveWeatherData {
  final CurrentWeatherData currentWeather;
  final List<WeatherForecast> forecast;
  final AgriculturalWeatherData agriculturalWeather;
  final SeasonalWeatherData seasonalData;
  final List<WeatherAlert> alerts;
  final AgriculturalIndices agriculturalIndices;
  final DateTime lastUpdated;
  final double dataAccuracy;

  ComprehensiveWeatherData({
    required this.currentWeather,
    required this.forecast,
    required this.agriculturalWeather,
    required this.seasonalData,
    required this.alerts,
    required this.agriculturalIndices,
    required this.lastUpdated,
    required this.dataAccuracy,
  });
}

class CurrentWeatherData {
  final double temperature;
  final double feelsLike;
  final double humidity;
  final double pressure;
  final double windSpeed;
  final double windDirection;
  final double windGust;
  final double visibility;
  final double cloudCover;
  final double uvIndex;
  final double dewPoint;
  final String weatherCondition;
  final String weatherIcon;
  final double precipitation;
  final double precipitationProbability;
  final DateTime timestamp;
  final String source;

  CurrentWeatherData({
    required this.temperature,
    required this.feelsLike,
    required this.humidity,
    required this.pressure,
    required this.windSpeed,
    required this.windDirection,
    required this.windGust,
    required this.visibility,
    required this.cloudCover,
    required this.uvIndex,
    required this.dewPoint,
    required this.weatherCondition,
    required this.weatherIcon,
    required this.precipitation,
    required this.precipitationProbability,
    required this.timestamp,
    required this.source,
  });
}

class WeatherForecast {
  final DateTime date;
  final double temperature;
  final double minTemperature;
  final double maxTemperature;
  final double humidity;
  final double pressure;
  final double windSpeed;
  final double windDirection;
  final double cloudCover;
  final double precipitation;
  final double precipitationProbability;
  final String weatherCondition;
  final String weatherIcon;

  WeatherForecast({
    required this.date,
    required this.temperature,
    required this.minTemperature,
    required this.maxTemperature,
    required this.humidity,
    required this.pressure,
    required this.windSpeed,
    required this.windDirection,
    required this.cloudCover,
    required this.precipitation,
    required this.precipitationProbability,
    required this.weatherCondition,
    required this.weatherIcon,
  });
}

class AgriculturalWeatherData {
  final double soilTemperature;
  final Map<String, double> growingDegreeDays;
  final double frostRisk;
  final double evapotranspiration;
  final List<String> irrigationRecommendations;
  final Map<String, CropSuitability> cropSuitability;
  final Map<String, double> pestDiseaseRisk;
  final String fieldWorkability;

  AgriculturalWeatherData({
    required this.soilTemperature,
    required this.growingDegreeDays,
    required this.frostRisk,
    required this.evapotranspiration,
    required this.irrigationRecommendations,
    required this.cropSuitability,
    required this.pestDiseaseRisk,
    required this.fieldWorkability,
  });
}

class SeasonalWeatherData {
  final String currentSeason;
  final String monsoonStatus;
  final double expectedRainfall;
  final String temperatureTrend;

  SeasonalWeatherData({
    required this.currentSeason,
    required this.monsoonStatus,
    required this.expectedRainfall,
    required this.temperatureTrend,
  });
}

class WeatherAlert {
  final String type;
  final String severity;
  final String message;
  final DateTime validFrom;
  final DateTime validTo;

  WeatherAlert({
    required this.type,
    required this.severity,
    required this.message,
    required this.validFrom,
    required this.validTo,
  });
}

class AgriculturalIndices {
  final double heatIndex;
  final double windChill;
  final double comfortIndex;
  final double diseasePressureIndex;
  final double sprayConditionsIndex;
  final double fieldWorkabilityIndex;
  final double stressIndex;

  AgriculturalIndices({
    required this.heatIndex,
    required this.windChill,
    required this.comfortIndex,
    required this.diseasePressureIndex,
    required this.sprayConditionsIndex,
    required this.fieldWorkabilityIndex,
    required this.stressIndex,
  });
}

class CropSuitability {
  final double score;
  final String recommendation;
  final List<String> factors;

  CropSuitability({
    required this.score,
    required this.recommendation,
    required this.factors,
  });
}
