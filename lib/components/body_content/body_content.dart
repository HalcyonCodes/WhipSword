import 'package:flutter/material.dart';
import 'package:whip_sword/components/body_content/user_widget_content.dart';

import '../../util.dart';
import './get_height_content.dart';

//Body的主体
class BodyContent extends StatefulWidget {
  final Widget? child;
  final Widget? userBody;
  final Util util;

  const BodyContent({
    super.key,
    required this.child,
    required this.util,
    this.userBody,
  });

  @override
  State<BodyContent> createState() => _BodyContentState();
}

class _BodyContentState extends State<BodyContent> {
  @override
  Widget build(BuildContext context) {
    return GetBodyHeight(
        util: widget.util,
        tempWidget: widget.userBody == null ? widget.child! : widget.userBody!,
        widget: widget.userBody == null
            ? UserBodyContent(
                util: widget.util,
                child: widget.child,
              )
            : widget.userBody!);
  }
}
