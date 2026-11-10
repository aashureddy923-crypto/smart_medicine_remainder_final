// Experiment 4: Navigation Drawer Using Named Routes
import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.teal, Colors.tealAccent],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                Icon(Icons.health_and_safety, size: 48, color: Colors.white),
                SizedBox(height: 8),
                Text(
                  "Smart Med Reminder",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Your Daily Health Companion",
                  style: TextStyle(color: Colors.white70, fontSize: 12),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home, color: Colors.teal),
            title: const Text("Home Reminders"),
            onTap: () {
              Navigator.pop(context); // Close drawer
              Navigator.pushReplacementNamed(context, '/');
            },
          ),
          ListTile(
            leading: const Icon(Icons.add_circle, color: Colors.teal),
            title: const Text("Add New Medicine"),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/add');
            },
          ),
          ListTile(
            leading: const Icon(Icons.dashboard_customize, color: Colors.teal),
            title: const Text("Responsive Analytics"),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/responsive');
            },
          ),
          ListTile(
            leading: const Icon(Icons.medical_information, color: Colors.teal),
            title: const Text("Health Tips & REST API"),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/tips');
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.view_quilt, color: Colors.grey),
            title: const Text("Basic UI View (Lab 2)"),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/basic');
            },
          ),
        ],
      ),
    );
  }
}
