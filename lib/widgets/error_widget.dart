import 'package:flutter/material.dart';

class ErrorWidgetCustom extends StatelessWidget {
  final String error;
  const ErrorWidgetCustom({required this.error});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.error, color: Colors.red, size: 48),
          SizedBox(height: 16),
          Text(error, style: TextStyle(fontSize: 16, color: Colors.red)),
        ],
      ),
    );
  }
}
