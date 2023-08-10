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
  final GlobalKey _myKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, boxConstraints) {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        //获得高度
        widget.util.setBodyHeight(_myKey.currentContext!.size!.height);
      });
      return Container(
        alignment: Alignment.center,
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Opacity(key: _myKey, opacity: 0.0, child: widget.widget),
        ]),
      );
    });
  }
}
