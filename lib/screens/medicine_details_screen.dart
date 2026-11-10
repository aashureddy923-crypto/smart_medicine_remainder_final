// Experiment 4: Multi-screen Navigation and Passing Data Between Screens
import 'package:flutter/material.dart';
import '../models/medicine.dart';

class MedicineDetailsScreen extends StatelessWidget {
  const MedicineDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Extracting data passed via Route Settings Arguments
    final medicine = ModalRoute.of(context)!.settings.arguments as Medicine;

    return Scaffold(
      appBar: AppBar(
        title: Text("${medicine.name} Details"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              elevation: 3,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    ListTile(
                      leading: const Icon(Icons.medication, size: 40, color: Colors.teal),
                      title: Text(
                        medicine.name,
                        style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text("Dosage: ${medicine.dosage}"),
                    ),
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildDetailChip("Type", medicine.type, Icons.category),
                        _buildDetailChip("Time", medicine.time, Icons.alarm),
                        _buildDetailChip(
                          "Status",
                          medicine.isTaken ? "Taken" : "Pending",
                          medicine.isTaken ? Icons.check_circle : Icons.pending,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            Center(
              child: ElevatedButton.icon(
                onPressed: () {
                  // Returning back to the previous screen using Navigator.pop
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back),
                label: const Text("Back to Reminder List"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailChip(String label, String value, IconData icon) {
    return Column(
      children: [
        Icon(icon, size: 20, color: Colors.teal),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(color: Colors.grey, fontSize: 12)),
        Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
      ],
    );
  }
}
