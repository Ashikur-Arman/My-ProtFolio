import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_text_styles.dart';
import '../../data/portfolio_data.dart';
import '../../widgets/common/neon_button.dart';
import '../../widgets/common/typewriter_text.dart';

class HeroSection extends StatefulWidget {
  final VoidCallback onContactTap;
  final VoidCallback onProjectsTap;
  const HeroSection({super.key, required this.onContactTap, required this.onProjectsTap});
  @override State<HeroSection> createState() => _HeroSectionState();
}

class _HeroSectionState extends State<HeroSection>
    with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl;
  late final Animation<double> _fade;
  late final Animation<Offset> _slide;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(vsync: this, duration: const Duration(milliseconds: 800));
    _fade  = CurvedAnimation(parent: _ctrl, curve: Curves.easeOut);
    _slide = Tween<Offset>(begin: const Offset(0, 0.05), end: Offset.zero)
        .animate(CurvedAnimation(parent: _ctrl, curve: Curves.easeOut));
    _ctrl.forward();
  }

  @override void dispose() { _ctrl.dispose(); super.dispose(); }

  @override
  Widget build(BuildContext context) {
    final screenW  = MediaQuery.of(context).size.width;
    final hPad     = AppSizes.responsivePad(screenW);
    final showCard = screenW > 860;

    return Container(
      width: double.infinity,
      constraints: BoxConstraints(
        minHeight: MediaQuery.of(context).size.height * 0.88,
      ),
      decoration: const BoxDecoration(
        gradient: RadialGradient(
          center: Alignment(-0.6, -0.5),
          radius: 1.4,
          colors: [Color(0xFF0D1F3C), AppColors.background],
        ),
      ),
      child: Stack(
        children: [
          Positioned.fill(child: CustomPaint(painter: _GridPainter())),
          Align(
            alignment: Alignment.topCenter,
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: AppSizes.maxWidth),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: hPad, vertical: 80),
                child: FadeTransition(
                  opacity: _fade,
                  child: SlideTransition(
                    position: _slide,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // ── Left ──
                        Expanded(
                          flex: showCard ? 6 : 10,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              _PulseBadge(),
                              const SizedBox(height: 28),
                              ShaderMask(
                                shaderCallback: (b) => const LinearGradient(
                                  colors: [Colors.white, Color(0xFF94A3B8)],
                                ).createShader(b),
                                child: Text('Md. Ashikur\nArman',
                                    style: AppTextStyles.heroName),
                              ),
                              const SizedBox(height: 20),
                              const TypewriterText(),
                              const SizedBox(height: 20),
                              Text(PortfolioData.summary,
                                  style: AppTextStyles.body),
                              const SizedBox(height: 40),
                              Wrap(
                                spacing: 16, runSpacing: 14,
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
                              Wrap(
                                spacing: 48, runSpacing: 20,
                                children: PortfolioData.stats
                                    .map((s) => _StatItem(s: s))
                                    .toList(),
                              ),
                            ],
                          ),
                        ),
                        // ── Right card ──
                        if (showCard) ...[
                          const SizedBox(width: 48),
                          Expanded(
                            flex: 4,
                            child: _TechCard(),
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ── Sub widgets ──────────────────────────────────────────────────

class _GridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final p = Paint()
      ..color = AppColors.neonCyan.withOpacity(0.03)
      ..strokeWidth = 1;
    const step = 64.0;
    for (double x = 0; x < size.width; x += step) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), p);
    }
    for (double y = 0; y < size.height; y += step) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), p);
    }
  }
  @override bool shouldRepaint(_) => false;
}

class _PulseBadge extends StatefulWidget {
  @override State<_PulseBadge> createState() => _PulseBadgeState();
}
class _PulseBadgeState extends State<_PulseBadge>
    with SingleTickerProviderStateMixin {
  late final AnimationController _c;
  @override void initState() {
    super.initState();
    _c = AnimationController(vsync: this, duration: const Duration(seconds: 2))
      ..repeat(reverse: true);
  }
  @override void dispose() { _c.dispose(); super.dispose(); }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.neonCyan.withOpacity(0.06),
        borderRadius: BorderRadius.circular(100),
        border: Border.all(color: AppColors.neonCyan.withOpacity(0.2)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          FadeTransition(
            opacity: _c,
            child: Container(
              width: 7, height: 7,
              decoration: BoxDecoration(
                color: AppColors.neonCyan, shape: BoxShape.circle,
                boxShadow: [BoxShadow(color: AppColors.neonCyan, blurRadius: 6)],
              ),
            ),
          ),
          const SizedBox(width: 10),
          const Text('Available for opportunities',
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500,
                  color: AppColors.neonCyan)),
        ],
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final StatModel s;
  const _StatItem({required this.s});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        ShaderMask(
          shaderCallback: (b) => const LinearGradient(
            colors: [AppColors.neonCyan, AppColors.neonPurple],
          ).createShader(b),
          child: Text(s.value, style: AppTextStyles.statValue),
        ),
        const SizedBox(height: 4),
        Text(s.label, style: AppTextStyles.statLabel),
      ],
    );
  }
}

class _TechCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: AppColors.cardBg.withOpacity(0.9),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.neonCyan.withOpacity(0.12)),
        boxShadow: [
          BoxShadow(color: AppColors.neonCyan.withOpacity(0.04), blurRadius: 32),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('TECH STACK', style: AppTextStyles.label),
          const SizedBox(height: 18),
          ...PortfolioData.techStack.map((t) => _TechRow(t: t)),
        ],
      ),
    );
  }
}

class _TechRow extends StatelessWidget {
  final TechModel t;
  const _TechRow({required this.t});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Container(
            width: 38, height: 38,
            decoration: BoxDecoration(
              color: AppColors.neonCyan.withOpacity(0.08),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(child: Text(t.icon, style: const TextStyle(fontSize: 17))),
          ),
          const SizedBox(width: 14),
          Expanded(child: Text(t.name,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500,
                  color: AppColors.textCbd))),
          SizedBox(
            width: 80, height: 5,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(3),
              child: LinearProgressIndicator(
                value: t.pct,
                backgroundColor: AppColors.neonCyan.withOpacity(0.07),
                valueColor: const AlwaysStoppedAnimation(AppColors.neonCyan),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
