import 'package:flutter/material.dart';

class StatusBadge extends StatelessWidget {
  final String status;

  const StatusBadge({required this.status});

  Color getColor() {
    switch (status) {
      case "Pending":
        return Colors.orange;
      case "Produksi":
        return Colors.blue;
      case "Selesai":
        return Colors.green;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: getColor().withOpacity(0.2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        status,
        style: TextStyle(
          color: getColor(),
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}