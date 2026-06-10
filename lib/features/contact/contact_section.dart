import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_text_styles.dart';
import '../../data/portfolio_data.dart';
import '../../widgets/common/neon_button.dart';
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
      backgroundColor: AppColors.neonCyan.withOpacity(0.9),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return SectionWrapper(
      label: "Let's Talk", title: 'Contact',
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 500),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Open to new opportunities, collaborations, and interesting '
                'projects. Feel free to reach out!',
                style: AppTextStyles.body.copyWith(fontSize: 15),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 28),
              Text(PortfolioData.email,
                  style: AppTextStyles.sectionTitle.copyWith(fontSize: 22),
                  textAlign: TextAlign.center),
              const SizedBox(height: 28),
              Wrap(
                spacing: 16, runSpacing: 12,
                alignment: WrapAlignment.center,
                children: [
                  NeonButton(label: 'Email Me',
                      onTap: () => _copy(context),
                      icon: Icons.mail_outline_rounded),
                  NeonButton(label: 'GitHub',
                      onTap: () => _launch(PortfolioData.github),
                      outlined: true, icon: Icons.code_rounded),
                  NeonButton(label: 'LinkedIn',
                      onTap: () => _launch(PortfolioData.linkedin),
                      outlined: true, icon: Icons.person_outline_rounded),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.phone_outlined,
                      size: 14, color: AppColors.textMuted),
                  const SizedBox(width: 8),
                  Text(PortfolioData.phone, style: AppTextStyles.bodySm),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
