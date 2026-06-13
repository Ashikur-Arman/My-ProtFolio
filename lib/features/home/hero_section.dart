import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_text_styles.dart';
import '../../data/portfolio_data.dart';
import '../../widgets/common/editorial_button.dart';
import '../../widgets/common/marquee_strip.dart';
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
    final showRight = screenW > 880;
    final narrow = screenW < 700;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: double.infinity,
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height * 0.85,
          ),
          color: AppColors.background,
          child: Stack(
            children: [
              // Giant background "AA"
              Positioned(
                right: -30,
                top: 0, bottom: 0,
                child: IgnorePointer(
                  child: Center(
                    child: Text(
                      'AA',
                      style: AppTextStyles.heroName(size: 340).copyWith(
                        color: AppColors.bgGiant,
                        letterSpacing: -16,
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: AppSizes.maxWidth),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: hPad, vertical: 72),
                    child: FadeTransition(
                      opacity: _fade,
                      child: SlideTransition(
                        position: _slide,
                        child: narrow
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  _LeftContent(narrow: true,
                                      onProjectsTap: widget.onProjectsTap,
                                      onContactTap: widget.onContactTap),
                                  const SizedBox(height: 48),
                                  _TechPanel(),
                                ],
                              )
                            : Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    flex: 7,
                                    child: _LeftContent(narrow: false,
                                        onProjectsTap: widget.onProjectsTap,
                                        onContactTap: widget.onContactTap),
                                  ),
                                  if (showRight) ...[
                                    const SizedBox(width: 56),
                                    Expanded(
                                      flex: 4,
                                      child: _TechPanel(),
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
        ),
        const MarqueeStrip(),
      ],
    );
  }
}

class _LeftContent extends StatelessWidget {
  final bool narrow;
  final VoidCallback onProjectsTap;
  final VoidCallback onContactTap;
  const _LeftContent({required this.narrow, required this.onProjectsTap, required this.onContactTap});

  @override
  Widget build(BuildContext context) {
    final nameSize = narrow ? 48.0 : 80.0;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Container(width: 32, height: 1, color: const Color(0xFF444444)),
            const SizedBox(width: 10),
            Text('FLUTTER APP DEVELOPER', style: AppTextStyles.heroLabel),
          ],
        ),
        const SizedBox(height: 28),
        RichText(
          text: TextSpan(children: [
            TextSpan(text: 'Md. Ashikur\n', style: AppTextStyles.heroName(size: nameSize)),
            TextSpan(text: 'Arman', style: AppTextStyles.heroNameItalic(size: nameSize)),
          ]),
        ),
        const SizedBox(height: 24),
        const TypewriterText(),
        const SizedBox(height: 20),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 540),
          child: Text(PortfolioData.summary, style: AppTextStyles.body),
        ),
        const SizedBox(height: 40),
        Wrap(
          spacing: 14, runSpacing: 12,
          children: [
            EditorialButton(label: 'VIEW PROJECTS', onTap: onProjectsTap),
            EditorialButton(label: 'CONTACT ME', onTap: onContactTap, ghost: true),
          ],
        ),
        const SizedBox(height: 56),
        Wrap(
          spacing: 48, runSpacing: 20,
          children: PortfolioData.stats.map((s) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(s.value, style: AppTextStyles.statValue),
              const SizedBox(height: 4),
              Text(s.label.toUpperCase(), style: AppTextStyles.statLabel),
            ],
          )).toList(),
        ),
      ],
    );
  }
}

class _TechPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 360),
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: AppColors.surfaceCard,
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.only(bottom: 16),
            decoration: const BoxDecoration(
              border: Border(bottom: BorderSide(color: AppColors.divider)),
            ),
            width: double.infinity,
            child: Text('TECH STACK', style: AppTextStyles.tagLabel.copyWith(
                color: AppColors.textTertiary, letterSpacing: 3, fontSize: 11)),
          ),
          const SizedBox(height: 4),
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
    final pctLabel = '${(t.pct * 100).round()}%';
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 13),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Color(0xFF161616))),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(t.name,
                style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600,
                    color: AppColors.textBright)),
          ),
          SizedBox(
            width: 72, height: 3,
            child: Stack(
              children: [
                Container(color: AppColors.border),
                FractionallySizedBox(
                  widthFactor: t.pct,
                  child: Container(color: AppColors.white),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          SizedBox(
            width: 32,
            child: Text(pctLabel,
                textAlign: TextAlign.right,
                style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600,
                    color: AppColors.textFaint)),
          ),
        ],
      ),
    );
  }
}
