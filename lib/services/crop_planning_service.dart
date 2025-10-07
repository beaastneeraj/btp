import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;
import '../services/weather_service.dart';
import '../services/market_data_service.dart';
import '../services/csv_data_service.dart';

class CropPlanningService {
  static final CropPlanningService _instance = CropPlanningService._internal();
  factory CropPlanningService() => _instance;
  CropPlanningService._internal();

  final WeatherService _weatherService = WeatherService();
  final MarketDataService _marketService = MarketDataService();
  final CsvDataService _csvDataService = CsvDataService();

  // Comprehensive crop database with scientific data
  static const Map<String, Map<String, dynamic>> _cropDatabase = {
    'wheat': {
      'name': 'Wheat',
      'hindiName': 'गेहूं',
      'season': 'Rabi',
      'plantingMonths': [10, 11, 12], // Oct-Dec
      'harvestMonths': [3, 4, 5], // Mar-May
      'duration': 120, // days
      'waterRequirement': 'Medium', // 450-650mm
      'soilType': ['Loamy', 'Clay'],
      'soilPH': [6.0, 7.5],
      'temperature': {'min': 15, 'max': 25, 'optimal': 20},
      'yield': {'min': 25, 'max': 50, 'average': 35}, // quintals per hectare
      'spacing': {'rows': 20, 'plants': 5}, // cm
      'fertilizer': {'n': 120, 'p': 60, 'k': 40}, // kg per hectare
      'diseases': ['Rust', 'Smut', 'Blight'],
      'pests': ['Aphids', 'Termites', 'Army Worm'],
      'marketPrice': {'min': 2000, 'max': 2500, 'current': 2200}, // per quintal
      'profitability': 'High',
      'riskLevel': 'Low',
      'irrigationFrequency': 6,
      'stages': [
        {'name': 'Sowing', 'days': '0-7', 'description': 'Seed sowing and initial watering'},
        {'name': 'Germination', 'days': '7-15', 'description': 'Seedling emergence'},
        {'name': 'Tillering', 'days': '20-40', 'description': 'Multiple shoot development'},
        {'name': 'Jointing', 'days': '45-65', 'description': 'Stem elongation'},
        {'name': 'Booting', 'days': '70-85', 'description': 'Ear formation'},
        {'name': 'Flowering', 'days': '90-100', 'description': 'Pollination phase'},
        {'name': 'Grain Filling', 'days': '100-115', 'description': 'Grain development'},
        {'name': 'Maturity', 'days': '115-120', 'description': 'Ready for harvest'}
      ],
      'tips': [
        'Plant during optimal temperature range 15-25°C',
        'Ensure proper drainage to prevent waterlogging',
        'Apply balanced fertilizer in split doses',
        'Monitor for rust diseases during flowering',
        'Harvest when moisture content is 14-16%'
      ]
    },
    'rice': {
      'name': 'Rice',
      'hindiName': 'धान',
      'season': 'Kharif',
      'plantingMonths': [6, 7, 8], // Jun-Aug
      'harvestMonths': [10, 11, 12], // Oct-Dec
      'duration': 110,
      'waterRequirement': 'High', // 1200-1500mm
      'soilType': ['Clay', 'Silty Clay'],
      'soilPH': [5.5, 6.5],
      'temperature': {'min': 20, 'max': 35, 'optimal': 28},
      'yield': {'min': 35, 'max': 65, 'average': 50},
      'spacing': {'rows': 20, 'plants': 15},
      'fertilizer': {'n': 100, 'p': 50, 'k': 50},
      'diseases': ['Blast', 'Bacterial Blight', 'Sheath Blight'],
      'pests': ['Brown Plant Hopper', 'Stem Borer', 'Leaf Roller'],
      'marketPrice': {'min': 1800, 'max': 2200, 'current': 2000},
      'profitability': 'High',
      'riskLevel': 'Medium',
      'irrigationFrequency': 15,
      'stages': [
        {'name': 'Nursery', 'days': '0-30', 'description': 'Seedling preparation'},
        {'name': 'Transplanting', 'days': '30-35', 'description': 'Moving seedlings to field'},
        {'name': 'Tillering', 'days': '35-55', 'description': 'Multiple shoot development'},
        {'name': 'Panicle Initiation', 'days': '55-75', 'description': 'Flower cluster formation'},
        {'name': 'Flowering', 'days': '75-85', 'description': 'Pollination phase'},
        {'name': 'Grain Filling', 'days': '85-105', 'description': 'Grain development'},
        {'name': 'Maturity', 'days': '105-110', 'description': 'Ready for harvest'}
      ],
      'tips': [
        'Maintain 2-5cm standing water during growth',
        'Use certified disease-resistant varieties',
        'Apply nitrogen in 3-4 split doses',
        'Control weeds in first 60 days',
        'Harvest at 80% grain maturity'
      ]
    },
    'maize': {
      'name': 'Maize',
      'hindiName': 'मक्का',
      'season': 'Kharif',
      'plantingMonths': [6, 7],
      'harvestMonths': [9, 10, 11],
      'duration': 90,
      'waterRequirement': 'Medium',
      'soilType': ['Loamy', 'Sandy Loam'],
      'soilPH': [6.0, 7.5],
      'temperature': {'min': 18, 'max': 35, 'optimal': 26},
      'yield': {'min': 30, 'max': 60, 'average': 45},
      'spacing': {'rows': 60, 'plants': 20},
      'fertilizer': {'n': 150, 'p': 75, 'k': 60},
      'diseases': ['Blight', 'Rust', 'Downy Mildew'],
      'pests': ['Stem Borer', 'Fall Army Worm', 'Shoot Fly'],
      'marketPrice': {'min': 1500, 'max': 2000, 'current': 1750},
      'profitability': 'Medium',
      'riskLevel': 'Medium',
      'irrigationFrequency': 8,
      'stages': [
        {'name': 'Sowing', 'days': '0-7', 'description': 'Seed planting'},
        {'name': 'Germination', 'days': '7-15', 'description': 'Seedling emergence'},
        {'name': 'Vegetative', 'days': '15-45', 'description': 'Leaf and stem growth'},
        {'name': 'Tasseling', 'days': '45-55', 'description': 'Male flower emergence'},
        {'name': 'Silking', 'days': '55-65', 'description': 'Female flower emergence'},
        {'name': 'Grain Filling', 'days': '65-85', 'description': 'Kernel development'},
        {'name': 'Maturity', 'days': '85-90', 'description': 'Ready for harvest'}
      ],
      'tips': [
        'Plant after soil temperature reaches 15°C',
        'Ensure good drainage and avoid waterlogging',
        'Apply nitrogen top-dressing at knee height',
        'Control fall army worm early in season',
        'Harvest when kernels reach 25% moisture'
      ]
    },
    'cotton': {
      'name': 'Cotton',
      'hindiName': 'कपास',
      'season': 'Kharif',
      'plantingMonths': [5, 6],
      'harvestMonths': [10, 11, 12, 1],
      'duration': 180,
      'waterRequirement': 'High',
      'soilType': ['Black Cotton', 'Alluvial'],
      'soilPH': [6.0, 8.0],
      'temperature': {'min': 20, 'max': 35, 'optimal': 28},
      'yield': {'min': 15, 'max': 35, 'average': 25},
      'spacing': {'rows': 45, 'plants': 10},
      'fertilizer': {'n': 100, 'p': 50, 'k': 50},
      'diseases': ['Fusarium Wilt', 'Bacterial Blight', 'Cotton Leaf Curl'],
      'pests': ['Bollworm', 'Whitefly', 'Aphids'],
      'marketPrice': {'min': 5000, 'max': 7000, 'current': 6200},
      'profitability': 'High',
      'riskLevel': 'High',
      'irrigationFrequency': 12,
      'stages': [
        {'name': 'Sowing', 'days': '0-10', 'description': 'Seed planting'},
        {'name': 'Germination', 'days': '10-20', 'description': 'Seedling emergence'},
        {'name': 'Squaring', 'days': '35-55', 'description': 'Flower bud formation'},
        {'name': 'Flowering', 'days': '55-100', 'description': 'Blooming period'},
        {'name': 'Boll Formation', 'days': '100-140', 'description': 'Cotton boll development'},
        {'name': 'Boll Opening', 'days': '140-180', 'description': 'Cotton fiber emergence'}
      ],
      'tips': [
        'Use certified Bt cotton varieties',
        'Maintain optimal plant population',
        'Regular monitoring for pink bollworm',
        'Apply growth regulators if needed',
        'Pick cotton in multiple rounds'
      ]
    },
    'sugarcane': {
      'name': 'Sugarcane',
      'hindiName': 'गन्ना',
      'season': 'Perennial',
      'plantingMonths': [2, 3, 10, 11],
      'harvestMonths': [12, 1, 2, 3],
      'duration': 365,
      'waterRequirement': 'Very High',
      'soilType': ['Loamy', 'Clay Loam'],
      'soilPH': [6.5, 7.5],
      'temperature': {'min': 20, 'max': 35, 'optimal': 28},
      'yield': {'min': 600, 'max': 1200, 'average': 800},
      'spacing': {'rows': 90, 'plants': 30},
      'fertilizer': {'n': 300, 'p': 150, 'k': 150},
      'diseases': ['Red Rot', 'Smut', 'Wilt'],
      'pests': ['Shoot Borer', 'Root Borer', 'Scale Insects'],
      'marketPrice': {'min': 280, 'max': 350, 'current': 315},
      'profitability': 'Very High',
      'riskLevel': 'Medium',
      'irrigationFrequency': 25,
      'stages': [
        {'name': 'Planting', 'days': '0-30', 'description': 'Sett planting and germination'},
        {'name': 'Tillering', 'days': '30-120', 'description': 'Multiple shoot development'},
        {'name': 'Grand Growth', 'days': '120-270', 'description': 'Maximum growth phase'},
        {'name': 'Maturation', 'days': '270-365', 'description': 'Sugar accumulation'}
      ],
      'tips': [
        'Use healthy three-budded setts',
        'Maintain proper row spacing',
        'Apply balanced fertilization',
        'Regular earthing up operations',
        'Harvest at optimal maturity for sugar content'
      ]
    },
    'soybean': {
      'name': 'Soybean',
      'hindiName': 'सोयाबीन',
      'season': 'Kharif',
      'plantingMonths': [6, 7],
      'harvestMonths': [10, 11],
      'duration': 100,
      'waterRequirement': 'Medium',
      'soilType': ['Well Drained Loamy'],
      'soilPH': [6.0, 7.5],
      'temperature': {'min': 20, 'max': 32, 'optimal': 26},
      'yield': {'min': 15, 'max': 35, 'average': 25},
      'spacing': {'rows': 30, 'plants': 5},
      'fertilizer': {'n': 25, 'p': 75, 'k': 30},
      'diseases': ['Rust', 'Bacterial Blight', 'Charcoal Rot'],
      'pests': ['Stem Fly', 'Pod Borer', 'Leaf Eating Caterpillar'],
      'marketPrice': {'min': 3500, 'max': 4500, 'current': 4000},
      'profitability': 'High',
      'riskLevel': 'Medium',
      'irrigationFrequency': 5,
      'stages': [
        {'name': 'Sowing', 'days': '0-7', 'description': 'Seed planting'},
        {'name': 'Germination', 'days': '7-15', 'description': 'Seedling emergence'},
        {'name': 'Vegetative', 'days': '15-45', 'description': 'Leaf and root development'},
        {'name': 'Flowering', 'days': '45-65', 'description': 'Blooming period'},
        {'name': 'Pod Filling', 'days': '65-90', 'description': 'Seed development'},
        {'name': 'Maturity', 'days': '90-100', 'description': 'Ready for harvest'}
      ],
      'tips': [
        'Inoculate seeds with Rhizobium bacteria',
        'Avoid waterlogging during flowering',
        'Monitor for yellow mosaic virus',
        'Apply phosphorus at sowing time',
        'Harvest when pods turn brown'
      ]
    },
    'chickpea': {
      'name': 'Chickpea',
      'hindiName': 'चना',
      'season': 'Rabi',
      'plantingMonths': [10, 11],
      'harvestMonths': [3, 4],
      'duration': 120,
      'waterRequirement': 'Low',
      'soilType': ['Loamy', 'Clay Loam', 'Black Cotton'],
      'soilPH': [6.0, 7.5],
      'temperature': {'min': 10, 'max': 30, 'optimal': 20},
      'yield': {'min': 15, 'max': 25, 'average': 20},
      'spacing': {'rows': 30, 'plants': 10},
      'fertilizer': {'n': 20, 'p': 60, 'k': 30},
      'diseases': ['Wilt', 'Blight', 'Root Rot'],
      'pests': ['Pod Borer', 'Cutworm', 'Aphids'],
      'marketPrice': {'min': 4500, 'max': 6000, 'current': 5250},
      'profitability': 'High',
      'riskLevel': 'Low',
      'irrigationFrequency': 2,
      'stages': [
        {'name': 'Sowing', 'days': '0-7', 'description': 'Seed planting'},
        {'name': 'Germination', 'days': '7-15', 'description': 'Seedling emergence'},
        {'name': 'Vegetative', 'days': '15-50', 'description': 'Branch and leaf development'},
        {'name': 'Flowering', 'days': '50-70', 'description': 'Flower formation'},
        {'name': 'Pod Formation', 'days': '70-95', 'description': 'Pod development'},
        {'name': 'Maturity', 'days': '95-120', 'description': 'Ready for harvest'}
      ],
      'tips': [
        'Seed treatment with Rhizobium culture',
        'Drought tolerant but needs moisture at flowering',
        'Protect from pod borer during pod formation',
        'Harvest when 90% pods turn brown',
        'Good for crop rotation with cereals'
      ]
    },
    'mustard': {
      'name': 'Mustard',
      'hindiName': 'सरसों',
      'season': 'Rabi',
      'plantingMonths': [10, 11],
      'harvestMonths': [2, 3],
      'duration': 110,
      'waterRequirement': 'Low',
      'soilType': ['Loamy', 'Sandy Loam'],
      'soilPH': [6.0, 7.5],
      'temperature': {'min': 10, 'max': 25, 'optimal': 18},
      'yield': {'min': 12, 'max': 20, 'average': 16},
      'spacing': {'rows': 30, 'plants': 10},
      'fertilizer': {'n': 80, 'p': 40, 'k': 20},
      'diseases': ['Alternaria Blight', 'White Rust', 'Downy Mildew'],
      'pests': ['Aphids', 'Painted Bug', 'Sawfly'],
      'marketPrice': {'min': 5000, 'max': 6500, 'current': 5750},
      'profitability': 'High',
      'riskLevel': 'Low',
      'irrigationFrequency': 3,
      'stages': [
        {'name': 'Sowing', 'days': '0-5', 'description': 'Seed planting'},
        {'name': 'Germination', 'days': '5-10', 'description': 'Seedling emergence'},
        {'name': 'Vegetative', 'days': '10-45', 'description': 'Leaf and stem growth'},
        {'name': 'Flowering', 'days': '45-75', 'description': 'Yellow flower bloom'},
        {'name': 'Siliqua Formation', 'days': '75-95', 'description': 'Pod development'},
        {'name': 'Maturity', 'days': '95-110', 'description': 'Ready for harvest'}
      ],
      'tips': [
        'Early sowing gives better yields',
        'Control aphids during flowering',
        'One irrigation at flowering crucial',
        'Harvest when pods turn yellow-brown',
        'Excellent oilseed and green manure crop'
      ]
    },
    'groundnut': {
      'name': 'Groundnut',
      'hindiName': 'मूंगफली',
      'season': 'Kharif',
      'plantingMonths': [6, 7],
      'harvestMonths': [10, 11],
      'duration': 110,
      'waterRequirement': 'Medium',
      'soilType': ['Sandy Loam', 'Red Loam'],
      'soilPH': [6.0, 7.0],
      'temperature': {'min': 20, 'max': 30, 'optimal': 25},
      'yield': {'min': 15, 'max': 30, 'average': 22},
      'spacing': {'rows': 30, 'plants': 10},
      'fertilizer': {'n': 25, 'p': 50, 'k': 75},
      'diseases': ['Tikka Leaf Spot', 'Stem Rot', 'Rust'],
      'pests': ['Aphids', 'Thrips', 'White Grub'],
      'marketPrice': {'min': 5000, 'max': 6500, 'current': 5800},
      'profitability': 'High',
      'riskLevel': 'Medium',
      'irrigationFrequency': 6,
      'stages': [
        {'name': 'Sowing', 'days': '0-7', 'description': 'Seed planting'},
        {'name': 'Germination', 'days': '7-15', 'description': 'Seedling emergence'},
        {'name': 'Vegetative', 'days': '15-40', 'description': 'Branch development'},
        {'name': 'Flowering', 'days': '40-55', 'description': 'Flower formation'},
        {'name': 'Pegging', 'days': '55-75', 'description': 'Underground peg penetration'},
        {'name': 'Pod Development', 'days': '75-100', 'description': 'Nut formation'},
        {'name': 'Maturity', 'days': '100-110', 'description': 'Ready for harvest'}
      ],
      'tips': [
        'Treat seeds with Rhizobium and fungicide',
        'Gypsum application at flowering crucial',
        'Do not disturb soil during pegging',
        'Ensure calcium availability for pod filling',
        'Harvest when leaves turn yellow'
      ]
    },
    'pigeon_pea': {
      'name': 'Pigeon Pea',
      'hindiName': 'अरहर/तुअर',
      'season': 'Kharif',
      'plantingMonths': [6, 7],
      'harvestMonths': [12, 1, 2],
      'duration': 160,
      'waterRequirement': 'Low',
      'soilType': ['Loamy', 'Clay Loam', 'Black Cotton'],
      'soilPH': [5.5, 7.5],
      'temperature': {'min': 20, 'max': 35, 'optimal': 28},
      'yield': {'min': 12, 'max': 25, 'average': 18},
      'spacing': {'rows': 60, 'plants': 20},
      'fertilizer': {'n': 20, 'p': 50, 'k': 25},
      'diseases': ['Wilt', 'Sterility Mosaic', 'Phytophthora Blight'],
      'pests': ['Pod Borer', 'Pod Fly', 'Plume Moth'],
      'marketPrice': {'min': 6000, 'max': 8000, 'current': 7000},
      'profitability': 'Very High',
      'riskLevel': 'Medium',
      'irrigationFrequency': 3,
      'stages': [
        {'name': 'Sowing', 'days': '0-10', 'description': 'Seed planting'},
        {'name': 'Germination', 'days': '10-20', 'description': 'Seedling emergence'},
        {'name': 'Vegetative', 'days': '20-80', 'description': 'Branch and leaf development'},
        {'name': 'Flowering', 'days': '80-120', 'description': 'Flower formation'},
        {'name': 'Pod Formation', 'days': '120-150', 'description': 'Pod development'},
        {'name': 'Maturity', 'days': '150-160', 'description': 'Ready for harvest'}
      ],
      'tips': [
        'Ideal for intercropping with cereals',
        'Drought tolerant, suitable for rainfed areas',
        'Use wilt-resistant varieties',
        'Monitor for pod borer after flowering',
        'Multiple pickings increase total yield'
      ]
    },
    'pearl_millet': {
      'name': 'Pearl Millet',
      'hindiName': 'बाजरा',
      'season': 'Kharif',
      'plantingMonths': [7, 8],
      'harvestMonths': [10, 11],
      'duration': 75,
      'waterRequirement': 'Low',
      'soilType': ['Sandy', 'Sandy Loam', 'Loamy'],
      'soilPH': [6.5, 7.5],
      'temperature': {'min': 25, 'max': 35, 'optimal': 30},
      'yield': {'min': 15, 'max': 30, 'average': 22},
      'spacing': {'rows': 45, 'plants': 10},
      'fertilizer': {'n': 80, 'p': 40, 'k': 20},
      'diseases': ['Downy Mildew', 'Ergot', 'Smut'],
      'pests': ['Shoot Fly', 'Stem Borer', 'Armyworm'],
      'marketPrice': {'min': 2000, 'max': 2800, 'current': 2400},
      'profitability': 'Medium',
      'riskLevel': 'Low',
      'irrigationFrequency': 2,
      'stages': [
        {'name': 'Sowing', 'days': '0-5', 'description': 'Seed planting'},
        {'name': 'Germination', 'days': '5-10', 'description': 'Seedling emergence'},
        {'name': 'Tillering', 'days': '10-30', 'description': 'Multiple shoot development'},
        {'name': 'Panicle Initiation', 'days': '30-45', 'description': 'Flower head formation'},
        {'name': 'Flowering', 'days': '45-55', 'description': 'Pollination phase'},
        {'name': 'Grain Filling', 'days': '55-70', 'description': 'Grain development'},
        {'name': 'Maturity', 'days': '70-75', 'description': 'Ready for harvest'}
      ],
      'tips': [
        'Highly drought tolerant crop',
        'Ideal for arid and semi-arid regions',
        'Rich in iron and minerals',
        'Treat seeds with systemic fungicide',
        'Good fodder value for livestock'
      ]
    },
    'tomato': {
      'name': 'Tomato',
      'hindiName': 'टमाटर',
      'season': 'All Season',
      'plantingMonths': [7, 8, 11, 12],
      'harvestMonths': [10, 11, 2, 3],
      'duration': 90,
      'waterRequirement': 'Medium',
      'soilType': ['Loamy', 'Sandy Loam'],
      'soilPH': [6.0, 7.0],
      'temperature': {'min': 15, 'max': 30, 'optimal': 23},
      'yield': {'min': 200, 'max': 600, 'average': 400},
      'spacing': {'rows': 60, 'plants': 45},
      'fertilizer': {'n': 150, 'p': 100, 'k': 100},
      'diseases': ['Early Blight', 'Late Blight', 'Leaf Curl Virus'],
      'pests': ['Fruit Borer', 'Whitefly', 'Leaf Miner'],
      'marketPrice': {'min': 1000, 'max': 3000, 'current': 2000},
      'profitability': 'Very High',
      'riskLevel': 'Medium',
      'irrigationFrequency': 10,
      'stages': [
        {'name': 'Nursery', 'days': '0-25', 'description': 'Seedling preparation'},
        {'name': 'Transplanting', 'days': '25-30', 'description': 'Moving to main field'},
        {'name': 'Vegetative', 'days': '30-45', 'description': 'Plant growth'},
        {'name': 'Flowering', 'days': '45-55', 'description': 'Flower formation'},
        {'name': 'Fruit Setting', 'days': '55-70', 'description': 'Fruit development'},
        {'name': 'Ripening', 'days': '70-90', 'description': 'Harvest stage'}
      ],
      'tips': [
        'Transplant in evening hours',
        'Stake tall varieties for support',
        'Regular pruning improves quality',
        'Drip irrigation highly beneficial',
        'Multiple pickings increase returns'
      ]
    },
    'onion': {
      'name': 'Onion',
      'hindiName': 'प्याज',
      'season': 'Rabi',
      'plantingMonths': [11, 12, 1],
      'harvestMonths': [3, 4, 5],
      'duration': 120,
      'waterRequirement': 'Medium',
      'soilType': ['Loamy', 'Sandy Loam'],
      'soilPH': [6.0, 7.0],
      'temperature': {'min': 13, 'max': 24, 'optimal': 18},
      'yield': {'min': 150, 'max': 400, 'average': 250},
      'spacing': {'rows': 15, 'plants': 10},
      'fertilizer': {'n': 100, 'p': 50, 'k': 100},
      'diseases': ['Purple Blotch', 'Stemphylium Blight', 'Basal Rot'],
      'pests': ['Thrips', 'Onion Maggot', 'Cutworm'],
      'marketPrice': {'min': 1500, 'max': 4000, 'current': 2500},
      'profitability': 'Very High',
      'riskLevel': 'High',
      'irrigationFrequency': 8,
      'stages': [
        {'name': 'Nursery', 'days': '0-40', 'description': 'Seedling preparation'},
        {'name': 'Transplanting', 'days': '40-45', 'description': 'Moving to main field'},
        {'name': 'Vegetative', 'days': '45-75', 'description': 'Leaf development'},
        {'name': 'Bulb Initiation', 'days': '75-95', 'description': 'Bulb formation'},
        {'name': 'Bulb Development', 'days': '95-115', 'description': 'Bulb enlargement'},
        {'name': 'Maturity', 'days': '115-120', 'description': 'Ready for harvest'}
      ],
      'tips': [
        'Shallow rooted, needs frequent irrigation',
        'Stop irrigation 10-15 days before harvest',
        'Cure bulbs in shade for better storage',
        'Control thrips during bulb formation',
        'Price fluctuations need market awareness'
      ]
    }
  };

