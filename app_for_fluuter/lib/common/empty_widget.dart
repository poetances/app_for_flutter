
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


enum EmptyWidgetType {
  Loading,
  hidden,
  show,
}


class EmptyWidget extends StatefulWidget {
  
  final Widget child;
  final Color  backgroundColor;
  EmptyWidget({
    Key key,
    @required this.child,
    this.backgroundColor = Colors.white})
      :super(key: key);
  
  static EmptyWidgetState of(BuildContext context) {
    return context.findAncestorStateOfType<EmptyWidgetState>();
  }
  
  @override
  EmptyWidgetState createState() => EmptyWidgetState();
}

class EmptyWidgetState extends State<EmptyWidget> {

  EmptyWidgetType _emptyWidgetType;
  Widget _emptyWidget;
  Widget _loadingWidget;


  /// empty view start 
  void showLoadingEmptyWidget({Widget loading}) {

    setState(() {
      _emptyWidgetType = EmptyWidgetType.Loading;
      _loadingWidget  = _createLoadingWidget(loading: loading);
    });
  }

  void showEmptyWidget({Text title, Text subTitle, Image placeHoledImage, MaterialButton button}) {
    setState(() {
      _emptyWidgetType = EmptyWidgetType.show;
      _emptyWidget = _createEmptyWidget(title: title, subTitle: subTitle, placeHoledImage: placeHoledImage, button: button);
    });
  }

  void showCustomEmptyWidget(Widget customWidget) {
    setState(() {
      _emptyWidgetType = EmptyWidgetType.show;
      _emptyWidget = customWidget;
    });
  }

  void dismissEmptyWidget() {
    setState(() {
      _emptyWidgetType = EmptyWidgetType.hidden;
    });
  }
  
  
  @override
  void initState() {
    super.initState();
    
    _emptyWidgetType = EmptyWidgetType.hidden;
    _loadingWidget   = _createLoadingWidget();
    _emptyWidget     = _createEmptyWidget();
  }

  @override
  Widget build(BuildContext context) {

    Widget emptyWidget;
    if(_emptyWidgetType == EmptyWidgetType.Loading) {
      emptyWidget = _loadingWidget;
    }else if(_emptyWidgetType == EmptyWidgetType.show) {
      emptyWidget = _emptyWidget;
    }

    return Stack(
      alignment: Alignment.center,
      fit: StackFit.expand,
      children: [
        widget.child,
        Offstage(
          offstage: _emptyWidgetType == EmptyWidgetType.hidden,
          child: Container(
            color: widget.backgroundColor,
            padding: EdgeInsets.symmetric(horizontal: 20),
            alignment: Alignment.center,
            child: emptyWidget,
          ),
        )
      ],
    );
  }
  
  /// private method
  Widget _createEmptyWidget({Text title, Text subTitle, Image placeHoledImage, MaterialButton button}) {
    List<Widget> _children = List();
    if(title != null) {
      _children.add(title);
    }
    if(subTitle != null) {
      _children.add(subTitle);
      _children.add(SizedBox(height: 10,));
    }
    if(placeHoledImage != null) {
      _children.add(placeHoledImage);
      _children.add(SizedBox(height: 10,));
    }
    if(button != null) {
      _children.add(button);
    }
    
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: _children,
    );
  }

  Widget _createLoadingWidget({Widget loading}) {
    return loading != null? loading:CupertinoActivityIndicator();
  }
}
