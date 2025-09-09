import 'package:flutter/material.dart';

// Enums for different categories
enum TransactionType { income, expense }
enum CropType { wheat, rice, corn, cotton, sugarcane, potato, tomato, onion, other }
enum ExpenseCategory { 
  seeds, 
  fertilizer, 
  pesticide, 
  labor, 
  equipment, 
  irrigation, 
  transport, 
  storage, 
  marketing,
  fuel,
  other 
}
enum IncomeCategory { 
  cropSale, 
  livestockSale, 
  equipmentRental, 
  subsidy, 
  other 
}

// Main Transaction Model
class Transaction {
  final String id;
  final TransactionType type;
  final double amount;
  final String description;
  final DateTime date;
  final String? cropId;
  final ExpenseCategory? expenseCategory;
  final IncomeCategory? incomeCategory;
  final String? notes;
  final List<String>? attachments;

  Transaction({
    required this.id,
    required this.type,
    required this.amount,
    required this.description,
    required this.date,
    this.cropId,
    this.expenseCategory,
    this.incomeCategory,
    this.notes,
    this.attachments,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type': type.name,
      'amount': amount,
      'description': description,
      'date': date.millisecondsSinceEpoch,
      'cropId': cropId,
      'expenseCategory': expenseCategory?.name,
      'incomeCategory': incomeCategory?.name,
      'notes': notes,
      'attachments': attachments,
    };
  }

  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
      id: json['id'],
      type: TransactionType.values.firstWhere((e) => e.name == json['type']),
      amount: json['amount'].toDouble(),
      description: json['description'],
      date: DateTime.fromMillisecondsSinceEpoch(json['date']),
      cropId: json['cropId'],
      expenseCategory: json['expenseCategory'] != null 
          ? ExpenseCategory.values.firstWhere((e) => e.name == json['expenseCategory'])
          : null,
      incomeCategory: json['incomeCategory'] != null 
          ? IncomeCategory.values.firstWhere((e) => e.name == json['incomeCategory'])
          : null,
      notes: json['notes'],
      attachments: json['attachments']?.cast<String>(),
    );
  }
}

// Crop Model for tracking crop-specific data
class Crop {
  final String id;
  final String name;
  final CropType type;
  final double areaInAcres;
  final DateTime plantingDate;
  final DateTime? harvestDate;
  final String variety;
  final double? expectedYield;
  final double? actualYield;
  final String? notes;
  final List<String>? photos;

  Crop({
    required this.id,
    required this.name,
    required this.type,
    required this.areaInAcres,
    required this.plantingDate,
    this.harvestDate,
    required this.variety,
    this.expectedYield,
    this.actualYield,
    this.notes,
    this.photos,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'type': type.name,
      'areaInAcres': areaInAcres,
      'plantingDate': plantingDate.millisecondsSinceEpoch,
      'harvestDate': harvestDate?.millisecondsSinceEpoch,
      'variety': variety,
      'expectedYield': expectedYield,
      'actualYield': actualYield,
      'notes': notes,
      'photos': photos,
    };
  }

  factory Crop.fromJson(Map<String, dynamic> json) {
    return Crop(
      id: json['id'],
      name: json['name'],
      type: CropType.values.firstWhere((e) => e.name == json['type']),
      areaInAcres: json['areaInAcres'].toDouble(),
      plantingDate: DateTime.fromMillisecondsSinceEpoch(json['plantingDate']),
      harvestDate: json['harvestDate'] != null 
          ? DateTime.fromMillisecondsSinceEpoch(json['harvestDate'])
          : null,
      variety: json['variety'],
      expectedYield: json['expectedYield']?.toDouble(),
      actualYield: json['actualYield']?.toDouble(),
      notes: json['notes'],
      photos: json['photos']?.cast<String>(),
    );
  }
}

// Budget Model for planning
class Budget {
  final String id;
  final String name;
  final String? cropId;
  final double plannedExpense;
  final double actualExpense;
  final double plannedIncome;
  final double actualIncome;
  final DateTime startDate;
  final DateTime endDate;
  final String? notes;

  Budget({
    required this.id,
    required this.name,
    this.cropId,
    required this.plannedExpense,
    required this.actualExpense,
    required this.plannedIncome,
    required this.actualIncome,
    required this.startDate,
    required this.endDate,
    this.notes,
  });

  double get plannedProfit => plannedIncome - plannedExpense;
  double get actualProfit => actualIncome - actualExpense;
  double get profitVariance => actualProfit - plannedProfit;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'cropId': cropId,
      'plannedExpense': plannedExpense,
      'actualExpense': actualExpense,
      'plannedIncome': plannedIncome,
      'actualIncome': actualIncome,
      'startDate': startDate.millisecondsSinceEpoch,
      'endDate': endDate.millisecondsSinceEpoch,
      'notes': notes,
    };
  }

  factory Budget.fromJson(Map<String, dynamic> json) {
    return Budget(
      id: json['id'],
      name: json['name'],
      cropId: json['cropId'],
      plannedExpense: json['plannedExpense'].toDouble(),
      actualExpense: json['actualExpense'].toDouble(),
      plannedIncome: json['plannedIncome'].toDouble(),
      actualIncome: json['actualIncome'].toDouble(),
      startDate: DateTime.fromMillisecondsSinceEpoch(json['startDate']),
      endDate: DateTime.fromMillisecondsSinceEpoch(json['endDate']),
      notes: json['notes'],
    );
  }
}

// Financial Summary Model
class FinancialSummary {
  final double totalIncome;
  final double totalExpense;
  final double netProfit;
  final Map<String, double> expensesByCategory;
  final Map<String, double> incomeByCategory;
  final Map<String, double> profitByCrop;
  final DateTime periodStart;
  final DateTime periodEnd;

  FinancialSummary({
    required this.totalIncome,
    required this.totalExpense,
    required this.netProfit,
    required this.expensesByCategory,
    required this.incomeByCategory,
    required this.profitByCrop,
    required this.periodStart,
    required this.periodEnd,
  });
}

// Crop Tips Model
class CropTip {
  final String id;
  final CropType cropType;
  final String title;
  final String description;
  final String category; // irrigation, fertilization, pest_control, etc.
  final String season;
  final int priority; // 1-5, 5 being highest
  final List<String>? relatedImages;
  final String? videoUrl;

  CropTip({
    required this.id,
    required this.cropType,
    required this.title,
    required this.description,
    required this.category,
    required this.season,
    required this.priority,
    this.relatedImages,
    this.videoUrl,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'cropType': cropType.name,
      'title': title,
      'description': description,
      'category': category,
      'season': season,
      'priority': priority,
      'relatedImages': relatedImages,
      'videoUrl': videoUrl,
    };
  }

  factory CropTip.fromJson(Map<String, dynamic> json) {
    return CropTip(
      id: json['id'],
      cropType: CropType.values.firstWhere((e) => e.name == json['cropType']),
      title: json['title'],
      description: json['description'],
      category: json['category'],
      season: json['season'],
      priority: json['priority'],
      relatedImages: json['relatedImages']?.cast<String>(),
      videoUrl: json['videoUrl'],
    );
  }
}

// Performance Metrics Model
class CropPerformance {
  final String cropId;
  final double yieldPerAcre;
  final double profitPerAcre;
  final double costPerKg;
  final double revenuePerKg;
  final double efficiency; // percentage
  final List<String> improvements;
  final List<String> challenges;

  CropPerformance({
    required this.cropId,
    required this.yieldPerAcre,
    required this.profitPerAcre,
    required this.costPerKg,
    required this.revenuePerKg,
    required this.efficiency,
    required this.improvements,
    required this.challenges,
  });
}