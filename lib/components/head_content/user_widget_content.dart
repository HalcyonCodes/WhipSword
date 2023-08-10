import 'package:flutter/material.dart';
import '../../head_animated_interface.dart';
import '../../util.dart';

//Uesr所要实现的Head内容
class UserHeadContent extends StatefulWidget {
  final Util? util;
  final Widget? child;
  const UserHeadContent({super.key, required this.util, required this.child});

  @override
  State<UserHeadContent> createState() => _UserHeadContentState();
}

class _UserHeadContentState extends State<UserHeadContent>
    with TickerProviderStateMixin {
  AnimationController? controller;
  Animation? animation;

  @override
  void initState() {
    super.initState();
    //实现动画控制器
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    animation = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: controller!,
        curve: const Interval(0, 1.0, curve: Curves.fastOutSlowIn)));
  }

  @override
  Widget build(BuildContext context) {
    return HeadAnimatedInterface(
      animationController: controller!,
      animation: animation!,
      util: widget.util!,
      child: widget.child!,
    );
  }
}
