import 'package:flutter/material.dart';
import '../../util.dart';
import './pop_content.dart';
import './get_height_content.dart';

class BodyContent extends StatelessWidget {
  final Widget widget;
  final Util util;

  const BodyContent({
    super.key,
    required this.widget,
    required this.util
  });

  @override
  Widget build(BuildContext context) {
    return GetBodyHeight(
      util: util, 
      widget: PopContent(
        util: util,
        widget: widget,
      )
    );
  }
}
