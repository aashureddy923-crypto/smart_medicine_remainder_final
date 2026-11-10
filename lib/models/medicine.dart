// Experiment 1: Dart Programming, Data Types, Classes, and Null Safety
class Medicine {
  final String id;
  final String name;
  final String dosage; // e.g. "500mg"
  final String type;   // e.g. "Tablet", "Capsule", "Syrup"
  final String time;   // e.g. "08:00 AM"
  bool isTaken;

  Medicine({
    required this.id,
    required this.name,
    required this.dosage,
    required this.type,
    required this.time,
    this.isTaken = false,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'dosage': dosage,
      'type': type,
      'time': time,
      'isTaken': isTaken,
    };
  }

  factory Medicine.fromMap(Map<String, dynamic> map) {
    return Medicine(
      id: map['id'] as String,
      name: map['name'] as String,
      dosage: map['dosage'] as String,
      type: map['type'] as String,
      time: map['time'] as String,
      isTaken: (map['isTaken'] as bool?) ?? false,
    );
  }
}
