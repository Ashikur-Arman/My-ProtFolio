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
    final count = PortfolioData.projects.length.toString().padLeft(2, '0');
    return SectionWrapper(
      number: '03 / Projects',
      title: 'Selected Work',
      count: count,
      alt: true,
      child: LayoutBuilder(builder: (ctx, con) {
        final wide = con.maxWidth > 900;
        final medium = con.maxWidth > 600;

        if (!medium) {
          // 1 col
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: _withGaps(PortfolioData.projects
                .map((p) => _ProjCard(project: p)).toList()),
          );
        }

        if (!wide) {
          // 2 col, no featured span
          final rows = <Widget>[];
          final list = PortfolioData.projects;
          for (int i = 0; i < list.length; i += 2) {
            rows.add(_Row2(
              left: _ProjCard(project: list[i]),
              right: i + 1 < list.length ? _ProjCard(project: list[i + 1]) : null,
            ));
          }
          return Column(mainAxisSize: MainAxisSize.min, children: _withGaps(rows));
        }

        // Wide: featured spans 2 cols, rest in pairs
        final featured = PortfolioData.projects.where((p) => p.featured).toList();
        final rest     = PortfolioData.projects.where((p) => !p.featured).toList();

        final widgets = <Widget>[];
        for (final f in featured) {
          widgets.add(_ProjCard(project: f, span2: true));
        }
        for (int i = 0; i < rest.length; i += 2) {
          widgets.add(_Row2(
            left: _ProjCard(project: rest[i]),
            right: i + 1 < rest.length ? _ProjCard(project: rest[i + 1]) : null,
          ));
        }
        return Column(mainAxisSize: MainAxisSize.min, children: _withGaps(widgets));
      }),
    );
  }

  List<Widget> _withGaps(List<Widget> items) {
    final out = <Widget>[];
    for (int i = 0; i < items.length; i++) {
      out.add(items[i]);
      if (i != items.length - 1) out.add(const SizedBox(height: 1));
    }
    return out;
  }
}

class _Row2 extends StatelessWidget {
  final Widget left;
  final Widget? right;
  const _Row2({required this.left, this.right});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: left),
        const SizedBox(width: 1),
        Expanded(child: right ?? Container(color: AppColors.background)),
      ],
    );
  }
}

class _ProjCard extends StatefulWidget {
  final ProjectModel project;
  final bool span2;
  const _ProjCard({required this.project, this.span2 = false});
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
    final idx = PortfolioData.projects.indexOf(p) + 1;
    final num = idx.toString().padLeft(3, '0');

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit:  (_) => setState(() => _hovered = false),
      child: Container(
        width: double.infinity,
        color: _hovered ? const Color(0xFF121212) : AppColors.background,
        padding: const EdgeInsets.all(36),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(num, style: AppTextStyles.tagLabel.copyWith(
                color: AppColors.textGhost, letterSpacing: 3, fontSize: 12)),
            const SizedBox(height: 28),
            Row(
              children: [
                Expanded(child: Text(p.title, style: AppTextStyles.projTitle())),
                if (p.isPrivate)
                  const Icon(Icons.lock_outline_rounded, size: 15, color: AppColors.textFaint)
                else if (p.githubUrl != null)
                  GestureDetector(
                    onTap: () => _launch(p.githubUrl!),
                    child: const Icon(Icons.north_east_rounded, size: 16, color: AppColors.textTertiary),
                  ),
              ],
            ),
            const SizedBox(height: 14),
            Text(p.desc, style: AppTextStyles.bodySm.copyWith(color: AppColors.textTertiary)),
            const SizedBox(height: 22),
            Container(
              padding: const EdgeInsets.only(left: 16),
              decoration: const BoxDecoration(
                border: Border(left: BorderSide(color: Color(0xFF3A3A3A))),
              ),
              child: Text(p.impact,
                  style: AppTextStyles.bodySm.copyWith(color: AppColors.textSecondary, fontSize: 12)),
            ),
            const SizedBox(height: 24),
            Wrap(
              spacing: 8, runSpacing: 8,
              children: p.tags.map((t) => Container(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
                decoration: BoxDecoration(border: Border.all(color: const Color(0xFF262626))),
                child: Text(t.toUpperCase(), style: AppTextStyles.tagLabel),
              )).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
