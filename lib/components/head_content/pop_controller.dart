import 'package:flutter/material.dart';
import '../../util.dart';

class PopController extends StatefulWidget {
  final Util util;
  final Widget widget;
  final BorderRadius borderRadius;

  const PopController({super.key, required this.util, required this.widget, required this.borderRadius});

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
    return InkWell(
      onTap: onTap,
      child: ,
    );
  }


  void onTap(){

  }
}
