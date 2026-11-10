// Smart Medicine Reminder Final Project
// Complete Integration of Flutter Lab Experiments 1 through 10
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/medicine.dart';
import 'providers/medicine_provider.dart';
import 'screens/basic_home_view.dart';
import 'screens/add_medicine_screen.dart';
import 'screens/medicine_details_screen.dart';
import 'screens/responsive_dashboard.dart';
import 'screens/health_tips_screen.dart';
import 'theme/app_theme.dart';
import 'widgets/app_drawer.dart';
import 'widgets/medicine_card.dart';
import 'widgets/slide_alert_banner.dart';
import 'widgets/intake_celebration.dart';

void main() {
  runApp(
    // Global State management using ChangeNotifierProvider (Experiment 5)
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MedicineProvider()),
      ],
      child: const SmartMedicineReminderApp(),
    ),
  );
}

class SmartMedicineReminderApp extends StatelessWidget {
  const SmartMedicineReminderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart Medicine Reminder',
      debugShowCheckedModeBanner: false,
      // Centralized Themes (Experiment 6)
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      // Named Routes Navigation (Experiment 4)
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/basic': (context) => const BasicHomeView(),
        '/add': (context) => const AddMedicineScreen(),
        '/details': (context) => const MedicineDetailsScreen(),
        '/responsive': (context) => const ResponsiveDashboard(),
        '/tips': (context) => const HealthTipsScreen(),
      },
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _showAlert = true;

  @override
  Widget build(BuildContext context) {
    final medProvider = Provider.of<MedicineProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Smart Medicine Reminder"),
        actions: [
          IconButton(
            icon: const Icon(Icons.devices),
            tooltip: "Responsive View (Exp 3)",
            onPressed: () => Navigator.pushNamed(context, '/responsive'),
          ),
          IconButton(
            icon: const Icon(Icons.tips_and_updates),
            tooltip: "REST API Tips (Exp 9)",
            onPressed: () => Navigator.pushNamed(context, '/tips'),
          ),
        ],
      ),
      drawer: const AppDrawer(), // Navigation Drawer (Exp 4)
      body: Stack(
        children: [
          Column(
            children: [
              // Adherence progress header
              Container(
                margin: const EdgeInsets.all(14),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.teal.shade700, Colors.teal.shade400],
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Today's Adherence",
                          style: TextStyle(color: Colors.white70, fontSize: 13),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          "${medProvider.adherenceScore.toStringAsFixed(0)}% Completed",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "${medProvider.takenDoses} of ${medProvider.totalDoses} doses taken",
                          style: const TextStyle(color: Colors.white70, fontSize: 12),
                        ),
                      ],
                    ),
                    const Icon(Icons.health_and_safety, size: 48, color: Colors.white),
                  ],
                ),
              ),

              // Celebration card animated with AnimatedContainer (Exp 8)
              if (medProvider.medicines.isNotEmpty)
                IntakeCelebrationCard(
                  isTaken: medProvider.medicines.first.isTaken,
                  medicineName: medProvider.medicines.first.name,
                ),

              // Medicine Reminders List
              Expanded(
                child: medProvider.medicines.isEmpty
                    ? const Center(child: Text("No reminders scheduled. Tap + to add!"))
                    : ListView.builder(
                        itemCount: medProvider.medicines.length,
                        itemBuilder: (context, index) {
                          final med = medProvider.medicines[index];
                          return MedicineCard(
                            medicine: med,
                            onToggle: () => medProvider.toggleStatus(med.id),
                            onTap: () {
                              // Pass Medicine data through Navigator named routes (Exp 4)
                              Navigator.pushNamed(
                                context,
                                '/details',
                                arguments: med,
                              );
                            },
                          );
                        },
                      ),
              ),
            ],
          ),

          // Slide-in Alert Banner with AnimatedPositioned (Exp 8)
          SlideAlertBanner(
            isVisible: _showAlert,
            title: "Dosage Reminder Alert",
            subtitle: "It's time for your 01:00 PM Metformin dose!",
            onDismiss: () => setState(() => _showAlert = false),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        icon: const Icon(Icons.add),
        label: const Text("Add Dose"),
        onPressed: () => Navigator.pushNamed(context, '/add'),
      ),
    );
  }
}
