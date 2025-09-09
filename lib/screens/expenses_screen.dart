import 'package:flutter/material.dart';

class ExpensesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expenses', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.orange.shade700,
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(24)),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.orange.shade400, Colors.blue.shade200],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: ListView(
          padding: EdgeInsets.all(20),
          children: [
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              elevation: 4,
              child: ListTile(
                leading: Icon(Icons.attach_money, color: Colors.orange.shade700),
                title: Text('Fertilizer'),
                subtitle: Text('₹1200 | Supplier: ABC Agro'),
                trailing: Icon(Icons.edit),
                onTap: () {},
              ),
            ),
            // ...more expenses, add CRUD logic here...
            SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {},
              icon: Icon(Icons.add),
              label: Text('Add Expense'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange.shade700,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                padding: EdgeInsets.symmetric(vertical: 16),
                elevation: 4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
