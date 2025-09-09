import 'package:flutter/material.dart';

class InventoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inventory', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.blue.shade700,
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(24)),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue.shade400, Colors.green.shade200],
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
                leading: Icon(Icons.inventory_2, color: Colors.blue.shade700),
                title: Text('Urea'),
                subtitle: Text('Stock: 50 | Reorder: 20'),
                trailing: Icon(Icons.edit),
                onTap: () {},
              ),
            ),
            // ...more inventory, add CRUD logic here...
            SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {},
              icon: Icon(Icons.add),
              label: Text('Add Item'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue.shade700,
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
