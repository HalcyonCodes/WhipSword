import 'package:flutter/material.dart';
import '../../util.dart';
import './temp_content.dart';

//通过切换overlay获得弹出组件的高度

class GetBodyHeight extends StatefulWidget {
  final Util util;
  final Widget widget;
  const GetBodyHeight({super.key, required this.util, required this.widget});

  @override
  State<GetBodyHeight> createState() => _GetBodyHeightState();
}

class _GetBodyHeightState extends State<GetBodyHeight> {
  OverlayEntry? _overlayEntry;

  @override
  void initState() {
    super.initState();
    //初始化
    _overlayEntry = overlayEntry();

    //注册
    widget.util.setFuncShowBodyTemp(showBodyTemp);
    widget.util.setFuncRemoveBodyTemp(removeBodyTemp);
  }

  @override
  Widget build(BuildContext context) {
    return widget.widget;
  }

  void refreshUi() {
    setState(() {});
  }

  void showBodyTemp() {
    Overlay.of(context).insert(_overlayEntry!);
  }

  void removeBodyTemp() {
    _overlayEntry?.remove();
  }

  OverlayEntry overlayEntry() {
    return OverlayEntry(builder: (context) {
      return WidgetTemp(util: widget.util, widget: widget.widget);
    });
  }
}
