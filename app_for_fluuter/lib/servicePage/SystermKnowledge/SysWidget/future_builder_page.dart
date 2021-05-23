
import 'package:flutter/material.dart';


// 这种定义方式，和ios中的block很想。
typedef bool TestDefine(String status);


class StaticClass {

}

class FutureBuilderPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _FutureBuilderPageState();
  }
}

class _FutureBuilderPageState extends State<FutureBuilderPage> {


    Future<String> _futureMethod() async{

   await Future.delayed(Duration(seconds: 3));

  }

  Future<String> _futureMethod1() async{

     _futureMethod().then((response){
       print(response);
     });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FutureBuilderPage'),
      ),
      body: Center(
        child: RaisedButton(
            onPressed: (){


        },
//        child: FutureBuilder(
//            future: _futureMethod1(),
//            builder: (context, snapshot){
//              if(snapshot.connectionState == ConnectionState.done) return Text('ConnectionState.done', style: TextStyle(fontSize: 20),);
//              return CircularProgressIndicator();
//            }
        ),
      ),
    );
  }
}