  // Get comprehensive crop recommendations based on location and conditions
  Future<Map<String, dynamic>> getCropRecommendations({
    required double latitude,
    required double longitude,
    required double fieldSize, // in hectares
    String? soilType,
    double? soilPH,
    String? experienceLevel,
  }) async {
    try {
      // Get weather data for location
      final weatherData = await _weatherService.getCurrentWeather(latitude, longitude);
      final forecastData = await _weatherService.getWeatherForecast(latitude, longitude);
      
      // Get current market prices
      final marketData = await _marketService.getCurrentMarketPrices();
      
      // Analyze current conditions
      final currentMonth = DateTime.now().month;
      final currentTemp = weatherData['temperature'] as double;
      final humidity = weatherData['humidity'] as int;
      
      // Filter suitable crops based on season and conditions
      final suitableCrops = _filterSuitableCrops(
        currentMonth: currentMonth,
        temperature: currentTemp,
        humidity: humidity,
        soilType: soilType,
        soilPH: soilPH,
      );
      
      // Calculate profitability for each crop
      final profitabilityAnalysis = _calculateProfitability(
        suitableCrops,
        fieldSize,
        marketData,
      );
      
      // Generate crop calendar
      final cropCalendar = _generateCropCalendar(currentMonth);
      
      // Risk assessment
      final riskAssessment = _assessRisks(suitableCrops, weatherData, forecastData);
      
      return {
        'recommendations': suitableCrops,
        'profitability': profitabilityAnalysis,
        'calendar': cropCalendar,
        'riskAssessment': riskAssessment,
        'weatherConditions': weatherData,
        'marketTrends': marketData,
        'bestCrops': _getBestCrops(profitabilityAnalysis),
        'alternativeCrops': _getAlternativeCrops(suitableCrops),
        'seasonalAdvice': _getSeasonalAdvice(currentMonth),
      };
    } catch (e) {
      return _getMockRecommendations();
    }
  }

