import 'package:flutter/material.dart';
import 'fields_screen.dart';
import 'crops_screen.dart';
import 'expenses_screen.dart';
import 'inventory_screen.dart';
import 'tasks_screen.dart';
import 'weather_screen.dart';
import 'reports_screen.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Farm Dashboard'),
        backgroundColor: Colors.green[700],
      ),
      body: GridView.count(
        crossAxisCount: 2,
        padding: EdgeInsets.all(16),
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        children: [
          _DashboardCard(
            icon: Icons.grass,
            label: 'Fields & Crops',
            color: Colors.green,
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => FieldsScreen()));
            },
          ),
          _DashboardCard(
            icon: Icons.attach_money,
            label: 'Expenses',
            color: Colors.orange,
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => ExpensesScreen()));
            },
          ),
          _DashboardCard(
            icon: Icons.inventory,
            label: 'Inventory',
            color: Colors.blue,
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => InventoryScreen()));
            },
          ),
          _DashboardCard(
            icon: Icons.task,
            label: 'Tasks',
            color: Colors.purple,
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => TasksScreen()));
            },
          ),
          _DashboardCard(
            icon: Icons.cloud,
            label: 'Weather',
            color: Colors.teal,
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => WeatherScreen()));
            },
          ),
          _DashboardCard(
            icon: Icons.bar_chart,
            label: 'Reports',
            color: Colors.red,
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => ReportsScreen()));
            },
          ),
        ],
      ),
    );
  }
}

class _DashboardCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback onTap;

  const _DashboardCard({required this.icon, required this.label, required this.color, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 48, color: color),
              SizedBox(height: 12),
              Text(label, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
            ],
          ),
        ),
      ),
    );
  }
}
