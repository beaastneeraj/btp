import 'package:flutter/material.dart';

class ReportChartWidget extends StatelessWidget {
  final String title;
  final List<double> data;
  final List<String> labels;

  const ReportChartWidget({required this.title, required this.data, required this.labels});

  @override
  Widget build(BuildContext context) {
    // Placeholder for chart
    return Card(
      margin: EdgeInsets.all(16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 12),
            Row(
              children: List.generate(data.length, (i) => Expanded(
                child: Column(
                  children: [
                    Container(
                      height: data[i],
                      width: 24,
                      color: Colors.blue.shade400,
                    ),
                    SizedBox(height: 4),
                    Text(labels[i], style: TextStyle(fontSize: 12)),
                  ],
                ),
              )),
            ),
          ],
        ),
      ),
    );
  }
}
