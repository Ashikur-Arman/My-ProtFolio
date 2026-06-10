import 'package:flutter/material.dart';
import 'core/constants/app_colors.dart';
import 'core/constants/app_text_styles.dart';
import 'features/home/hero_section.dart';
import 'features/experience/experience_section.dart';
import 'features/projects/projects_section.dart';
import 'features/skills/skills_section.dart';
import 'features/achievements/achievements_section.dart';
import 'features/contact/contact_section.dart';

class PortfolioPage extends StatefulWidget {
  const PortfolioPage({super.key});
  @override State<PortfolioPage> createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> {
  final _scroll = ScrollController();

  final _k0 = GlobalKey();
  final _k1 = GlobalKey();
  final _k2 = GlobalKey();
  final _k3 = GlobalKey();
  final _k4 = GlobalKey();
  final _k5 = GlobalKey();

  int _nav = 0;

  List<GlobalKey> get _keys => [_k0, _k1, _k2, _k3, _k4, _k5];

  void _go(int i) {
    setState(() => _nav = i);
    final ctx = _keys[i].currentContext;
    if (ctx != null) {
      Scrollable.ensureVisible(ctx,
          duration: const Duration(milliseconds: 600),
          curve: Curves.easeInOut);
    }
  }

  @override
  void dispose() { _scroll.dispose(); super.dispose(); }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      // Use PreferredSizeWidget for appBar so Scaffold handles body height correctly
      appBar: _NavBarWidget(activeIndex: _nav, onTap: _go),
      body: SingleChildScrollView(
        controller: _scroll,
        // CRITICAL: child must not be unbounded
        child: Column(
          // stretch so children fill full width without unbounded cross-axis
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            KeyedSubtree(key: _k0,
                child: HeroSection(
                  onContactTap:  () => _go(5),
                  onProjectsTap: () => _go(2),
                )),
            KeyedSubtree(key: _k1, child: const ExperienceSection()),
            KeyedSubtree(key: _k2, child: const ProjectsSection()),
            KeyedSubtree(key: _k3, child: const SkillsSection()),
            KeyedSubtree(key: _k4, child: const AchievementsSection()),
            KeyedSubtree(key: _k5, child: const ContactSection()),
            const _Footer(),
          ],
        ),
      ),
    );
  }
}

// ── NAVBAR as PreferredSizeWidget ─────────────────────────────────

class _NavBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final int activeIndex;
  final void Function(int) onTap;
  const _NavBarWidget({required this.activeIndex, required this.onTap});

  @override Size get preferredSize => const Size.fromHeight(AppSizes.navHeight);

  static const _labels = [
    'Home','Experience','Projects','Skills','Achievements','Contact',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSizes.navHeight,
      decoration: BoxDecoration(
        color: AppColors.background.withOpacity(0.92),
        border: Border(
          bottom: BorderSide(color: AppColors.neonCyan.withOpacity(0.08)),
        ),
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: AppSizes.maxWidth),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSizes.hPad),
            child: Row(
              children: [
                // Logo
                ShaderMask(
                  shaderCallback: (b) => const LinearGradient(
                    colors: [AppColors.neonCyan, AppColors.neonPurple],
                  ).createShader(b),
                  child: const Text('AA.',
                      style: TextStyle(fontSize: 20,
                          fontWeight: FontWeight.w800, color: Colors.white)),
                ),
                const Spacer(),
                if (MediaQuery.of(context).size.width > 600)
                  ..._labels.asMap().entries.map((e) => _NavItem(
                    label: e.value,
                    isActive: activeIndex == e.key,
                    onTap: () => onTap(e.key),
                  )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _NavItem extends StatefulWidget {
  final String label;
  final bool isActive;
  final VoidCallback onTap;
  const _NavItem({required this.label, required this.isActive, required this.onTap});
  @override State<_NavItem> createState() => _NavItemState();
}

class _NavItemState extends State<_NavItem> {
  bool _hovered = false;
  @override
  Widget build(BuildContext context) {
    final active = widget.isActive || _hovered;
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit:  (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(widget.label,
                style: AppTextStyles.navItem.copyWith(
                  color: active ? AppColors.neonCyan : AppColors.textMuted,
                  fontWeight: widget.isActive
                      ? FontWeight.w600 : FontWeight.w400,
                )),
              const SizedBox(height: 2),
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                height: 2, width: widget.isActive ? 20 : 0,
                decoration: BoxDecoration(
                  color: AppColors.neonCyan,
                  borderRadius: BorderRadius.circular(1),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ── FOOTER ───────────────────────────────────────────────────────

class _Footer extends StatelessWidget {
  const _Footer();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: AppSizes.hPad),
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: AppColors.border.withOpacity(0.5))),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('© 2026 Md. Ashikur Arman', style: AppTextStyles.footerText),
          Text('Built with Flutter ❤️', style: AppTextStyles.footerText),
        ],
      ),
    );
  }
}
