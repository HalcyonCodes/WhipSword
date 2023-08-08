import 'package:flutter/material.dart';
import '../../body_animated_interface.dart';
import '../../head_animated_interface.dart';

class WhipSword extends StatefulWidget {
  final Widget? body;
  final Widget? head;
  final BodyAnimatedInterface? bodyAnimatedWidget;
  final HeadAnimatedInterface? headAnimatedWidget;

  const WhipSword(
      {super.key,
      this.body,
      this.head,
      this.bodyAnimatedWidget,
      this.headAnimatedWidget});

  @override
  State<WhipSword> createState() => _WhipSwordState();
}

class _WhipSwordState extends State<WhipSword> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        widget.headAnimatedWidget ?? widget.head!,
        widget.bodyAnimatedWidget ?? widget.body!,
      ],
    );
  }
}
