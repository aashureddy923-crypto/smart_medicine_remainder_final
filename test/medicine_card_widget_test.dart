// Experiment 10: Writing Widget Tests Using WidgetTester and Matchers
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:smart_medicine_remainder_final/models/medicine.dart';
import 'package:smart_medicine_remainder_final/widgets/medicine_card.dart';

void main() {
  testWidgets('MedicineCard renders medicine name, dosage, and triggers callbacks', (WidgetTester tester) async {
    bool toggled = false;
    bool tapped = false;

    final sampleMed = Medicine(
      id: 'm1',
      name: 'Atorvastatin',
      dosage: '20mg',
      type: 'Tablet',
      time: '09:00 PM',
      isTaken: false,
    );

    // Build the widget in test environment using pumpWidget
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: MedicineCard(
            medicine: sampleMed,
            onToggle: () => toggled = true,
            onTap: () => tapped = true,
          ),
        ),
      ),
    );

    // Verify UI components using find and matchers
    expect(find.text('Atorvastatin'), findsOneWidget);
    expect(find.textContaining('20mg'), findsOneWidget);
    expect(find.byIcon(Icons.radio_button_unchecked), findsOneWidget);

    // Tap toggle button
    await tester.tap(find.byType(IconButton));
    expect(toggled, isTrue);

    // Tap card
    await tester.tap(find.text('Atorvastatin'));
    expect(tapped, isTrue);
  });
}