  // Filter crops suitable for current conditions
  List<Map<String, dynamic>> _filterSuitableCrops({
    required int currentMonth,
    required double temperature,
    required int humidity,
    String? soilType,
    double? soilPH,
  }) {
    final suitableCrops = <Map<String, dynamic>>[];
    
    _cropDatabase.forEach((key, crop) {
      bool isSuitable = true;
      double suitabilityScore = 100.0;
      List<String> reasons = [];
      
      // Check planting season
      final plantingMonths = crop['plantingMonths'] as List<int>;
      if (!plantingMonths.contains(currentMonth)) {
        suitabilityScore -= 30;
        reasons.add('Not optimal planting season');
      }
      
      // Check temperature range
      final tempRange = crop['temperature'] as Map<String, dynamic>;
      if (temperature < tempRange['min'] || temperature > tempRange['max']) {
        suitabilityScore -= 25;
        reasons.add('Temperature outside optimal range');
      }
      
      // Check soil type if provided
      if (soilType != null) {
        final suitableSoilTypes = crop['soilType'] as List<String>;
        if (!suitableSoilTypes.any((type) => 
            soilType.toLowerCase().contains(type.toLowerCase()))) {
          suitabilityScore -= 20;
          reasons.add('Soil type not optimal');
        }
      }
      
      // Check soil pH if provided
      if (soilPH != null) {
        final phRange = crop['soilPH'] as List<double>;
        if (soilPH < phRange[0] || soilPH > phRange[1]) {
          suitabilityScore -= 15;
          reasons.add('Soil pH outside optimal range');
        }
      }
      
      // Add humidity considerations
      if (crop['waterRequirement'] == 'High' && humidity < 60) {
        suitabilityScore -= 10;
        reasons.add('Low humidity for high water requirement crop');
      }
      
      if (suitabilityScore > 30) { // Only include if reasonably suitable
        suitableCrops.add({
          'cropId': key,
          'cropData': crop,
          'suitabilityScore': suitabilityScore,
          'reasons': reasons,
          'recommendation': _getCropRecommendation(suitabilityScore),
        });
      }
    });
    
    // Sort by suitability score
    suitableCrops.sort((a, b) => (b['suitabilityScore'] as double)
        .compareTo(a['suitabilityScore'] as double));
    
    return suitableCrops;
  }

