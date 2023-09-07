import 'package:flutter/material.dart';
import '../../util.dart';
import './temp_content.dart';

//通过切换overlay获得弹出组件的高度

class GetBodyHeight extends StatefulWidget {
  final Util util;
  final Widget widget;
  final Widget? tempWidget;
  const GetBodyHeight(
      {super.key, required this.util, required this.widget, this.tempWidget});

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
    widget.util.setFuncRefreshBodyHeight(refreshHeight);

    //初始化body高度
    if ((widget.util.getInit!() == false) &&
        (widget.util.getExpanded!() == false)) {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
        widget.util.bodyAnimationController!.value = 1.0;
        widget.util.headAnimationController!.value = 1.0;
        await widget.util.showBodyTemp!().then((i) {
          WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
            await widget.util.removeBodyTemp!().then((i) {
              widget.util.setInit!(true);
              widget.util.refreshWhipSword!();
            });
          });
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.widget;
  }

  void refreshUi() {
    setState(() {});
  }

  Future<void> showBodyTemp() async {
    Overlay.of(context).insert(_overlayEntry!);
  }

  Future<void> removeBodyTemp() async {
    _overlayEntry?.remove();
  }

  OverlayEntry overlayEntry() {
    return OverlayEntry(builder: (context) {
      return Opacity(
        opacity: 0.0,
        child: Scaffold(
            body: WidgetTemp(util: widget.util, widget: widget.tempWidget!)),
      );
    });
  }

  void refreshHeight() async {
    await widget.util.showBodyTemp!().then((i) {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
        await widget.util.removeBodyTemp!().then((i) {
          widget.util.setInit!(true);
          widget.util.refreshWhipSword!();
        });
      });
    });
  }
}
