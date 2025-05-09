// tab_widget.dart
import 'package:flutter/material.dart';

class TabWidget extends StatelessWidget {
  final String label;
  final bool isSelected;

  const TabWidget({
    super.key,
    required this.label,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xFFDCF763) : Colors.grey[300],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 12,
          color: isSelected ? Colors.black : Colors.grey[800],
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
