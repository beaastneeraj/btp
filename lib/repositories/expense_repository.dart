import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/expense_model.dart';

class ExpenseRepository {
	final _expensesCollection = FirebaseFirestore.instance.collection('expenses');

	Future<void> addExpense(ExpenseModel expense) async {
		await _expensesCollection.doc(expense.id).set({
			'fieldId': expense.fieldId,
			'category': expense.category,
			'amount': expense.amount,
			'description': expense.description,
			'date': expense.date.toIso8601String(),
			'supplier': expense.supplier,
		});
	}

	Future<List<ExpenseModel>> getExpenses(String fieldId) async {
		final snapshot = await _expensesCollection.where('fieldId', isEqualTo: fieldId).get();
		return snapshot.docs.map((doc) => ExpenseModel(
			id: doc.id,
			fieldId: doc['fieldId'],
			category: doc['category'],
			amount: doc['amount'],
			description: doc['description'],
			date: DateTime.parse(doc['date']),
			supplier: doc['supplier'],
		)).toList();
	}

	Future<void> updateExpense(ExpenseModel expense) async {
		await _expensesCollection.doc(expense.id).update({
			'category': expense.category,
			'amount': expense.amount,
			'description': expense.description,
			'date': expense.date.toIso8601String(),
			'supplier': expense.supplier,
		});
	}

	Future<void> deleteExpense(String expenseId) async {
		await _expensesCollection.doc(expenseId).delete();
	}
}
