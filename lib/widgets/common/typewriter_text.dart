import 'dart:async';
import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_text_styles.dart';
import '../../data/portfolio_data.dart';

class TypewriterText extends StatefulWidget {
  const TypewriterText({super.key});
  @override State<TypewriterText> createState() => _TypewriterTextState();
}

class _TypewriterTextState extends State<TypewriterText>
    with SingleTickerProviderStateMixin {
  final _roles = PortfolioData.roles;
  int    _roleIdx  = 0;
  int    _charIdx  = 0;
  bool   _deleting = false;
  String _shown    = '';
  late final AnimationController _cursor;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _cursor = AnimationController(
      vsync: this, duration: const Duration(milliseconds: 900))
      ..repeat(reverse: true);
    _schedule(const Duration(milliseconds: 600));
  }

  void _schedule(Duration d) => _timer = Timer(d, _tick);

  void _tick() {
    if (!mounted) return;
    final cur = _roles[_roleIdx];
    setState(() {
      if (!_deleting) {
        _charIdx++;
        _shown = cur.substring(0, _charIdx);
        if (_charIdx == cur.length) {
          _deleting = true;
          _schedule(const Duration(milliseconds: 1800));
        } else {
          _schedule(const Duration(milliseconds: 68));
        }
      } else {
        _charIdx--;
        _shown = cur.substring(0, _charIdx);
        if (_charIdx == 0) {
          _deleting = false;
          _roleIdx  = (_roleIdx + 1) % _roles.length;
          _schedule(const Duration(milliseconds: 400));
        } else {
          _schedule(const Duration(milliseconds: 32));
        }
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _cursor.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('> ', style: AppTextStyles.typewriterPrefix),
        Text(_shown, style: AppTextStyles.typewriter),
        FadeTransition(
          opacity: _cursor,
          child: Container(
            width: 2, height: 22,
            margin: const EdgeInsets.only(left: 2),
            decoration: BoxDecoration(
              color: AppColors.neonCyan,
              borderRadius: BorderRadius.circular(1),
            ),
          ),
        ),
      ],
    );
  }
}
