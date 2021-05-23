
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:ui';


enum ProgressHudType {
  /// 加载。CupertinoActivityIndicator
  loading,
  /// 显示Icons.check 和 text
  success,
  /// 显示Icons.close 和 text
  error,
  /// 显示CircularProgressIndicator
  progress,
  /// 只显示text内容。
  text
}



class ProgressHud extends StatefulWidget {

  /// 背景颜色。默认Colors.transparent
  final Color backgroundColor;

  /// 中间Container的颜色。默认Color.fromARGB(255, 232, 234, 236)
  final Color containerColor;

  /// 中间Container的Y轴偏移。默认-50.
  final double offsetY;

  /// 文本样式。TextStyle(fontSize: 16, color: Colors.white)
  final TextStyle textStyle;

  /// 图标大小。默认40。
  final double iconSize;

  /// 子控件。
  final Widget child;


  ProgressHud({
      Key key,
      @required this.child,
      this.backgroundColor = Colors.transparent,
      this.containerColor = const Color.fromARGB(255, 232, 234, 236),
      this.offsetY = -50,
      this.textStyle = const TextStyle(fontSize: 16, color: Color(0xFF262626)),
      this.iconSize = 40
  }) : super(key: key);

  static ProgressHudState of(BuildContext context) {
    return context.findAncestorStateOfType<ProgressHudState>();
  }


  @override
  ProgressHudState createState() => ProgressHudState();
}


class ProgressHudState extends State<ProgressHud> with SingleTickerProviderStateMixin {

  
  bool _isVisible = false;
  String _text;
  double _progressValue = 0;
  ProgressHudType _progressHudType;

  
  ///  * 显示Hud
  ///  * type，HUD类型
  ///  * test，内容
  void show(ProgressHudType type,{String text}) {

    _isVisible = true;
    _text = text;
    _progressHudType = type;
    setState(() {});
  }


  ///  * 显示Hud，并自动隐藏
  ///  * type，HUD类型
  ///  * test，内容
  Future<void> showAndDismiss(ProgressHudType type,{String text}) async {

    show(type, text: text);
    await Future.delayed(Duration(seconds: 3));
    dismiss();
  }


  ///  * 显示ProgressHudType.loading类型的hud
  void showLoading({String text}) {
     show(ProgressHudType.loading, text: text ?? '加载中...');
  }

  ///  * 显示ProgressHudType.success类型的hud
  Future<void> showSuccess({String text}) async {
    await showAndDismiss(ProgressHudType.success, text: text ?? '成功');
  }

  ///  * 显示ProgressHudType.error类型的hud
  Future<void> showError({String text}) async {
    await showAndDismiss(ProgressHudType.error, text: text ?? '失败');
  }

  ///  * 显示ProgressHudType.text类型的hud
  Future<void> showHint({String hint}) async {
    await showAndDismiss(ProgressHudType.text, text: hint ?? '');
  }

  ///  * 显示ProgressHudType.progress类型的hud
  void showProgress(double value, {String text}) async {

    show(ProgressHudType.progress, text: text ?? '');
    _progressValue = value;
    setState(() {});
  }

  ///  * 更新ProgressHudType.progress的value。
  void updateProgress(double value, {String text}) {
    if(value >1 || value < 0) return;
    _progressValue = value;
    _text = text;
    setState(() {});
  }


  ///  * 隐藏Hud
  void dismiss() {
    _isVisible = false;
    setState(() {});
  }


  /// private method
  @override
  Widget build(BuildContext context) {

    Widget hud = IgnorePointer(
      ignoring: false,
      child: Container(
        color: widget.backgroundColor,
        alignment: Alignment.center,
        child: Container(
            margin: _containerWidgetMargin,
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
                color: widget.containerColor,
                borderRadius: BorderRadius.circular(5)
            ),
            constraints: BoxConstraints(
                minHeight: 50,
                minWidth: 50,
                maxWidth: window.physicalSize.width/window.devicePixelRatio - 40
            ),
            child: _ProgressHudContainer(
              hudType: _progressHudType,
              progressValue: _progressValue,
              text: _text,
              textStyle: widget.textStyle,
              iconSize: widget.iconSize,
            )
        ),
      ),
    );

    return Stack(
      children: <Widget>[
        widget.child,

        Offstage(offstage: !_isVisible, child: _isVisible ? hud:null),
      ],
    );
  }

  /// private method
  // 调整ContainerWidget位置。
  EdgeInsets get _containerWidgetMargin{
    if(widget.offsetY < 0) {
      return EdgeInsets.only(bottom: -widget.offsetY);
    }else {
      return EdgeInsets.only(top: widget.offsetY);
    }
  }

}

///---------------------------------------------------------------
class _ProgressHudContainer extends StatefulWidget {

  final ProgressHudType hudType;
  final String    text;
  final TextStyle textStyle;
  final double    iconSize;
  final double    progressValue;
  _ProgressHudContainer({this.hudType, this.textStyle, this.iconSize, this.text, this.progressValue});

  @override
  _ProgressHudContainerState createState() => _ProgressHudContainerState();
}

class _ProgressHudContainerState extends State<_ProgressHudContainer> {

  @override
  Widget build(BuildContext context) {

    List<Widget> childes;
    switch (widget.hudType) {
      case ProgressHudType.loading:
        childes = _loadingWidgets();
        break;
      case ProgressHudType.error:
        childes = _errorWidgets();
        break;
      case ProgressHudType.success:
        childes = _successWidgets();
        break;
      case ProgressHudType.progress:
        childes = _progressWidgets();
        break;
      case ProgressHudType.text:
        childes = _textWidgets();
        break;
      default:
        throw Exception("not implementation");
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: childes,
    );
  }

  /// private method
  List<Widget> _loadingWidgets() {

    List<Widget> _hudList = [];
    _hudList.add(
        SizedBox(
            width: widget.iconSize,
            height: widget.iconSize,
            child: CupertinoActivityIndicator(animating: true, radius: widget.iconSize/3,)
        )
    );

    if(_textWidget != null) _hudList.add(_textWidget);
    return _hudList;
  }

  List<Widget> _successWidgets() {
    List<Widget> _hudList = [];

    _hudList.add(
        Icon(Icons.check, color: widget.textStyle.color, size: widget.iconSize)
    );
    if(_textWidget != null) _hudList.add(_textWidget);
    return _hudList;
  }

  List<Widget> _errorWidgets() {
    List<Widget> _hudList = [];

    _hudList.add(
        Icon(Icons.close, color: widget.textStyle.color, size: widget.iconSize)
    );
    if(_textWidget != null) _hudList.add(_textWidget);
    return _hudList;
  }


  List<Widget> _progressWidgets() {


    List<Widget> _hudList = [];

    _hudList.add(
        SizedBox.fromSize(
          child: CircularProgressIndicator(
            value: widget.progressValue,
            valueColor: AlwaysStoppedAnimation<Color>(widget.textStyle.color),
          ),
          size: Size(widget.iconSize, widget.iconSize),
        )
    );

    _hudList.add(
      SizedBox(height: 5,),
    );

    if(_textWidget != null) _hudList.add(_textWidget);
    return _hudList;
  }

  List<Widget> _textWidgets() {
    List<Widget> _hudList = [];
    if(_textWidget != null) _hudList.add(_textWidget);
    return _hudList;
  }


  Widget get _textWidget {
    if(widget.text == null || widget.text.length == 0) return null;
    return Text(
        widget.text,
        textAlign: TextAlign.center,
        style: widget.textStyle
    );
  }
}


