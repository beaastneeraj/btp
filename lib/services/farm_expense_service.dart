import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/indian_agriculture_models.dart';

/// Farm Expense Management Service
class FarmExpenseService {
  /// Add expense to farm
  static Future<void> addExpense(FarmProfile farm, FarmExpense expense) async {
    // Add expense to farm's expense list
    farm.expenses.add(expense);
    
    // Update crop field expenses if applicable
    if (expense.relatedCropFieldId != null) {
      final cropField = farm.cropFields
          .firstWhere((field) => field.id == expense.relatedCropFieldId);
      cropField.expenses.add(expense);
    }
    
    // Update instrument expenses if applicable
    if (expense.relatedInstrumentId != null) {
      final instrument = farm.instruments
          .firstWhere((inst) => inst.id == expense.relatedInstrumentId);
      // Add to instrument usage history
      instrument.usageHistory.add(
        UsageRecord(
          date: expense.date,
          hours: 0, // Will be updated separately
          activity: expense.description,
          cost: expense.amount,
          fuelUsed: 0, // Will be updated separately
        ),
      );
    }
  }

  /// Get total expenses by category
  static double getTotalExpensesByCategory(
    List<FarmExpense> expenses, 
    ExpenseCategory category
  ) {
    return expenses
        .where((expense) => expense.category == category)
        .fold(0.0, (sum, expense) => sum + expense.amount);
  }

  /// Get monthly expenses
  static Map<int, double> getMonthlyExpenses(
    List<FarmExpense> expenses, 
    int year
  ) {
    final monthlyExpenses = <int, double>{};
    
    for (int month = 1; month <= 12; month++) {
      monthlyExpenses[month] = expenses
          .where((expense) => 
              expense.date.year == year && 
              expense.date.month == month)
          .fold(0.0, (sum, expense) => sum + expense.amount);
    }
    
    return monthlyExpenses;
  }

  /// Get crop-wise expenses
  static Map<String, double> getCropWiseExpenses(
    List<FarmExpense> expenses,
    List<CropField> cropFields
  ) {
    final cropWiseExpenses = <String, double>{};
    
    for (final field in cropFields) {
      final fieldExpenses = expenses
          .where((expense) => expense.relatedCropFieldId == field.id)
          .fold(0.0, (sum, expense) => sum + expense.amount);
      
      cropWiseExpenses[field.cropName] = 
          (cropWiseExpenses[field.cropName] ?? 0.0) + fieldExpenses;
    }
    
    return cropWiseExpenses;
  }

  /// Calculate cost per hectare
  static double getCostPerHectare(
    List<FarmExpense> expenses,
    double totalArea
  ) {
    final totalExpenses = expenses
        .fold(0.0, (sum, expense) => sum + expense.amount);
    return totalArea > 0 ? totalExpenses / totalArea : 0.0;
  }

  /// Get expense trends
  static List<ExpenseTrend> getExpenseTrends(
    List<FarmExpense> expenses,
    int months
  ) {
    final trends = <ExpenseTrend>[];
    final now = DateTime.now();
    
    for (int i = months - 1; i >= 0; i--) {
      final targetDate = DateTime(now.year, now.month - i, 1);
      final monthExpenses = expenses
          .where((expense) => 
              expense.date.year == targetDate.year &&
              expense.date.month == targetDate.month)
          .fold(0.0, (sum, expense) => sum + expense.amount);
      
      trends.add(ExpenseTrend(
        month: targetDate,
        amount: monthExpenses,
      ));
    }
    
    return trends;
  }

  /// Calculate ROI for a crop
  static double calculateCropROI(
    List<FarmExpense> expenses,
    List<FarmIncome> incomes,
    String cropFieldId
  ) {
    final totalExpenses = expenses
        .where((expense) => expense.relatedCropFieldId == cropFieldId)
        .fold(0.0, (sum, expense) => sum + expense.amount);
    
    final totalIncome = incomes
        .where((income) => income.relatedCropFieldId == cropFieldId)
        .fold(0.0, (sum, income) => sum + income.amount);
    
    return totalExpenses > 0 ? 
        ((totalIncome - totalExpenses) / totalExpenses) * 100 : 0.0;
  }
}

