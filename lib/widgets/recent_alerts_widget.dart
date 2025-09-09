import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/app_provider.dart';
import '../models/task.dart';

class RecentAlertsWidget extends StatelessWidget {
  const RecentAlertsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(
      builder: (context, provider, child) {
        final urgentTasks = _getUrgentTasks(provider.tasks);
        final weatherAlerts = _getWeatherAlerts();
        final allAlerts = [...urgentTasks, ...weatherAlerts];

        return Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.1),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: Colors.white.withOpacity(0.2),
              width: 1,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.notifications_active,
                    color: allAlerts.isNotEmpty ? Colors.red.shade300 : Colors.white,
                    size: 24,
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    'Recent Alerts',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const Spacer(),
                  if (allAlerts.isNotEmpty)
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.red.shade400,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        '${allAlerts.length}',
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 16),
              if (allAlerts.isEmpty)
                _buildNoAlertsContent()
              else
                _buildAlertsContent(allAlerts),
            ],
          ),
        );
      },
    );
  }

  Widget _buildNoAlertsContent() {
    return Center(
      child: Column(
        children: [
          Icon(
            Icons.check_circle_outline,
            size: 48,
            color: Colors.green.shade300,
          ),
          const SizedBox(height: 8),
          Text(
            'No urgent alerts',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.white.withOpacity(0.9),
            ),
          ),
          Text(
            'All systems running smoothly',
            style: TextStyle(
              fontSize: 14,
              color: Colors.white.withOpacity(0.7),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAlertsContent(List<AlertItem> alerts) {
    return Column(
      children: alerts
          .take(5) // Show only first 5 alerts
          .map((alert) => _buildAlertItem(alert))
          .toList(),
    );
  }

  Widget _buildAlertItem(AlertItem alert) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: _getAlertColor(alert.priority).withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: _getAlertColor(alert.priority).withOpacity(0.3),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: _getAlertColor(alert.priority),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              _getAlertIcon(alert.type),
              size: 16,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  alert.title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  alert.description,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white.withOpacity(0.8),
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  _formatTimeAgo(alert.timestamp),
                  style: TextStyle(
                    fontSize: 11,
                    color: Colors.white.withOpacity(0.6),
                  ),
                ),
              ],
            ),
          ),
          Icon(
            Icons.chevron_right,
            color: Colors.white.withOpacity(0.5),
            size: 16,
          ),
        ],
      ),
    );
  }

  List<AlertItem> _getUrgentTasks(List<Task> tasks) {
    final now = DateTime.now();
    final urgentTasks = <AlertItem>[];

    for (final task in tasks) {
      if (task.status == TaskStatus.pending) {
        final daysUntilDue = task.dueDate.difference(now).inDays;
        
        if (daysUntilDue <= 0) {
          urgentTasks.add(AlertItem(
            id: task.id,
            type: AlertType.task,
            priority: AlertPriority.high,
            title: 'Overdue Task',
            description: '${task.title} was due ${daysUntilDue == 0 ? 'today' : '${-daysUntilDue} days ago'}',
            timestamp: task.dueDate,
          ));
        } else if (daysUntilDue <= 2) {
          urgentTasks.add(AlertItem(
            id: task.id,
            type: AlertType.task,
            priority: daysUntilDue == 1 ? AlertPriority.high : AlertPriority.medium,
            title: 'Task Due Soon',
            description: '${task.title} is due in $daysUntilDue day${daysUntilDue == 1 ? '' : 's'}',
            timestamp: task.dueDate,
          ));
        }
      }
    }

    return urgentTasks;
  }

  List<AlertItem> _getWeatherAlerts() {
    // Mock weather alerts - in real app, this would come from weather service
    final now = DateTime.now();
    return [
      AlertItem(
        id: 'weather_1',
        type: AlertType.weather,
        priority: AlertPriority.medium,
        title: 'Heavy Rain Expected',
        description: 'Postpone irrigation and outdoor farming activities',
        timestamp: now.subtract(const Duration(hours: 2)),
      ),
      AlertItem(
        id: 'weather_2',
        type: AlertType.weather,
        priority: AlertPriority.low,
        title: 'Optimal Growing Conditions',
        description: 'Perfect weather for crop development this week',
        timestamp: now.subtract(const Duration(hours: 6)),
      ),
    ];
  }

  Color _getAlertColor(AlertPriority priority) {
    switch (priority) {
      case AlertPriority.high:
        return Colors.red;
      case AlertPriority.medium:
        return Colors.orange;
      case AlertPriority.low:
        return Colors.blue;
    }
  }

  IconData _getAlertIcon(AlertType type) {
    switch (type) {
      case AlertType.task:
        return Icons.assignment_late;
      case AlertType.weather:
        return Icons.cloud;
      case AlertType.system:
        return Icons.warning;
      case AlertType.maintenance:
        return Icons.build;
    }
  }

  String _formatTimeAgo(DateTime timestamp) {
    final now = DateTime.now();
    final difference = now.difference(timestamp);

    if (difference.inDays > 0) {
      return '${difference.inDays}d ago';
    } else if (difference.inHours > 0) {
      return '${difference.inHours}h ago';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes}m ago';
    } else {
      return 'Just now';
    }
  }
}

// Alert data models
class AlertItem {
  final String id;
  final AlertType type;
  final AlertPriority priority;
  final String title;
  final String description;
  final DateTime timestamp;

  AlertItem({
    required this.id,
    required this.type,
    required this.priority,
    required this.title,
    required this.description,
    required this.timestamp,
  });
}

enum AlertType {
  task,
  weather,
  system,
  maintenance,
}

enum AlertPriority {
  high,
  medium,
  low,
}
