import 'dart:async';
import 'package:flutter/material.dart';
import '../../core/constants/app_text_styles.dart';
import '../../data/portfolio_data.dart';

class TypewriterText extends StatefulWidget {
  const TypewriterText({super.key});
  @override State<TypewriterText> createState() => _TypewriterTextState();
}

class _TypewriterTextState extends State<TypewriterText> {
  final _roles = PortfolioData.roles;
  int    _roleIdx  = 0;
  int    _charIdx  = 0;
  bool   _deleting = false;
  String _shown    = '';
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _schedule(const Duration(milliseconds: 700));
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
          _schedule(const Duration(milliseconds: 65));
        }
      } else {
        _charIdx--;
        _shown = cur.substring(0, _charIdx);
        if (_charIdx == 0) {
          _deleting = false;
          _roleIdx  = (_roleIdx + 1) % _roles.length;
          _schedule(const Duration(milliseconds: 400));
        } else {
          _schedule(const Duration(milliseconds: 30));
        }
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(_shown.toUpperCase(), style: AppText.typewriter);
  }
}
