// Experiment 5: Application-Wide State Management Using Provider & ChangeNotifier
import 'package:flutter/material.dart';
import '../models/medicine.dart';

class MedicineProvider extends ChangeNotifier {
  final List<Medicine> _medicines = [
    Medicine(
      id: '1',
      name: 'Amoxicillin',
      dosage: '500mg',
      type: 'Capsule',
      time: '08:00 AM',
      isTaken: true,
    ),
    Medicine(
      id: '2',
      name: 'Metformin',
      dosage: '850mg',
      type: 'Tablet',
      time: '01:00 PM',
      isTaken: false,
    ),
    Medicine(
      id: '3',
      name: 'Vitamin D3',
      dosage: '1000 IU',
      type: 'Tablet',
      time: '08:00 PM',
      isTaken: false,
    ),
  ];

  // Getter for immutable list consumption
  List<Medicine> get medicines => List.unmodifiable(_medicines);

  int get totalDoses => _medicines.length;
  int get takenDoses => _medicines.where((m) => m.isTaken).length;

  double get adherenceScore =>
      totalDoses == 0 ? 0.0 : (takenDoses / totalDoses) * 100.0;

  void addMedicine(Medicine med) {
    _medicines.add(med);
    // Notifying all active Consumer / Provider.of listeners to rebuild
    notifyListeners();
  }

  void toggleStatus(String id) {
    final index = _medicines.indexWhere((m) => m.id == id);
    if (index != -1) {
      _medicines[index].isTaken = !_medicines[index].isTaken;
      notifyListeners();
    }
  }

  void removeMedicine(String id) {
    _medicines.removeWhere((m) => m.id == id);
    notifyListeners();
  }
}
