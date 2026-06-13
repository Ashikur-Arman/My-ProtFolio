import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_text_styles.dart';
import '../../data/portfolio_data.dart';

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
    final w = MediaQuery.of(context).size.width;
    final hPad = AppSizes.responsivePad(w);
    final narrow = w < 700;
    final bigSize = narrow ? 40.0 : 56.0;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: AppSizes.sectionV, horizontal: hPad),
      child: Align(
        alignment: Alignment.topCenter,
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 800),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              RichText(
                text: TextSpan(children: [
                  TextSpan(text: "Let's build\nsomething\n",
                      style: AppTextStyles.contactBig(size: bigSize)),
                  TextSpan(text: 'great.',
                      style: AppTextStyles.contactBigItalic(size: bigSize)),
                ]),
              ),
              const SizedBox(height: 48),
              Wrap(
                spacing: 32, runSpacing: 16,
                children: [
                  _ContactLink(label: PortfolioData.email, onTap: () => _copy(context)),
                  _ContactLink(label: 'GitHub', onTap: () => _launch(PortfolioData.github)),
                  _ContactLink(label: 'LinkedIn', onTap: () => _launch(PortfolioData.linkedin)),
                ],
              ),
              const SizedBox(height: 32),
              Text(PortfolioData.phone,
                  style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w700,
                      letterSpacing: 2, color: AppColors.textFaint)),
            ],
          ),
        ),
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
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit:  (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(widget.label.toUpperCase(),
                style: TextStyle(
                  fontSize: 12, fontWeight: FontWeight.w700, letterSpacing: 3,
                  color: _hovered ? AppColors.white : AppColors.textSecondary,
                )),
            const SizedBox(width: 8),
            Icon(Icons.north_east_rounded, size: 14,
                color: _hovered ? AppColors.white : AppColors.textSecondary),
          ],
        ),
      ),
    );
  }
}
