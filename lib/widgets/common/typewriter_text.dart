import 'dart:async';
import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_text_styles.dart';

class TypewriterText extends StatefulWidget {
  final List<String> texts;

  const TypewriterText({super.key, required this.texts});

  @override
  State<TypewriterText> createState() => _TypewriterTextState();
}

class _TypewriterTextState extends State<TypewriterText>
    with SingleTickerProviderStateMixin {
  late AnimationController _cursorCtrl;

  String _displayed = '';
  int _roleIdx = 0;
  int _charIdx = 0;
  bool _deleting = false;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    // Blinking cursor
    _cursorCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    )..repeat(reverse: true);
    // Start typing after short delay
    _timer = Timer(const Duration(milliseconds: 600), _tick);
  }

  void _tick() {
    if (!mounted) return;
    final current = widget.texts[_roleIdx];

    if (!_deleting) {
      _charIdx++;
      setState(() => _displayed = current.substring(0, _charIdx));
      if (_charIdx == current.length) {
        _deleting = true;
        _timer = Timer(const Duration(milliseconds: 1800), _tick);
        return;
      }
      _timer = Timer(const Duration(milliseconds: 68), _tick);
    } else {
      _charIdx--;
      setState(() => _displayed = current.substring(0, _charIdx));
      if (_charIdx == 0) {
        _deleting = false;
        _roleIdx = (_roleIdx + 1) % widget.texts.length;
        _timer = Timer(const Duration(milliseconds: 380), _tick);
        return;
      }
      _timer = Timer(const Duration(milliseconds: 32), _tick);
    }
  }

  @override
  void dispose() {
    _cursorCtrl.dispose();
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Prompt symbol
        Text('> ', style: AppTextStyles.mono.copyWith(color: AppColors.textMuted)),
        // Typed text
        Flexible(
          child: Text(
            _displayed,
            style: AppTextStyles.mono,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        // Cursor
        AnimatedBuilder(
          animation: _cursorCtrl,
          builder: (_, __) => Opacity(
            opacity: _cursorCtrl.value,
            child: Container(
              width: 2,
              height: 22,
              margin: const EdgeInsets.only(left: 2),
              decoration: BoxDecoration(
                color: AppColors.neonCyan,
                borderRadius: BorderRadius.circular(1),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