  // Calculate profitability analysis
  Map<String, dynamic> _calculateProfitability(
    List<Map<String, dynamic>> crops,
    double fieldSize,
    List<Map<String, dynamic>> marketData,
  ) {
    final analysis = <String, dynamic>{};
    
    for (final crop in crops) {
      final cropData = crop['cropData'] as Map<String, dynamic>;
      final cropId = crop['cropId'] as String;
      
      final averageYield = cropData['yield']['average'] as int;
      final marketPrice = cropData['marketPrice']['current'] as int;
      
      // Calculate revenue
      final totalYield = averageYield * fieldSize;
      final revenue = totalYield * marketPrice;
      
      // Estimate costs
      final costs = _calculateCropCosts(cropData, fieldSize);
      
      // Calculate profit
      final profit = revenue - costs['total'];
      final profitPercentage = (profit / costs['total']) * 100;
      
      analysis[cropId] = {
        'revenue': revenue,
        'costs': costs,
        'profit': profit,
        'profitPercentage': profitPercentage,
        'roi': (profit / costs['total']) * 100,
        'paybackPeriod': cropData['duration'],
        'riskLevel': cropData['riskLevel'],
        'expectedYield': totalYield,
      };
    }
    
    return analysis;
  }

  // Calculate crop cultivation costs
  Map<String, dynamic> _calculateCropCosts(Map<String, dynamic> cropData, double fieldSize) {
    final baseCostPerHectare = 25000; // Base cost in INR
    
    // Seed cost
    final seedCost = 3000 * fieldSize;
    
    // Fertilizer cost
    final fertilizerCost = (cropData['fertilizer']['n'] * 12 + 
                           cropData['fertilizer']['p'] * 20 + 
                           cropData['fertilizer']['k'] * 15) * fieldSize;
    
    // Irrigation cost
    final irrigationCost = cropData['irrigationFrequency'] * 500 * fieldSize;
    
    // Labor cost
    final laborCost = cropData['duration'] * 200 * fieldSize;
    
    // Equipment and other costs
    final otherCosts = baseCostPerHectare * fieldSize * 0.3;
    
    final total = seedCost + fertilizerCost + irrigationCost + laborCost + otherCosts;
    
    return {
      'seed': seedCost,
      'fertilizer': fertilizerCost,
      'irrigation': irrigationCost,
      'labor': laborCost,
      'other': otherCosts,
      'total': total,
    };
  }

