import 'package:flutter/material.dart';
import '../../util.dart';

//获取body高度的暂时性显示组件

class WidgetTemp extends StatefulWidget {
  final Util util;
  final Widget widget;

  const WidgetTemp({super.key, required this.util, required this.widget});

  @override
  State<WidgetTemp> createState() => _WidgetTempState();
}

class _WidgetTempState extends State<WidgetTemp> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, boxConstraints) {
      //获得高度
      widget.util.setBodyHeight(boxConstraints.maxHeight);
      final Tween<double> tween = Tween(begin: 0, end: 0);
      return FadeTransition(
          opacity: tween.animate(
        CurvedAnimation(
          parent: AnimationController(
            duration: const Duration(seconds: 0),
            vsync: this,
          ),
          curve: Curves.linear, // 使用线性插值器以获取匀速动画
        )),
        child: Transform(
            transform: Matrix4.translationValues(0, 0, 0.0), child: widget),
      );
    });
  }
}
