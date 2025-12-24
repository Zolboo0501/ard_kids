import 'package:flutter/material.dart';

class TouchableOpacity extends StatefulWidget {
  final Widget child;
  final VoidCallback onTap;

  const TouchableOpacity({required this.child, required this.onTap});

  @override
  _TouchableOpacityState createState() => _TouchableOpacityState();
}

class _TouchableOpacityState extends State<TouchableOpacity> {
  double _opacity = 1.0;
  double _scale = 1.0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() {
        _opacity = 0.6;
        _scale = 0.95;
      }),
      onTapUp: (_) => setState(() {
        _opacity = 1.0;
        _scale = 1.0;
      }),
      onTapCancel: () => setState(() {
        _opacity = 1.0;
        _scale = 1.0;
      }),
      onTap: widget.onTap,
      child: AnimatedScale(
        scale: _scale,
        duration: const Duration(milliseconds: 100),
        curve: Curves.easeInOut,
        child: AnimatedOpacity(
          duration: const Duration(milliseconds: 100),
          opacity: _opacity,
          child: widget.child,
        ),
      ),
    );
  }
}