  // Generate crop calendar for the year
  Map<String, dynamic> _generateCropCalendar(int currentMonth) {
    final calendar = <String, List<Map<String, dynamic>>>{};
    
    for (int month = 1; month <= 12; month++) {
      final monthName = _getMonthName(month);
      calendar[monthName] = [];
      
      _cropDatabase.forEach((key, crop) {
        final plantingMonths = crop['plantingMonths'] as List<int>;
        final harvestMonths = crop['harvestMonths'] as List<int>;
        
        if (plantingMonths.contains(month)) {
          calendar[monthName]!.add({
            'crop': crop['name'],
            'activity': 'Planting',
            'priority': plantingMonths.first == month ? 'High' : 'Medium',
          });
        }
        
        if (harvestMonths.contains(month)) {
          calendar[monthName]!.add({
            'crop': crop['name'],
            'activity': 'Harvesting',
            'priority': 'High',
          });
        }
      });
    }
    
    return calendar;
  }

  // Assess risks for recommended crops
  Map<String, dynamic> _assessRisks(
    List<Map<String, dynamic>> crops,
    Map<String, dynamic> weatherData,
    List<Map<String, dynamic>> forecastData,
  ) {
    final riskAssessment = <String, dynamic>{};
    
    for (final crop in crops) {
      final cropData = crop['cropData'] as Map<String, dynamic>;
      final cropId = crop['cropId'] as String;
      
      final risks = <String>[];
      final riskLevel = cropData['riskLevel'] as String;
      
      // Weather-based risks
      final temperature = weatherData['temperature'] as double;
      if (temperature > 35) {
        risks.add('High temperature stress');
      }
      
      // Check for excessive rainfall in forecast
      final heavyRainDays = forecastData.where((day) => 
          (day['precipitation'] as double) > 80).length;
      if (heavyRainDays > 2) {
        risks.add('Excessive rainfall predicted');
      }
      
      // Market risks
      if (cropData['marketPrice']['current'] < cropData['marketPrice']['min'] * 1.1) {
        risks.add('Current market prices below average');
      }
      
      // Disease and pest risks
      final diseases = cropData['diseases'] as List<String>;
      final pests = cropData['pests'] as List<String>;
      
      riskAssessment[cropId] = {
        'overallRisk': riskLevel,
        'specificRisks': risks,
        'diseaseRisks': diseases,
        'pestRisks': pests,
        'mitigationStrategies': _getMitigationStrategies(riskLevel, risks),
        'riskScore': _calculateRiskScore(riskLevel, risks.length),
      };
    }
    
    return riskAssessment;
  }

