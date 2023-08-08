import 'package:flutter/material.dart';
import 'util.dart';

//封装加载更多的指示器动画
class HeadAnimatedInterface extends StatefulWidget {
  final Util util;
  final AnimationController animationController;
  final Widget widget;
  const HeadAnimatedInterface(
      {super.key,
      required this.util,
      required this.animationController,
      required this.widget});

  @override
  State<HeadAnimatedInterface> createState() =>
      _HeadAnimatedInterfaceState();
}

class _HeadAnimatedInterfaceState extends State<HeadAnimatedInterface>
    with AutomaticKeepAliveClientMixin {

  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = widget.animationController;
    widget.util.setFuncStartHeadAnimate(startAnimate);
    widget.util.setFuncReverseHeadAnimte(reverseAnimate);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget.widget;
  }

  Future<void> startAnimate(Function() func) async {
    if (animationController.status != AnimationStatus.completed) {
      refreshUi();
      await animationController.forward().then((value) {
        func();
      });
    }
  }

  Future<void> reverseAnimate(Function() func) async {
    if (animationController.status == AnimationStatus.completed) {
      refreshUi();
      await animationController.reverse().then((value) {
        func();
      });
    }
  }

  void refreshUi() {
    setState(() {});
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  bool get wantKeepAlive => true;
}