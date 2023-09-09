import 'package:flutter/material.dart';

import '../../util.dart';
import '../head_content/head_content.dart';
import '../body_content/body_content.dart';

class WhipSword extends StatefulWidget {
  final Widget? body;
  final Widget? head;
  final Widget? userHead;
  final Util? util;
  final BorderRadius? headBorderRadius;
  final bool? isExpanded;
  final double headBottomMargin;
  final CrossAxisAlignment? crossAxisAlignment;

  const WhipSword({
    super.key,
    required this.body,
    this.util,
    this.head,
    this.userHead,
    this.headBorderRadius,
    this.isExpanded,
    required this.headBottomMargin,
    this.crossAxisAlignment,
  });

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

  CrossAxisAlignment? crossAxisAlignment;

  @override
  void initState() {
    super.initState();
    isExpanded = widget.isExpanded ?? true;
    isExpanding = false;
    util = widget.util ?? Util();
    isInit = false;
    crossAxisAlignment = widget.crossAxisAlignment ?? CrossAxisAlignment.start;

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
      crossAxisAlignment: crossAxisAlignment!,
      mainAxisSize: MainAxisSize.min,
      children: [
        HeadContent(
          headBottomMargin: widget.headBottomMargin,
          borderRadius: widget.headBorderRadius,
          util: util!,
          userHead: widget.userHead,
          child: widget.head,
        ),
        isExpanded == true
            ? const SizedBox()
            : BodyContent(
              
                util: util!,
                userBody: null,
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
