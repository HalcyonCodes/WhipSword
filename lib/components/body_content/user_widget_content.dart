import 'package:flutter/material.dart';
import '../../body_animated_interface.dart';
import '../../util.dart';

//Uesr所要实现的Body内容
class UserBodyContent extends StatefulWidget {
  final Util? util;
  final Widget? child;
  const UserBodyContent({super.key, required this.util, required this.child});

  @override
  State<UserBodyContent> createState() => _UserBodyContentState();
}

class _UserBodyContentState extends State<UserBodyContent>
    with TickerProviderStateMixin {
  AnimationController? controller;
  Animation<double>? animation;

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
    return BodyAnimatedInterface(
      
        animationController: controller!,
        animation: animation!,
        util: widget.util!,
        
          child: FadeTransition(
              opacity: animation!,
              child: Transform(
                transform: Matrix4.translationValues(
                    0.0, 0.0, 0.0),
                child: widget.child,
              )),
        );
  }
}
