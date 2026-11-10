// Experiment 5: Local State Management Using StatefulWidget and setState()
import 'package:flutter/material.dart';
import '../models/medicine.dart';

class InteractivePillItem extends StatefulWidget {
  final Medicine medicine;
  final ValueChanged<bool>? onStatusChanged;

  const InteractivePillItem({
    super.key,
    required this.medicine,
    this.onStatusChanged,
  });

  @override
  State<InteractivePillItem> createState() => _InteractivePillItemState();
}

class _InteractivePillItemState extends State<InteractivePillItem> {
  late bool _isTaken;

  @override
  void initState() {
    super.initState();
    _isTaken = widget.medicine.isTaken;
  }

  void _toggleTaken(bool? value) {
    // Calling setState to inform Flutter that local state has changed
    setState(() {
      _isTaken = value ?? false;
      widget.medicine.isTaken = _isTaken;
    });

    if (widget.onStatusChanged != null) {
      widget.onStatusChanged!(_isTaken);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: _isTaken ? Colors.green.shade50 : Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: _isTaken ? Colors.green.shade300 : Colors.grey.shade300,
        ),
      ),
      child: ListTile(
        leading: Icon(
          Icons.medication,
          color: _isTaken ? Colors.green : Colors.blueGrey,
          size: 32,
        ),
        title: Text(
          widget.medicine.name,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            decoration: _isTaken ? TextDecoration.lineThrough : null,
          ),
        ),
        subtitle: Text(
          "${widget.medicine.dosage} • ${widget.medicine.time} (${_isTaken ? 'Completed' : 'Pending'})",
        ),
        trailing: Checkbox(
          value: _isTaken,
          activeColor: Colors.green,
          onChanged: _toggleTaken,
        ),
      ),
    );
  }
}
