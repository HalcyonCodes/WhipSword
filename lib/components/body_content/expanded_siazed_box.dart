import 'package:flutter/material.dart';
import '../../util.dart';

class ExpandedSizedBox extends StatefulWidget {
  final Util util;
  const ExpandedSizedBox({super.key, required this.util});

  @override
  State<ExpandedSizedBox> createState() => _ExpandedSizedBoxState();
}

class _ExpandedSizedBoxState extends State<ExpandedSizedBox> {
  @override
  void initState() {
    super.initState();

    widget.util.setFuncRefreshBodyHeight(() {});
  }

  @override
  Widget build(BuildContext context) {
    return const SizedBox();
  }
}
