import 'package:flutter/material.dart';

class AnimatedBodyContent extends StatefulWidget {
  final AnimationController animationController;
  final Animation<double> animation;
  final Widget widget;
  final double widgetHeight;

  const AnimatedBodyContent({
    super.key,
    required this.animationController,
    required this.animation,
    required this.widget,
    required this.widgetHeight
  });

  @override
  State<AnimatedBodyContent> createState() => _AnimatedBodyContentState();
}

class _AnimatedBodyContentState extends State<AnimatedBodyContent> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.animation,
      builder: (context, child) {
        return FadeTransition(
          opacity: widget.animation,
          child: Transform(
              transform: Matrix4.translationValues(
                  0.0, widget.widgetHeight * (widget.animation.value - 1.0), 0.0),
              child: widget.widget),
        );
      },
    );
  }
}
