
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class SpinKitPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SpinKitPageState();
  }
}

class _SpinKitPageState extends State<SpinKitPage> with TickerProviderStateMixin {

  AnimationController _animationController;

  Animation<double> _animation;
  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(vsync: this, duration: Duration(seconds: 5));

    _animation = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
          parent: _animationController,
          curve: Interval(0.5, 1)
      )
    )..addListener(()=>setState((){}));


  }

  @override
  Widget build(BuildContext context) {



    return Scaffold(
      appBar: AppBar(
        title: Text('SpinkKitPage'),
        actions: <Widget>[
          IconButton(
              icon:Icon(Icons.apps),
              onPressed: (){
                _animationController.forward();
              }
          )
        ],
      ),
      body: GridView.builder(
          padding: EdgeInsets.all(10),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 1,
              mainAxisSpacing: 1,
              childAspectRatio: 1/1, // 宽高比。
          ),
//          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
//              maxCrossAxisExtent: 300,
//            crossAxisSpacing: 10,
//            mainAxisSpacing: 10,
//
//          ),
          itemBuilder: (context, index){

            if(index == 0) {
              return SpinKitRotatingCircle(
                duration: Duration(seconds: 5),
                itemBuilder: (context, index){
                  return FlutterLogo(
                    size: 20,
                  );
                },
              );
            }

            if(index == 1) {
              return SpinKitDoubleBounce(
                color: Colors.purpleAccent,
              );
            }

            if(index == 2) {
              return SpinKitWave(
                color: Colors.purpleAccent,
                size: 20,
              );
            }

            if(index == 3) {
              return SpinKitWanderingCubes(
                color: Colors.purpleAccent,
              );
            }

            if(index == 4) {
              return SpinKitFadingFour(
                color: Colors.purpleAccent,
              );
            }

            if(index == 5) {
              return SpinKitPulse(
                color: Colors.purpleAccent,
              );
            }

            if(index == 6) {
              return SpinKitRing(
                color: Colors.purpleAccent,
              );
            }



            if(index == 8) {


              return Container(
                color: Colors.purple.withOpacity(_animation.value),
              );
            }

            if(index == 9) {
              return FlutterLogo();
            }

            return Container(
              width: 100,
              height: 200,
              color: Colors.deepPurple,
            );
          },
          itemCount: 10,
      )
    );
  }

  @override
  void dispose() {
    _animationController.dispose();

    super.dispose();
  }
}

