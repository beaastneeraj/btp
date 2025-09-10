import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart' hide Transaction;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/khatabook_models.dart';

class FirebaseService {
  static final FirebaseService _instance = FirebaseService._internal();
  factory FirebaseService() => _instance;
  FirebaseService._internal();

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  String? get currentUserId => _auth.currentUser?.uid;

  // ========== TRANSACTIONS ==========
  
  /// Add a new transaction to Firestore
  Future<String> addTransaction(Transaction transaction) async {
    try {
      final userId = currentUserId;
      if (userId == null) throw Exception('User not authenticated');

      final docRef = await _firestore
          .collection('users')
          .doc(userId)
          .collection('transactions')
          .add(transaction.toFirestore());

      return docRef.id;
    } catch (e) {
      throw Exception('Failed to add transaction: $e');
    }
  }

  /// Get all transactions for current user
  Stream<List<Transaction>> getTransactions() {
    final userId = currentUserId;
    if (userId == null) return Stream.value([]);

    return _firestore
        .collection('users')
        .doc(userId)
        .collection('transactions')
        .orderBy('date', descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => Transaction.fromFirestore(doc.data(), doc.id))
            .toList());
  }

  /// Update an existing transaction
  Future<void> updateTransaction(String transactionId, Transaction transaction) async {
    try {
      final userId = currentUserId;
      if (userId == null) throw Exception('User not authenticated');

      await _firestore
          .collection('users')
          .doc(userId)
          .collection('transactions')
          .doc(transactionId)
          .update(transaction.toFirestore());
    } catch (e) {
      throw Exception('Failed to update transaction: $e');
    }
  }

  /// Delete a transaction
  Future<void> deleteTransaction(String transactionId) async {
    try {
      final userId = currentUserId;
      if (userId == null) throw Exception('User not authenticated');

      await _firestore
          .collection('users')
          .doc(userId)
          .collection('transactions')
          .doc(transactionId)
          .delete();
    } catch (e) {
      throw Exception('Failed to delete transaction: $e');
    }
  }

  // ========== CROPS ==========

  /// Add a new crop to Firestore
  Future<String> addCrop(Crop crop) async {
    try {
      final userId = currentUserId;
      if (userId == null) throw Exception('User not authenticated');

      final docRef = await _firestore
          .collection('users')
          .doc(userId)
          .collection('crops')
          .add(crop.toFirestore());

      return docRef.id;
    } catch (e) {
      throw Exception('Failed to add crop: $e');
    }
  }

  /// Get all crops for current user
  Stream<List<Crop>> getCrops() {
    final userId = currentUserId;
    if (userId == null) return Stream.value([]);

    return _firestore
        .collection('users')
        .doc(userId)
        .collection('crops')
        .orderBy('plantingDate', descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => Crop.fromFirestore(doc.data(), doc.id))
            .toList());
  }

  /// Update crop information
  Future<void> updateCrop(String cropId, Crop crop) async {
    try {
      final userId = currentUserId;
      if (userId == null) throw Exception('User not authenticated');

      await _firestore
          .collection('users')
          .doc(userId)
          .collection('crops')
          .doc(cropId)
          .update(crop.toFirestore());
    } catch (e) {
      throw Exception('Failed to update crop: $e');
    }
  }

  /// Delete a crop
  Future<void> deleteCrop(String cropId) async {
    try {
      final userId = currentUserId;
      if (userId == null) throw Exception('User not authenticated');

      await _firestore
          .collection('users')
          .doc(userId)
          .collection('crops')
          .doc(cropId)
          .delete();
    } catch (e) {
      throw Exception('Failed to delete crop: $e');
    }
  }

  // ========== FIELDS ==========

  /// Add a new field to Firestore
  Future<String> addField(Field field) async {
    try {
      final userId = currentUserId;
      if (userId == null) throw Exception('User not authenticated');

      final docRef = await _firestore
          .collection('users')
          .doc(userId)
          .collection('fields')
          .add(field.toFirestore());

      return docRef.id;
    } catch (e) {
      throw Exception('Failed to add field: $e');
    }
  }

  /// Get all fields for current user
  Stream<List<Field>> getFields() {
    final userId = currentUserId;
    if (userId == null) return Stream.value([]);

    return _firestore
        .collection('users')
        .doc(userId)
        .collection('fields')
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => Field.fromFirestore(doc.data(), doc.id))
            .toList());
  }

  /// Update field information
  Future<void> updateField(String fieldId, Field field) async {
    try {
      final userId = currentUserId;
      if (userId == null) throw Exception('User not authenticated');

      await _firestore
          .collection('users')
          .doc(userId)
          .collection('fields')
          .doc(fieldId)
          .update(field.toFirestore());
    } catch (e) {
      throw Exception('Failed to update field: $e');
    }
  }

  // ========== FILE UPLOADS ==========

  /// Upload file to Firebase Storage
  Future<String> uploadFile(File file, String path) async {
    try {
      final userId = currentUserId;
      if (userId == null) throw Exception('User not authenticated');

      final ref = _storage.ref().child('users/$userId/$path');
      final uploadTask = await ref.putFile(file);
      final downloadUrl = await uploadTask.ref.getDownloadURL();
      
      return downloadUrl;
    } catch (e) {
      throw Exception('Failed to upload file: $e');
    }
  }

  /// Delete file from Firebase Storage
  Future<void> deleteFile(String url) async {
    try {
      final ref = _storage.refFromURL(url);
      await ref.delete();
    } catch (e) {
      throw Exception('Failed to delete file: $e');
    }
  }

  // ========== USER PROFILE ==========

  /// Get user profile
  Future<Map<String, dynamic>?> getUserProfile() async {
    try {
      final userId = currentUserId;
      if (userId == null) return null;

      final doc = await _firestore
          .collection('users')
          .doc(userId)
          .get();

      return doc.exists ? doc.data() : null;
    } catch (e) {
      throw Exception('Failed to get user profile: $e');
    }
  }

  /// Update user profile
  Future<void> updateUserProfile(Map<String, dynamic> profile) async {
    try {
      final userId = currentUserId;
      if (userId == null) throw Exception('User not authenticated');

      await _firestore
          .collection('users')
          .doc(userId)
          .set(profile, SetOptions(merge: true));
    } catch (e) {
      throw Exception('Failed to update user profile: $e');
    }
  }

  // ========== ANALYTICS ==========

  /// Get transaction analytics
  Future<Map<String, dynamic>> getAnalytics({
    DateTime? startDate,
    DateTime? endDate,
    String? cropId,
  }) async {
    try {
      final userId = currentUserId;
      if (userId == null) throw Exception('User not authenticated');

      Query query = _firestore
          .collection('users')
          .doc(userId)
          .collection('transactions');

      if (startDate != null) {
        query = query.where('date', isGreaterThanOrEqualTo: Timestamp.fromDate(startDate));
      }
      if (endDate != null) {
        query = query.where('date', isLessThanOrEqualTo: Timestamp.fromDate(endDate));
      }
      if (cropId != null) {
        query = query.where('cropId', isEqualTo: cropId);
      }

      final snapshot = await query.get();
      
      double totalIncome = 0;
      double totalExpense = 0;
      Map<String, double> categoryExpenses = {};
      Map<String, double> monthlyIncome = {};
      Map<String, double> monthlyExpense = {};

      for (final doc in snapshot.docs) {
        final data = doc.data() as Map<String, dynamic>;
        final amount = (data['amount'] as num).toDouble();
        final type = data['type'] as String;
        final date = (data['date'] as Timestamp).toDate();
        final monthKey = '${date.year}-${date.month.toString().padLeft(2, '0')}';

        if (type == 'income') {
          totalIncome += amount;
          monthlyIncome[monthKey] = (monthlyIncome[monthKey] ?? 0) + amount;
        } else {
          totalExpense += amount;
          monthlyExpense[monthKey] = (monthlyExpense[monthKey] ?? 0) + amount;
          
          final category = data['expenseCategory'] as String?;
          if (category != null) {
            categoryExpenses[category] = (categoryExpenses[category] ?? 0) + amount;
          }
        }
      }

      return {
        'totalIncome': totalIncome,
        'totalExpense': totalExpense,
        'profit': totalIncome - totalExpense,
        'categoryExpenses': categoryExpenses,
        'monthlyIncome': monthlyIncome,
        'monthlyExpense': monthlyExpense,
        'transactionCount': snapshot.docs.length,
      };
    } catch (e) {
      throw Exception('Failed to get analytics: $e');
    }
  }

  // ========== BATCH OPERATIONS ==========

  /// Sync local data to Firebase
  Future<void> syncLocalToFirebase(List<Transaction> transactions, List<Crop> crops, List<Field> fields) async {
    try {
      final userId = currentUserId;
      if (userId == null) throw Exception('User not authenticated');

      final batch = _firestore.batch();

      // Add transactions
      for (final transaction in transactions) {
        final ref = _firestore
            .collection('users')
            .doc(userId)
            .collection('transactions')
            .doc();
        batch.set(ref, transaction.toFirestore());
      }

      // Add crops
      for (final crop in crops) {
        final ref = _firestore
            .collection('users')
            .doc(userId)
            .collection('crops')
            .doc();
        batch.set(ref, crop.toFirestore());
      }

      // Add fields
      for (final field in fields) {
        final ref = _firestore
            .collection('users')
            .doc(userId)
            .collection('fields')
            .doc();
        batch.set(ref, field.toFirestore());
      }

      await batch.commit();
    } catch (e) {
      throw Exception('Failed to sync data: $e');
    }
  }
}
