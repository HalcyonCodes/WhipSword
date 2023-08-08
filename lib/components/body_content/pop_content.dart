import 'package:flutter/material.dart';
import '../../util.dart';

//修改弹出高度
class PopContent extends StatefulWidget {
  final Widget widget;
  final Util util;

  const PopContent({
    super.key,
    required this.util,
    required this.widget,
  });

  @override
  State<PopContent> createState() => _PopContentState();
}

class _PopContentState extends State<PopContent> {


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.util.animation!,
      builder: (context, child) {
        return SizedBox(
            height: widget.util.bodyHeight * (widget.util.animation!.value),
            child: widget.widget);
      },
    );
  }
}
