import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_text_styles.dart';
import '../../data/portfolio_data.dart';
import '../../widgets/common/neon_button.dart';

class HeroSection extends StatefulWidget {
  final VoidCallback onContactTap;
  final VoidCallback onProjectsTap;

  const HeroSection({
    super.key,
    required this.onContactTap,
    required this.onProjectsTap,
  });

  @override
  State<HeroSection> createState() => _HeroSectionState();
}

class _HeroSectionState extends State<HeroSection>
    with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl;
  late final Animation<double> _fade;
  late final Animation<Offset> _slide;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );
    _fade = CurvedAnimation(parent: _ctrl, curve: Curves.easeOut);
    _slide = Tween<Offset>(
      begin: const Offset(0, 0.08),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _ctrl, curve: Curves.easeOut));
    _ctrl.forward();
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 24),
      decoration: const BoxDecoration(
        gradient: RadialGradient(
          center: Alignment(-0.6, -0.8),
          radius: 1.2,
          colors: [
            Color(0xFF0D1F3C),
            AppColors.background,
          ],
        ),
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: AppSizes.maxContentWidth),
          child: FadeTransition(
            opacity: _fade,
            child: SlideTransition(
              position: _slide,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Label
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 14, vertical: 6),
                    decoration: BoxDecoration(
                      color: AppColors.neonCyan.withOpacity(0.08),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                          color: AppColors.neonCyan.withOpacity(0.3)),
                    ),
                    child: Text(
                      '👋  Available for opportunities',
                      style: AppTextStyles.chipText,
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Name
                  ShaderMask(
                    shaderCallback: (bounds) => const LinearGradient(
                      colors: [
                        AppColors.textPrimary,
                        AppColors.neonCyan,
                      ],
                    ).createShader(bounds),
                    child: Text(
                      PortfolioData.name,
                      style: AppTextStyles.heroTitle.copyWith(
                        color: Colors.white,
                        fontSize: 48,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Role
                  Text(
                    '${PortfolioData.role}  ·  ${PortfolioData.tagline}',
                    style: AppTextStyles.heroSubtitle,
                  ),
                  const SizedBox(height: 20),

                  // Summary
                  ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 620),
                    child: Text(
                      PortfolioData.summary,
                      style: AppTextStyles.body,
                    ),
                  ),
                  const SizedBox(height: 36),

                  // CTAs
                  Wrap(
                    spacing: 16,
                    runSpacing: 12,
                    children: [
                      NeonButton(
                        label: 'View Projects',
                        onTap: widget.onProjectsTap,
                        icon: Icons.rocket_launch_rounded,
                      ),
                      NeonButton(
                        label: 'Contact Me',
                        onTap: widget.onContactTap,
                        outlined: true,
                        icon: Icons.mail_outline_rounded,
                      ),
                    ],
                  ),
                  const SizedBox(height: 56),

                  // Stats row
                  _StatsRow(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _StatsRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 32,
      runSpacing: 16,
      children: const [
        _StatItem(value: '3+', label: 'Production Apps'),
        _StatItem(value: '150+', label: 'Problems Solved'),
        _StatItem(value: '4+', label: 'Personal Projects'),
        _StatItem(value: '3.456', label: 'CGPA'),
      ],
    );
  }
}

class _StatItem extends StatelessWidget {
  final String value;
  final String label;

  const _StatItem({required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ShaderMask(
          shaderCallback: (bounds) => const LinearGradient(
            colors: [AppColors.neonCyan, AppColors.neonPurple],
          ).createShader(bounds),
          child: Text(
            value,
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w800,
              color: Colors.white,
            ),
          ),
        ),
        Text(label, style: AppTextStyles.cardSubtitle),
      ],
    );
  }
}
