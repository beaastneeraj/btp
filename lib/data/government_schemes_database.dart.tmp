import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/indian_agriculture_models.dart';

/// Indian Government Agricultural Schemes Database
class GovernmentSchemesDatabase {
  static const Map<String, GovernmentScheme> schemes = {
    'pm_kisan': GovernmentScheme(
      id: 'pm_kisan',
      name: 'PM-KISAN Samman Nidhi',
      hindiName: 'प्रधानमंत्री किसान सम्मान निधि',
      description: 'Income support scheme providing ₹6000 per year to eligible farmer families',
      launchingAuthority: 'Ministry of Agriculture & Farmers Welfare',
      launchDate: DateTime(2019, 2, 24),
      benefits: [
        '₹6000 per year in three installments',
        'Direct benefit transfer to bank account',
        'No middleman involvement',
        'Quick and transparent process'
      ],
      eligibility: [
        'Small and marginal farmers',
        'Holding cultivable land up to 2 hectares',
        'Valid Aadhaar card required',
        'Bank account linked with Aadhaar'
      ],
      documents: [
        'Aadhaar Card',
        'Bank Account Details',
        'Land ownership documents',
        'Self-declaration certificate'
      ],
      applicationProcess: [
        'Visit PM-KISAN portal or CSC center',
        'Fill registration form with required details',
        'Upload necessary documents',
        'Submit application and note registration number',
        'Check status online periodically'
      ],
      website: 'https://pmkisan.gov.in',
      helpline: '155261',
      status: 'Active',
      budget: '₹75,000 crore (2023-24)',
      beneficiaries: '11 crore farmers',
      coverage: 'Pan India',
      implementingAgency: 'Department of Agriculture & Cooperation',
    ),

    'fasal_bima_yojana': GovernmentScheme(
      id: 'fasal_bima_yojana',
      name: 'Pradhan Mantri Fasal Bima Yojana',
      hindiName: 'प्रधानमंत्री फसल बीमा योजना',
      description: 'Crop insurance scheme to protect farmers against crop losses',
      launchingAuthority: 'Ministry of Agriculture & Farmers Welfare',
      launchDate: DateTime(2016, 1, 13),
      benefits: [
        'Low premium rates for farmers',
        'Coverage against natural calamities',
        'Post-harvest losses coverage',
        'Quick claim settlement'
      ],
      eligibility: [
        'All farmers (sharecroppers, tenant farmers)',
        'Enrolled in any of the notified crops',
        'Should have insurable interest in crop',
        'Premium payment within due date'
      ],
      documents: [
        'Aadhaar Card',
        'Bank Account Details',
        'Land records (Khata/Khatauni)',
        'Sowing certificate from Patwari',
        'Previous insurance policy (if any)'
      ],
      applicationProcess: [
        'Visit nearest bank or insurance company',
        'Fill application form with crop details',
        'Submit required documents',
        'Pay premium amount',
        'Get insurance policy document'
      ],
      website: 'https://pmfby.gov.in',
      helpline: '14447',
      status: 'Active',
      budget: '₹16,000 crore (2023-24)',
      beneficiaries: '5.5 crore farmers',
      coverage: 'All states and UTs',
      implementingAgency: 'Agriculture Insurance Company of India',
    ),

    'kisan_credit_card': GovernmentScheme(
      id: 'kisan_credit_card',
      name: 'Kisan Credit Card Scheme',
      hindiName: 'किसान क्रेडिट कार्ड योजना',
      description: 'Credit facility to meet comprehensive credit requirements of farmers',
      launchingAuthority: 'Ministry of Agriculture & Farmers Welfare',
      launchDate: DateTime(1998, 8, 15),
      benefits: [
        'Easy access to credit',
        'Simple documentation',
        'Flexible repayment',
        'Insurance coverage included'
      ],
      eligibility: [
        'Farmers with own land',
        'Tenant farmers and sharecroppers',
        'Self Help Group members',
        'Age 18 to 75 years'
      ],
      documents: [
        'Application form with photograph',
        'Identity proof (Aadhaar, Voter ID)',
        'Address proof',
        'Land documents',
        'Income certificate'
      ],
      applicationProcess: [
        'Approach nearest bank branch',
        'Fill KCC application form',
        'Submit required documents',
        'Bank verification process',
        'Credit limit sanctioning and card issuance'
      ],
      website: 'https://www.nabard.org/kcc.aspx',
      helpline: '1800-180-6770',
      status: 'Active',
      budget: '₹3,60,000 crore (2023-24)',
      beneficiaries: '7 crore farmers',
      coverage: 'Pan India',
      implementingAgency: 'NABARD and Commercial Banks',
    ),

    'soil_health_card': GovernmentScheme(
      id: 'soil_health_card',
      name: 'Soil Health Card Scheme',
      hindiName: 'मृदा स्वास्थ्य कार्ड योजना',
      description: 'Provides soil health information to farmers for better crop management',
      launchingAuthority: 'Ministry of Agriculture & Farmers Welfare',
      launchDate: DateTime(2015, 2, 19),
      benefits: [
        'Soil nutrient status information',
        'Fertilizer recommendations',
        'Improved soil health',
        'Cost reduction in fertilizers'
      ],
      eligibility: [
        'All farmers',
        'Having agricultural land',
        'Registered with local agriculture department'
      ],
      documents: [
        'Land ownership documents',
        'Aadhaar Card',
        'Application form',
        'Bank account details'
      ],
      applicationProcess: [
        'Contact local agriculture extension officer',
        'Register for soil sampling',
        'Provide soil samples from field',
        'Await laboratory analysis',
        'Receive soil health card with recommendations'
      ],
      website: 'https://soilhealth.dac.gov.in',
      helpline: '1800-180-1551',
      status: 'Active',
      budget: '₹568 crore (2023-24)',
      beneficiaries: '22 crore farmers',
      coverage: 'All states',
      implementingAgency: 'Department of Agriculture & Cooperation',
    ),

    'organic_farming': GovernmentScheme(
      id: 'organic_farming',
      name: 'Paramparagat Krishi Vikas Yojana',
      hindiName: 'परंपरागत कृषि विकास योजना',
      description: 'Promotion of organic farming through cluster approach',
      launchingAuthority: 'Ministry of Agriculture & Farmers Welfare',
      launchDate: DateTime(2015, 4, 1),
      benefits: [
        '₹50,000 per hectare over 3 years',
        'Certification support',
        'Training and capacity building',
        'Market linkage support'
      ],
      eligibility: [
        'Farmers practicing organic farming',
        'Willing to form clusters of 50 hectares',
        'Ready to follow organic practices',
        'Participate in training programs'
      ],
      documents: [
        'Land documents',
        'Aadhaar Card',
        'Bank account details',
        'Group formation certificate',
        'Training completion certificate'
      ],
      applicationProcess: [
        'Form farmer group of 20 farmers',
        'Apply through state agriculture department',
        'Attend training on organic practices',
        'Start conversion to organic farming',
        'Get organic certification'
      ],
      website: 'https://pgsindia-ncof.gov.in',
      helpline: '011-23382012',
      status: 'Active',
      budget: '₹325 crore (2023-24)',
      beneficiaries: '8.75 lakh farmers',
      coverage: 'All states',
      implementingAgency: 'State Agriculture Departments',
    ),

    'pradhan_mantri_krishi_sinchai': GovernmentScheme(
      id: 'pradhan_mantri_krishi_sinchai',
      name: 'Pradhan Mantri Krishi Sinchai Yojana',
      hindiName: 'प्रधानमंत्री कृषि सिंचाई योजना',
      description: 'Expanding cultivated area with assured irrigation and improving water use efficiency',
      launchingAuthority: 'Ministry of Agriculture & Farmers Welfare',
      launchDate: DateTime(2015, 7, 1),
      benefits: [
        'Subsidy on drip and sprinkler irrigation',
        'Micro irrigation system support',
        'Water conservation techniques',
        'Higher crop productivity'
      ],
      eligibility: [
        'All categories of farmers',
        'Cooperative societies',
        'FPOs and Water User Associations',
        'Self Help Groups'
      ],
      documents: [
        'Land ownership documents',
        'Aadhaar Card',
        'Bank account details',
        'Quotation from approved vendors',
        'Site verification report'
      ],
      applicationProcess: [
        'Apply at district horticulture office',
        'Submit technical proposal',
        'Get technical approval',
        'Install system after approval',
        'Claim subsidy after verification'
      ],
      website: 'https://pmksy.gov.in',
      helpline: '1800-180-1551',
      status: 'Active',
      budget: '₹93,068 crore (Total allocation)',
      beneficiaries: '22 lakh farmers',
      coverage: 'All states and UTs',
      implementingAgency: 'Department of Agriculture & Cooperation',
    ),

    'formation_promotion_fpos': GovernmentScheme(
      id: 'formation_promotion_fpos',
      name: 'Formation and Promotion of Farmer Producer Organizations',
      hindiName: 'किसान उत्पादक संगठन का गठन और संवर्धन',
      description: 'Formation of 10,000 FPOs to improve farmers income and market access',
      launchingAuthority: 'Ministry of Agriculture & Farmers Welfare',
      launchDate: DateTime(2020, 2, 29),
      benefits: [
        '₹18.5 lakh financial support per FPO',
        'Business development support',
        'Market linkage facilitation',
        'Training and capacity building'
      ],
      eligibility: [
        'Groups of 300 farmers in plains',
        'Groups of 100 farmers in hills',
        'Registered as FPO',
        'Having common business activity'
      ],
      documents: [
        'FPO registration certificate',
        'Member list with Aadhaar',
        'Bank account details',
        'Business plan',
        'Audited financial statements'
      ],
      applicationProcess: [
        'Form farmer group',
        'Register as FPO under appropriate act',
        'Apply through NABARD or SFAC',
        'Submit business plan',
        'Get approval and funding support'
      ],
      website: 'https://www.sfac.in/fpo',
      helpline: '011-26862367',
      status: 'Active',
      budget: '₹6,865 crore (2020-25)',
      beneficiaries: '30 lakh farmers',
      coverage: 'All states',
      implementingAgency: 'SFAC and NABARD',
    ),

    'kisan_rail': GovernmentScheme(
      id: 'kisan_rail',
      name: 'Kisan Rail',
      hindiName: 'किसान रेल',
      description: 'Special parcel trains for transportation of perishable agricultural products',
      launchingAuthority: 'Ministry of Railways',
      launchDate: DateTime(2020, 8, 7),
      benefits: [
        'Fast transportation of perishables',
        'Reduced post-harvest losses',
        'Better market access',
        'Competitive freight rates'
      ],
      eligibility: [
        'Farmers and FPOs',
        'Cold storage operators',
        'Traders and exporters',
        'Cooperative societies'
      ],
      documents: [
        'Consignment booking form',
        'Quality certificate',
        'Invoice and packing list',
        'Transportation permit',
        'Insurance documents'
      ],
      applicationProcess: [
        'Contact nearest railway freight booking office',
        'Book consignment with details',
        'Arrange pre-cooling if required',
        'Load goods at designated station',
        'Track consignment online'
      ],
      website: 'https://www.fois.indianrailways.gov.in',
      helpline: '139',
      status: 'Active',
      budget: 'Part of railway budget',
      beneficiaries: 'Lakhs of farmers',
      coverage: 'Major routes across India',
      implementingAgency: 'Indian Railways',
    ),

    'beekeeping_development': GovernmentScheme(
      id: 'beekeeping_development',
      name: 'National Beekeeping and Honey Mission',
      hindiName: 'राष्ट्रीय मधुमक्खी पालन और शहद मिशन',
      description: 'Promoting scientific beekeeping for increasing farmers income',
      launchingAuthority: 'Ministry of Agriculture & Farmers Welfare',
      launchDate: DateTime(2020, 5, 1),
      benefits: [
        'Subsidy on beekeeping equipment',
        'Training on scientific beekeeping',
        'Honey processing unit support',
        'Market linkage for honey products'
      ],
      eligibility: [
        'Individual farmers',
        'Self Help Groups',
        'Cooperative societies',
        'FPOs and NGOs'
      ],
      documents: [
        'Application form',
        'Aadhaar Card',
        'Bank account details',
        'Training completion certificate',
        'Land documents (if applicable)'
      ],
      applicationProcess: [
        'Apply at district horticulture office',
        'Attend training program',
        'Purchase equipment from approved vendors',
        'Start beekeeping activities',
        'Claim subsidy after verification'
      ],
      website: 'https://nbhm.gov.in',
      helpline: '011-23382305',
      status: 'Active',
      budget: '₹500 crore (2020-25)',
      beneficiaries: '2 lakh beekeepers',
      coverage: 'All states',
      implementingAgency: 'National Bee Board',
    ),

    'digital_agriculture': GovernmentScheme(
      id: 'digital_agriculture',
      name: 'Digital Agriculture Mission',
      hindiName: 'डिजिटल कृषि मिशन',
      description: 'Leveraging emerging technologies for sustainable agriculture development',
      launchingAuthority: 'Ministry of Agriculture & Farmers Welfare',
      launchDate: DateTime(2021, 4, 1),
      benefits: [
        'Access to digital farming solutions',
        'Real-time crop monitoring',
        'Weather-based advisory',
        'Market information services'
      ],
      eligibility: [
        'All farmers',
        'Agricultural service providers',
        'Research institutions',
        'Private companies in agriculture'
      ],
      documents: [
        'Registration on digital platforms',
        'Aadhaar Card',
        'Mobile number verification',
        'Land documents',
        'Crop details'
      ],
      applicationProcess: [
        'Download agriculture mobile apps',
        'Register with Aadhaar verification',
        'Add farm and crop details',
        'Access digital services',
        'Avail advisory and market services'
      ],
      website: 'https://digitalindia.gov.in/agriculture',
      helpline: '1800-180-1551',
      status: 'Active',
      budget: '₹2,817 crore (2021-26)',
      beneficiaries: '6 crore farmers',
      coverage: 'Pan India',
      implementingAgency: 'Department of Agriculture & Cooperation',
    ),
  };

