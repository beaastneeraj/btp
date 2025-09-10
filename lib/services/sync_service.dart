import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'firebase_service.dart';
import 'database_service.dart';
import '../models/khatabook_models.dart';

class SyncService {
  static final SyncService _instance = SyncService._internal();
  factory SyncService() => _instance;
  SyncService._internal();

  final FirebaseService _firebaseService = FirebaseService();
  final DatabaseService _databaseService = DatabaseService();
  final Connectivity _connectivity = Connectivity();

  bool _isSyncing = false;
  Timer? _autoSyncTimer;
  final StreamController<SyncStatus> _syncStatusController = StreamController<SyncStatus>.broadcast();

  // Sync status stream
  Stream<SyncStatus> get syncStatusStream => _syncStatusController.stream;
  bool get isSyncing => _isSyncing;

  // Start automatic sync every 30 minutes
  void startAutoSync() {
    _autoSyncTimer?.cancel();
    _autoSyncTimer = Timer.periodic(const Duration(minutes: 30), (_) {
      syncAll();
    });
  }

  // Stop automatic sync
  void stopAutoSync() {
    _autoSyncTimer?.cancel();
  }

  // Check internet connectivity
  Future<bool> hasInternetConnection() async {
    final connectivityResult = await _connectivity.checkConnectivity();
    return connectivityResult != ConnectivityResult.none;
  }

  // Sync all data (transactions, crops, fields)
  Future<SyncResult> syncAll() async {
    if (_isSyncing) {
      return SyncResult(
        success: false,
        message: 'Sync already in progress',
        transactionsSynced: 0,
        cropsSynced: 0,
        fieldsSynced: 0,
      );
    }

    if (!await hasInternetConnection()) {
      return SyncResult(
        success: false,
        message: 'No internet connection',
        transactionsSynced: 0,
        cropsSynced: 0,
        fieldsSynced: 0,
      );
    }

    _isSyncing = true;
    _syncStatusController.add(SyncStatus.syncing);

    try {
      int transactionsSynced = 0;
      int cropsSynced = 0;
      int fieldsSynced = 0;

      // Sync transactions
      final transactionResult = await _syncTransactions();
      transactionsSynced = transactionResult;

      // Sync crops
      final cropResult = await _syncCrops();
      cropsSynced = cropResult;

      // Sync fields
      final fieldResult = await _syncFields();
      fieldsSynced = fieldResult;

      // Download data from Firebase
      await _downloadFromFirebase();

      _syncStatusController.add(SyncStatus.completed);
      
      return SyncResult(
        success: true,
        message: 'Sync completed successfully',
        transactionsSynced: transactionsSynced,
        cropsSynced: cropsSynced,
        fieldsSynced: fieldsSynced,
      );
    } catch (e) {
      _syncStatusController.add(SyncStatus.failed);
      
      return SyncResult(
        success: false,
        message: 'Sync failed: $e',
        transactionsSynced: 0,
        cropsSynced: 0,
        fieldsSynced: 0,
      );
    } finally {
      _isSyncing = false;
    }
  }

  // Sync transactions to Firebase
  Future<int> _syncTransactions() async {
    try {
      final unsyncedData = await _databaseService.getUnsyncedTransactions();
      int synced = 0;

      for (final data in unsyncedData) {
        try {
          final transaction = Transaction(
            id: data['id'],
            type: TransactionType.values.firstWhere((e) => e.name == data['type']),
            amount: (data['amount'] as num).toDouble(),
            description: data['description'],
            date: DateTime.fromMillisecondsSinceEpoch(data['date']),
            cropId: data['cropId'],
            expenseCategory: data['expenseCategory'] != null 
                ? ExpenseCategory.values.firstWhere((e) => e.name == data['expenseCategory'])
                : null,
            incomeCategory: data['incomeCategory'] != null 
                ? IncomeCategory.values.firstWhere((e) => e.name == data['incomeCategory'])
                : null,
            notes: data['notes'],
            attachments: data['attachments']?.split(',').where((s) => s.isNotEmpty).toList(),
          );

          await _firebaseService.addTransaction(transaction);
          await _databaseService.markAsSynced('transactions', data['id']);
          synced++;
        } catch (e) {
          print('Failed to sync transaction ${data['id']}: $e');
        }
      }

      return synced;
    } catch (e) {
      print('Error syncing transactions: $e');
      return 0;
    }
  }

