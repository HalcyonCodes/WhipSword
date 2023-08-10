import 'package:flutter/material.dart';
import '../../body_animated_interface.dart';
import '../../head_animated_interface.dart';
import '../../util.dart';
import '../head_content/head_content.dart';
import '../body_content/body_content.dart';

class WhipSword extends StatefulWidget {
  final Widget? body;
  final Widget? head;
  final BodyAnimatedInterface? bodyAnimatedWidget;
  final HeadAnimatedInterface? headAnimatedWidget;
  final BorderRadius? headBorderRadius;
  final bool? isExpanded;
  final Util? util;
  final double headBottomMargin;

  const WhipSword(
      {super.key,
      required this.body,
      required this.head,
      this.bodyAnimatedWidget,
      this.headAnimatedWidget,
      this.headBorderRadius,
      this.isExpanded,
      this.util,
      required this.headBottomMargin});

  @override
  State<WhipSword> createState() => _WhipSwordState();
}

class _WhipSwordState extends State<WhipSword> {
  Util? util;

  //是否处于折叠状态中
  bool? isExpanding;

  //已经折叠
  bool? isExpanded;

  //初始化
  bool? isInit;

  @override
  void initState() {
    super.initState();
    isExpanded = widget.isExpanded ?? true;
    isExpanding = false;
    util = widget.util ?? Util();
    isInit = false;

    //注册
    util!.setFuncChangeExpanded(changeExpanded);
    util!.setFuncChangeExpanding(changeExpanding);
    util!.setFuncGetExpanding(getExpanding);
    util!.setFuncGetExpanded(getExpanded);
    util!.setFuncRefreshWhipSword(refreshUi);
    util!.setFuncSetInit(changeInit);
    util!.setFuncGetInit(getInit);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        HeadContent(
          headBottomMargin: widget.headBottomMargin,
          borderRadius: widget.headBorderRadius,
          util: util!,
          userHead: widget.headAnimatedWidget,
          child: widget.head,
        ),
        isExpanded == true
            ? const SizedBox()
            : BodyContent(
                util: util!,
                userBody: widget.bodyAnimatedWidget,
                child: widget.body,
              )
      ],
    );
  }

  //修改折叠状
  void changeExpanded(bool i) {
    isExpanded = i;
  }

  //修改是否处于折叠状态中
  void changeExpanding(bool i) {
    isExpanding = i;
  }

  //获得是否处于折叠状态中
  bool getExpanding() {
    return isExpanding!;
  }

  Future<void> refreshUi() async {
    setState(() {});
  }

  //获得折叠状态
  bool getExpanded() {
    return isExpanded!;
  }

  //修改初始化状态
  void changeInit(bool i) {
    isInit = i;
  }

  //获得初始化状态
  bool getInit() {
    return isInit!;
  }
}
