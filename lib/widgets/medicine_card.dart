// Experiment 6: Reusable Custom UI Component - MedicineCard
import 'package:flutter/material.dart';
import '../models/medicine.dart';

class MedicineCard extends StatelessWidget {
  final Medicine medicine;
  final VoidCallback onToggle;
  final VoidCallback onTap;

  const MedicineCard({
    super.key,
    required this.medicine,
    required this.onToggle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              CircleAvatar(
                radius: 24,
                backgroundColor: medicine.isTaken
                    ? Colors.green.shade100
                    : Colors.teal.shade50,
                child: Icon(
                  Icons.medication_liquid,
                  color: medicine.isTaken ? Colors.green : Colors.teal,
                  size: 26,
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      medicine.name,
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        decoration: medicine.isTaken ? TextDecoration.lineThrough : null,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "${medicine.type} • ${medicine.dosage} • ${medicine.time}",
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
                icon: Icon(
                  medicine.isTaken
                      ? Icons.check_circle
                      : Icons.radio_button_unchecked,
                  color: medicine.isTaken ? Colors.green : Colors.grey,
                  size: 28,
                ),
                onPressed: onToggle,
                tooltip: medicine.isTaken ? "Mark Pending" : "Mark Taken",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
