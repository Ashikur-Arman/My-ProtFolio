import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_text_styles.dart';
import '../../data/portfolio_data.dart';
import '../../widgets/common/glow_card.dart';
import '../../widgets/common/neon_chip.dart';
import '../../widgets/common/section_wrapper.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.surface.withOpacity(0.4),
      child: SectionWrapper(
        label: 'Work',
        title: 'Projects',
        child: LayoutBuilder(
          builder: (context, constraints) {
            final crossAxis = constraints.maxWidth > 600 ? 2 : 1;
            return GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxis,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: crossAxis == 2 ? 1.1 : 1.5,
              ),
              itemCount: PortfolioData.projects.length,
              itemBuilder: (_, i) =>
                  _ProjectCard(project: PortfolioData.projects[i]),
            );
          },
        ),
      ),
    );
  }
}

class _ProjectCard extends StatelessWidget {
  final ProjectModel project;

  const _ProjectCard({required this.project});

  Future<void> _launch(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) await launchUrl(uri);
  }

  @override
  Widget build(BuildContext context) {
    return GlowCard(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(project.title, style: AppTextStyles.cardTitle),
              ),
              if (project.isPrivate)
                const Icon(Icons.lock_outline_rounded,
                    size: 16, color: AppColors.textMuted)
              else if (project.githubUrl != null)
                InkWell(
                  onTap: () => _launch(project.githubUrl!),
                  child: const Icon(Icons.open_in_new_rounded,
                      size: 16, color: AppColors.neonCyan),
                ),
            ],
          ),
          const SizedBox(height: 8),
          Expanded(
            child: Text(
              project.description,
              style: AppTextStyles.cardSubtitle,
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(height: 8),
          // Impact
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppColors.neonPurple.withOpacity(0.06),
              borderRadius: BorderRadius.circular(8),
              border:
                  Border.all(color: AppColors.neonPurple.withOpacity(0.2)),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('⚡ ', style: TextStyle(fontSize: 12)),
                Expanded(
                  child: Text(
                    project.impact,
                    style: AppTextStyles.cardSubtitle.copyWith(fontSize: 12),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          // Tags
          Wrap(
            spacing: 6,
            runSpacing: 6,
            children:
                project.tags.map((t) => NeonChip(label: t)).toList(),
          ),
        ],
      ),
    );
  }
}
