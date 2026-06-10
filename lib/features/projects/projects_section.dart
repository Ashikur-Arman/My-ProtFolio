import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_text_styles.dart';
import '../../data/portfolio_data.dart';
import '../../widgets/common/neon_chip.dart';
import '../../widgets/common/section_wrapper.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final featured = PortfolioData.projects.where((p) => p.featured).toList();
    final rest     = PortfolioData.projects.where((p) => !p.featured).toList();

    return SectionWrapper(
      label: 'Work', title: 'Projects',
      bg: AppColors.surface.withOpacity(0.3),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Featured — full width
          ...featured.map((p) => Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: _ProjCard(project: p),
              )),
          // Rest — 2-col on wide, 1-col on narrow
          LayoutBuilder(builder: (ctx, con) {
            final cols = con.maxWidth > 560 ? 2 : 1;
            if (cols == 1) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: rest
                    .map((p) => Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: _ProjCard(project: p),
                        ))
                    .toList(),
              );
            }
            // 2-col manual grid (no GridView inside Column)
            final rows = <Widget>[];
            for (int i = 0; i < rest.length; i += 2) {
              rows.add(Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: _ProjCard(project: rest[i])),
                    if (i + 1 < rest.length) ...[
                      const SizedBox(width: 20),
                      Expanded(child: _ProjCard(project: rest[i + 1])),
                    ] else
                      const Expanded(child: SizedBox()),
                  ],
                ),
              ));
            }
            return Column(
                mainAxisSize: MainAxisSize.min, children: rows);
          }),
        ],
      ),
    );
  }
}

class _ProjCard extends StatefulWidget {
  final ProjectModel project;
  const _ProjCard({required this.project});
  @override State<_ProjCard> createState() => _ProjCardState();
}

class _ProjCardState extends State<_ProjCard> {
  bool _hovered = false;

  Future<void> _launch(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) await launchUrl(uri);
  }

  @override
  Widget build(BuildContext context) {
    final p = widget.project;
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit:  (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 220),
        transform: Matrix4.translationValues(0, _hovered ? -4 : 0, 0),
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: AppColors.cardBg,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: _hovered
                ? AppColors.neonPurple.withOpacity(0.45)
                : AppColors.border,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Top glow line
            AnimatedContainer(
              duration: const Duration(milliseconds: 220),
              height: 2, margin: const EdgeInsets.only(bottom: 14),
              decoration: BoxDecoration(
                gradient: _hovered
                    ? const LinearGradient(
                        colors: [AppColors.neonCyan, AppColors.neonPurple])
                    : null,
                color: _hovered ? null : Colors.transparent,
                borderRadius: BorderRadius.circular(1),
              ),
            ),
            Row(
              children: [
                Text('${p.emoji} ',
                    style: const TextStyle(fontSize: 18)),
                Expanded(
                    child: Text(p.title, style: AppTextStyles.cardTitle)),
                if (p.isPrivate)
                  const Icon(Icons.lock_outline_rounded,
                      size: 15, color: AppColors.textMuted)
                else if (p.githubUrl != null)
                  GestureDetector(
                    onTap: () => _launch(p.githubUrl!),
                    child: const Icon(Icons.open_in_new_rounded,
                        size: 15, color: AppColors.neonCyan),
                  ),
              ],
            ),
            const SizedBox(height: 10),
            Text(p.desc, style: AppTextStyles.bodySm),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: AppColors.neonPurple.withOpacity(0.07),
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(8),
                  bottomRight: Radius.circular(8),
                ),
                border: const Border(
                    left: BorderSide(color: AppColors.neonPurple, width: 2)),
              ),
              child: Text('⚡ ${p.impact}',
                  style: AppTextStyles.bodySm
                      .copyWith(fontSize: 12, color: AppColors.textLight)),
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 6, runSpacing: 6,
              children: List.generate(p.tags.length,
                  (i) => NeonChip(label: p.tags[i], colorKey: p.tagColors[i])),
            ),
          ],
        ),
      ),
    );
  }
}
