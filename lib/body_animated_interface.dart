import 'package:flutter/material.dart';
import 'util.dart';
import './components/body_content/pop_content.dart';

//封装加载更多的指示器动画
class BodyAnimatedInterface extends StatefulWidget {
  final Util util;
  final AnimationController animationController;
  final Animation animation;
  final Widget child;
  const BodyAnimatedInterface(
      {super.key,
      required this.util,
      required this.animationController,
      required this.animation,
      required this.child});

  @override
  State<BodyAnimatedInterface> createState() => _BodyAnimatedInterfaceState();
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
    widget.util.setBodyAnimationController(widget.animationController);
    widget.util.setBodyAnimation(widget.animation);
    //实现折叠状态
    //(widget.util.getExpanding!() == false) && (widget.util.getExpanded!() == false)
    ///   ? widget.animationController.forward(from: 1.0)
    //   : () {};
    //widget.animationController.forward(from: 1.0);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return PopContent(util: widget.util, widget: widget.child);
  }

  Future<void> startAnimate(Function() func) async {
    //if (animationController.status != AnimationStatus.completed) {
      //refreshUi();
      animationController.forward().then((value) {
        func();
      });
    //}
  }

  Future<void> reverseAnimate( double d,Function() func) async {
   // if (animationController.status == AnimationStatus.completed) {
      //refreshUi();
       animationController.reverse(from: d).then((value) {
        func();
     });
   // }
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
