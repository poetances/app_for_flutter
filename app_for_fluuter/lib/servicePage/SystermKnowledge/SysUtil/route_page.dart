
import 'package:flutter/material.dart';

class RoutePage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _RoutePageState();
  }
}

class _RoutePageState extends State<RoutePage>  with SingleTickerProviderStateMixin {



  OverlayEntry _overlayEntry;

  void _raiseButtonClick() {

    Navigator.of(context).push(
        PageRouteBuilder(
          opaque: false,
          barrierDismissible: true,
          pageBuilder: (context, startAnimation, backAnimation) {
            return Stack(
              children: <Widget>[
                Positioned(
                  child: Container(
                    color: Colors.purple.withOpacity(0.5),
                  ),
                  left: 0,
                  right: 0,
                  bottom: 0,
                  top: 100,
                )
              ],
            );
          },
          transitionsBuilder: (context, startAnimation, backAnimation, chirld){
            return FadeTransition(
              opacity: Tween<double>(begin: 0.0, end: 1.0).animate(startAnimation),
              child: chirld,
            );
          }
        )
    );
  }

  void _overlayBtnClick() {

    Overlay.of(context).insert(
      _overlayEntry = OverlayEntry(
        builder: (context){
          return Positioned(
            top: 100,
            left: 0,
            right: 0,
            bottom: 0,
            child: Stack(
              children: <Widget>[
                GestureDetector(
                  onTap: (){
                    _overlayEntry.remove();
                  },
                  child: Container(
                    color: Colors.black.withOpacity(0.25),
                  ),
                ),

                Positioned(
                  child: Container(
                    color: Colors.white,
                  ),
                  bottom: 100,
                  top: 0,
                  left: 0,
                  right: 0,
                ),

              ],
            ),
          );
        },
      )
    );

  }

  @override
  Widget build(BuildContext context) {

    return WillPopScope(
        child: Scaffold(
          appBar: AppBar(
            title: Text("RoutePage"),
            centerTitle: true,
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              RaisedButton(
                child: Text("RouteBtn"),
                onPressed: _raiseButtonClick,
              ),

              Divider(),

              RaisedButton(
                child: Text("OverlayBtn"),
                onPressed: _overlayBtnClick,
              )
            ],
          ),
        ),
        onWillPop: () async{
           _overlayEntry.remove();
           return true;
        }
    );
  }
}

class SecondPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SecondPage();
  }
}

class _SecondPage extends State<SecondPage> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        alignment: Alignment(0, 0),
        color: Colors.purple.withOpacity(0.5),

        child: Text("second page"),
      ),
    );
  }
}
