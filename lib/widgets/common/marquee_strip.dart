import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_text_styles.dart';
import '../../data/portfolio_data.dart';

class MarqueeStrip extends StatefulWidget {
  const MarqueeStrip({super.key});
  @override State<MarqueeStrip> createState() => _MarqueeStripState();
}

class _MarqueeStripState extends State<MarqueeStrip>
    with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 20),
    )..repeat();
  }

  @override
  void dispose() { _ctrl.dispose(); super.dispose(); }

  @override
  Widget build(BuildContext context) {
    final tags = PortfolioData.marqueeTags;
    return Container(
      width: double.infinity,
      height: 52,
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(color: AppColors.divider),
          bottom: BorderSide(color: AppColors.divider),
        ),
      ),
      child: ClipRect(
        child: AnimatedBuilder(
          animation: _ctrl,
          builder: (context, _) {
            return LayoutBuilder(
              builder: (context, constraints) {
                // Build a wide row, then shift it left continuously.
                final row = Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    for (int rep = 0; rep < 4; rep++)
                      for (final t in tags) _MarqueeItem(text: t),
                  ],
                );
                return OverflowBox(
                  minWidth: 0, maxWidth: double.infinity,
                  alignment: Alignment.centerLeft,
                  child: Transform.translate(
                    offset: Offset(-_ctrl.value * 1600, 0),
                    child: row,
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class _MarqueeItem extends StatelessWidget {
  final String text;
  const _MarqueeItem({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(text.toUpperCase(), style: AppTextStyles.marquee),
          const SizedBox(width: 24),
          Container(
            width: 4, height: 4,
            decoration: const BoxDecoration(
              color: AppColors.textGhost, shape: BoxShape.circle,
            ),
          ),
        ],
      ),
    );
  }
}
