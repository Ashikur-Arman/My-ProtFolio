import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_text_styles.dart';

class SectionWrapper extends StatelessWidget {
  final String number;    // e.g. "02 / Experience"
  final String title;     // e.g. "Work History"
  final String? count;    // e.g. "01" — shown big on the right
  final Widget child;
  final Color? bg;

  const SectionWrapper({
    super.key, required this.number, required this.title,
    required this.child, this.count, this.bg,
  });

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final pad = AppSizes.pad(w);

    return Container(
      width: double.infinity,
      color: bg,
      padding: EdgeInsets.symmetric(vertical: AppSizes.sectionV),
      child: Align(
        alignment: Alignment.topCenter,
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: AppSizes.maxWidth),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: pad),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                // Header row
                Container(
                  padding: const EdgeInsets.only(bottom: 24),
                  decoration: const BoxDecoration(
                    border: Border(bottom: BorderSide(color: AppColors.grey8)),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(number, style: AppText.sectionNum),
                            const SizedBox(height: 8),
                            Text(title, style: AppText.sectionTitle),
                          ],
                        ),
                      ),
                      if (count != null)
                        Text(count!, style: AppText.sectionCount),
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
