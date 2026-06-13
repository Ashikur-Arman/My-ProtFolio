import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_text_styles.dart';
import '../../data/portfolio_data.dart';
import '../../widgets/common/section_wrapper.dart';

class AchievementsSection extends StatelessWidget {
  const AchievementsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final achs = PortfolioData.achievements;
    return SectionWrapper(
      number: '05 / Achievements',
      title: 'Recognition',
      alt: true,
      child: LayoutBuilder(builder: (ctx, con) {
        final wide = con.maxWidth > 700;
        if (!wide) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: _withGaps(achs.asMap().entries
                .map((e) => _AchItem(index: e.key + 1, ach: e.value))
                .toList()),
          );
        }
        final rows = <Widget>[];
        for (int i = 0; i < achs.length; i += 2) {
          rows.add(Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: _AchItem(index: i + 1, ach: achs[i])),
              const SizedBox(width: 1),
              Expanded(
                child: i + 1 < achs.length
                    ? _AchItem(index: i + 2, ach: achs[i + 1])
                    : Container(color: AppColors.surfaceAlt),
              ),
            ],
          ));
        }
        return Column(mainAxisSize: MainAxisSize.min, children: _withGaps(rows));
      }),
    );
  }

  List<Widget> _withGaps(List<Widget> items) {
    final out = <Widget>[];
    for (int i = 0; i < items.length; i++) {
      out.add(items[i]);
      if (i != items.length - 1) out.add(const SizedBox(height: 1));
    }
    return out;
  }
}

class _AchItem extends StatefulWidget {
  final int index;
  final AchModel ach;
  const _AchItem({required this.index, required this.ach});
  @override State<_AchItem> createState() => _AchItemState();
}

class _AchItemState extends State<_AchItem> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit:  (_) => setState(() => _hovered = false),
      child: Container(
        width: double.infinity,
        color: _hovered ? const Color(0xFF101010) : AppColors.background,
        padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 32),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.index.toString().padLeft(2, '0'),
                style: const TextStyle(fontSize: 32, fontWeight: FontWeight.w800,
                    letterSpacing: -2, color: Color(0xFF222222), height: 1)),
            const SizedBox(width: 24),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(widget.ach.title,
                      style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w700,
                          color: AppColors.white)),
                  const SizedBox(height: 6),
                  Text(widget.ach.sub, style: AppTextStyles.bodySm.copyWith(color: AppColors.textQuiet)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
