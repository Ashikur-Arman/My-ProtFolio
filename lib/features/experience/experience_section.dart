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
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Timeline bar — fixed width, not intrinsic
          SizedBox(
            width: 24,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 12, height: 12,
                  decoration: BoxDecoration(
                    color: AppColors.neonCyan, shape: BoxShape.circle,
                    boxShadow: [BoxShadow(
                        color: AppColors.neonCyan.withOpacity(0.5), blurRadius: 8)],
                  ),
                ),
                Container(
                  width: 2,
                  height: PortfolioData.experiences.length * 180.0,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [AppColors.neonCyan, Color(0x337C3AED)],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 24),
          // Cards
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: PortfolioData.experiences
                  .map((e) => Padding(
                        padding: const EdgeInsets.only(bottom: 20),
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
  @override State<_ExpCard> createState() => _ExpCardState();
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
        child: GlowCard(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(widget.exp.role,
                            style: AppTextStyles.cardTitle
                                .copyWith(fontSize: 17)),
                        const SizedBox(height: 4),
                        Text(
                          '${widget.exp.company}  ·  ${widget.exp.type}',
                          style: AppTextStyles.body.copyWith(
                              color: AppColors.neonCyan,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 12),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 4),
                    decoration: BoxDecoration(
                      color: AppColors.neonGreen.withOpacity(0.08),
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(
                          color: AppColors.neonGreen.withOpacity(0.2)),
                    ),
                    child: Text(widget.exp.duration,
                        style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: AppColors.neonGreen)),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              ...widget.exp.bullets.map(
                (b) => Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 2, right: 10),
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
      ),
    );
  }
}