  // Helper methods
  String _getCropRecommendation(double score) {
    if (score >= 80) return 'Highly Recommended';
    if (score >= 60) return 'Recommended';
    if (score >= 40) return 'Consider with Caution';
    return 'Not Recommended';
  }

  List<Map<String, dynamic>> _getBestCrops(Map<String, dynamic> profitability) {
    final sortedCrops = profitability.entries.toList()
      ..sort((a, b) => (b.value['profit'] as double)
          .compareTo(a.value['profit'] as double));
    
    return sortedCrops.take(3).map((entry) => {
      'cropId': entry.key,
      'profit': entry.value['profit'],
      'roi': entry.value['roi'],
    }).toList();
  }

  List<String> _getAlternativeCrops(List<Map<String, dynamic>> crops) {
    return crops.skip(3).take(3).map((crop) => 
        crop['cropData']['name'] as String).toList();
  }

  String _getSeasonalAdvice(int month) {
    if (month >= 3 && month <= 5) {
      return 'Summer season: Focus on heat-resistant crops and water management';
    } else if (month >= 6 && month <= 9) {
      return 'Monsoon season: Plant Kharif crops and ensure proper drainage';
    } else {
      return 'Winter season: Ideal for Rabi crops with moderate water requirements';
    }
  }

  List<String> _getMitigationStrategies(String riskLevel, List<String> risks) {
    final strategies = <String>[];
    
    if (riskLevel == 'High') {
      strategies.add('Consider crop insurance');
      strategies.add('Diversify with multiple crops');
    }
    
    if (risks.contains('High temperature stress')) {
      strategies.add('Use shade nets or mulching');
      strategies.add('Increase irrigation frequency');
    }
    
    if (risks.contains('Excessive rainfall predicted')) {
      strategies.add('Improve field drainage');
      strategies.add('Apply preventive fungicides');
    }
    
    return strategies;
  }