  /// Get active schemes
  static List<GovernmentScheme> getActiveSchemes() {
    return schemes.values
        .where((scheme) => scheme.status == 'Active')
        .toList();
  }

  /// Get schemes by benefit type
  static List<GovernmentScheme> getSchemesByBenefit(String benefitType) {
    return schemes.values
        .where((scheme) => scheme.benefits
            .any((benefit) => benefit.toLowerCase().contains(benefitType.toLowerCase())))
        .toList();
  }

  /// Search schemes
  static List<GovernmentScheme> searchSchemes(String query) {
    final lowerQuery = query.toLowerCase();
    return schemes.values
        .where((scheme) =>
            scheme.name.toLowerCase().contains(lowerQuery) ||
            scheme.hindiName.contains(query) ||
            scheme.description.toLowerCase().contains(lowerQuery))
        .toList();
  }

  /// Get schemes by budget range
  static List<GovernmentScheme> getSchemesByBudget(String minBudget) {
    return schemes.values
        .where((scheme) => scheme.budget.contains(minBudget))
        .toList();
  }

  /// Get schemes for specific farmer type
  static List<GovernmentScheme> getSchemesForFarmerType(String farmerType) {
    return schemes.values
        .where((scheme) => scheme.eligibility
            .any((criteria) => criteria.toLowerCase().contains(farmerType.toLowerCase())))
        .toList();
  }
}

