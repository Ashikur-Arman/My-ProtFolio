import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_text_styles.dart';

class SectionWrapper extends StatelessWidget {
  final String number;   // e.g. "02 / Experience"
  final String title;    // e.g. "Work History"
  final String? count;   // e.g. "01", "03" — shown big on the right
  final Widget child;
  final bool alt;        // alternate background shade

  const SectionWrapper({
    super.key, required this.number, required this.title,
    required this.child, this.count, this.alt = false,
  });

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final hPad = AppSizes.responsivePad(w);
    final narrow = w < 700;

    return Container(
      width: double.infinity,
      color: alt ? AppColors.surfaceAlt : null,
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
                Container(
                  padding: const EdgeInsets.only(bottom: 24),
                  decoration: const BoxDecoration(
                    border: Border(bottom: BorderSide(color: AppColors.divider)),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(number.toUpperCase(), style: AppTextStyles.sectionNum),
                            const SizedBox(height: 8),
                            Text(title,
                                style: AppTextStyles.sectionTitle(
                                  size: narrow ? 32 : 48,
                                )),
                          ],
                        ),
                      ),
                      if (count != null && !narrow)
                        Text(count!, style: AppTextStyles.sectionCount),
                    ],
                  ),
                ),
                const SizedBox(height: 64),
                child,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
