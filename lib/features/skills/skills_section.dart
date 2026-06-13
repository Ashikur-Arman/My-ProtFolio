import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_text_styles.dart';
import '../../data/portfolio_data.dart';
import '../../widgets/common/section_wrapper.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionWrapper(
      number: '04 / Skills',
      title: 'Expertise',
      child: LayoutBuilder(builder: (ctx, con) {
        if (con.maxWidth > 700) {
          final half = (PortfolioData.skills.length / 2).ceil();
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: _SkillCol(cats: PortfolioData.skills.sublist(0, half))),
              const SizedBox(width: 56),
              Expanded(child: _SkillCol(cats: PortfolioData.skills.sublist(half))),
            ],
          );
        }
        return _SkillCol(cats: PortfolioData.skills);
      }),
    );
  }
}

class _SkillCol extends StatelessWidget {
  final List<SkillCatModel> cats;
  const _SkillCol({required this.cats});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: cats.map((c) => Padding(
        padding: const EdgeInsets.only(bottom: 36),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(c.cat.toUpperCase(), style: AppTextStyles.sectionNum),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8, runSpacing: 8,
              children: c.skills.map((s) => Container(
                padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 9),
                decoration: BoxDecoration(border: Border.all(color: AppColors.border)),
                child: Text(s, style: const TextStyle(
                    fontSize: 13, fontWeight: FontWeight.w600,
                    color: AppColors.textSecondary)),
              )).toList(),
            ),
          ],
        ),
      )).toList(),
    );
  }
}
