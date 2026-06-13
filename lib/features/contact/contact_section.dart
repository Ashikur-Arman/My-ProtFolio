import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_text_styles.dart';
import '../../data/portfolio_data.dart';
import '../../widgets/common/section_wrapper.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  Future<void> _launch(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) await launchUrl(uri);
  }

  void _copy(BuildContext ctx) {
    Clipboard.setData(const ClipboardData(text: PortfolioData.email));
    ScaffoldMessenger.of(ctx).showSnackBar(SnackBar(
      content: const Text('Email copied!'),
      backgroundColor: AppColors.white,
      behavior: SnackBarBehavior.floating,
    ));
  }

  @override
  Widget build(BuildContext context) {
    final screenW = MediaQuery.of(context).size.width;
    final bigSize = screenW < 700 ? 40.0 : 64.0;

    return SectionWrapper(
      number: "06 / CONTACT",
      title: "Let's Talk",
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text.rich(
            TextSpan(children: [
              TextSpan(text: "Let's build\nsomething\n",
                  style: AppText.contactBig.copyWith(fontSize: bigSize)),
              TextSpan(text: 'great.',
                  style: AppText.contactBigItalic.copyWith(fontSize: bigSize)),
            ]),
          ),
          const SizedBox(height: 48),
          Wrap(
            spacing: 32, runSpacing: 16,
            children: [
              _ContactLink(
                label: PortfolioData.email,
                onTap: () => _copy(context),
              ),
              _ContactLink(
                label: 'GitHub',
                onTap: () => _launch(PortfolioData.github),
              ),
              _ContactLink(
                label: 'LinkedIn',
                onTap: () => _launch(PortfolioData.linkedin),
              ),
            ],
          ),
          const SizedBox(height: 32),
          Text(PortfolioData.phone, style: AppText.contactPhone),
        ],
      ),
    );
  }
}

class _ContactLink extends StatefulWidget {
  final String label;
  final VoidCallback onTap;
  const _ContactLink({required this.label, required this.onTap});
  @override State<_ContactLink> createState() => _ContactLinkState();
}
class _ContactLinkState extends State<_ContactLink> {
  bool _h = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _h = true),
      onExit:  (_) => setState(() => _h = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(widget.label.toUpperCase(),
                style: AppText.contactLink.copyWith(
                  color: _h ? AppColors.white : AppColors.grey3,
                )),
            const SizedBox(width: 10),
            Text('↗', style: TextStyle(
              fontSize: 14,
              color: _h ? AppColors.white : AppColors.grey3,
            )),
          ],
        ),
      ),
    );
  }
}
