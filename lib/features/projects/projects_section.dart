import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_text_styles.dart';
import '../../data/portfolio_data.dart';
import '../../widgets/common/section_wrapper.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final projects = PortfolioData.projects;
    final count = projects.length.toString().padLeft(2, '0');

    return SectionWrapper(
      number: '03 / PROJECTS',
      title: 'Selected Work',
      count: count,
      bg: AppColors.surfaceAlt,
      child: LayoutBuilder(builder: (ctx, con) {
        final cols = con.maxWidth > 700 ? 3 : (con.maxWidth > 420 ? 2 : 1);
        return _ProjGrid(projects: projects, cols: cols);
      }),
    );
  }
}

class _ProjGrid extends StatelessWidget {
  final List<ProjectModel> projects;
  final int cols;
  const _ProjGrid({required this.projects, required this.cols});

  @override
  Widget build(BuildContext context) {
    // Build rows manually respecting "featured" spanning logic
    final rows = <Widget>[];
    int i = 0;
    int num = 1;

    while (i < projects.length) {
      final p = projects[i];
      if (p.featured && cols >= 2) {
        // Featured takes 2 slots; try to pair with next normal project if cols==3
        if (cols == 3 && i + 1 < projects.length && !projects[i + 1].featured) {
          rows.add(_Row(children: [
            Expanded(flex: 2, child: _ProjCard(p: p, num: num)),
            Expanded(flex: 1, child: _ProjCard(p: projects[i + 1], num: num + 1)),
          ]));
          i += 2; num += 2;
        } else {
          rows.add(_ProjCard(p: p, num: num, fullWidth: true));
          i += 1; num += 1;
        }
      } else {
        // Pack `cols` normal cards per row
        final group = <Widget>[];
        final groupCount = (projects.length - i) >= cols ? cols : (projects.length - i);
        for (int j = 0; j < groupCount; j++) {
          if (projects[i + j].featured) break;
          group.add(Expanded(child: _ProjCard(p: projects[i + j], num: num + j)));
        }
        if (group.isEmpty) {
          // single featured leftover
          rows.add(_ProjCard(p: projects[i], num: num, fullWidth: true));
          i += 1; num += 1;
        } else {
          rows.add(_Row(children: group));
          i += group.length; num += group.length;
        }
      }
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: rows,
    );
  }
}

class _Row extends StatelessWidget {
  final List<Widget> children;
  const _Row({required this.children});
  @override
  Widget build(BuildContext context) {
    final spaced = <Widget>[];
    for (int i = 0; i < children.length; i++) {
      if (i > 0) spaced.add(Container(width: 1, color: AppColors.grey8));
      spaced.add(children[i]);
    }
    return Container(
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: AppColors.grey8)),
      ),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: spaced,
        ),
      ),
    );
  }
}

class _ProjCard extends StatefulWidget {
  final ProjectModel p;
  final int num;
  final bool fullWidth;
  const _ProjCard({required this.p, required this.num, this.fullWidth = false});
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
    final p = widget.p;
    final card = MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit:  (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        color: _hovered ? AppColors.surface : AppColors.background,
        padding: const EdgeInsets.all(36),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(widget.num.toString().padLeft(3, '0'), style: AppText.projNum),
            const SizedBox(height: 28),
            Text(p.title, style: AppText.projTitle),
            const SizedBox(height: 14),
            Text(p.desc, style: AppText.projDesc),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.only(left: 14),
              decoration: const BoxDecoration(
                border: Border(left: BorderSide(color: AppColors.grey6)),
              ),
              child: Text(p.impact, style: AppText.projImpact),
            ),
            const SizedBox(height: 24),
            Wrap(
              spacing: 8, runSpacing: 8,
              children: [
                ...p.tags.map((t) => _ProjTag(label: t)),
                if (p.isPrivate)
                  const _ProjTag(label: 'PRIVATE')
                else if (p.githubUrl != null)
                  GestureDetector(
                    onTap: () => _launch(p.githubUrl!),
                    child: const _ProjTag(label: 'GITHUB ↗', interactive: true),
                  ),
              ],
            ),
          ],
        ),
      ),
    );

    if (widget.fullWidth) {
      return Container(
        decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: AppColors.grey8)),
        ),
        child: card,
      );
    }
    return card;
  }
}

class _ProjTag extends StatelessWidget {
  final String label;
  final bool interactive;
  const _ProjTag({required this.label, this.interactive = false});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        border: Border.all(color: interactive ? AppColors.grey4 : AppColors.grey7),
      ),
      child: Text(label, style: AppText.projTag.copyWith(
        color: interactive ? AppColors.grey1 : AppColors.grey4,
      )),
    );
  }
}
