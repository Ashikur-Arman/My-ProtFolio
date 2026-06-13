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
      duration: const Duration(seconds: 22),
    )..repeat();
  }

  @override void dispose() { _ctrl.dispose(); super.dispose(); }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(color: AppColors.grey8),
          bottom: BorderSide(color: AppColors.grey8),
        ),
      ),
      child: ClipRect(
        child: AnimatedBuilder(
          animation: _ctrl,
          builder: (context, _) {
            return OverflowBox(
              minWidth: 0, maxWidth: double.infinity,
              alignment: Alignment.centerLeft,
              child: FractionalTranslation(
                translation: Offset(-_ctrl.value, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _itemsRow(),
                    _itemsRow(),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _itemsRow() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: PortfolioData.marqueeItems
          .map((t) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(t.toUpperCase(), style: AppText.marqueeItem),
                    const SizedBox(width: 16),
                    Container(
                      width: 4, height: 4,
                      decoration: const BoxDecoration(
                        color: AppColors.grey5, shape: BoxShape.circle),
                    ),
                  ],
                ),
              ))
          .toList(),
    );
  }
}