/// Financial Planning and Budgeting Service
class FinancialPlanningService {
  /// Create seasonal budget plan
  static SeasonalBudget createSeasonalBudget({
    required CropSeason season,
    required List<CropField> cropFields,
    required List<FarmInstrument> instruments,
    required List<LivestockRecord> livestock,
  }) {
    double totalBudget = 0.0;
    final categoryBudgets = <ExpenseCategory, double>{};

    // Calculate crop-wise budgets
    for (final field in cropFields) {
      if (field.season == season) {
        // Seed cost
        final seedCost = _calculateSeedCost(field);
        categoryBudgets[ExpenseCategory.seeds] = 
            (categoryBudgets[ExpenseCategory.seeds] ?? 0.0) + seedCost;

        // Fertilizer cost
        final fertilizerCost = _calculateFertilizerCost(field);
        categoryBudgets[ExpenseCategory.fertilizers] = 
            (categoryBudgets[ExpenseCategory.fertilizers] ?? 0.0) + fertilizerCost;

        // Pesticide cost
        final pesticideCost = _calculatePesticideCost(field);
        categoryBudgets[ExpenseCategory.pesticides] = 
            (categoryBudgets[ExpenseCategory.pesticides] ?? 0.0) + pesticideCost;

        // Labor cost
        final laborCost = _calculateLaborCost(field);
        categoryBudgets[ExpenseCategory.labor] = 
            (categoryBudgets[ExpenseCategory.labor] ?? 0.0) + laborCost;

        // Irrigation cost
        final irrigationCost = _calculateIrrigationCost(field);
        categoryBudgets[ExpenseCategory.irrigation] = 
            (categoryBudgets[ExpenseCategory.irrigation] ?? 0.0) + irrigationCost;
      }
    }

    // Machinery maintenance cost
    final maintenanceCost = _calculateMaintenanceCost(instruments);
    categoryBudgets[ExpenseCategory.machineryMaintenance] = maintenanceCost;

    // Livestock cost
    final livestockCost = _calculateLivestockCost(livestock);
    categoryBudgets[ExpenseCategory.livestock] = livestockCost;

    // Calculate total budget
    totalBudget = categoryBudgets.values.fold(0.0, (sum, cost) => sum + cost);

    return SeasonalBudget(
      season: season,
      totalBudget: totalBudget,
      categoryBudgets: categoryBudgets,
      createdDate: DateTime.now(),
      lastUpdated: DateTime.now(),
    );
  }

  /// Calculate expected revenue
  static double calculateExpectedRevenue(
    List<CropField> cropFields,
    CropSeason season
  ) {
    double totalRevenue = 0.0;

    for (final field in cropFields) {
      if (field.season == season) {
        // Get crop market rate (this would come from market data API)
        final marketRate = _getMarketRate(field.cropName);
        final expectedYield = field.areaInHectares * field.expectedYield;
        totalRevenue += expectedYield * marketRate;
      }
    }

    return totalRevenue;
  }

  /// Generate financial report
  static FinancialReport generateFinancialReport(
    FarmProfile farm,
    DateTime startDate,
    DateTime endDate
  ) {
    final expenses = farm.expenses
        .where((expense) => 
            expense.date.isAfter(startDate) && 
            expense.date.isBefore(endDate))
        .toList();

    final incomes = farm.incomes
        .where((income) => 
            income.date.isAfter(startDate) && 
            income.date.isBefore(endDate))
        .toList();

    final totalExpenses = expenses
        .fold(0.0, (sum, expense) => sum + expense.amount);

    final totalIncome = incomes
        .fold(0.0, (sum, income) => sum + income.amount);

    final netProfit = totalIncome - totalExpenses;
    final profitMargin = totalIncome > 0 ? (netProfit / totalIncome) * 100 : 0.0;

    return FinancialReport(
      farmId: farm.id,
      reportPeriod: DateRange(start: startDate, end: endDate),
      totalIncome: totalIncome,
      totalExpenses: totalExpenses,
      netProfit: netProfit,
      profitMargin: profitMargin,
      categoryWiseExpenses: _getCategoryWiseExpenses(expenses),
      cropWiseRevenue: _getCropWiseRevenue(incomes, farm.cropFields),
      generatedDate: DateTime.now(),
    );
  }

