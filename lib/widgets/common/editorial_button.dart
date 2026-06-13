import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_text_styles.dart';

class EditorialButton extends StatefulWidget {
  final String label;
  final VoidCallback onTap;
  final bool ghost;
  const EditorialButton({super.key, required this.label, required this.onTap, this.ghost = false});

  @override State<EditorialButton> createState() => _EditorialButtonState();
}

class _EditorialButtonState extends State<EditorialButton> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit:  (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          transform: Matrix4.translationValues(0, _hovered ? -2 : 0, 0),
          padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 15),
          decoration: widget.ghost
              ? BoxDecoration(
            border: Border.all(
              color: _hovered ? AppColors.borderHover : const Color(0xFF3A3A3A),
            ),
          )
              : BoxDecoration(
            color: _hovered ? AppColors.white.withOpacity(0.85) : AppColors.white,
          ),
          child: Text(
            widget.label,
            style: AppTextStyles.btnLabel.copyWith(
              color: widget.ghost ? AppColors.white : AppColors.background,
            ),
          ),
        ),
      ),
    );
  }
}