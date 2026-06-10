import 'package:flutter/material.dart';
import '../../core/constants/app_text_styles.dart';
import '../../data/portfolio_data.dart';
import '../../widgets/common/neon_chip.dart';
import '../../widgets/common/section_wrapper.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionWrapper(
      label: 'Expertise', title: 'Skills',
      child: LayoutBuilder(builder: (ctx, con) {
        if (con.maxWidth > 560) {
          final half = (PortfolioData.skills.length / 2).ceil();
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: _SkillCol(
                  cats: PortfolioData.skills.sublist(0, half))),
              const SizedBox(width: 40),
              Expanded(child: _SkillCol(
                  cats: PortfolioData.skills.sublist(half))),
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
        padding: const EdgeInsets.only(bottom: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(c.cat.toUpperCase(), style: AppTextStyles.label),
            const SizedBox(height: 10),
            Wrap(
              spacing: 8, runSpacing: 8,
              children: c.skills
                  .map((s) => NeonChip(label: s, colorKey: c.color))
                  .toList(),
            ),
          ],
        ),
      )).toList(),
    );
  }
}
