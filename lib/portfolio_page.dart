import 'package:flutter/material.dart';
import 'core/constants/app_colors.dart';
import 'core/constants/app_text_styles.dart';
import 'features/hero/hero_section.dart';
import 'features/experience/experience_section.dart';
import 'features/projects/projects_section.dart';
import 'features/skills/skills_section.dart';
import 'features/achievements/achievements_section.dart';
import 'features/contact/contact_section.dart';

class PortfolioPage extends StatefulWidget {
  const PortfolioPage({super.key});

  @override
  State<PortfolioPage> createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> {
  final _scrollCtrl = ScrollController();

  final _heroKey         = GlobalKey();
  final _expKey          = GlobalKey();
  final _projectsKey     = GlobalKey();
  final _skillsKey       = GlobalKey();
  final _achievementsKey = GlobalKey();
  final _contactKey      = GlobalKey();

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

  List<GlobalKey> get _keys => [
    _heroKey, _expKey, _projectsKey,
    _skillsKey, _achievementsKey, _contactKey,
  ];

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
          // Sticky navbar
          _NavBar(
            activeIndex: _activeNav,
            onTap: (i) => _scrollTo(_keys[i], i),
          ),
          // Scrollable content
          Expanded(
            child: SingleChildScrollView(
              controller: _scrollCtrl,
              child: Column(
                children: [
                  KeyedSubtree(
                    key: _heroKey,
                    child: HeroSection(
                      onContact:  () => _scrollTo(_contactKey, 5),
                      onProjects: () => _scrollTo(_projectsKey, 2),
                    ),
                  ),
                  KeyedSubtree(key: _expKey,
                      child: const ExperienceSection()),
                  KeyedSubtree(key: _projectsKey,
                      child: const ProjectsSection()),
                  KeyedSubtree(key: _skillsKey,
                      child: const SkillsSection()),
                  KeyedSubtree(key: _achievementsKey,
                      child: const AchievementsSection()),
                  KeyedSubtree(key: _contactKey,
                      child: const ContactSection()),
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

// ── NAVBAR ───────────────────────────────────────────────────

class _NavBar extends StatelessWidget {
  final int activeIndex;
  final void Function(int) onTap;

  const _NavBar({required this.activeIndex, required this.onTap});

  static const _labels = [
    'Home', 'Experience', 'Projects', 'Skills', 'Achievements', 'Contact',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70, // AppSizes.navHeight এর জায়গায় ডিরেক্ট হাইট দেওয়া হয়েছে যদি AppSizes মিসিং থাকে
      decoration: BoxDecoration(
        color: AppColors.background.withOpacity(0.9),
        border: Border(
          bottom: BorderSide(color: AppColors.neonCyan.withOpacity(0.08)),
        ),
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200), // AppSizes.maxWidth এর ব্যাকআপ
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 48),
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
                      fontSize: 20, fontWeight: FontWeight.w800, color: Colors.white,
                    ),
                  ),
                ),
                const Spacer(),
                // Nav items
                if (MediaQuery.of(context).size.width > 600)
                  ..._labels.asMap().entries.map(
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

  const _NavItem({
    required this.label, required this.isActive, required this.onTap,
  });

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
            children: [
              Text(
                widget.label,
                style: TextStyle(
                  fontSize: 14,
                  color: active ? AppColors.neonCyan : Colors.grey, // AppTextStyles.navItem ও AppColors.textMuted এর ব্যাকআপ ফিক্স
                  fontWeight: widget.isActive ? FontWeight.w600 : FontWeight.w400,
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
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 48),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: Colors.white.withOpacity(0.1)), // AppColors.border এর ব্যাকআপ ফিক্স
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '© 2026 Md. Ashikur Arman',
            style: AppTextStyles.bodySm.copyWith(fontSize: 12, color: Colors.grey), // AppTextStyles.footerText এর ফিক্স
          ),
          Text(
            'Built with Flutter ❤️',
            style: AppTextStyles.bodySm.copyWith(fontSize: 12, color: Colors.grey), // AppTextStyles.footerText এর ফিক্স
          ),
        ],
      ),
    );
  }
}