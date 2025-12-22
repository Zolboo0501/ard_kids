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

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _opacity = 0.5),
      onTapUp: (_) => setState(() => _opacity = 1.0),
      onTapCancel: () => setState(() => _opacity = 1.0),
      onTap: () {
        setState(() => _opacity = 0.5);
        widget.onTap();
        setState(() => _opacity = 1.0);
      },
      child: AnimatedOpacity(
        duration: Duration(milliseconds: 100),
        opacity: _opacity,
        child: widget.child,
      ),
    );
  }
}
