import 'package:flutter/material.dart';
import '../../util.dart';

//修改弹出高度
class PopContent extends StatefulWidget {
  final Widget widget;
  final Util util;

  const PopContent({
    super.key,
    required this.util,
    required this.widget,
  });

  @override
  State<PopContent> createState() => _PopContentState();
}

class _PopContentState extends State<PopContent> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.util.bodyAnimation!,
      builder: (context, child) {
        return widget.util.getInit!() == true
            ? SizedBox(
                height:
                    widget.util.bodyHeight * (widget.util.bodyAnimation!.value),
                child: ClipPath(
                  clipper: RectangleClipper(height: widget.util.bodyHeight * (widget.util.bodyAnimation!.value) ),
                  child: ScrollConfiguration(
                    behavior: ScrollConfiguration.of(context)
                        .copyWith(scrollbars: false),
                    child: SingleChildScrollView(
                      clipBehavior: Clip.none,
                      child: widget.widget,
                    ),
                  ),
                ))
            : const SizedBox();
      },
    );
  }
}

class RectangleClipper extends CustomClipper<Path> {
  final double height;

  const RectangleClipper({required this.height});

  @override
  Path getClip(Size size) {
    final path = Path();
    path.addRect(Rect.fromLTRB(-500, 0, 1920, height));
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