  /// Helper methods for cost calculations
  static double _calculateSeedCost(CropField field) {
    // This would be based on crop type, area, and current seed prices
    final seedRatePerHectare = _getSeedRate(field.cropName);
    final seedPrice = _getSeedPrice(field.cropName);
    return field.areaInHectares * seedRatePerHectare * seedPrice;
  }

  static double _calculateFertilizerCost(CropField field) {
    // Based on soil test recommendations and current fertilizer prices
    return field.areaInHectares * 3000; // Estimated ₹3000 per hectare
  }

  static double _calculatePesticideCost(CropField field) {
    // Based on crop type and pest/disease pressure
    return field.areaInHectares * 1500; // Estimated ₹1500 per hectare
  }

  static double _calculateLaborCost(CropField field) {
    // Based on crop type and local labor rates
    return field.areaInHectares * 8000; // Estimated ₹8000 per hectare
  }

  static double _calculateIrrigationCost(CropField field) {
    // Based on irrigation method and water source
    return field.areaInHectares * 2000; // Estimated ₹2000 per hectare
  }

  static double _calculateMaintenanceCost(List<FarmInstrument> instruments) {
    return instruments.fold(0.0, (sum, instrument) => 
        sum + (instrument.maintenance?.estimatedCost ?? 0.0));
  }

  static double _calculateLivestockCost(List<LivestockRecord> livestock) {
    return livestock.fold(0.0, (sum, animal) => 
        sum + (animal.monthlyFeedCost * 12));
  }

  static double _getSeedRate(String cropName) {
    // Seed rate per hectare in kg
    switch (cropName.toLowerCase()) {
      case 'wheat': return 100.0;
      case 'rice': return 25.0;
      case 'maize': return 20.0;
      case 'cotton': return 1.5;
      default: return 50.0;
    }
  }

  static double _getSeedPrice(String cropName) {
    // Price per kg
    switch (cropName.toLowerCase()) {
      case 'wheat': return 45.0;
      case 'rice': return 80.0;
      case 'maize': return 60.0;
      case 'cotton': return 5000.0;
      default: return 100.0;
    }
  }

  static double _getMarketRate(String cropName) {
    // Current market rate per quintal
    switch (cropName.toLowerCase()) {
      case 'wheat': return 2200.0;
      case 'rice': return 2800.0;
      case 'maize': return 1900.0;
      case 'cotton': return 6000.0;
      default: return 2000.0;
    }
  }

  static Map<ExpenseCategory, double> _getCategoryWiseExpenses(
    List<FarmExpense> expenses
  ) {
    final categoryExpenses = <ExpenseCategory, double>{};
    
    for (final expense in expenses) {
      categoryExpenses[expense.category] = 
          (categoryExpenses[expense.category] ?? 0.0) + expense.amount;
    }
    
    return categoryExpenses;
  }

  static Map<String, double> _getCropWiseRevenue(
    List<FarmIncome> incomes,
    List<CropField> cropFields
  ) {
    final cropRevenue = <String, double>{};
    
    for (final income in incomes) {
      if (income.relatedCropFieldId != null) {
        final cropField = cropFields
            .firstWhere((field) => field.id == income.relatedCropFieldId);
        cropRevenue[cropField.cropName] = 
            (cropRevenue[cropField.cropName] ?? 0.0) + income.amount;
      }
    }
    
    return cropRevenue;
  }
}

