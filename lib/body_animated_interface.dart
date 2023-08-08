import 'package:flutter/material.dart';
import 'util.dart';

//封装加载更多的指示器动画
class BodyAnimatedInterface extends StatefulWidget {
  final Util util;
  final AnimationController animationController;
  final Widget widget;
  const BodyAnimatedInterface(
      {super.key,
      required this.util,
      required this.animationController,
      required this.widget});

  @override
  State<BodyAnimatedInterface> createState() =>
      _BodyAnimatedInterfaceState();
}

class _BodyAnimatedInterfaceState extends State<BodyAnimatedInterface>
    with AutomaticKeepAliveClientMixin {
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = widget.animationController;
    widget.util.setFuncStartBodyAnimate(startAnimate);
    widget.util.setFuncReverseBodyAnimte(reverseAnimate);
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
