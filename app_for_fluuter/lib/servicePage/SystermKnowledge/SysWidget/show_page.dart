
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ShowPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _ShowPageState();
  }
}

class _ShowPageState extends State<ShowPage> with SingleTickerProviderStateMixin {


  List<String> _list = ["showBottomSheet","showDatePicker","showTimePicker","showDialog",
  "showCupertinoDialog","showAboutDialog","showGeneralDialog","showBottomSheet","showModalBottomSheet",
  "showLicensePage","showCupertinoModalPopup","---" ];


  TabController _tabController;
  AppBar _appBar;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _tabController = TabController(length: _list.length, vsync: this);
    _appBar = AppBar(
      title: Text("ShowPage"),
      centerTitle: true,
      elevation: 1,
      bottom: PreferredSize(child: TabBar(
        tabs: _list.map((value){
          return SizedBox(height: 30,child: Text(value),);
        }).toList(),
        controller: _tabController,
        isScrollable: true,
      ), preferredSize: Size(double.infinity, 30))
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar,
      body: SafeArea(
          bottom: false,
          child: ListView.separated(
              itemBuilder: (context, index){
                return ListTile(
                  title: Text(_list[index]),
                  onTap: (){

                    if(index == 0) {
                      showBottomSheet(
                          context: context,
                          builder: (context){
                            return FlutterLogo(size: 100,);
                          });

                    }else if(index == 1){
                      showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2018),
                        lastDate: DateTime(2020),
                        initialDatePickerMode: DatePickerMode.day,

                      );

                    }else if(index == 2) {
                      showTimePicker(context: context, initialTime: TimeOfDay.now());

                    }else if(index == 3) {
                      showDialog(context: context, builder: (context){

                        return Center(
                          child: Container(
                            color: Colors.purple,
                            child: RaisedButton(onPressed: (){}, child: Text("rase button"),),
                          ),
                        );
                      });

                    }else if(index == 4){
                      showCupertinoDialog(context: context, builder: (context){
                        return Center(
                          child: Container(
                            width: 100,
                            height: 100,
                            color: Colors.purple,
                            child: RaisedButton(onPressed: (){
                              Navigator.of(context).pop();
                            }),
                          ),
                        );
                      });

                    }else if(index == 5){
                      showAboutDialog(context: context,

                      );

                    }else if(index == 6){
                      showGeneralDialog(context: context,
                          barrierDismissible: true,
                          barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
                          transitionDuration: Duration(seconds: 1),
                          pageBuilder: (context, animation, secondeAnimation){
                            return Center(
                              child: Container(
                                width: 100,
                                height: 100,
                                color: Colors.purple,
                              ),
                            );
                          });

                    }else if(index == 7) {
                      showBottomSheet(context: context, builder: (context){
                        return Container(
                          width: double.infinity,
                          height: 100,
                          color: Colors.purple,
                          child: Text("hello, Dialog",),
                        );
                      });

                    }else if(index == 8) {
                      showModalBottomSheet(context: context, builder: (context){
                        return Container(
                          width: 100,
                          height: 100,
                          color: Colors.purple,
                          child: Text("hello, Dialog",),
                        );
                      });

                    }else if(index == 9) {
                      showLicensePage(context: context);


                    }else if(index == 10){
                      showCupertinoModalPopup(context: context, builder: (context){
                        return Container(
                          width: 100,
                          height: 100,
                          color: Colors.purple,
                          child: Text("hello, Dialog",),
                        );
                      });

                    }else {

                      Scaffold.of(context).showBodyScrim(true, 0.5);
                    }



                  },
                );
              },
              separatorBuilder: (context, index) => Divider(),
              itemCount: _list.length
          ),
      ),
      bottomNavigationBar: Container(
        color: Colors.purple,
        height: 50,
        child: BottomAppBar(

        ),
      )
    );
  }
}