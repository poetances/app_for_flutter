
import 'package:flutter/material.dart';

class ShowPage extends StatefulWidget {

  @override
  createState() {
    return _ShowPageState();
  }
}

class _ShowPageState extends State<ShowPage> {




  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Plugin example app'),
      ),
      body: Builder(
          builder: (context){
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  onPressed: () {

                    Scaffold.of(context).showSnackBar(SnackBar(content: Text("showSnackBar")));
                  },
                  child: Text("showSnackBar"),
                ),
                Divider(),

                RaisedButton(
                  onPressed: () {

                   showBottomSheet(context: context,builder: (context){
                     return Container(
                       height: 300,
                       width: 200,
                       decoration: BoxDecoration(
                         color: Colors.purple,
                         border: Border.all(color: Colors.amber, width: 10),
                       ),
                     );
                   });

                    Future.delayed(Duration(seconds: 4)).then((value){


                      Navigator.of(context).pop();
                    });
                  },
                  child: Text("showBottomSheet"),
                ),
                Divider(),

                RaisedButton(
                  onPressed: () {


                    showModalBottomSheet(
                        context: context,
                        builder: (context)
                        {

                          return Center(
                            child: Container(
                              height: 300,
                              width: 200,
                              decoration: BoxDecoration(
                                color: Colors.purple,
                                border: Border.all(color: Colors.amber, width: 10),
                              ),
                            ),
                          );

                        });
                  },
                  child: Text("showModalBottomSheet"),
                ),
                Divider(),

                RaisedButton(
                  onPressed: () {

                    showDialog(context: context, builder: (context){

                      return AlertDialog(
                        title: Center(child: Text("AlertDialog"),),
                        content: Container(
                          height: 100,
                          color: Colors.purple,
                        ),
                        contentPadding: EdgeInsets.only(top: 0,bottom: 24,left: 24,right: 24),

                      );

                    });
                  },
                  child: Text("showDialog"),
                ),

                Divider(),
                RaisedButton(
                  onPressed: () {

                    print(context.size);

                    showGeneralDialog(
                      context: context,
                      barrierColor: Colors.black.withOpacity(0.2),
                      barrierDismissible: true,
                      barrierLabel: "barrierLabel",
                      transitionDuration: kThemeAnimationDuration,
                      pageBuilder: (context, startAnimation, endAnimation){
                        return Material(
                          child: Container(
                            height: 200,
                            width: 200,
                            color: Colors.purple,
                            child: Text("showGeneralDialog"),
                          ),
                        );
                      },
                      transitionBuilder: (context, startAnimation, endAnimation, chirld) {
                        return SlideTransition(
                          child: chirld,
                          position: Tween<Offset>(begin:Offset(0, 1), end: Offset(0, 0.75)).animate(startAnimation),
                        );
                      }
                    );

                  },
                  child: Text("showGeneralDialog"),
                ),

                Divider(),

                RaisedButton(
                  onPressed: () {

                    showMenu(

                        context: context, 
                        position: RelativeRect.fromLTRB(100.0, 200.0, 100, 100),
                        items: [
                          PopupMenuItem(child: Text("hello")),
                          PopupMenuItem(child: Text("world")),
                          PopupMenuItem(child: Text("menu")),

                        ],
                    );
                  },
                  child: Text("showMenu"),
                ),

                PopupMenuButton<String>(
                  tooltip: "PopupMenuButton",
                  color: Colors.purple,
                  itemBuilder: (BuildContext context) =>
                  <PopupMenuItem<String>>[
                    new PopupMenuItem<String>(
                        value: 'value01', child: new Text('Item One')),
                    new PopupMenuItem<String>(
                        value: 'value02', child: new Text('Item Two')),
                    new PopupMenuItem<String>(
                        value: 'value03', child: new Text('Item Three')),
                    new PopupMenuItem<String>(
                        value: 'value04', child: new Text('I am Item Four'))
                  ],
                )

              ],


            );
          },
      ),
    );
  }
}

