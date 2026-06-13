import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_text_styles.dart';
import '../../data/portfolio_data.dart';
import '../../widgets/common/section_wrapper.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    final count = PortfolioData.experiences.length
        .toString().padLeft(2, '0');

    return SectionWrapper(
      number: '02 / EXPERIENCE',
      title: 'Work History',
      count: count,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: PortfolioData.experiences
            .map((e) => _ExpItem(exp: e))
            .toList(),
      ),
    );
  }
}

class _ExpItem extends StatefulWidget {
  final ExperienceModel exp;
  const _ExpItem({required this.exp});
  @override State<_ExpItem> createState() => _ExpItemState();
}

class _ExpItemState extends State<_ExpItem> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final screenW = MediaQuery.of(context).size.width;
    final isNarrow = screenW < 700;

    final meta = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(widget.exp.company.toUpperCase(), style: AppText.expCompany),
        const SizedBox(height: 8),
        Text(widget.exp.period, style: AppText.expPeriod),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          decoration: BoxDecoration(border: Border.all(color: AppColors.grey7)),
          child: Text(widget.exp.type.toUpperCase(), style: AppText.expTag),
        ),
      ],
    );

    final content = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(widget.exp.role, style: AppText.expRole),
        const SizedBox(height: 16),
        ...widget.exp.bullets.map((b) => Padding(
          padding: const EdgeInsets.only(bottom: 6),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('— ', style: AppText.expBullet.copyWith(color: AppColors.grey5)),
              Expanded(child: Text(b, style: AppText.expBullet)),
            ],
          ),
        )),
      ],
    );

    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit:  (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(vertical: 40),
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(
            color: _hovered ? AppColors.grey5 : AppColors.grey8)),
        ),
        child: isNarrow
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [meta, const SizedBox(height: 24), content],
              )
            : IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(width: 220, child: meta),
                    const SizedBox(width: 48),
                    Expanded(child: content),
                  ],
                ),
              ),
      ),
    );
  }
}
