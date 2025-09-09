import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/task_model.dart';

class TaskRepository {
	final _tasksCollection = FirebaseFirestore.instance.collection('tasks');

	Future<void> addTask(TaskModel task) async {
		await _tasksCollection.doc(task.id).set({
			'fieldId': task.fieldId,
			'title': task.title,
			'description': task.description,
			'dueDate': task.dueDate.toIso8601String(),
			'status': task.status,
			'assignedTo': task.assignedTo,
		});
	}

	Future<List<TaskModel>> getTasks(String fieldId) async {
		final snapshot = await _tasksCollection.where('fieldId', isEqualTo: fieldId).get();
		return snapshot.docs.map((doc) => TaskModel(
			id: doc.id,
			fieldId: doc['fieldId'],
			title: doc['title'],
			description: doc['description'],
			dueDate: DateTime.parse(doc['dueDate']),
			status: doc['status'],
			assignedTo: doc['assignedTo'],
		)).toList();
	}

	Future<void> updateTask(TaskModel task) async {
		await _tasksCollection.doc(task.id).update({
			'title': task.title,
			'description': task.description,
			'dueDate': task.dueDate.toIso8601String(),
			'status': task.status,
			'assignedTo': task.assignedTo,
		});
	}

	Future<void> deleteTask(String taskId) async {
		await _tasksCollection.doc(taskId).delete();
	}
}
