import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';

class GlowCard extends StatefulWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final Color? glowColor;
  final VoidCallback? onTap;

  const GlowCard({
    super.key, required this.child,
    this.padding, this.glowColor, this.onTap,
  });

  @override
  State<GlowCard> createState() => _GlowCardState();
}

class _GlowCardState extends State<GlowCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final glow = widget.glowColor ?? AppColors.neonCyan;
    return MouseRegion(
      cursor: widget.onTap != null
          ? SystemMouseCursors.click : SystemMouseCursors.basic,
      onEnter: (_) => setState(() => _hovered = true),
      onExit:  (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 220),
          padding: widget.padding ?? const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: AppColors.cardBg,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: _hovered ? glow.withOpacity(0.4) : AppColors.border,
            ),
            boxShadow: _hovered
                ? [BoxShadow(color: glow.withOpacity(0.08), blurRadius: 20)]
                : [],
          ),
          child: widget.child,
        ),
      ),
    );
  }
}
