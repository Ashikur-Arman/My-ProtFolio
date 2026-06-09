import 'package:flutter/material.dart';
import '../core/constants/app_colors.dart';
import '../core/constants/app_text_styles.dart';
import '../features/home/hero_section.dart';
import '../features/experience/experience_section.dart';
import '../features/projects/projects_section.dart';
import '../features/skills/skills_section.dart';
import '../features/achievements/achievements_section.dart';
import '../features/contact/contact_section.dart';

class PortfolioPage extends StatefulWidget {
  const PortfolioPage({super.key});

  @override
  State<PortfolioPage> createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> {
  final ScrollController _scrollCtrl = ScrollController();

  // Section keys for scroll-to
  final _heroKey = GlobalKey();
  final _expKey = GlobalKey();
  final _projectsKey = GlobalKey();
  final _skillsKey = GlobalKey();
  final _achievementsKey = GlobalKey();
  final _contactKey = GlobalKey();

  int _activeNav = 0;

  void _scrollTo(GlobalKey key, int index) {
    setState(() => _activeNav = index);
    final ctx = key.currentContext;
    if (ctx != null) {
      Scrollable.ensureVisible(
        ctx,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  void dispose() {
    _scrollCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          // ── NAV BAR ──
          _NavBar(
            activeIndex: _activeNav,
            onTap: (i) {
              final keys = [
                _heroKey,
                _expKey,
                _projectsKey,
                _skillsKey,
                _achievementsKey,
                _contactKey,
              ];
              _scrollTo(keys[i], i);
            },
          ),

          // ── CONTENT ──
          Expanded(
            child: SingleChildScrollView(
              controller: _scrollCtrl,
              child: Column(
                children: [
                  KeyedSubtree(
                    key: _heroKey,
                    child: HeroSection(
                      onContactTap: () => _scrollTo(_contactKey, 5),
                      onProjectsTap: () => _scrollTo(_projectsKey, 2),
                    ),
                  ),
                  KeyedSubtree(
                    key: _expKey,
                    child: const ExperienceSection(),
                  ),
                  KeyedSubtree(
                    key: _projectsKey,
                    child: const ProjectsSection(),
                  ),
                  KeyedSubtree(
                    key: _skillsKey,
                    child: const SkillsSection(),
                  ),
                  KeyedSubtree(
                    key: _achievementsKey,
                    child: const AchievementsSection(),
                  ),
                  KeyedSubtree(
                    key: _contactKey,
                    child: const ContactSection(),
                  ),
                  const _Footer(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ── NAV BAR ──────────────────────────────────────────────────

class _NavBar extends StatelessWidget {
  final int activeIndex;
  final void Function(int) onTap;

  const _NavBar({required this.activeIndex, required this.onTap});

  static const _items = [
    'Home',
    'Experience',
    'Projects',
    'Skills',
    'Achievements',
    'Contact',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      decoration: BoxDecoration(
        color: AppColors.surface.withOpacity(0.9),
        border: const Border(
          bottom: BorderSide(color: AppColors.border),
        ),
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: AppSizes.maxContentWidth),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              children: [
                // Logo
                ShaderMask(
                  shaderCallback: (b) => const LinearGradient(
                    colors: [AppColors.neonCyan, AppColors.neonPurple],
                  ).createShader(b),
                  child: const Text(
                    'AA.',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                    ),
                  ),
                ),
                const Spacer(),
                // Nav items (hide on small screens)
                if (MediaQuery.of(context).size.width > 600)
                  ..._items.asMap().entries.map(
                        (e) => _NavItem(
                          label: e.value,
                          isActive: activeIndex == e.key,
                          onTap: () => onTap(e.key),
                        ),
                      ),
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

  const _NavItem(
      {required this.label, required this.isActive, required this.onTap});

  @override
  State<_NavItem> createState() => _NavItemState();
}

class _NavItemState extends State<_NavItem> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.label,
                style: AppTextStyles.cardSubtitle.copyWith(
                  color: widget.isActive || _hovered
                      ? AppColors.neonCyan
                      : AppColors.textSecondary,
                  fontWeight: widget.isActive
                      ? FontWeight.w600
                      : FontWeight.w400,
                ),
              ),
              const SizedBox(height: 2),
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                height: 2,
                width: widget.isActive ? 20 : 0,
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

// ── FOOTER ───────────────────────────────────────────────────

class _Footer extends StatelessWidget {
  const _Footer();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 24),
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: AppColors.border)),
      ),
      child: Text(
        '© 2026 Md. Ashikur Arman — Built with Flutter ❤️',
        style: AppTextStyles.cardSubtitle.copyWith(fontSize: 12),
        textAlign: TextAlign.center,
      ),
    );
  }
}
