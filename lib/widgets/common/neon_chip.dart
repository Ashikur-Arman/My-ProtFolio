import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_text_styles.dart';

class NeonChip extends StatelessWidget {
  final String label;
  final String colorKey;
  const NeonChip({super.key, required this.label, this.colorKey = 'cyan'});

  Color _c() {
    switch (colorKey) {
      case 'purple': return AppColors.neonPurple;
      case 'green':  return AppColors.neonGreen;
      case 'amber':  return AppColors.neonAmber;
      case 'pink':   return AppColors.neonPink;
      default:       return AppColors.neonCyan;
    }
  }

  @override
  Widget build(BuildContext context) {
    final c = _c();
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: c.withOpacity(0.06),
        borderRadius: BorderRadius.circular(100),
        border: Border.all(color: c.withOpacity(0.25)),
      ),
      child: Text(label, style: AppTextStyles.chip.copyWith(color: c)),
    );
  }
}
