import 'package:flutter/material.dart';

class InventoryAlertWidget extends StatelessWidget {
  final String itemName;
  final int stock;
  final int reorderLevel;

  const InventoryAlertWidget({
    required this.itemName,
    required this.stock,
    required this.reorderLevel,
  });

  @override
  Widget build(BuildContext context) {
    final isLow = stock <= reorderLevel;
    return isLow
        ? Card(
            color: Colors.red.shade100,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            elevation: 4,
            margin: EdgeInsets.all(12),
            child: ListTile(
              leading: Icon(Icons.warning, color: Colors.red.shade700),
              title: Text('Low Inventory: $itemName'),
              subtitle: Text('Stock: $stock | Reorder Level: $reorderLevel'),
            ),
          )
        : SizedBox.shrink();
  }
}
