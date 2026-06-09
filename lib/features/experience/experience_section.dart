import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_text_styles.dart';
import '../../data/portfolio_data.dart';
import '../../widgets/common/glow_card.dart';
import '../../widgets/common/section_wrapper.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionWrapper(
      label: 'Career',
      title: 'Experience',
      child: Column(
        children: PortfolioData.experiences
            .map((e) => Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: _ExperienceCard(exp: e),
                ))
            .toList(),
      ),
    );
  }
}

class _ExperienceCard extends StatelessWidget {
  final ExperienceModel exp;

  const _ExperienceCard({required this.exp});

  @override
  Widget build(BuildContext context) {
    return GlowCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Left accent bar
              Container(
                width: 3,
                height: 48,
                margin: const EdgeInsets.only(right: 16),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [AppColors.neonCyan, AppColors.neonPurple],
                  ),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(exp.role, style: AppTextStyles.cardTitle),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 3),
                          decoration: BoxDecoration(
                            color: AppColors.neonGreen.withOpacity(0.08),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                                color: AppColors.neonGreen.withOpacity(0.3)),
                          ),
                          child: Text(
                            exp.type,
                            style: AppTextStyles.chipText
                                .copyWith(color: AppColors.neonGreen),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Text(
                          exp.company,
                          style: AppTextStyles.cardSubtitle.copyWith(
                            color: AppColors.neonCyan,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Text(
                          exp.duration,
                          style: AppTextStyles.cardSubtitle,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          ...exp.bullets.map(
            (b) => Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 6, right: 10),
                    child: CircleAvatar(
                      radius: 3,
                      backgroundColor: AppColors.neonCyan,
                    ),
                  ),
                  Expanded(
                    child: Text(b, style: AppTextStyles.body),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