  double _calculateRiskScore(String riskLevel, int riskCount) {
    double baseScore = 50.0;
    
    switch (riskLevel) {
      case 'Low': baseScore = 20.0; break;
      case 'Medium': baseScore = 50.0; break;
      case 'High': baseScore = 80.0; break;
    }
    
    return (baseScore + (riskCount * 5)).clamp(0.0, 100.0);
  }

  String _getMonthName(int month) {
    const months = [
      'January', 'February', 'March', 'April', 'May', 'June',
      'July', 'August', 'September', 'October', 'November', 'December'
    ];
    return months[month - 1];
  }

  // Mock data for fallback
  Map<String, dynamic> _getMockRecommendations() {
    return {
      'recommendations': [
        {
          'cropId': 'wheat',
          'cropData': _cropDatabase['wheat'],
          'suitabilityScore': 85.0,
          'reasons': [],
          'recommendation': 'Highly Recommended',
        }
      ],
      'profitability': {
        'wheat': {
          'revenue': 220000,
          'costs': {'total': 120000},
          'profit': 100000,
          'profitPercentage': 83.3,
          'roi': 83.3,
          'paybackPeriod': 120,
          'riskLevel': 'Low',
          'expectedYield': 100,
        }
      },
      'calendar': {
        'November': [
          {'crop': 'Wheat', 'activity': 'Planting', 'priority': 'High'}
        ]
      },
      'riskAssessment': {
        'wheat': {
          'overallRisk': 'Low',
          'specificRisks': [],
          'riskScore': 25.0,
        }
      },
      'weatherConditions': {'temperature': 22.0, 'humidity': 65},
      'bestCrops': [
        {'cropId': 'wheat', 'profit': 100000, 'roi': 83.3}
      ],
      'seasonalAdvice': 'Winter season: Ideal for Rabi crops'
    };
  }

