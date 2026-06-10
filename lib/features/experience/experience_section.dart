import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_text_styles.dart';
import '../../data/portfolio_data.dart';
import '../../widgets/common/section_wrapper.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionWrapper(
      label: 'Career',
      title: 'Experience',
      child: _Timeline(),
    );
  }
}

class _Timeline extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Vertical line
          Column(
            children: [
              Container(
                width: 12,
                height: 12,
                margin: const EdgeInsets.only(top: 28),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.neonCyan,
                  boxShadow: [
                    BoxShadow(
                        color: AppColors.neonCyan.withOpacity(0.5),
                        blurRadius: 10)
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  width: 2,
                  margin: const EdgeInsets.symmetric(vertical: 4),
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [AppColors.neonCyan, Color(0x337C3AED)],
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(width: 28),
          // Cards
          Expanded(
            child: Column(
              children: experiences
                  .map((e) => Padding(
                        padding: const EdgeInsets.only(bottom: 24),
                        child: _ExpCard(exp: e),
                      ))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class _ExpCard extends StatefulWidget {
  final ExperienceModel exp;
  const _ExpCard({required this.exp});

  @override
  State<_ExpCard> createState() => _ExpCardState();
}

class _ExpCardState extends State<_ExpCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit:  (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        transform: Matrix4.translationValues(_hovered ? 4 : 0, 0, 0),
        padding: const EdgeInsets.all(28),
        decoration: BoxDecoration(
          color: AppColors.surfaceCard,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: _hovered
                ? AppColors.neonCyan.withOpacity(0.28)
                : AppColors.border,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.exp.role, style: AppTextStyles.cardTitle),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Text(
                            widget.exp.company,
                            style: AppTextStyles.bodySm.copyWith(
                              color: AppColors.neonCyan,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            '  ·  ${widget.exp.type}',
                            style: AppTextStyles.bodySm,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(
                    color: AppColors.neonGreen.withOpacity(0.08),
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(color: AppColors.neonGreen.withOpacity(0.25)),
                  ),
                  child: Text(
                    widget.exp.duration,
                    style: AppTextStyles.chip
                        .copyWith(color: AppColors.neonGreen, fontSize: 12),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            // Bullets
            ...widget.exp.bullets.map(
              (b) => Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 6, right: 10),
                      child: Text('▸',
                          style: TextStyle(
                              color: AppColors.neonCyan, fontSize: 13)),
                    ),
                    Expanded(child: Text(b, style: AppTextStyles.body)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
