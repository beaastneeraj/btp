import 'dart:io';
import 'package:sqflite/sqflite.dart' hide Transaction;
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import '../models/khatabook_models.dart';

class DatabaseService {
  static final DatabaseService _instance = DatabaseService._internal();
  factory DatabaseService() => _instance;
  DatabaseService._internal();

  Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'khatabook.db');
    
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
      onUpgrade: _onUpgrade,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    // Create transactions table
    await db.execute('''
      CREATE TABLE transactions (
        id TEXT PRIMARY KEY,
        type TEXT NOT NULL,
        amount REAL NOT NULL,
        description TEXT NOT NULL,
        date INTEGER NOT NULL,
        cropId TEXT,
        expenseCategory TEXT,
        incomeCategory TEXT,
        notes TEXT,
        attachments TEXT,
        synced INTEGER DEFAULT 0,
        createdAt INTEGER NOT NULL,
        updatedAt INTEGER NOT NULL
      )
    ''');

    // Create crops table
    await db.execute('''
      CREATE TABLE crops (
        id TEXT PRIMARY KEY,
        name TEXT NOT NULL,
        type TEXT NOT NULL,
        areaInAcres REAL NOT NULL,
        plantingDate INTEGER NOT NULL,
        harvestDate INTEGER,
        variety TEXT NOT NULL,
        expectedYield REAL,
        actualYield REAL,
        notes TEXT,
        photos TEXT,
        synced INTEGER DEFAULT 0,
        createdAt INTEGER NOT NULL,
        updatedAt INTEGER NOT NULL
      )
    ''');

    // Create fields table
    await db.execute('''
      CREATE TABLE fields (
        id TEXT PRIMARY KEY,
        name TEXT NOT NULL,
        areaInAcres REAL NOT NULL,
        location TEXT NOT NULL,
        soilType TEXT NOT NULL,
        currentCrop TEXT,
        notes TEXT,
        photos TEXT,
        synced INTEGER DEFAULT 0,
        createdAt INTEGER NOT NULL,
        updatedAt INTEGER NOT NULL
      )
    ''');

    // Create budgets table
    await db.execute('''
      CREATE TABLE budgets (
        id TEXT PRIMARY KEY,
        name TEXT NOT NULL,
        cropId TEXT,
        plannedExpense REAL NOT NULL,
        actualExpense REAL NOT NULL,
        plannedIncome REAL NOT NULL,
        actualIncome REAL NOT NULL,
        startDate INTEGER NOT NULL,
        endDate INTEGER NOT NULL,
        notes TEXT,
        synced INTEGER DEFAULT 0,
        createdAt INTEGER NOT NULL,
        updatedAt INTEGER NOT NULL
      )
    ''');

    // Create indexes for better performance
    await db.execute('CREATE INDEX idx_transactions_date ON transactions(date DESC)');
    await db.execute('CREATE INDEX idx_transactions_crop ON transactions(cropId)');
    await db.execute('CREATE INDEX idx_transactions_type ON transactions(type)');
    await db.execute('CREATE INDEX idx_crops_planting_date ON crops(plantingDate DESC)');
    await db.execute('CREATE INDEX idx_transactions_synced ON transactions(synced)');
    await db.execute('CREATE INDEX idx_crops_synced ON crops(synced)');
    await db.execute('CREATE INDEX idx_fields_synced ON fields(synced)');
  }

  Future<void> _onUpgrade(Database db, int oldVersion, int newVersion) async {
    // Handle database upgrades
    if (oldVersion < 2) {
      // Future upgrades will go here
    }
  }

  // ========== TRANSACTION OPERATIONS ==========

  Future<String> insertTransaction(Transaction transaction) async {
    final db = await database;
    final id = DateTime.now().millisecondsSinceEpoch.toString();
    
    await db.insert(
      'transactions',
      {
        'id': id,
        'type': transaction.type.name,
        'amount': transaction.amount,
        'description': transaction.description,
        'date': transaction.date.millisecondsSinceEpoch,
        'cropId': transaction.cropId,
        'expenseCategory': transaction.expenseCategory?.name,
        'incomeCategory': transaction.incomeCategory?.name,
        'notes': transaction.notes,
        'attachments': transaction.attachments?.join(','),
        'synced': 0,
        'createdAt': DateTime.now().millisecondsSinceEpoch,
        'updatedAt': DateTime.now().millisecondsSinceEpoch,
      },
    );
    return id;
  }

  Future<List<Transaction>> getAllTransactions() async {
    final db = await database;
    final maps = await db.query(
      'transactions',
      orderBy: 'date DESC',
    );

    return maps.map((map) => _transactionFromMap(map)).toList();
  }

  Future<List<Transaction>> getTransactionsByDateRange(DateTime start, DateTime end) async {
    final db = await database;
    final maps = await db.query(
      'transactions',
      where: 'date >= ? AND date <= ?',
      whereArgs: [start.millisecondsSinceEpoch, end.millisecondsSinceEpoch],
      orderBy: 'date DESC',
    );

    return maps.map((map) => _transactionFromMap(map)).toList();
  }

  Future<List<Transaction>> getTransactionsByCrop(String cropId) async {
    final db = await database;
    final maps = await db.query(
      'transactions',
      where: 'cropId = ?',
      whereArgs: [cropId],
      orderBy: 'date DESC',
    );

    return maps.map((map) => _transactionFromMap(map)).toList();
  }

  Future<void> updateTransaction(String id, Transaction transaction) async {
    final db = await database;
    await db.update(
      'transactions',
      {
        'type': transaction.type.name,
        'amount': transaction.amount,
        'description': transaction.description,
        'date': transaction.date.millisecondsSinceEpoch,
        'cropId': transaction.cropId,
        'expenseCategory': transaction.expenseCategory?.name,
        'incomeCategory': transaction.incomeCategory?.name,
        'notes': transaction.notes,
        'attachments': transaction.attachments?.join(','),
        'synced': 0,
        'updatedAt': DateTime.now().millisecondsSinceEpoch,
      },
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<void> deleteTransaction(String id) async {
    final db = await database;
    await db.delete(
      'transactions',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  // ========== CROP OPERATIONS ==========

  Future<String> insertCrop(Crop crop) async {
    final db = await database;
    final id = DateTime.now().millisecondsSinceEpoch.toString();
    
    await db.insert(
      'crops',
      {
        'id': id,
        'name': crop.name,
        'type': crop.type.name,
        'areaInAcres': crop.areaInAcres,
        'plantingDate': crop.plantingDate.millisecondsSinceEpoch,
        'harvestDate': crop.harvestDate?.millisecondsSinceEpoch,
        'variety': crop.variety,
        'expectedYield': crop.expectedYield,
        'actualYield': crop.actualYield,
        'notes': crop.notes,
        'photos': crop.photos?.join(','),
        'synced': 0,
        'createdAt': DateTime.now().millisecondsSinceEpoch,
        'updatedAt': DateTime.now().millisecondsSinceEpoch,
      },
    );
    return id;
  }

  Future<List<Crop>> getAllCrops() async {
    final db = await database;
    final maps = await db.query(
      'crops',
      orderBy: 'plantingDate DESC',
    );

    return maps.map((map) => _cropFromMap(map)).toList();
  }

  Future<Crop?> getCropById(String id) async {
    final db = await database;
    final maps = await db.query(
      'crops',
      where: 'id = ?',
      whereArgs: [id],
      limit: 1,
    );

    if (maps.isNotEmpty) {
      return _cropFromMap(maps.first);
    }
    return null;
  }

  Future<void> updateCrop(String id, Crop crop) async {
    final db = await database;
    await db.update(
      'crops',
      {
        'name': crop.name,
        'type': crop.type.name,
        'areaInAcres': crop.areaInAcres,
        'plantingDate': crop.plantingDate.millisecondsSinceEpoch,
        'harvestDate': crop.harvestDate?.millisecondsSinceEpoch,
        'variety': crop.variety,
        'expectedYield': crop.expectedYield,
        'actualYield': crop.actualYield,
        'notes': crop.notes,
        'photos': crop.photos?.join(','),
        'synced': 0,
        'updatedAt': DateTime.now().millisecondsSinceEpoch,
      },
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<void> deleteCrop(String id) async {
    final db = await database;
    await db.delete(
      'crops',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  // ========== FIELD OPERATIONS ==========

  Future<String> insertField(Field field) async {
    final db = await database;
    final id = DateTime.now().millisecondsSinceEpoch.toString();
    
    await db.insert(
      'fields',
      {
        'id': id,
        'name': field.name,
        'areaInAcres': field.areaInAcres,
        'location': field.location,
        'soilType': field.soilType,
        'currentCrop': field.currentCrop,
        'notes': field.notes,
        'photos': field.photos?.join(','),
        'synced': 0,
        'createdAt': DateTime.now().millisecondsSinceEpoch,
        'updatedAt': DateTime.now().millisecondsSinceEpoch,
      },
    );
    return id;
  }

  Future<List<Field>> getAllFields() async {
    final db = await database;
    final maps = await db.query('fields');

    return maps.map((map) => _fieldFromMap(map)).toList();
  }

  Future<void> updateField(String id, Field field) async {
    final db = await database;
    await db.update(
      'fields',
      {
        'name': field.name,
        'areaInAcres': field.areaInAcres,
        'location': field.location,
        'soilType': field.soilType,
        'currentCrop': field.currentCrop,
        'notes': field.notes,
        'photos': field.photos?.join(','),
        'synced': 0,
        'updatedAt': DateTime.now().millisecondsSinceEpoch,
      },
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  // ========== ANALYTICS ==========

  Future<Map<String, dynamic>> getFinancialSummary({
    DateTime? startDate,
    DateTime? endDate,
    String? cropId,
  }) async {
    final db = await database;
    
    String whereClause = '';
    List<dynamic> whereArgs = [];

    if (startDate != null || endDate != null || cropId != null) {
      List<String> conditions = [];
      
      if (startDate != null) {
        conditions.add('date >= ?');
        whereArgs.add(startDate.millisecondsSinceEpoch);
      }
      if (endDate != null) {
        conditions.add('date <= ?');
        whereArgs.add(endDate.millisecondsSinceEpoch);
      }
      if (cropId != null) {
        conditions.add('cropId = ?');
        whereArgs.add(cropId);
      }
      
      whereClause = 'WHERE ${conditions.join(' AND ')}';
    }

    // Get total income and expenses
    final result = await db.rawQuery('''
      SELECT 
        type,
        SUM(amount) as total,
        COUNT(*) as count
      FROM transactions 
      $whereClause
      GROUP BY type
    ''', whereArgs);

    double totalIncome = 0;
    double totalExpense = 0;
    int incomeTransactions = 0;
    int expenseTransactions = 0;

    for (final row in result) {
      final type = row['type'] as String;
      final total = (row['total'] as num).toDouble();
      final count = row['count'] as int;

      if (type == 'income') {
        totalIncome = total;
        incomeTransactions = count;
      } else {
        totalExpense = total;
        expenseTransactions = count;
      }
    }

    // Get expense breakdown by category
    final expenseBreakdown = await db.rawQuery('''
      SELECT 
        expenseCategory,
        SUM(amount) as total
      FROM transactions 
      $whereClause AND type = 'expense' AND expenseCategory IS NOT NULL
      GROUP BY expenseCategory
    ''', whereArgs);

    Map<String, double> expensesByCategory = {};
    for (final row in expenseBreakdown) {
      final category = row['expenseCategory'] as String;
      final total = (row['total'] as num).toDouble();
      expensesByCategory[category] = total;
    }

    return {
      'totalIncome': totalIncome,
      'totalExpense': totalExpense,
      'netProfit': totalIncome - totalExpense,
      'incomeTransactions': incomeTransactions,
      'expenseTransactions': expenseTransactions,
      'totalTransactions': incomeTransactions + expenseTransactions,
      'expensesByCategory': expensesByCategory,
    };
  }

  // ========== SYNC OPERATIONS ==========

  Future<List<Map<String, dynamic>>> getUnsyncedTransactions() async {
    final db = await database;
    return await db.query(
      'transactions',
      where: 'synced = ?',
      whereArgs: [0],
    );
  }

  Future<List<Map<String, dynamic>>> getUnsyncedCrops() async {
    final db = await database;
    return await db.query(
      'crops',
      where: 'synced = ?',
      whereArgs: [0],
    );
  }

  Future<List<Map<String, dynamic>>> getUnsyncedFields() async {
    final db = await database;
    return await db.query(
      'fields',
      where: 'synced = ?',
      whereArgs: [0],
    );
  }

  Future<void> markAsSynced(String table, String id) async {
    final db = await database;
    await db.update(
      table,
      {'synced': 1},
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  // ========== HELPER METHODS ==========

  Transaction _transactionFromMap(Map<String, dynamic> map) {
    return Transaction(
      id: map['id'],
      type: TransactionType.values.firstWhere((e) => e.name == map['type']),
      amount: (map['amount'] as num).toDouble(),
      description: map['description'],
      date: DateTime.fromMillisecondsSinceEpoch(map['date']),
      cropId: map['cropId'],
      expenseCategory: map['expenseCategory'] != null 
          ? ExpenseCategory.values.firstWhere((e) => e.name == map['expenseCategory'])
          : null,
      incomeCategory: map['incomeCategory'] != null 
          ? IncomeCategory.values.firstWhere((e) => e.name == map['incomeCategory'])
          : null,
      notes: map['notes'],
      attachments: map['attachments']?.split(',').where((s) => s.isNotEmpty).toList(),
    );
  }

  Crop _cropFromMap(Map<String, dynamic> map) {
    return Crop(
      id: map['id'],
      name: map['name'],
      type: CropType.values.firstWhere((e) => e.name == map['type']),
      areaInAcres: (map['areaInAcres'] as num).toDouble(),
      plantingDate: DateTime.fromMillisecondsSinceEpoch(map['plantingDate']),
      harvestDate: map['harvestDate'] != null 
          ? DateTime.fromMillisecondsSinceEpoch(map['harvestDate'])
          : null,
      variety: map['variety'],
      expectedYield: map['expectedYield']?.toDouble(),
      actualYield: map['actualYield']?.toDouble(),
      notes: map['notes'],
      photos: map['photos']?.split(',').where((s) => s.isNotEmpty).toList(),
    );
  }

  Field _fieldFromMap(Map<String, dynamic> map) {
    return Field(
      id: map['id'],
      name: map['name'],
      areaInAcres: (map['areaInAcres'] as num).toDouble(),
      location: map['location'],
      soilType: map['soilType'],
      currentCrop: map['currentCrop'],
      notes: map['notes'],
      photos: map['photos']?.split(',').where((s) => s.isNotEmpty).toList(),
    );
  }

  // ========== DATABASE MAINTENANCE ==========

  Future<void> clearAllData() async {
    final db = await database;
    await db.delete('transactions');
    await db.delete('crops');
    await db.delete('fields');
    await db.delete('budgets');
  }

  Future<void> backup() async {
    // Implementation for backing up database
    final db = await database;
    final documentsDirectory = await getApplicationDocumentsDirectory();
    final backupPath = join(documentsDirectory.path, 'khatabook_backup_${DateTime.now().millisecondsSinceEpoch}.db');
    
    await File(db.path).copy(backupPath);
  }

  Future<void> closeDatabase() async {
    final db = _database;
    if (db != null) {
      await db.close();
      _database = null;
    }
  }
}