  // Get detailed crop information
  Map<String, dynamic>? getCropDetails(String cropId) {
    return _cropDatabase[cropId];
  }

  // Get all available crops
  List<Map<String, dynamic>> getAllCrops() {
    return _cropDatabase.entries.map((entry) => {
      'id': entry.key,
      ...entry.value,
    }).toList();
  }

  // Get crop planting schedule
  Map<String, dynamic> getCropSchedule(String cropId, DateTime plantingDate) {
    final cropData = _cropDatabase[cropId];
    if (cropData == null) return {};

    final stages = cropData['stages'] as List<Map<String, dynamic>>;
    final schedule = <Map<String, dynamic>>[];

    for (final stage in stages) {
      final dayRange = stage['days'] as String;
      final startDay = int.parse(dayRange.split('-')[0]);
      final endDay = int.parse(dayRange.split('-')[1]);
      
      schedule.add({
        'stage': stage['name'],
        'startDate': plantingDate.add(Duration(days: startDay)),
        'endDate': plantingDate.add(Duration(days: endDay)),
        'description': stage['description'],
        'dayRange': dayRange,
      });
    }

    return {
      'cropName': cropData['name'],
      'totalDuration': cropData['duration'],
      'schedule': schedule,
      'harvestDate': plantingDate.add(Duration(days: cropData['duration'] as int)),
    };
  }

  /// Get enriched recommendations with regional CSV data
  Future<Map<String, dynamic>> getEnrichedRecommendations({
    required double latitude,
    required double longitude,
    required double fieldSize,
    String? state,
    String? district,
  }) async {
    try {
      // Get base recommendations
      final baseRecommendations = await getCropRecommendations(
        latitude: latitude,
        longitude: longitude,
        fieldSize: fieldSize,
      );

      // Enrich with CSV data if state is provided
      if (state != null) {
        final soilData = await _csvDataService.getSoilDataByRegion(state, district);
        final cropCalendar = await _csvDataService.getCropCalendarForRegion(state, null);
        final inputCosts = await _csvDataService.getInputCostsByRegion(state);

        baseRecommendations['regionalData'] = {
          'soilData': soilData,
          'cropCalendar': cropCalendar,
          'inputCosts': inputCosts,
        };
      }

      return baseRecommendations;
    } catch (e) {
      return await getCropRecommendations(
        latitude: latitude,
        longitude: longitude,
        fieldSize: fieldSize,
      );
    }
  }
}
