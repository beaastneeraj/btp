import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/crop_model.dart';

class CropRepository {
	final _cropsCollection = FirebaseFirestore.instance.collection('crops');

	Future<void> addCrop(CropModel crop) async {
		await _cropsCollection.doc(crop.id).set({
			'fieldId': crop.fieldId,
			'cropName': crop.cropName,
			'variety': crop.variety,
			'plantingDate': crop.plantingDate.toIso8601String(),
			'harvestDate': crop.harvestDate?.toIso8601String(),
			'yield': crop.yield,
		});
	}

	Future<List<CropModel>> getCrops(String fieldId) async {
		final snapshot = await _cropsCollection.where('fieldId', isEqualTo: fieldId).get();
		return snapshot.docs.map((doc) => CropModel(
			id: doc.id,
			fieldId: doc['fieldId'],
			cropName: doc['cropName'],
			variety: doc['variety'],
			plantingDate: DateTime.parse(doc['plantingDate']),
			harvestDate: doc['harvestDate'] != null ? DateTime.parse(doc['harvestDate']) : null,
			yield: doc['yield']?.toDouble(),
		)).toList();
	}

	Future<void> updateCrop(CropModel crop) async {
		await _cropsCollection.doc(crop.id).update({
			'cropName': crop.cropName,
			'variety': crop.variety,
			'plantingDate': crop.plantingDate.toIso8601String(),
			'harvestDate': crop.harvestDate?.toIso8601String(),
			'yield': crop.yield,
		});
	}

	Future<void> deleteCrop(String cropId) async {
		await _cropsCollection.doc(cropId).delete();
	}
}
