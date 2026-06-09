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
    return Container(
      color: AppColors.surface.withOpacity(0.3),
      child: SectionWrapper(
        label: 'Recognition',
        title: 'Achievements',
        child: LayoutBuilder(
          builder: (context, constraints) {
            final crossAxis = constraints.maxWidth > 600 ? 2 : 1;
            return GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxis,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 3.2,
              ),
              itemCount: PortfolioData.achievements.length,
              itemBuilder: (_, i) =>
                  _AchievementCard(achievement: PortfolioData.achievements[i]),
            );
          },
        ),
      ),
    );
  }
}

class _AchievementCard extends StatelessWidget {
  final AchievementModel achievement;

  const _AchievementCard({required this.achievement});

  @override
  Widget build(BuildContext context) {
    return GlowCard(
      padding: const EdgeInsets.all(20),
      glowColor: AppColors.neonPurple,
      child: Row(
        children: [
          Text(achievement.icon, style: const TextStyle(fontSize: 28)),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(achievement.title, style: AppTextStyles.cardTitle),
                const SizedBox(height: 4),
                Text(
                  achievement.subtitle,
                  style: AppTextStyles.cardSubtitle,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
