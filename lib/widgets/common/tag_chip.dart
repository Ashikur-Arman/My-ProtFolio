import 'package:flutter/material.dart';
import '../../core/constants/app_text_styles.dart';

class TagChip extends StatelessWidget {
  final String label;
  final Color color;

  const TagChip({super.key, required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.06),
        borderRadius: BorderRadius.circular(100),
        border: Border.all(color: color.withOpacity(0.25)),
      ),
      child: Text(
        label,
        style: AppTextStyles.chip.copyWith(color: color),
      ),
    );
  }
}
