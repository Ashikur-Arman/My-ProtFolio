import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_text_styles.dart';
import '../../data/portfolio_data.dart';
import '../../widgets/common/typewriter_text.dart';
import '../../widgets/common/marquee_strip.dart';

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
    final screenW = MediaQuery.of(context).size.width;
    final screenH = MediaQuery.of(context).size.height;
    final pad = AppSizes.pad(screenW);
    final isSmall = screenW < 700;
    final nameSize = isSmall ? 52.0 : (screenW < 1000 ? 68.0 : 88.0);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Hero content
        Container(
          width: double.infinity,
          constraints: BoxConstraints(minHeight: screenH * 0.86),
          child: Stack(
            children: [
              // Giant background "AA" — desktop only
              if (!isSmall)
                Positioned(
                  right: -20,
                  top: 0, bottom: 0,
                  child: Center(
                    child: Text(
                      'AA',
                      style: AppText.heroName.copyWith(
                        fontSize: 320,
                        color: AppColors.grey9,
                        letterSpacing: -16,
                      ),
                    ),
                  ),
                ),
              Align(
                alignment: Alignment.topCenter,
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: AppSizes.maxWidth),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: pad, vertical: 64),
                    child: FadeTransition(
                      opacity: _fade,
                      child: SlideTransition(
                        position: _slide,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            // Label
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(width: 32, height: 1, color: AppColors.grey5),
                                const SizedBox(width: 10),
                                Text('FLUTTER APP DEVELOPER',
                                    style: AppText.heroLabel),
                              ],
                            ),
                            const SizedBox(height: 32),

                            // Name
                            Text.rich(
                              TextSpan(children: [
                                TextSpan(text: 'Md. Ashikur\n',
                                    style: AppText.heroName.copyWith(fontSize: nameSize)),
                                TextSpan(text: 'Arman',
                                    style: AppText.heroNameItalic.copyWith(fontSize: nameSize)),
                              ]),
                            ),
                            const SizedBox(height: 28),

                            // Typewriter
                            const TypewriterText(),
                            const SizedBox(height: 28),

                            // Description
                            ConstrainedBox(
                              constraints: const BoxConstraints(maxWidth: 580),
                              child: Text(PortfolioData.desc, style: AppText.heroDesc),
                            ),
                            const SizedBox(height: 44),

                            // CTAs
                            Wrap(
                              spacing: 16, runSpacing: 12,
                              children: [
                                _SolidButton(
                                    label: 'View Projects', onTap: widget.onProjectsTap),
                                _GhostButton(
                                    label: 'Contact Me', onTap: widget.onContactTap),
                              ],
                            ),
                            const SizedBox(height: 64),

                            // Stats
                            Wrap(
                              spacing: 48, runSpacing: 24,
                              children: PortfolioData.stats
                                  .map((s) => _StatItem(s: s))
                                  .toList(),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        // Marquee strip
        const MarqueeStrip(),
      ],
    );
  }
}

class _SolidButton extends StatefulWidget {
  final String label;
  final VoidCallback onTap;
  const _SolidButton({required this.label, required this.onTap});
  @override State<_SolidButton> createState() => _SolidButtonState();
}
class _SolidButtonState extends State<_SolidButton> {
  bool _h = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _h = true),
      onExit:  (_) => setState(() => _h = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          transform: Matrix4.translationValues(0, _h ? -2 : 0, 0),
          padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 16),
          color: _h ? AppColors.pureWhite : AppColors.white,
          child: Text(widget.label.toUpperCase(), style: AppText.btnSolid),
        ),
      ),
    );
  }
}

class _GhostButton extends StatefulWidget {
  final String label;
  final VoidCallback onTap;
  const _GhostButton({required this.label, required this.onTap});
  @override State<_GhostButton> createState() => _GhostButtonState();
}
class _GhostButtonState extends State<_GhostButton> {
  bool _h = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _h = true),
      onExit:  (_) => setState(() => _h = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          transform: Matrix4.translationValues(0, _h ? -2 : 0, 0),
          padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 15),
          decoration: BoxDecoration(
            border: Border.all(color: _h ? AppColors.grey1 : AppColors.grey5),
          ),
          child: Text(widget.label.toUpperCase(), style: AppText.btnGhost),
        ),
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
        Text(s.value, style: AppText.statValue),
        const SizedBox(height: 6),
        Text(s.label.toUpperCase(), style: AppText.statLabel),
      ],
    );
  }
}
