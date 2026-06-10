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
    if (await canLaunchUrl(uri)) launchUrl(uri);
  }

  void _copyEmail(BuildContext ctx) {
    Clipboard.setData(const ClipboardData(text: PersonalInfo.email));
    ScaffoldMessenger.of(ctx).showSnackBar(
      SnackBar(
        content: const Text('Email copied to clipboard!'),
        backgroundColor: AppColors.neonCyan.withOpacity(0.9),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SectionWrapper(
      label: "Let's Talk",
      title: 'Contact',
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 560),
          child: Column(
            children: [
              Text(
                'Open to new opportunities, collaborations, and interesting '
                'projects. Feel free to reach out!',
                style: AppTextStyles.body,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              // Email display
              Text(
                PersonalInfo.email,
                style: AppTextStyles.cardTitle.copyWith(
                  fontSize: 20,
                  letterSpacing: -0.3,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              // Buttons
              Wrap(
                spacing: 16,
                runSpacing: 12,
                alignment: WrapAlignment.center,
                children: [
                  NeonButton(
                    label: 'Email Me',
                    onTap: () => _copyEmail(context),
                    icon: Icons.mail_outline_rounded,
                  ),
                  NeonButton(
                    label: 'GitHub',
                    onTap: () => _launch(PersonalInfo.github),
                    outlined: true,
                    icon: Icons.code_rounded,
                  ),
                  NeonButton(
                    label: 'LinkedIn',
                    onTap: () => _launch(PersonalInfo.linkedin),
                    outlined: true,
                    icon: Icons.person_outline_rounded,
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.phone_outlined,
                      size: 15, color: AppColors.textMuted),
                  const SizedBox(width: 8),
                  Text(PersonalInfo.phone,
                      style: AppTextStyles.bodySm),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
