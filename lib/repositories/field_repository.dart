import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/field_model.dart';

class FieldRepository {
	final _fieldsCollection = FirebaseFirestore.instance.collection('fields');

	Future<void> addField(FieldModel field) async {
		await _fieldsCollection.doc(field.id).set({
			'userId': field.userId,
			'name': field.name,
			'sizeHectares': field.sizeHectares,
			'soilType': field.soilType,
			'gpsCoordinates': field.gpsCoordinates,
		});
	}

	Future<List<FieldModel>> getFields(String userId) async {
		final snapshot = await _fieldsCollection.where('userId', isEqualTo: userId).get();
		return snapshot.docs.map((doc) => FieldModel(
			id: doc.id,
			userId: doc['userId'],
			name: doc['name'],
			sizeHectares: doc['sizeHectares'],
			soilType: doc['soilType'],
			gpsCoordinates: doc['gpsCoordinates'],
		)).toList();
	}

	Future<void> updateField(FieldModel field) async {
		await _fieldsCollection.doc(field.id).update({
			'name': field.name,
			'sizeHectares': field.sizeHectares,
			'soilType': field.soilType,
			'gpsCoordinates': field.gpsCoordinates,
		});
	}

	Future<void> deleteField(String fieldId) async {
		await _fieldsCollection.doc(fieldId).delete();
	}
}
