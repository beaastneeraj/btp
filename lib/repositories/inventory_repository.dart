import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/inventory_model.dart';

class InventoryRepository {
	final _inventoryCollection = FirebaseFirestore.instance.collection('inventory');

	Future<void> addItem(InventoryModel item) async {
		await _inventoryCollection.doc(item.id).set({
			'userId': item.userId,
			'itemName': item.itemName,
			'category': item.category,
			'stock': item.stock,
			'unitPrice': item.unitPrice,
			'reorderLevel': item.reorderLevel,
		});
	}

	Future<List<InventoryModel>> getItems(String userId) async {
		final snapshot = await _inventoryCollection.where('userId', isEqualTo: userId).get();
		return snapshot.docs.map((doc) => InventoryModel(
			id: doc.id,
			userId: doc['userId'],
			itemName: doc['itemName'],
			category: doc['category'],
			stock: doc['stock'],
			unitPrice: doc['unitPrice'],
			reorderLevel: doc['reorderLevel'],
		)).toList();
	}

	Future<void> updateItem(InventoryModel item) async {
		await _inventoryCollection.doc(item.id).update({
			'itemName': item.itemName,
			'category': item.category,
			'stock': item.stock,
			'unitPrice': item.unitPrice,
			'reorderLevel': item.reorderLevel,
		});
	}

	Future<void> deleteItem(String itemId) async {
		await _inventoryCollection.doc(itemId).delete();
	}
}