/// Loan and Credit Management Service
class LoanManagementService {
  /// Calculate loan eligibility
  static LoanEligibility calculateLoanEligibility(
    FarmProfile farm,
    double requestedAmount
  ) {
    final annualIncome = _calculateAnnualIncome(farm);
    final existingLoans = farm.loans
        .where((loan) => loan.status == LoanStatus.active)
        .toList();
    
    final totalExistingEMI = existingLoans
        .fold(0.0, (sum, loan) => sum + loan.emiAmount);
    
    final maxEligibleAmount = annualIncome * 0.4; // 40% of annual income
    final availableAmount = maxEligibleAmount - (totalExistingEMI * 12);
    
    final isEligible = requestedAmount <= availableAmount && 
                      farm.totalLandArea >= 0.5; // Minimum 0.5 hectare
    
    return LoanEligibility(
      isEligible: isEligible,
      maxEligibleAmount: maxEligibleAmount,
      availableAmount: availableAmount,
      annualIncome: annualIncome,
      existingEMI: totalExistingEMI,
      reason: isEligible 
          ? 'Eligible for loan'
          : 'Requested amount exceeds eligibility or insufficient land area',
    );
  }

  /// Calculate EMI
  static double calculateEMI(
    double principal,
    double rateOfInterest,
    int tenureInMonths
  ) {
    final monthlyRate = rateOfInterest / (12 * 100);
    final emi = (principal * monthlyRate * 
                 pow(1 + monthlyRate, tenureInMonths)) /
                (pow(1 + monthlyRate, tenureInMonths) - 1);
    return emi;
  }

  static double _calculateAnnualIncome(FarmProfile farm) {
    final lastYearIncomes = farm.incomes
        .where((income) => 
            income.date.isAfter(DateTime.now().subtract(Duration(days: 365))))
        .fold(0.0, (sum, income) => sum + income.amount);
    
    return lastYearIncomes;
  }
}

/// Data classes for financial tracking
class ExpenseTrend {
  final DateTime month;
  final double amount;

  const ExpenseTrend({
    required this.month,
    required this.amount,
  });
}

class SeasonalBudget {
  final CropSeason season;
  final double totalBudget;
  final Map<ExpenseCategory, double> categoryBudgets;
  final DateTime createdDate;
  final DateTime lastUpdated;

  const SeasonalBudget({
    required this.season,
    required this.totalBudget,
    required this.categoryBudgets,
    required this.createdDate,
    required this.lastUpdated,
  });
}

class FinancialReport {
  final String farmId;
  final DateRange reportPeriod;
  final double totalIncome;
  final double totalExpenses;
  final double netProfit;
  final double profitMargin;
  final Map<ExpenseCategory, double> categoryWiseExpenses;
  final Map<String, double> cropWiseRevenue;
  final DateTime generatedDate;

  const FinancialReport({
    required this.farmId,
    required this.reportPeriod,
    required this.totalIncome,
    required this.totalExpenses,
    required this.netProfit,
    required this.profitMargin,
    required this.categoryWiseExpenses,
    required this.cropWiseRevenue,
    required this.generatedDate,
  });
}

class DateRange {
  final DateTime start;
  final DateTime end;

  const DateRange({
    required this.start,
    required this.end,
  });
}

class LoanEligibility {
  final bool isEligible;
  final double maxEligibleAmount;
  final double availableAmount;
  final double annualIncome;
  final double existingEMI;
  final String reason;

  const LoanEligibility({
    required this.isEligible,
    required this.maxEligibleAmount,
    required this.availableAmount,
    required this.annualIncome,
    required this.existingEMI,
    required this.reason,
  });
}

/// Providers
final farmExpenseServiceProvider = Provider<FarmExpenseService>((ref) {
  return FarmExpenseService();
});

final financialPlanningServiceProvider = Provider<FinancialPlanningService>((ref) {
  return FinancialPlanningService();
});

final loanManagementServiceProvider = Provider<LoanManagementService>((ref) {
  return LoanManagementService();
});

// Helper function for power calculation
double pow(double base, int exponent) {
  if (exponent == 0) return 1.0;
  double result = 1.0;
  for (int i = 0; i < exponent; i++) {
    result *= base;
  }
  return result;
}
