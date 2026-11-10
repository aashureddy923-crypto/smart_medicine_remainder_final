// Experiment 10: Writing Unit Tests Using flutter_test Package
import 'package:flutter_test/flutter_test.dart';
import 'package:smart_medicine_remainder_final/models/medicine.dart';
import 'package:smart_medicine_remainder_final/utils/reminder_helper.dart';

void main() {
  group('Smart Medicine Reminder - Unit Test Suite', () {
    test('calculateNextDose correctly advances hour and formats AM/PM', () {
      // 8 AM + 4 hours interval = 12 PM
      final result1 = ReminderHelper.calculateNextDose(4, 8);
      expect(result1, equals('12:00 PM'));

      // 10 PM (22) + 4 hours interval = 2 AM
      final result2 = ReminderHelper.calculateNextDose(4, 22);
      expect(result2, equals('2:00 AM'));
    });

    test('calculateAdherenceRate calculates correct percentage', () {
      // 3 taken out of 4 doses = 75.0%
      final rate = ReminderHelper.calculateAdherenceRate(3, 4);
      expect(rate, equals(75.0));

      // 0 taken out of 0 doses edge case
      final zeroRate = ReminderHelper.calculateAdherenceRate(0, 0);
      expect(zeroRate, equals(0.0));
    });

    test('getAdherenceGrade categorizes adherence properly', () {
      expect(ReminderHelper.getAdherenceGrade(95.0), equals("Excellent"));
      expect(ReminderHelper.getAdherenceGrade(75.0), equals("Good"));
      expect(ReminderHelper.getAdherenceGrade(55.0), equals("Needs Attention"));
      expect(ReminderHelper.getAdherenceGrade(30.0), equals("Critical"));
    });

    test('Medicine model serialization toMap and fromMap matches', () {
      final med = Medicine(
        id: 'test_101',
        name: 'Aspirin',
        dosage: '75mg',
        type: 'Tablet',
        time: '09:00 AM',
        isTaken: true,
      );

      final map = med.toMap();
      final restoredMed = Medicine.fromMap(map);

      expect(restoredMed.id, equals(med.id));
      expect(restoredMed.name, equals('Aspirin'));
      expect(restoredMed.isTaken, isTrue);
    });
  });
}
