import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_text_styles.dart';
import '../../data/portfolio_data.dart';
import '../../widgets/common/neon_button.dart';
import '../../widgets/common/typewriter_text.dart';

class HeroSection extends StatefulWidget {
  final VoidCallback onProjects;
  final VoidCallback onContact;

  const HeroSection({
    super.key,
    required this.onProjects,
    required this.onContact,
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
        vsync: this, duration: const Duration(milliseconds: 800));
    _fade  = CurvedAnimation(parent: _ctrl, curve: Curves.easeOut);
    _slide = Tween<Offset>(begin: const Offset(0, 0.06), end: Offset.zero)
        .animate(CurvedAnimation(parent: _ctrl, curve: Curves.easeOut));
    _ctrl.forward();
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final wide = MediaQuery.of(context).size.width > 900;
    return Container(
      width: double.infinity,
      constraints: const BoxConstraints(minHeight: 700),
      decoration: const BoxDecoration(
        gradient: RadialGradient(
          center: Alignment(-0.7, -0.5),
          radius: 1.4,
          colors: [Color(0xFF0D1F3C), AppColors.background],
        ),
      ),
      child: Stack(
        children: [
          // Grid lines
          Positioned.fill(child: _GridLines()),
          // Content
          Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1100),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 80),
                child: FadeTransition(
                  opacity: _fade,
                  child: SlideTransition(
                    position: _slide,
                    child: wide
                        ? Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(child: _LeftContent(
                                onProjects: widget.onProjects,
                                onContact:  widget.onContact,
                              )),
                              const SizedBox(width: 48),
                              const _TechCard(),
                            ],
                          )
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _LeftContent(
                                onProjects: widget.onProjects,
                                onContact:  widget.onContact,
                              ),
                              const SizedBox(height: 40),
                              const _TechCard(),
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

// ── Grid background ───────────────────────────────────────────
class _GridLines extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(painter: _GridPainter());
  }
}

class _GridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF00D4FF).withOpacity(0.03)
      ..strokeWidth = 1;
    const step = 60.0;
    for (double x = 0; x < size.width; x += step) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
    }
    for (double y = 0; y < size.height; y += step) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }
  }

  @override
  bool shouldRepaint(_) => false;
}

// ── Left content ─────────────────────────────────────────────
class _LeftContent extends StatelessWidget {
  final VoidCallback onProjects;
  final VoidCallback onContact;

  const _LeftContent({required this.onProjects, required this.onContact});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Badge
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
          decoration: BoxDecoration(
            color: AppColors.neonCyan.withOpacity(0.06),
            borderRadius: BorderRadius.circular(100),
            border: Border.all(color: AppColors.neonCyan.withOpacity(0.22)),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              _PulseDot(),
              const SizedBox(width: 8),
              Text(
                'Available for opportunities',
                style: AppTextStyles.chip.copyWith(
                  color: AppColors.neonCyan,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 28),

        // Name with gradient
        ShaderMask(
          shaderCallback: (b) => const LinearGradient(
            colors: [Colors.white, Color(0xFF94A3B8)],
          ).createShader(b),
          child: Text(PersonalInfo.name, style: AppTextStyles.heroName),
        ),
        const SizedBox(height: 20),

        // Typewriter
        TypewriterText(texts: PersonalInfo.roles),
        const SizedBox(height: 24),

        // Summary
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 520),
          child: Text(PersonalInfo.summary, style: AppTextStyles.body),
        ),
        const SizedBox(height: 40),

        // CTAs
        Wrap(
          spacing: 16,
          runSpacing: 12,
          children: [
            NeonButton(
              label: 'View Projects',
              onTap: onProjects,
              icon: Icons.rocket_launch_rounded,
            ),
            NeonButton(
              label: 'Contact Me',
              onTap: onContact,
              outlined: true,
              icon: Icons.mail_outline_rounded,
            ),
          ],
        ),
        const SizedBox(height: 56),

        // Stats
        Wrap(
          spacing: 36,
          runSpacing: 20,
          children: heroStats
              .map((s) => _StatItem(value: s.value, label: s.label))
              .toList(),
        ),
      ],
    );
  }
}

// ── Pulsing dot ───────────────────────────────────────────────
class _PulseDot extends StatefulWidget {
  @override
  State<_PulseDot> createState() => _PulseDotState();
}

class _PulseDotState extends State<_PulseDot>
    with SingleTickerProviderStateMixin {
  late final AnimationController _c;

  @override
  void initState() {
    super.initState();
    _c = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 900))
      ..repeat(reverse: true);
  }

  @override
  void dispose() {
    _c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _c,
      builder: (_, __) => Opacity(
        opacity: 0.3 + 0.7 * _c.value,
        child: Container(
          width: 6,
          height: 6,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.neonCyan,
            boxShadow: [
              BoxShadow(color: AppColors.neonCyan.withOpacity(0.6), blurRadius: 6)
            ],
          ),
        ),
      ),
    );
  }
}

// ── Stat item ────────────────────────────────────────────────
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
          shaderCallback: (b) => AppColors.brandGradient.createShader(b),
          child: Text(
            value,
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w800,
              color: Colors.white,
            ),
          ),
        ),
        Text(label,
            style: AppTextStyles.bodySm.copyWith(fontSize: 12)),
      ],
    );
  }
}

// ── Floating tech card ────────────────────────────────────────
class _TechCard extends StatelessWidget {
  const _TechCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 272,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.surfaceCard.withOpacity(0.85),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.neonCyan.withOpacity(0.12)),
        boxShadow: [
          BoxShadow(
            color: AppColors.neonCyan.withOpacity(0.05),
            blurRadius: 32,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'TECH STACK',
            style: AppTextStyles.chip.copyWith(
              color: AppColors.textMuted,
              letterSpacing: 2,
              fontSize: 11,
            ),
          ),
          const SizedBox(height: 16),
          ...techStack.map((t) => _TechRow(item: t)),
        ],
      ),
    );
  }
}

class _TechRow extends StatelessWidget {
  final TechItem item;
  const _TechRow({required this.item});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 9),
      child: Row(
        children: [
          Container(
            width: 34,
            height: 34,
            decoration: BoxDecoration(
              color: AppColors.neonCyan.withOpacity(0.08),
              borderRadius: BorderRadius.circular(9),
            ),
            child: Center(child: Text(item.emoji, style: const TextStyle(fontSize: 16))),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(item.name,
                style: AppTextStyles.bodySm
                    .copyWith(color: AppColors.textCard, fontWeight: FontWeight.w500)),
          ),
          Container(
            width: 72,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.06),
              borderRadius: BorderRadius.circular(2),
            ),
            child: FractionallySizedBox(
              widthFactor: item.level,
              alignment: Alignment.centerLeft,
              child: Container(
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [AppColors.neonCyan, AppColors.neonPurple],
                  ),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
