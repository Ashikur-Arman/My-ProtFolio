import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_text_styles.dart';
import '../../data/portfolio_data.dart';
import '../../widgets/common/glow_card.dart';
import '../../widgets/common/section_wrapper.dart';

class AchievementsSection extends StatelessWidget {
  const AchievementsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final achs = PortfolioData.achievements;
    return SectionWrapper(
      label: 'Recognition', title: 'Achievements',
      bg: AppColors.surface.withOpacity(0.25),
      child: LayoutBuilder(builder: (ctx, con) {
        final wide = con.maxWidth > 560;
        if (!wide) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: achs.map((a) => Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: _AchCard(a: a),
            )).toList(),
          );
        }
        final rows = <Widget>[];
        for (int i = 0; i < achs.length; i += 2) {
          rows.add(Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Row(
              children: [
                Expanded(child: _AchCard(a: achs[i])),
                if (i + 1 < achs.length) ...[
                  const SizedBox(width: 16),
                  Expanded(child: _AchCard(a: achs[i + 1])),
                ] else
                  const Expanded(child: SizedBox()),
              ],
            ),
          ));
        }
        return Column(mainAxisSize: MainAxisSize.min, children: rows);
      }),
    );
  }
}

class _AchCard extends StatelessWidget {
  final AchModel a;
  const _AchCard({required this.a});

  @override
  Widget build(BuildContext context) {
    return GlowCard(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      glowColor: AppColors.neonPurple,
      child: Row(
        children: [
          Text(a.icon, style: const TextStyle(fontSize: 26)),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(a.title, style: AppTextStyles.cardTitle),
                const SizedBox(height: 3),
                Text(a.sub,
                    style: AppTextStyles.bodySm.copyWith(fontSize: 12)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
