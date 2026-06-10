import 'package:flutter/material.dart';
import '../../core/constants/app_text_styles.dart';
import '../../data/portfolio_data.dart';
import '../../widgets/common/section_wrapper.dart';
import '../../widgets/common/tag_chip.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width > 700;
    return SectionWrapper(
      label: 'Expertise',
      title: 'Skills',
      child: isWide ? _WideLayout() : _NarrowLayout(),
    );
  }
}

class _WideLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final half = (skillCategories.length / 2).ceil();
    final left  = skillCategories.sublist(0, half);
    final right = skillCategories.sublist(half);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: _CategoryList(items: left)),
        const SizedBox(width: 48),
        Expanded(child: _CategoryList(items: right)),
      ],
    );
  }
}

class _NarrowLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) =>
      _CategoryList(items: skillCategories);
}

class _CategoryList extends StatelessWidget {
  final List<SkillCategory> items;
  const _CategoryList({required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: items
          .map((cat) => Padding(
                padding: const EdgeInsets.only(bottom: 28),
                child: _SkillCategoryRow(category: cat),
              ))
          .toList(),
    );
  }
}

class _SkillCategoryRow extends StatelessWidget {
  final SkillCategory category;
  const _SkillCategoryRow({required this.category});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          category.label.toUpperCase(),
          style: AppTextStyles.chip.copyWith(
            letterSpacing: 2,
            fontSize: 11,
          ),
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: category.skills
              .map((s) => _HoverChip(name: s.name, color: s.color))
              .toList(),
        ),
      ],
    );
  }
}

class _HoverChip extends StatefulWidget {
  final String name;
  final Color color;
  const _HoverChip({required this.name, required this.color});

  @override
  State<_HoverChip> createState() => _HoverChipState();
}

class _HoverChipState extends State<_HoverChip> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit:  (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        transform: Matrix4.translationValues(0, _hovered ? -2 : 0, 0),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
        decoration: BoxDecoration(
          color: widget.color.withOpacity(_hovered ? 0.12 : 0.05),
          borderRadius: BorderRadius.circular(100),
          border: Border.all(
            color: widget.color.withOpacity(_hovered ? 0.5 : 0.25),
          ),
        ),
        child: Text(
          widget.name,
          style: AppTextStyles.chip.copyWith(
            color: widget.color,
            fontSize: 13,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
