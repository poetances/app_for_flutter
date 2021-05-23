import 'package:flutter/material.dart';
import 'textfield_page.dart';
import 'radio_widget.dart';
import 'date_time_widget.dart';
import 'search_bar_widget.dart';
import 'animator_widget.dart';
import 'notify_widget.dart';
import 'package:flutter/cupertino.dart';


class GovernmentPage  extends StatefulWidget {
  @override
  _GovernmentPageState createState() =>  _GovernmentPageState();
}

class _GovernmentPageState extends State<GovernmentPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('政务'),
        backgroundColor: Colors.grey,
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
        MediaQuery.removeViewInsets(context: context,
            removeTop: true,
            removeRight: true,
            child: RaisedButton(
                child: Text('TextFieldWidget'),
                color: Colors.purple,
                highlightColor: Colors.red,
                elevation: 5,
                onPressed: () {
                  print('RaisedButton click');

                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) {
                    return TextFieldWidget();
                  }));
                }
            )),
          Container(
            //margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
            width: 150,
            height: 50,
            child: RaisedButton(
                child: Text('RadioWidget', overflow: TextOverflow.ellipsis,),
                color: Colors.blue,
                highlightColor: Colors.yellow,
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return RadioWidget();
                  }));
                }
            ),
          ),
          RaisedButton.icon(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return DateTimeWidget();
                }));
              },
              icon: Icon(Icons.add),
              label: Text('DateTimeWidget'),
              clipBehavior: Clip.hardEdge,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(1)), // 给圆角
          ),
          RaisedButton.icon(
              onPressed: (){

              },
              icon: Icon(Icons.print),
              label: Text('圆形按钮'),
              shape: CircleBorder(
                  side: BorderSide(
                    color: Colors.red,
                    width: 2
                  )
              ),
          ),
          Divider(),
          SizedBox(height: 20,),
          FlatButton(
              color: Colors.blue,
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return SearchBarWidget();
                }));
              },
              child: Text('SearchBarWidget')
          ),
          OutlineButton(
              onPressed: (){

                Navigator.of(context).push(MaterialPageRoute(builder: (context) => AnimationWidget())).then((value){
                  print('反向传尺成功--$value');
                });

              },
            child: Text("AnimationWidget"),
            disabledBorderColor: Colors.purple,
            highlightedBorderColor: Colors.red,
          ),
          IconButton(icon: Icon(Icons.settings), onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => NotificationRoute()));
          },
            color: Colors.purple,
            highlightColor: Colors.grey,
          ),
          ButtonBar(
            alignment: MainAxisAlignment.start,
            children: <Widget>[
              RaisedButton(
                  onPressed: (){

                 },
                child: Text('ButtonBar1'),
              ),
              RaisedButton(
                  onPressed: (){

                  },
                child: Text('ButtonBar1'),
              ),

            ],
          ),

        ],
      ),
    );
  }


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

  }
}

