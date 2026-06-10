import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_text_styles.dart';
import '../../data/portfolio_data.dart';
import '../../widgets/common/section_wrapper.dart';

class AchievementsSection extends StatelessWidget {
  const AchievementsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width > 700;
    return SectionWrapper(
      label: 'Recognition',
      title: 'Achievements',
      bgColor: Colors.white.withOpacity(0.015),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: isWide ? 2 : 1,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: isWide ? 3.8 : 4.5,
        ),
        itemCount: achievements.length,
        itemBuilder: (_, i) => _AchCard(model: achievements[i]),
      ),
    );
  }
}

class _AchCard extends StatefulWidget {
  final AchievementModel model;
  const _AchCard({required this.model});

  @override
  State<_AchCard> createState() => _AchCardState();
}

class _AchCardState extends State<_AchCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit:  (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        decoration: BoxDecoration(
          color: AppColors.surfaceCard,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: _hovered
                ? AppColors.neonPurple.withOpacity(0.35)
                : AppColors.border,
          ),
        ),
        child: Row(
          children: [
            Text(widget.model.emoji,
                style: const TextStyle(fontSize: 28)),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(widget.model.title,
                      style: AppTextStyles.cardTitle),
                  const SizedBox(height: 4),
                  Text(widget.model.subtitle,
                      style: AppTextStyles.bodySm,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
