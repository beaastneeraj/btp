import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile & Settings'),
        backgroundColor: Colors.green.shade700,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            CircleAvatar(
              radius: 40,
              backgroundColor: Colors.green.shade400,
              child: Icon(Icons.person, size: 48, color: Colors.white),
            ),
            SizedBox(height: 16),
            Text('Your Name', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text('your.email@example.com', style: TextStyle(fontSize: 16)),
            SizedBox(height: 24),
            ListTile(
              leading: Icon(Icons.settings, color: Colors.green.shade700),
              title: Text('Settings'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.logout, color: Colors.red.shade700),
              title: Text('Logout'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
