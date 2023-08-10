import 'package:flutter/material.dart';
import 'util.dart';

//封装加载更多的指示器动画
class HeadAnimatedInterface extends StatefulWidget {
  final Util util;
  final AnimationController animationController;
  final Widget child;
  final Animation animation;
  const HeadAnimatedInterface(
      {super.key,
      required this.util,
      required this.animationController,
      required this.child,
      required this.animation,
      });

  @override
  State<HeadAnimatedInterface> createState() => _HeadAnimatedInterfaceState();
}

class _HeadAnimatedInterfaceState extends State<HeadAnimatedInterface>
    with AutomaticKeepAliveClientMixin {
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();

    animationController = widget.animationController;
    widget.util.setFuncStartBodyAnimate(startAnimate);
    widget.util.setFuncReverseBodyAnimte(reverseAnimate);
    widget.util.setHeadAnimationController(widget.animationController);
    widget.util.setHeadAnimation(widget.animation);
    //实现折叠状态
    (widget.util.getExpanding!() == false) && (widget.util.getExpanded!() == false)
        ? widget.animationController.forward(from: 1.0)
        : () {};
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget.child;
  }

  Future<void> startAnimate(Function() func) async {
      animationController.forward().then((value) {
        func();
      });

  }

  Future<void> reverseAnimate(Function() func) async {
      animationController.reverse().then((value) {
        func();
     });

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
