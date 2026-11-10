// Experiment 3: Responsive UI Using MediaQuery and Orientation
import 'package:flutter/material.dart';

class ResponsiveDashboard extends StatelessWidget {
  const ResponsiveDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    // Obtaining screen dimensions and orientation via MediaQuery
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;
    final orientation = mediaQuery.orientation;
    final isPortrait = orientation == Orientation.portrait;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Responsive Health Dashboard"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Responsive banner adapting to width percentage
            Container(
              width: screenWidth * 0.95,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.teal.shade700,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  const Text(
                    "Smart Medicine Adherence Tracker",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Device Orientation: ${isPortrait ? 'Portrait Mode' : 'Landscape Mode'}",
                    style: const TextStyle(color: Colors.white70),
                  ),
                  Text(
                    "Screen: ${screenWidth.toInt()} x ${screenHeight.toInt()} px",
                    style: const TextStyle(color: Colors.white70, fontSize: 12),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            // Responsive Layout using LayoutBuilder and Expanded widgets
            const Text(
              "Daily Summary (LayoutBuilder & Expanded)",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            LayoutBuilder(
              builder: (context, constraints) {
                // If screen width is greater than 600, show multi-column row
                if (constraints.maxWidth > 600) {
                  return Row(
                    children: [
                      Expanded(
                        child: _buildMetricCard("Scheduled", "6", Colors.blue, Icons.list_alt),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: _buildMetricCard("Completed", "4", Colors.green, Icons.check_circle),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: _buildMetricCard("Pending", "2", Colors.orange, Icons.pending_actions),
                      ),
                    ],
                  );
                } else {
                  // Phone vertical layout
                  return Column(
                    children: [
                      _buildMetricCard("Scheduled Today", "6", Colors.blue, Icons.list_alt),
                      const SizedBox(height: 10),
                      _buildMetricCard("Completed Today", "4", Colors.green, Icons.check_circle),
                      const SizedBox(height: 10),
                      _buildMetricCard("Pending Today", "2", Colors.orange, Icons.pending_actions),
                    ],
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMetricCard(String title, String count, Color color, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.12),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: color.withOpacity(0.4)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(icon, color: color, size: 28),
              const SizedBox(width: 12),
              Text(
                title,
                style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
              ),
            ],
          ),
          Text(
            count,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
