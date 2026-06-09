import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_text_styles.dart';
import '../../data/portfolio_data.dart';
import '../../widgets/common/neon_chip.dart';
import '../../widgets/common/section_wrapper.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionWrapper(
      label: 'Expertise',
      title: 'Skills',
      child: Column(
        children: PortfolioData.skills
            .map((cat) => Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: _SkillRow(category: cat),
                ))
            .toList(),
      ),
    );
  }
}

class _SkillRow extends StatelessWidget {
  final SkillCategoryModel category;

  const _SkillRow({required this.category});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 160,
          child: Text(
            category.category,
            style: AppTextStyles.cardSubtitle.copyWith(
              color: AppColors.textSecondary,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Wrap(
            spacing: 8,
            runSpacing: 8,
            children: category.skills
                .map((s) => NeonChip(
                      label: s,
                      color: _colorFor(category.category),
                    ))
                .toList(),
          ),
        ),
      ],
    );
  }

  Color _colorFor(String cat) {
    switch (cat) {
      case 'Mobile Development':
        return AppColors.neonCyan;
      case 'State Management':
        return AppColors.neonPurple;
      case 'Backend / Cloud':
        return AppColors.neonGreen;
      case 'API Integration':
        return const Color(0xFFFF9F43);
      case 'Software Engineering':
        return const Color(0xFFFF6B9D);
      default:
        return AppColors.neonCyan;
    }
  }
}
