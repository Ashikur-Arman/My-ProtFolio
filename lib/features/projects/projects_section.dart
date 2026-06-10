import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_text_styles.dart';
import '../../data/portfolio_data.dart';
import '../../widgets/common/section_wrapper.dart';
import '../../widgets/common/tag_chip.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionWrapper(
      label: 'Work',
      title: 'Projects',
      bgColor: Colors.white.withOpacity(0.015),
      child: _ProjectsGrid(),
    );
  }
}

class _ProjectsGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final featured = projects.where((p) => p.featured).toList();
    final normal   = projects.where((p) => !p.featured).toList();
    final isWide   = MediaQuery.of(context).size.width > 700;

    return Column(
      children: [
        // Featured projects — full width
        ...featured.map((p) => Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: _ProjectCard(project: p),
            )),
        // Normal projects — 2-col on wide
        if (isWide)
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              childAspectRatio: 1.05,
            ),
            itemCount: normal.length,
            itemBuilder: (_, i) => _ProjectCard(project: normal[i]),
          )
        else
          ...normal.map((p) => Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: _ProjectCard(project: p),
              )),
      ],
    );
  }
}

class _ProjectCard extends StatefulWidget {
  final ProjectModel project;
  const _ProjectCard({required this.project});

  @override
  State<_ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<_ProjectCard> {
  bool _hovered = false;

  Future<void> _launch(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) launchUrl(uri);
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit:  (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 220),
        transform: Matrix4.translationValues(0, _hovered ? -4 : 0, 0),
        padding: const EdgeInsets.all(28),
        decoration: BoxDecoration(
          color: AppColors.surfaceCard,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: _hovered
                ? AppColors.neonPurple.withOpacity(0.4)
                : AppColors.border,
          ),
          boxShadow: _hovered
              ? [BoxShadow(
                  color: AppColors.neonPurple.withOpacity(0.08),
                  blurRadius: 24)]
              : [],
        ),
        child: Stack(
          children: [
            // Top glow bar on hover
            if (_hovered)
              Positioned(
                top: -28, left: -28, right: -28,
                child: Container(
                  height: 2,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [AppColors.neonCyan, AppColors.neonPurple],
                    ),
                    borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                  ),
                ),
              ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title row
                Row(
                  children: [
                    Text(widget.project.emoji,
                        style: const TextStyle(fontSize: 20)),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(widget.project.title,
                          style: AppTextStyles.cardTitle),
                    ),
                    if (widget.project.isPrivate)
                      const Icon(Icons.lock_outline_rounded,
                          size: 16, color: AppColors.textMuted)
                    else if (widget.project.githubUrl != null)
                      GestureDetector(
                        onTap: () => _launch(widget.project.githubUrl!),
                        child: const Icon(Icons.open_in_new_rounded,
                            size: 16, color: AppColors.neonCyan),
                      ),
                  ],
                ),
                const SizedBox(height: 12),
                // Description
                Expanded(
                  child: Text(
                    widget.project.description,
                    style: AppTextStyles.bodySm,
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(height: 12),
                // Impact
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    color: AppColors.neonPurple.withOpacity(0.06),
                    borderRadius: BorderRadius.circular(8),
                    border: Border(
                      left: BorderSide(
                          color: AppColors.neonPurple, width: 2),
                    ),
                  ),
                  child: Row(
                    children: [
                      const Text('⚡ ',
                          style: TextStyle(fontSize: 12)),
                      Expanded(
                        child: Text(
                          widget.project.impact,
                          style: AppTextStyles.bodySm
                              .copyWith(fontSize: 12),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                // Tags
                Wrap(
                  spacing: 6,
                  runSpacing: 6,
                  children: widget.project.tags
                      .map((t) =>
                          TagChip(label: t.label, color: t.color))
                      .toList(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
