import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_text_styles.dart';

class SectionWrapper extends StatelessWidget {
  final String label;
  final String title;
  final Widget child;
  final Color? bgColor;

  const SectionWrapper({
    super.key,
    required this.label,
    required this.title,
    required this.child,
    this.bgColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: bgColor,
      padding: const EdgeInsets.symmetric(vertical: 96, horizontal: 48),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label.toUpperCase(), style: AppTextStyles.sectionLabel),
              const SizedBox(height: 8),
              Row(
                children: [
                  Text(title, style: AppTextStyles.sectionTitle),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Container(
                      height: 1,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0x4D00D4FF), Colors.transparent],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 48),
              child,
            ],
          ),
        ),
      ),
    );
  }
}
