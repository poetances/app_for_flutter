
import 'package:flutter/material.dart';
import 'package:app_for_fluuter/methodChannel/custom_method_channel.dart';

class MethodChannelPage extends StatefulWidget {
  
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MethodChannelPageState();
  }
}

class _MethodChannelPageState extends State<MethodChannelPage> {
  
  List<String> _list = const ["","",""];
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("MehodChannelPage"),
      ),
      body: ListView.separated(
          itemBuilder: (context, index){
            return ListTile(
              title: Text("${_list[index]}=======$index"),
              onTap: (){
                if(index == 0){
                  CustomMethodChannel().iosInfo.then((value){
                    print("获取到的结果是:$value");
                  });

                }else{

                }

              },
            );
          }, 
          separatorBuilder: (context, index) => Divider(), 
          itemCount: _list.length
      ),
    );
  }
}