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
  OverlayEntry? overlayEntry;

  Widget? tempWidget;

  @override
  void initState() {
    super.initState();
    //初始化
    overlayEntry = dOverlayEntry();

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
    tempWidget = widget.tempWidget;
    return widget.widget;
  }

  void refreshUi() {
    setState(() {});
  }

  Future<void> showBodyTemp() async {
    Overlay.of(context).insert(overlayEntry!);
  }

  Future<void> removeBodyTemp() async {
    overlayEntry?.remove();
  }

  OverlayEntry dOverlayEntry() {
    return OverlayEntry(builder: (context) {
      return Opacity(
        opacity: 0.0,
        child:
            Scaffold(body: WidgetTemp(util: widget.util, widget: tempWidget!)),
      );
    });
  }

  void refreshHeight() async {
    await widget.util.refreshWhipSword!();
    //这里由于refresh在构建的时候build默认是在本函数执行完成之后再执行build的，无法获得组件的最新状态
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      overlayEntry = dOverlayEntry();
      await showBodyTemp().then((i) {
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
          await removeBodyTemp().then((i) {
            widget.util.setInit!(true);
            widget.util.refreshWhipSword!();
          });
        });
      });
    });
    
  }
}
