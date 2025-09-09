class FarmingType {
  final String id;
  final String name;
  final String description;
  final String icon;
  final List<String> features;
  final Map<String, dynamic> requirements;

  FarmingType({
    required this.id,
    required this.name,
    required this.description,
    required this.icon,
    required this.features,
    required this.requirements,
  });

  factory FarmingType.fromJson(Map<String, dynamic> json) {
    return FarmingType(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      icon: json['icon'] ?? '',
      features: List<String>.from(json['features'] ?? []),
      requirements: json['requirements'] ?? {},
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'icon': icon,
      'features': features,
      'requirements': requirements,
    };
  }

  static List<FarmingType> getDefaultTypes() {
    return [
      FarmingType(
        id: 'crop_farming',
        name: 'Crop Farming',
        description: 'Traditional crop cultivation and field management',
        icon: '🌾',
        features: [
          'Crop rotation planning',
          'Seed management',
          'Harvest tracking',
          'Yield analysis',
          'Seasonal planning'
        ],
        requirements: {
          'min_area': 1.0,
          'water_source': true,
          'soil_type': ['loamy', 'sandy', 'clay'],
        },
      ),
      FarmingType(
        id: 'livestock_farming',
        name: 'Livestock Farming',
        description: 'Cattle, poultry, and livestock management',
        icon: '🐄',
        features: [
          'Animal health tracking',
          'Feed management',
          'Breeding records',
          'Milk production',
          'Weight monitoring'
        ],
        requirements: {
          'shelter': true,
          'veterinary_access': true,
          'feed_storage': true,
        },
      ),
      FarmingType(
        id: 'dairy_farming',
        name: 'Dairy Farming',
        description: 'Specialized dairy cattle and milk production',
        icon: '🥛',
        features: [
          'Milk yield tracking',
          'Cattle breeding',
          'Feed optimization',
          'Quality control',
          'Market analysis'
        ],
        requirements: {
          'milking_facility': true,
          'cold_storage': true,
          'quality_testing': true,
        },
      ),
      FarmingType(
        id: 'organic_farming',
        name: 'Organic Farming',
        description: 'Chemical-free sustainable agriculture',
        icon: '🌱',
        features: [
          'Organic certification',
          'Natural pest control',
          'Soil health monitoring',
          'Compost management',
          'Premium pricing'
        ],
        requirements: {
          'certification': true,
          'transition_period': 3,
          'documentation': true,
        },
      ),
      FarmingType(
        id: 'hydroponic_farming',
        name: 'Hydroponic Farming',
        description: 'Soilless cultivation with nutrient solutions',
        icon: '💧',
        features: [
          'Nutrient monitoring',
          'pH control',
          'Climate control',
          'Space efficiency',
          'Year-round production'
        ],
        requirements: {
          'controlled_environment': true,
          'nutrient_system': true,
          'electricity': true,
        },
      ),
      FarmingType(
        id: 'greenhouse_farming',
        name: 'Greenhouse Farming',
        description: 'Protected cultivation in controlled environment',
        icon: '🏠',
        features: [
          'Climate control',
          'Pest protection',
          'Water efficiency',
          'Extended seasons',
          'Higher yields'
        ],
        requirements: {
          'greenhouse_structure': true,
          'irrigation_system': true,
          'ventilation': true,
        },
      ),
    ];
  }
}