  // Sync crops to Firebase
  Future<int> _syncCrops() async {
    try {
      final unsyncedData = await _databaseService.getUnsyncedCrops();
      int synced = 0;

      for (final data in unsyncedData) {
        try {
          final crop = Crop(
            id: data['id'],
            name: data['name'],
            type: CropType.values.firstWhere((e) => e.name == data['type']),
            areaInAcres: (data['areaInAcres'] as num).toDouble(),
            plantingDate: DateTime.fromMillisecondsSinceEpoch(data['plantingDate']),
            harvestDate: data['harvestDate'] != null 
                ? DateTime.fromMillisecondsSinceEpoch(data['harvestDate'])
                : null,
            variety: data['variety'],
            expectedYield: data['expectedYield']?.toDouble(),
            actualYield: data['actualYield']?.toDouble(),
            notes: data['notes'],
            photos: data['photos']?.split(',').where((s) => s.isNotEmpty).toList(),
          );

          await _firebaseService.addCrop(crop);
          await _databaseService.markAsSynced('crops', data['id']);
          synced++;
        } catch (e) {
          print('Failed to sync crop ${data['id']}: $e');
        }
      }

      return synced;
    } catch (e) {
      print('Error syncing crops: $e');
      return 0;
    }
  }

  // Sync fields to Firebase
  Future<int> _syncFields() async {
    try {
      final unsyncedData = await _databaseService.getUnsyncedFields();
      int synced = 0;

      for (final data in unsyncedData) {
        try {
          final field = Field(
            id: data['id'],
            name: data['name'],
            areaInAcres: (data['areaInAcres'] as num).toDouble(),
            location: data['location'],
            soilType: data['soilType'],
            currentCrop: data['currentCrop'],
            notes: data['notes'],
            photos: data['photos']?.split(',').where((s) => s.isNotEmpty).toList(),
          );

          await _firebaseService.addField(field);
          await _databaseService.markAsSynced('fields', data['id']);
          synced++;
        } catch (e) {
          print('Failed to sync field ${data['id']}: $e');
        }
      }

      return synced;
    } catch (e) {
      print('Error syncing fields: $e');
      return 0;
    }
  }

  // Download data from Firebase and store locally
  Future<void> _downloadFromFirebase() async {
    try {
      // Note: This would require implementing a way to identify and download
      // only new/updated records from Firebase to avoid duplicates
      // For now, we'll skip this to avoid data duplication
      
      // TODO: Implement incremental download with proper conflict resolution
      print('Download from Firebase - Not implemented yet to avoid duplicates');
    } catch (e) {
      print('Error downloading from Firebase: $e');
    }
  }

  // Sync specific transaction
  Future<bool> syncTransaction(String transactionId) async {
    if (!await hasInternetConnection()) return false;

    try {
      final transaction = await _databaseService.getAllTransactions();
      final targetTransaction = transaction.firstWhere((t) => t.id == transactionId);
      
      await _firebaseService.addTransaction(targetTransaction);
      await _databaseService.markAsSynced('transactions', transactionId);
      
      return true;
    } catch (e) {
      print('Failed to sync transaction $transactionId: $e');
      return false;
    }
  }

  // Sync specific crop
  Future<bool> syncCrop(String cropId) async {
    if (!await hasInternetConnection()) return false;

    try {
      final crop = await _databaseService.getCropById(cropId);
      if (crop != null) {
        await _firebaseService.addCrop(crop);
        await _databaseService.markAsSynced('crops', cropId);
        return true;
      }
      return false;
    } catch (e) {
      print('Failed to sync crop $cropId: $e');
      return false;
    }
  }

