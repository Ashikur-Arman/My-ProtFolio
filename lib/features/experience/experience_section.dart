import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_text_styles.dart';
import '../../data/portfolio_data.dart';
import '../../widgets/common/section_wrapper.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    final count = PortfolioData.experiences.length.toString().padLeft(2, '0');
    return SectionWrapper(
      number: '02 / Experience',
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
    final narrow = MediaQuery.of(context).size.width < 700;

    final meta = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(widget.exp.company.toUpperCase(),
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700,
                letterSpacing: 2, color: AppColors.white)),
        const SizedBox(height: 8),
        Text(widget.exp.duration,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600,
                letterSpacing: 1, color: AppColors.textQuiet)),
        const SizedBox(height: 14),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
          decoration: BoxDecoration(border: Border.all(color: const Color(0xFF2A2A2A))),
          child: Text(widget.exp.type.toUpperCase(), style: AppTextStyles.tagLabel),
        ),
      ],
    );

    final content = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(widget.exp.role,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w700,
                letterSpacing: -0.5, color: AppColors.white)),
        const SizedBox(height: 18),
        ...widget.exp.bullets.map((b) => Padding(
          padding: const EdgeInsets.only(bottom: 6),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 2, right: 16),
                child: Text('—', style: TextStyle(color: Color(0xFF444444), fontSize: 14)),
              ),
              Expanded(child: Text(b, style: AppTextStyles.body)),
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
          border: Border(
            bottom: BorderSide(
              color: _hovered ? const Color(0xFF3A3A3A) : AppColors.divider,
            ),
          ),
        ),
        child: narrow
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [meta, const SizedBox(height: 24), content],
              )
            : Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(flex: 1, child: meta),
                  const SizedBox(width: 48),
                  Expanded(flex: 3, child: content),
                ],
              ),
      ),
    );
  }
}
