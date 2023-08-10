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

  //body的animation
  Animation? _bodyAnimation;
  Animation? get bodyAnimation => _bodyAnimation;
  void setBodyAnimation(Animation? a) {
    _bodyAnimation = a;
  }


  //body的animatedController
  AnimationController? _bodyAnimationController;
  AnimationController? get bodyAnimationController => _bodyAnimationController;
  void setBodyAnimationController(AnimationController? a) {
    _bodyAnimationController = a;
  }

  //head的animation
  Animation? _headAnimation;
  Animation? get headAnimation => _headAnimation;
  void setHeadAnimation(Animation? a) {
    _headAnimation = a;
  }


  //head的animatedController
  AnimationController? _headAnimationController;
  AnimationController? get headAnimationController => _headAnimationController;
  void setHeadAnimationController(AnimationController? a) {
    _headAnimationController = a;
  }
  


  //修改已经折叠标志
  Function? _changeExpanded;
  Function? get changeExpanded => _changeExpanded;
  void setFuncChangeExpanded(Function? func) {
    _changeExpanded = func;
  }

  //修改折叠状态是否在折叠中
  Function? _changeExpanding;
  Function? get changeExpanding => _changeExpanding;
  void setFuncChangeExpanding(Function? func) {
    _changeExpanding = func;
  }

  //获得折叠状态是否在折叠中
  Function? _getExpanding;
  Function? get getExpanding => _getExpanding;
  void setFuncGetExpanding(Function? func) {
    _getExpanding = func;
  }

  //获得折叠状态
  Function? _getExpanded;
  Function? get getExpanded => _getExpanded;
  void setFuncGetExpanded(Function? func) {
    _getExpanded = func;
  }
  

  //刷新最顶层
  Function? _refreshWhipSword;
  Function? get refreshWhipSword => _refreshWhipSword;
  void setFuncRefreshWhipSword(Function? func) {
    _refreshWhipSword = func;
  }

  //获得初始化状态
  Function? _getInit;
  Function? get getInit => _getInit;
  void setFuncGetInit(Function? func) {
    _getInit = func;
  }

    //获得初始化状态
  Function? _setInit;
  Function? get setInit => _setInit;
  void setFuncSetInit(Function? func) {
    _setInit = func;
  }

}