/// Agricultural News and Updates
class AgricultureNewsDatabase {
  static const List<AgricultureNews> news = [
    AgricultureNews(
      id: 'news_001',
      title: 'New PM-KISAN installment released',
      hindiTitle: 'नया पीएम-किसान किस्त जारी',
      content: 'Government releases 14th installment of PM-KISAN scheme, benefiting over 11 crore farmers across the country...',
      category: 'Government Schemes',
      date: DateTime(2024, 7, 15),
      source: 'Ministry of Agriculture',
      imageUrl: 'assets/images/pm_kisan_news.jpg',
      isImportant: true,
      tags: ['PM-KISAN', 'Farmers', 'Direct Benefit Transfer'],
      readTime: '2 min read',
    ),
    
    AgricultureNews(
      id: 'news_002',
      title: 'Monsoon forecast: Normal rainfall expected',
      hindiTitle: 'मानसून पूर्वानुमान: सामान्य वर्षा की उम्मीद',
      content: 'IMD predicts normal monsoon rainfall across most parts of India, which is good news for Kharif crops...',
      category: 'Weather',
      date: DateTime(2024, 7, 10),
      source: 'India Meteorological Department',
      imageUrl: 'assets/images/monsoon_forecast.jpg',
      isImportant: true,
      tags: ['Monsoon', 'Weather', 'Kharif', 'Rainfall'],
      readTime: '3 min read',
    ),
    
    AgricultureNews(
      id: 'news_003',
      title: 'New crop insurance guidelines released',
      hindiTitle: 'नई फसल बीमा दिशा-निर्देश जारी',
      content: 'PMFBY guidelines updated to include more crops and simplified claim process for faster settlements...',
      category: 'Insurance',
      date: DateTime(2024, 7, 8),
      source: 'Agriculture Insurance Company',
      imageUrl: 'assets/images/crop_insurance.jpg',
      isImportant: false,
      tags: ['PMFBY', 'Insurance', 'Claims', 'Guidelines'],
      readTime: '4 min read',
    ),
  ];

  /// Get latest news
  static List<AgricultureNews> getLatestNews() {
    var sortedNews = List<AgricultureNews>.from(news);
    sortedNews.sort((a, b) => b.date.compareTo(a.date));
    return sortedNews;
  }

  /// Get important news
  static List<AgricultureNews> getImportantNews() {
    return news.where((article) => article.isImportant).toList();
  }

  /// Get news by category
  static List<AgricultureNews> getNewsByCategory(String category) {
    return news
        .where((article) => article.category.toLowerCase() == category.toLowerCase())
        .toList();
  }

  /// Search news
  static List<AgricultureNews> searchNews(String query) {
    final lowerQuery = query.toLowerCase();
    return news
        .where((article) =>
            article.title.toLowerCase().contains(lowerQuery) ||
            article.content.toLowerCase().contains(lowerQuery) ||
            article.tags.any((tag) => tag.toLowerCase().contains(lowerQuery)))
        .toList();
  }
}

/// Providers
final governmentSchemesDatabaseProvider = Provider<GovernmentSchemesDatabase>((ref) {
  return GovernmentSchemesDatabase();
});

final agricultureNewsDatabaseProvider = Provider<AgricultureNewsDatabase>((ref) {
  return AgricultureNewsDatabase();
});
