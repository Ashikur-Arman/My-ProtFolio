import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';

class GlowCard extends StatefulWidget {
  final Widget child;
  final EdgeInsetsGeometry padding;
  final Color glowColor;
  final BorderRadius? borderRadius;

  const GlowCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(28),
    this.glowColor = AppColors.neonCyan,
    this.borderRadius,
  });

  @override
  State<GlowCard> createState() => _GlowCardState();
}

class _GlowCardState extends State<GlowCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final br = widget.borderRadius ?? BorderRadius.circular(16);
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit:  (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 220),
        curve: Curves.easeOut,
        padding: widget.padding,
        decoration: BoxDecoration(
          color: AppColors.surfaceCard,
          borderRadius: br,
          border: Border.all(
            color: _hovered
                ? widget.glowColor.withOpacity(0.45)
                : AppColors.border,
          ),
          boxShadow: _hovered
              ? [BoxShadow(color: widget.glowColor.withOpacity(0.12), blurRadius: 28, spreadRadius: 2)]
              : [],
        ),
        child: widget.child,
      ),
    );
  }
}
