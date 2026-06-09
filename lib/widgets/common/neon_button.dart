import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_text_styles.dart';

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
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          decoration: widget.outlined
              ? BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(
                    color: _hovered
                        ? AppColors.neonCyan
                        : AppColors.neonCyan.withOpacity(0.5),
                  ),
                  color: _hovered
                      ? AppColors.neonCyan.withOpacity(0.08)
                      : Colors.transparent,
                )
              : BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  gradient: LinearGradient(
                    colors: _hovered
                        ? [AppColors.neonCyan, AppColors.neonPurple]
                        : [
                            AppColors.neonCyan.withOpacity(0.8),
                            AppColors.neonPurple.withOpacity(0.8),
                          ],
                  ),
                  boxShadow: _hovered
                      ? [
                          BoxShadow(
                            color: AppColors.neonCyan.withOpacity(0.3),
                            blurRadius: 16,
                          )
                        ]
                      : [],
                ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (widget.icon != null) ...[
                Icon(
                  widget.icon,
                  size: 16,
                  color: widget.outlined
                      ? AppColors.neonCyan
                      : AppColors.background,
                ),
                const SizedBox(width: 8),
              ],
              Text(
                widget.label,
                style: AppTextStyles.chipText.copyWith(
                  color: widget.outlined
                      ? AppColors.neonCyan
                      : AppColors.background,
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
