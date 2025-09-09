import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class LocalizationService {
  static const Map<String, Map<String, String>> _localizedValues = {
    'en': {
      // App Basic
      'appTitle': 'Indian Farming',
      'appSubtitle': 'Modern Solutions for Farmers',
      'loading': 'Loading...',
      
      // Navigation
      'dashboard': 'Dashboard',
      'khatabook': 'Khatabook',
      'weather': 'Weather',
      'market': 'Market',
      'profile': 'Profile',
      'settings': 'Settings',
      
      // Khatabook Main
      'digitalLedger': 'Digital Ledger',
      'farmAccounting': 'Farm Accounting',
      'khatabookDescription': 'Track your farm expenses, income, and profits with smart analytics',
      'totalIncome': 'Total Income',
      'totalExpenses': 'Total Expenses',
      'netProfit': 'Net Profit',
      'thisMonth': 'This Month',
      'thisYear': 'This Year',
      'profitMargin': 'Profit Margin',
      'overview': 'Overview',
      'transactions': 'Transactions',
      'crops': 'Crops',
      'budget': 'Budget',
      'tips': 'Tips',
      'analytics': 'Analytics',
      
      // Transactions
      'addTransaction': 'Add Transaction',
      'income': 'Income',
      'expense': 'Expense',
      'amount': 'Amount',
      'description': 'Description',
      'category': 'Category',
      'date': 'Date',
      'selectCategory': 'Select Category',
      'enterAmount': 'Enter Amount',
      'enterDescription': 'Enter Description',
      'save': 'Save',
      'cancel': 'Cancel',
      'edit': 'Edit',
      'delete': 'Delete',
      'deleteConfirmation': 'Are you sure you want to delete this transaction?',
      
      // Income Categories
      'cropSales': 'Crop Sales',
      'livestockSales': 'Livestock Sales',
      'dairySales': 'Dairy Sales',
      'governmentSubsidy': 'Government Subsidy',
      'otherIncome': 'Other Income',
      
      // Expense Categories
      'seeds': 'Seeds',
      'fertilizers': 'Fertilizers',
      'pesticides': 'Pesticides',
      'fuel': 'Fuel',
      'labor': 'Labor',
      'equipment': 'Equipment',
      'irrigation': 'Irrigation',
      'transportation': 'Transportation',
      'otherExpenses': 'Other Expenses',
      
      // Crops
      'addCrop': 'Add Crop',
      'cropName': 'Crop Name',
      'variety': 'Variety',
      'plantingDate': 'Planting Date',
      'harvestDate': 'Harvest Date',
      'areaPlanted': 'Area Planted (acres)',
      'expectedYield': 'Expected Yield (kg)',
      'actualYield': 'Actual Yield (kg)',
      'costPerAcre': 'Cost per Acre',
      'pricePerKg': 'Price per Kg',
      'status': 'Status',
      'planted': 'Planted',
      'growing': 'Growing',
      'harvested': 'Harvested',
      'sold': 'Sold',
      
      // Analytics
      'monthlyTrends': 'Monthly Trends',
      'cropProfitability': 'Crop Profitability',
      'aiInsights': 'AI Insights',
      'forecasting': 'Forecasting',
      'profitTrend': 'Profit Trend',
      'expenseTrend': 'Expense Trend',
      'incomeTrend': 'Income Trend',
      'topPerformingCrops': 'Top Performing Crops',
      'recommendations': 'Recommendations',
      'marketTrends': 'Market Trends',
      'weatherImpact': 'Weather Impact',
      'investmentAdvice': 'Investment Advice',
      
      // Settings
      'appearance': 'Appearance',
      'language': 'Language',
      'currency': 'Currency',
      'notifications': 'Notifications',
      'showTips': 'Show Tips',
      'darkMode': 'Dark Mode',
      'lightMode': 'Light Mode',
      'systemMode': 'System Mode',
      
      // Common
      'yes': 'Yes',
      'no': 'No',
      'ok': 'OK',
      'close': 'Close',
      'next': 'Next',
      'previous': 'Previous',
      'submit': 'Submit',
      'update': 'Update',
      'create': 'Create',
      'search': 'Search',
      'filter': 'Filter',
      'sort': 'Sort',
      'export': 'Export',
      'import': 'Import',
      'backup': 'Backup',
      'restore': 'Restore',
      
      // Messages
      'successSaved': 'Successfully saved!',
      'errorOccurred': 'An error occurred',
      'noDataAvailable': 'No data available',
      'comingSoon': 'Coming Soon',
      'featureInDevelopment': 'This feature is under development',
    },
    
    'hi': {
      // App Basic
      'appTitle': 'भारतीय कृषि',
      'appSubtitle': 'किसानों के लिए आधुनिक समाधान',
      'loading': 'लोड हो रहा है...',
      
      // Navigation
      'dashboard': 'डैशबोर्ड',
      'khatabook': 'खाताबही',
      'weather': 'मौसम',
      'market': 'बाजार',
      'profile': 'प्रोफ़ाइल',
      'settings': 'सेटिंग्स',
      
      // Khatabook Main
      'digitalLedger': 'डिजिटल खाताबही',
      'farmAccounting': 'कृषि लेखांकन',
      'khatabookDescription': 'स्मार्ट एनालिटिक्स के साथ अपने खेत के खर्च, आय और मुनाफे को ट्रैक करें',
      'totalIncome': 'कुल आय',
      'totalExpenses': 'कुल खर्च',
      'netProfit': 'शुद्ध लाभ',
      'thisMonth': 'इस महीने',
      'thisYear': 'इस साल',
      'profitMargin': 'लाभ मार्जिन',
      'overview': 'अवलोकन',
      'transactions': 'लेन-देन',
      'crops': 'फसलें',
      'budget': 'बजट',
      'tips': 'सुझाव',
      'analytics': 'विश्लेषण',
      
      // Transactions
      'addTransaction': 'लेन-देन जोड़ें',
      'income': 'आय',
      'expense': 'खर्च',
      'amount': 'राशि',
      'description': 'विवरण',
      'category': 'श्रेणी',
      'date': 'तारीख',
      'selectCategory': 'श्रेणी चुनें',
      'enterAmount': 'राशि दर्ज करें',
      'enterDescription': 'विवरण दर्ज करें',
      'save': 'सेव करें',
      'cancel': 'रद्द करें',
      'edit': 'संपादित करें',
      'delete': 'हटाएं',
      'deleteConfirmation': 'क्या आप वाकई इस लेन-देन को हटाना चाहते हैं?',
      
      // Income Categories
      'cropSales': 'फसल बिक्री',
      'livestockSales': 'पशुधन बिक्री',
      'dairySales': 'डेयरी बिक्री',
      'governmentSubsidy': 'सरकारी सब्सिडी',
      'otherIncome': 'अन्य आय',
      
      // Expense Categories
      'seeds': 'बीज',
      'fertilizers': 'उर्वरक',
      'pesticides': 'कीटनाशक',
      'fuel': 'ईंधन',
      'labor': 'मजदूर',
      'equipment': 'उपकरण',
      'irrigation': 'सिंचाई',
      'transportation': 'परिवहन',
      'otherExpenses': 'अन्य खर्च',
      
      // Crops
      'addCrop': 'फसल जोड़ें',
      'cropName': 'फसल का नाम',
      'variety': 'किस्म',
      'plantingDate': 'रोपण की तारीख',
      'harvestDate': 'कटाई की तारीख',
      'areaPlanted': 'बोया गया क्षेत्र (एकड़)',
      'expectedYield': 'अपेक्षित उपज (किग्रा)',
      'actualYield': 'वास्तविक उपज (किग्रा)',
      'costPerAcre': 'प्रति एकड़ लागत',
      'pricePerKg': 'प्रति किग्रा मूल्य',
      'status': 'स्थिति',
      'planted': 'बोया गया',
      'growing': 'बढ़ रहा',
      'harvested': 'काटा गया',
      'sold': 'बेचा गया',
      
      // Analytics
      'monthlyTrends': 'मासिक रुझान',
      'cropProfitability': 'फसल लाभप्रदता',
      'aiInsights': 'एआई अंतर्दृष्टि',
      'forecasting': 'पूर्वानुमान',
      'profitTrend': 'लाभ रुझान',
      'expenseTrend': 'खर्च रुझान',
      'incomeTrend': 'आय रुझान',
      'topPerformingCrops': 'सर्वोत्तम प्रदर्शन करने वाली फसलें',
      'recommendations': 'सिफारिशें',
      'marketTrends': 'बाजार के रुझान',
      'weatherImpact': 'मौसम का प्रभाव',
      'investmentAdvice': 'निवेश सलाह',
      
      // Settings
      'appearance': 'दिखावट',
      'language': 'भाषा',
      'currency': 'मुद्रा',
      'notifications': 'सूचनाएं',
      'showTips': 'सुझाव दिखाएं',
      'darkMode': 'डार्क मोड',
      'lightMode': 'लाइट मोड',
      'systemMode': 'सिस्टम मोड',
      
      // Common
      'yes': 'हां',
      'no': 'नहीं',
      'ok': 'ठीक है',
      'close': 'बंद करें',
      'next': 'अगला',
      'previous': 'पिछला',
      'submit': 'जमा करें',
      'update': 'अपडेट करें',
      'create': 'बनाएं',
      'search': 'खोजें',
      'filter': 'फिल्टर',
      'sort': 'क्रमबद्ध करें',
      'export': 'निर्यात',
      'import': 'आयात',
      'backup': 'बैकअप',
      'restore': 'पुनर्स्थापना',
      
      // Messages
      'successSaved': 'सफलतापूर्वक सेव किया गया!',
      'errorOccurred': 'एक त्रुटि हुई',
      'noDataAvailable': 'कोई डेटा उपलब्ध नहीं',
      'comingSoon': 'जल्द आ रहा है',
      'featureInDevelopment': 'यह सुविधा विकसित की जा रही है',
    },
  };

  static String translate(String key, String languageCode) {
    return _localizedValues[languageCode]?[key] ?? 
           _localizedValues['en']?[key] ?? 
           key;
  }

  static List<String> getSupportedLanguages() {
    return _localizedValues.keys.toList();
  }

  static Map<String, String> getLanguageNames() {
    return {
      'en': 'English',
      'hi': 'हिन्दी',
    };
  }
}

// Extension for easy translation access
extension StringTranslation on String {
  String tr(String languageCode) {
    return LocalizationService.translate(this, languageCode);
  }
}
