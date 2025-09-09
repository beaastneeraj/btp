import 'package:flutter/material.dart';

class AnalyticsDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _AnalyticsCard(
          title: 'Total Fields',
          value: '5',
          icon: Icons.grass,
          color: Colors.green.shade700,
        ),
        _AnalyticsCard(
          title: 'Active Crops',
          value: '8',
          icon: Icons.eco,
          color: Colors.green.shade400,
        ),
        _AnalyticsCard(
          title: 'Expenses This Month',
          value: '₹12,500',
          icon: Icons.attach_money,
          color: Colors.orange.shade700,
        ),
        _AnalyticsCard(
          title: 'Low Inventory Items',
          value: '2',
          icon: Icons.inventory_2,
          color: Colors.blue.shade700,
        ),
        _AnalyticsCard(
          title: 'Pending Tasks',
          value: '3',
          icon: Icons.task_alt,
          color: Colors.purple.shade700,
        ),
      ],
    );
  }
}

class _AnalyticsCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color color;

  const _AnalyticsCard({required this.title, required this.value, required this.icon, required this.color});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 6,
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      child: ListTile(
        leading: Icon(icon, size: 36, color: color),
        title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
        trailing: Text(value, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: color)),
      ),
    );
  }
}
