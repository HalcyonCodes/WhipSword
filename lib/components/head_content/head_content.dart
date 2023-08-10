import 'package:flutter/material.dart';
import './pop_controller.dart';
import '../../util.dart';
import './user_widget_content.dart';

class HeadContent extends StatefulWidget {
  final Util util;
  final Widget? child;
  final Widget? userHead;
  final BorderRadius? borderRadius;
  final double headBottomMargin;
  const HeadContent({
    super.key,
    this.borderRadius,
    required this.util,
    this.child,
    this.userHead,
    required this.headBottomMargin,
  });

  @override
  State<HeadContent> createState() => _HeadContentState();
}

class _HeadContentState extends State<HeadContent> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PopController(
      headBottomMargin: EdgeInsets.only(bottom: widget.headBottomMargin),
      util: widget.util,
      borderRadius: widget.borderRadius ?? BorderRadius.circular(0),
      widget: widget.userHead ?? UserHeadContent(
        util: widget.util,
        child: widget.child,

      ),
    );
  }
}
