import 'package:sqflite/sqflite.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SyncService {
  Future<void> syncToFirebase(Database db, String table, String collection) async {
    final List<Map<String, dynamic>> localData = await db.query(table);
    final CollectionReference ref = FirebaseFirestore.instance.collection(collection);
    for (var row in localData) {
      await ref.doc(row['id'].toString()).set(row);
    }
  }

  Future<void> syncToLocal(Database db, String table, String collection) async {
    final CollectionReference ref = FirebaseFirestore.instance.collection(collection);
    final snapshot = await ref.get();
    for (var doc in snapshot.docs) {
      await db.insert(table, doc.data() as Map<String, dynamic>, conflictAlgorithm: ConflictAlgorithm.replace);
    }
  }
}
