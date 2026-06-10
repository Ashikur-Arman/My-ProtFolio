import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';

class NeonButton extends StatefulWidget {
  final String label;
  final VoidCallback onTap;
  final bool outlined;
  final IconData? icon;

  const NeonButton({
    super.key,
    required this.label,
    required this.onTap,
    this.outlined = false,
    this.icon,
  });

  @override
  State<NeonButton> createState() => _NeonButtonState();
}

class _NeonButtonState extends State<NeonButton> {
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
          duration: const Duration(milliseconds: 180),
          transform: Matrix4.translationValues(0, _hovered ? -2 : 0, 0),
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 13),
          decoration: widget.outlined
              ? BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(
                    color: _hovered
                        ? AppColors.neonCyan
                        : AppColors.neonCyan.withOpacity(0.35),
                  ),
                  color: _hovered ? AppColors.neonCyan.withOpacity(0.07) : Colors.transparent,
                )
              : BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  gradient: LinearGradient(
                    colors: [
                      AppColors.neonCyan.withOpacity(_hovered ? 1 : 0.9),
                      AppColors.neonPurple.withOpacity(_hovered ? 1 : 0.9),
                    ],
                  ),
                  boxShadow: _hovered
                      ? [BoxShadow(color: AppColors.neonCyan.withOpacity(0.28), blurRadius: 18)]
                      : [],
                ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (widget.icon != null) ...[
                Icon(widget.icon, size: 16,
                    color: widget.outlined ? AppColors.neonCyan : AppColors.background),
                const SizedBox(width: 8),
              ],
              Text(
                widget.label,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: widget.outlined ? AppColors.neonCyan : AppColors.background,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
