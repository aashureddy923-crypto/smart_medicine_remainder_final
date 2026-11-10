// Experiment 7: Designing Forms with TextFormField and Form Validation
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/medicine.dart';
import '../providers/medicine_provider.dart';

class AddMedicineScreen extends StatefulWidget {
  const AddMedicineScreen({super.key});

  @override
  State<AddMedicineScreen> createState() => _AddMedicineScreenState();
}

class _AddMedicineScreenState extends State<AddMedicineScreen> {
  // GlobalKey to identify and validate form state
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _dosageController = TextEditingController();

  String _selectedType = 'Tablet';
  String _selectedFrequency = 'Once Daily';
  bool _afterMeals = true;
  String _time = '08:00 AM';

  @override
  void dispose() {
    _nameController.dispose();
    _dosageController.dispose();
    super.dispose();
  }

  void _saveMedicine() {
    if (_formKey.currentState!.validate()) {
      final newMedicine = Medicine(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        name: _nameController.text.trim(),
        dosage: _dosageController.text.trim(),
        type: _selectedType,
        time: _time,
      );

      // Save via Global State Provider
      Provider.of<MedicineProvider>(context, listen: false).addMedicine(newMedicine);

      // Display user feedback via SnackBar
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Reminder for '${newMedicine.name}' added successfully!"),
          backgroundColor: Colors.teal,
          behavior: SnackBarBehavior.floating,
        ),
      );

      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Medicine Reminder"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(18.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                "Prescription Details",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 14),
              // Name Field with non-empty validation
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: "Medicine Name *",
                  hintText: "e.g., Paracetamol, Cetirizine",
                  prefixIcon: Icon(Icons.medication),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Medicine name cannot be empty";
                  }
                  if (value.trim().length < 3) {
                    return "Name must be at least 3 characters";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              // Dosage Field with validation
              TextFormField(
                controller: _dosageController,
                decoration: const InputDecoration(
                  labelText: "Dosage (e.g. 500mg, 10ml) *",
                  prefixIcon: Icon(Icons.fitness_center),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Dosage amount is mandatory";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              // DropdownButtonFormField for Form Factor
              DropdownButtonFormField<String>(
                value: _selectedType,
                decoration: const InputDecoration(
                  labelText: "Medicine Type / Form Factor",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.category),
                ),
                items: ['Tablet', 'Capsule', 'Syrup', 'Injection', 'Drops']
                    .map((type) => DropdownMenuItem(value: type, child: Text(type)))
                    .toList(),
                onChanged: (val) {
                  setState(() {
                    _selectedType = val!;
                  });
                },
              ),
              const SizedBox(height: 16),
              const Text("Intake Frequency (Radio Buttons):",
                  style: TextStyle(fontWeight: FontWeight.w600)),
              RadioListTile<String>(
                title: const Text("Once Daily (Morning)"),
                value: 'Once Daily',
                groupValue: _selectedFrequency,
                activeColor: Colors.teal,
                onChanged: (val) => setState(() {
                  _selectedFrequency = val!;
                  _time = '08:00 AM';
                }),
              ),
              RadioListTile<String>(
                title: const Text("Twice Daily (Morning & Night)"),
                value: 'Twice Daily',
                groupValue: _selectedFrequency,
                activeColor: Colors.teal,
                onChanged: (val) => setState(() {
                  _selectedFrequency = val!;
                  _time = '08:00 AM & 08:00 PM';
                }),
              ),
              CheckboxListTile(
                title: const Text("Take strictly after meals"),
                value: _afterMeals,
                activeColor: Colors.teal,
                onChanged: (val) => setState(() => _afterMeals = val ?? true),
              ),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: _saveMedicine,
                icon: const Icon(Icons.save),
                label: const Text("Save Medicine Reminder"),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
