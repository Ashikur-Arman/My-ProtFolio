import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_text_styles.dart';

class SectionWrapper extends StatelessWidget {
  final String label;
  final String title;
  final Widget child;
  final Color? bg;

  const SectionWrapper({
    super.key, required this.label, required this.title,
    required this.child, this.bg,
  });

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final hPad = AppSizes.responsivePad(w);

    return Container(
      width: double.infinity,
      color: bg,
      padding: EdgeInsets.symmetric(vertical: AppSizes.sectionV),
      child: Align(
        alignment: Alignment.topCenter,
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: AppSizes.maxWidth),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: hPad),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(label.toUpperCase(), style: AppTextStyles.sectionLabel),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Text(title, style: AppTextStyles.sectionTitle),
                    const SizedBox(width: 20),
                    Expanded(
                      child: Container(
                        height: 1,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(colors: [
                            AppColors.neonCyan.withOpacity(0.4),
                            Colors.transparent,
                          ]),
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
      ),
    );
  }
}