  // Force sync all data (re-upload everything)
  Future<SyncResult> forceSyncAll() async {
    if (!await hasInternetConnection()) {
      return SyncResult(
        success: false,
        message: 'No internet connection',
        transactionsSynced: 0,
        cropsSynced: 0,
        fieldsSynced: 0,
      );
    }

    _isSyncing = true;
    _syncStatusController.add(SyncStatus.syncing);

    try {
      // Get all local data
      final transactions = await _databaseService.getAllTransactions();
      final crops = await _databaseService.getAllCrops();
      final fields = await _databaseService.getAllFields();

      // Upload to Firebase
      await _firebaseService.syncLocalToFirebase(transactions, crops, fields);

      _syncStatusController.add(SyncStatus.completed);
      
      return SyncResult(
        success: true,
        message: 'Force sync completed successfully',
        transactionsSynced: transactions.length,
        cropsSynced: crops.length,
        fieldsSynced: fields.length,
      );
    } catch (e) {
      _syncStatusController.add(SyncStatus.failed);
      
      return SyncResult(
        success: false,
        message: 'Force sync failed: $e',
        transactionsSynced: 0,
        cropsSynced: 0,
        fieldsSynced: 0,
      );
    } finally {
      _isSyncing = false;
    }
  }

  // Get sync statistics
  Future<SyncStats> getSyncStats() async {
    try {
      final unsyncedTransactions = await _databaseService.getUnsyncedTransactions();
      final unsyncedCrops = await _databaseService.getUnsyncedCrops();
      final unsyncedFields = await _databaseService.getUnsyncedFields();

      final totalTransactions = await _databaseService.getAllTransactions();
      final totalCrops = await _databaseService.getAllCrops();
      final totalFields = await _databaseService.getAllFields();

      return SyncStats(
        unsyncedTransactions: unsyncedTransactions.length,
        unsyncedCrops: unsyncedCrops.length,
        unsyncedFields: unsyncedFields.length,
        totalTransactions: totalTransactions.length,
        totalCrops: totalCrops.length,
        totalFields: totalFields.length,
        lastSyncTime: DateTime.now(), // TODO: Store actual last sync time
        hasInternetConnection: await hasInternetConnection(),
      );
    } catch (e) {
      return SyncStats(
        unsyncedTransactions: 0,
        unsyncedCrops: 0,
        unsyncedFields: 0,
        totalTransactions: 0,
        totalCrops: 0,
        totalFields: 0,
        lastSyncTime: null,
        hasInternetConnection: false,
      );
    }
  }

  // Clear sync service resources
  void dispose() {
    _autoSyncTimer?.cancel();
    _syncStatusController.close();
  }
}

// Sync status enum
enum SyncStatus { idle, syncing, completed, failed }

// Sync result class
class SyncResult {
  final bool success;
  final String message;
  final int transactionsSynced;
  final int cropsSynced;
  final int fieldsSynced;

  SyncResult({
    required this.success,
    required this.message,
    required this.transactionsSynced,
    required this.cropsSynced,
    required this.fieldsSynced,
  });

  @override
  String toString() {
    return 'SyncResult(success: $success, message: $message, '
           'transactions: $transactionsSynced, crops: $cropsSynced, fields: $fieldsSynced)';
  }
}

// Sync statistics class
class SyncStats {
  final int unsyncedTransactions;
  final int unsyncedCrops;
  final int unsyncedFields;
  final int totalTransactions;
  final int totalCrops;
  final int totalFields;
  final DateTime? lastSyncTime;
  final bool hasInternetConnection;

  SyncStats({
    required this.unsyncedTransactions,
    required this.unsyncedCrops,
    required this.unsyncedFields,
    required this.totalTransactions,
    required this.totalCrops,
    required this.totalFields,
    required this.lastSyncTime,
    required this.hasInternetConnection,
  });

  double get syncProgress {
    final totalItems = totalTransactions + totalCrops + totalFields;
    if (totalItems == 0) return 1.0;
    
    final syncedItems = totalItems - (unsyncedTransactions + unsyncedCrops + unsyncedFields);
    return syncedItems / totalItems;
  }

  bool get isFullySynced => 
      unsyncedTransactions == 0 && unsyncedCrops == 0 && unsyncedFields == 0;
}
