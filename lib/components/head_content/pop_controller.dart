import 'package:flutter/material.dart';
import 'package:whip_sword/components/head_content/user_widget_content.dart';
import '../../util.dart';

class PopController extends StatefulWidget {
  final Util util;
  final Widget widget;
  final BorderRadius borderRadius;
  final EdgeInsets headBottomMargin;

  const PopController({
    super.key,
    required this.util,
    required this.widget,
    required this.borderRadius,
    required this.headBottomMargin,
  });

  @override
  State<PopController> createState() => _PopControllerState();
}

class _PopControllerState extends State<PopController> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.headBottomMargin,
      child: InkWell(
        onTap: onTap,
        borderRadius: widget.borderRadius,
        child: UserHeadContent(util: widget.util, child: widget.widget),
      ),
    );
  }

  void onTap() {
    //执行外部方法
    widget.util.headOnTap != null ? widget.util.headOnTap!() : () {};

    widget.util.getExpanded!() == true
        ? (() async {
            //原始状态是折叠状态
            widget.util.changeExpanding!(true);
            widget.util.changeExpanded!(false);
            widget.util.setInit!(true);
            await widget.util.refreshWhipSword!();
            WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
              await widget.util.showBodyTemp!().then((i) {
                WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
                  await widget.util.removeBodyTemp!().then((i) {
                    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                      widget.util.startBodyAnimate!(() {});
                      widget.util.startHeadAnimate!(() {});
                    });
                  });
                });
              });
            });
          })()
        : (() async {
            //原始状态是展开状态
            widget.util.changeExpanding!(true);
            widget.util.changeExpanded!(true);
            widget.util.bodyAnimationController!.stop();
            widget.util.headAnimationController!.stop();
            widget.util.reverseHeadAnimate!(
                widget.util.headAnimationController!.value, () {});
            widget.util.reverseBodyAnimate!(
                widget.util.bodyAnimationController!.value, () {
              widget.util.changeExpanding!(false);
            });
          })();
  }
}
