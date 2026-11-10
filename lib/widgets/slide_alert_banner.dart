// Experiment 8: Slide Animation Using AnimatedPositioned and Curves
import 'package:flutter/material.dart';

class SlideAlertBanner extends StatelessWidget {
  final bool isVisible;
  final String title;
  final String subtitle;
  final VoidCallback onDismiss;

  const SlideAlertBanner({
    super.key,
    required this.isVisible,
    required this.title,
    required this.subtitle,
    required this.onDismiss,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 600),
      curve: Curves.elasticOut,
      top: isVisible ? 16.0 : -120.0,
      left: 16.0,
      right: 16.0,
      child: Material(
        elevation: 6,
        borderRadius: BorderRadius.circular(12),
        color: Colors.amber.shade100,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.orange.shade300),
          ),
          child: Row(
            children: [
              const Icon(Icons.warning_amber_rounded, color: Colors.deepOrange, size: 32),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    Text(subtitle, style: const TextStyle(fontSize: 12)),
                  ],
                ),
              ),
              IconButton(
                icon: const Icon(Icons.close, size: 20),
                onPressed: onDismiss,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
