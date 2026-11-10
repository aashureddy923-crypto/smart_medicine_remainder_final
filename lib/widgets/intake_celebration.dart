// Experiment 8: Implicit Animations Using AnimatedContainer and AnimatedOpacity
import 'package:flutter/material.dart';

class IntakeCelebrationCard extends StatelessWidget {
  final bool isTaken;
  final String medicineName;

  const IntakeCelebrationCard({
    super.key,
    required this.isTaken,
    required this.medicineName,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeInOut,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: isTaken ? Colors.green.shade50 : Colors.blueGrey.shade50,
        borderRadius: BorderRadius.circular(isTaken ? 16 : 8),
        border: Border.all(
          color: isTaken ? Colors.green : Colors.blueGrey.shade200,
          width: isTaken ? 2 : 1,
        ),
      ),
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 500),
        opacity: isTaken ? 1.0 : 0.6,
        child: Row(
          children: [
            Icon(
              isTaken ? Icons.check_circle : Icons.pending,
              color: isTaken ? Colors.green : Colors.grey,
              size: 28,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    medicineName,
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Text(
                    isTaken
                        ? "Dose completed on schedule!"
                        : "Dose waiting for user intake.",
                    style: TextStyle(
                      color: isTaken ? Colors.green.shade800 : Colors.black54,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
