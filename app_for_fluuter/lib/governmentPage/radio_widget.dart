
import 'package:flutter/material.dart';

class RadioWidget extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _RadioWidgetState();
  }
}

class _RadioWidgetState extends State<RadioWidget> with SingleTickerProviderStateMixin{

  int _radioValue = 1;
  double _slideValue = 0;

  AnimationController _controller;
  @override
  void initState() {

    super.initState();

    _controller = AnimationController(vsync: this);
    _controller.duration = Duration(seconds: 2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('hello'),
      ),

      body: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: <Widget>[


              Row(
                children: <Widget>[
                  Radio(
                      value: 1,
                      groupValue: _radioValue,
                      onChanged: (value){
                        setState(() {
                          print(value);
                          _radioValue = value;
                        });
                      }
                  ),

                  Radio(
                      value: 2,
                      groupValue: _radioValue,
                      onChanged: (value){
                        setState(() {
                          print(value);
                          _radioValue = value;
                        });
                      }
                  ),

                  Radio(
                      value: 3,
                      groupValue: _radioValue,
                      onChanged: (value){
                        setState(() {
                          print(value);
                          _radioValue = value;
                        });
                      },
                      materialTapTargetSize: MaterialTapTargetSize.padded,
                      activeColor: Colors.purple,
                      
                  ),

                  GestureDetector(
                    child: Text('GestureDetector'),
                    onTap: (){
                      print('点击 GestureDetector-Text');
                    },
                  ),

                  Listener(
                    child: Text('Listener'),
                    onPointerDown: (PointerDownEvent event){
                      print("Listener--onPointerDown");
                    },
                  ),

                  Container(
                    width: 50,
                    height: 50,
                    child:  Checkbox(
                        value: true,
                        onChanged: (value){
                          setState(() {

                          });
                        },
                      materialTapTargetSize: MaterialTapTargetSize.padded,
                    ),
                    color: Colors.purple,
                  )



                ],
              ),

              Divider(),

              SizedBox(
                height: 3,
                child: LinearProgressIndicator(
                  value: 0.5,
                  backgroundColor: Colors.black,
                  valueColor: AlwaysStoppedAnimation(Colors.amber),
                ),
              ),
              SizedBox(height: 20,),
              SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  value: 0.5,
                  backgroundColor: Colors.black,
                  valueColor: AlwaysStoppedAnimation(Colors.red),
                ),
              ),
              Slider(
                  label: "Labe",
                  min: 0,
                  max: 100,
                  divisions: 10,
                  activeColor: Colors.red,
                  inactiveColor: Colors.black,
                  value: _slideValue,
                  onChanged: (value){
                      setState(() {
                        _slideValue = value;
                      });
                  },
              ),

              

              SizedBox(
                height: 50,
              ),
              RaisedButton(onPressed: (){
                _controller.forward();
              })


            ],
          ),
      ),
    );
  }
}