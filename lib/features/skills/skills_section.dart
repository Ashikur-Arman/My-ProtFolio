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
      number: '04 / SKILLS',
      title: 'Expertise',
      child: LayoutBuilder(builder: (ctx, con) {
        if (con.maxWidth > 700) {
          final half = (PortfolioData.skills.length / 2).ceil();
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: _SkillCol(cats: PortfolioData.skills.sublist(0, half))),
              const SizedBox(width: 64),
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
            Text(c.cat.toUpperCase(), style: AppText.skillCatLabel),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8, runSpacing: 8,
              children: c.skills.map((s) => _SkillPill(label: s)).toList(),
            ),
          ],
        ),
      )).toList(),
    );
  }
}

class _SkillPill extends StatefulWidget {
  final String label;
  const _SkillPill({required this.label});
  @override State<_SkillPill> createState() => _SkillPillState();
}
class _SkillPillState extends State<_SkillPill> {
  bool _h = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _h = true),
      onExit:  (_) => setState(() => _h = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          border: Border.all(color: _h ? AppColors.grey3 : AppColors.grey7),
        ),
        child: Text(widget.label,
          style: AppText.skillPill.copyWith(
            color: _h ? AppColors.white : AppColors.grey1,
          )),
      ),
    );
  }
}
