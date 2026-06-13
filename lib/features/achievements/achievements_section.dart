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
      number: '05 / ACHIEVEMENTS',
      title: 'Recognition',
      bg: AppColors.surfaceAlt,
      child: LayoutBuilder(builder: (ctx, con) {
        final cols = con.maxWidth > 700 ? 2 : 1;
        final rows = <Widget>[];
        for (int i = 0; i < achs.length; i += cols) {
          final rowItems = <Widget>[];
          for (int j = 0; j < cols; j++) {
            final idx = i + j;
            if (idx < achs.length) {
              if (j > 0) rowItems.add(Container(width: 1, color: AppColors.grey8));
              rowItems.add(Expanded(
                  child: _AchItem(a: achs[idx], num: idx + 1)));
            } else if (cols == 2) {
              rowItems.add(Container(width: 1, color: AppColors.grey8));
              rowItems.add(const Expanded(child: SizedBox()));
            }
          }
          rows.add(Container(
            decoration: const BoxDecoration(
              border: Border(bottom: BorderSide(color: AppColors.grey8)),
            ),
            child: IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: rowItems,
              ),
            ),
          ));
        }
        return Column(mainAxisSize: MainAxisSize.min, children: rows);
      }),
    );
  }
}

class _AchItem extends StatefulWidget {
  final AchModel a;
  final int num;
  const _AchItem({required this.a, required this.num});
  @override State<_AchItem> createState() => _AchItemState();
}
class _AchItemState extends State<_AchItem> {
  bool _h = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _h = true),
      onExit:  (_) => setState(() => _h = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        color: _h ? AppColors.surface : AppColors.surfaceAlt,
        padding: const EdgeInsets.all(32),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(widget.num.toString().padLeft(2, '0'), style: AppText.achNum),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(widget.a.title, style: AppText.achTitle),
                  const SizedBox(height: 6),
                  Text(widget.a.sub, style: AppText.achSub),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
