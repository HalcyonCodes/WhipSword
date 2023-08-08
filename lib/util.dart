import 'package:flutter/material.dart';

class Util {
  //body弹出动画
  Function? _startBodyAnimate;
  Function? get startBodyAnimate => _startBodyAnimate;
  void setFuncStartBodyAnimate(Function? func) {
    _startBodyAnimate = func;
  }

  //body收缩动画
  Function? _reverseBodyAnimate;
  Function? get reverseBodyAnimate => _reverseBodyAnimate;
  void setFuncReverseBodyAnimte(Function? func) {
    _reverseBodyAnimate = func;
  }

  //head弹出动画
  Function? _startHeadAnimate;
  Function? get startHeadAnimate => _startHeadAnimate;
  void setFuncStartHeadAnimate(Function? func) {
    _startHeadAnimate = func;
  }

  //head收缩动画
  Function? _reverseHeadAnimate;
  Function? get reverseHeadAnimate => _reverseHeadAnimate;
  void setFuncReverseHeadAnimte(Function? func) {
    _reverseHeadAnimate = func;
  }

  //body的高度
  double _bodyHeight = 0;
  double get bodyHeight => _bodyHeight;
  void setBodyHeight(double h) {
    _bodyHeight = h;
  }

  //GetBodyHeight组件中显示overlay
  Function? _showBodyTemp;
  Function? get showBodyTemp => _showBodyTemp;
  void setFuncShowBodyTemp(Function? func) {
    _showBodyTemp = func;
  }

  //GetBodyHeight组件中移除overlay
  Function? _removeBodyTemp;
  Function? get removeBodyTemp => _removeBodyTemp;
  void setFuncRemoveBodyTemp(Function? func) {
    _removeBodyTemp = func;
  }

  //animation
  Animation<double>? _animation;
  Animation<double>? get animation => _animation;
  void setAnimation(Animation<double>? a) {
    _animation = a;
  }

  //animatedController
  AnimationController? _animationController;
  AnimationController? get animationController => _animationController;
  void setAnimationController(AnimationController? a) {
    _animationController = a;
  }

  //

}
