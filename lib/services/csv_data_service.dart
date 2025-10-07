import 'dart:convert';
import 'package:flutter/services.dart';

/// Service to load and parse CSV research data for crop planning
class CsvDataService {
  static final CsvDataService _instance = CsvDataService._internal();
  factory CsvDataService() => _instance;
  CsvDataService._internal();

  // Cached data
  List<Map<String, dynamic>>? _soilData;
  List<Map<String, dynamic>>? _cropCalendarData;
  List<Map<String, dynamic>>? _inputCostsData;
  Map<String, dynamic>? _regionalConfig;

  /// Load soil data from CSV
  Future<List<Map<String, dynamic>>> loadSoilData() async {
    if (_soilData != null) return _soilData!;

    final csvString = await rootBundle.loadString('CSV Data/soil_data_by_region.csv');
    _soilData = _parseCsv(csvString);
    return _soilData!;
  }

  /// Load crop calendar data from CSV
  Future<List<Map<String, dynamic>>> loadCropCalendarData() async {
    if (_cropCalendarData != null) return _cropCalendarData!;

    final csvString = await rootBundle.loadString('CSV Data/regional_crop_calendar.csv');
    _cropCalendarData = _parseCsv(csvString);
    return _cropCalendarData!;
  }

  /// Load input costs data from CSV
  Future<List<Map<String, dynamic>>> loadInputCostsData() async {
    if (_inputCostsData != null) return _inputCostsData!;

    final csvString = await rootBundle.loadString('CSV Data/input_costs_regional.csv');
    _inputCostsData = _parseCsv(csvString);
    return _inputCostsData!;
  }

  /// Load regional configuration from JSON
  Future<Map<String, dynamic>> loadRegionalConfig() async {
    if (_regionalConfig != null) return _regionalConfig!;

    final jsonString = await rootBundle.loadString('CSV Data/regional_configuration.json');
    _regionalConfig = jsonDecode(jsonString) as Map<String, dynamic>;
    return _regionalConfig!;
  }

  /// Parse CSV string into list of maps
  List<Map<String, dynamic>> _parseCsv(String csvString) {
    final lines = csvString.split('\n');
    if (lines.isEmpty) return [];

    final headers = lines[0].split(',').map((h) => h.trim()).toList();
    final data = <Map<String, dynamic>>[];

    for (int i = 1; i < lines.length; i++) {
      if (lines[i].trim().isEmpty) continue;

      final values = lines[i].split(',');
      if (values.length != headers.length) continue;

      final row = <String, dynamic>{};
      for (int j = 0; j < headers.length; j++) {
        row[headers[j]] = values[j].trim();
      }
      data.add(row);
    }

    return data;
  }

  /// Get soil data by region
  Future<Map<String, dynamic>?> getSoilDataByRegion(String state, String? district) async {
    final data = await loadSoilData();
    return data.firstWhere(
      (item) => item['state']?.toLowerCase() == state.toLowerCase(),
      orElse: () => <String, dynamic>{},
    );
  }

  /// Get crop calendar for a specific crop and region
  Future<List<Map<String, dynamic>>> getCropCalendarForRegion(String state, String? cropId) async {
    final data = await loadCropCalendarData();
    return data.where((item) => item['state']?.toLowerCase() == state.toLowerCase()).toList();
  }

  /// Get input costs for a region
  Future<Map<String, dynamic>> getInputCostsByRegion(String state) async {
    final data = await loadInputCostsData();
    final costs = <String, dynamic>{};
    
    for (final item in data) {
      final inputType = item['input_type'] ?? '';
      final inputName = item['input_name'] ?? '';
      final costPerUnit = double.tryParse(item['cost_per_unit'] ?? '0') ?? 0.0;
      final unitType = item['unit_type'] ?? '';
      
      if (!costs.containsKey(inputType)) {
        costs[inputType] = <Map<String, dynamic>>[];
      }
      (costs[inputType] as List).add({
        'name': inputName,
        'cost': costPerUnit,
        'unit': unitType,
        'availability': item['availability_status'],
        'supplier': item['supplier_contact'],
      });
    }
    
    return costs;
  }

  /// Clear cached data
  void clearCache() {
    _soilData = null;
    _cropCalendarData = null;
    _inputCostsData = null;
    _regionalConfig = null;
  }
}
