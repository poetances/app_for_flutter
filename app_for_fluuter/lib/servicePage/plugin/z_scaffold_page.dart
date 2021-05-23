
import 'package:app_for_fluuter/common/z_scaffold.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ZScaffoldPage extends StatefulWidget {

  @override
  _ZScaffoldPageState createState() => _ZScaffoldPageState();
}

class _ZScaffoldPageState extends State<ZScaffoldPage> {

  Future<void> testFuture() async{
    print("开始测试----");
    Future.delayed(Duration(seconds: 1), (){
        for(int i =0 ; i< 10000; i++) {
          print("object-$i");
        }

    });
    other();
    print("开始结束----");
  }

  void other() {
    print("other----");

  }

  @override
  Widget build(BuildContext context) {

    return ZScaffold(
      hasProgressHud: true,
      hasEmptyWidget: true,
      appBar: AppBar(
        title: Text('ZScaffoldPage'),
      ),
      body: Builder(builder: (context){

       return Column(
         mainAxisAlignment: MainAxisAlignment.center,
         children: [
           RaisedButton(
             onPressed: (){
               showBottomSheet(context: context, builder: (context){
                 return Container();
               });

             },
             child: Text('progress showLoading'),
           ),
           RaisedButton(
             onPressed: (){

               showSuccessProgressHud(context, text: "成功");
             },
             child: Text('progress showSuccess'),
           ),
           RaisedButton(
             onPressed: (){
               showErrorProgressHud(context, text: "失败");

             },
             child: Text('progress showError'),
           ),
           RaisedButton(
             onPressed: (){
               showHintProgressHud(context, '提示');

             },
             child: Text('progress showHint'),
           ),
           RaisedButton(
             onPressed: (){
               dismissProgressHud(context);
             },
             child: Text('progress hidden'),
           ),

           Divider(),

           RaisedButton(
             onPressed: (){
               showLoadingEmptyWidget(context, loading: CupertinoActivityIndicator());

               Future.delayed(Duration(seconds: 3)).then((value){
                 dismissEmptyWidget(context);
               });
             },
             child: Text('showLoadingEmptyWidget'),
           ),
           RaisedButton(
             onPressed: (){
               showEmptyWidget(context,
                 title: Text('标题'),
                 subTitle: Text('副标题')
               );

               Future.delayed(Duration(seconds: 3)).then((value){
                 dismissEmptyWidget(context);
               });

             },
             child: Text('showEmptyWidget'),
           ),
           RaisedButton(
             onPressed: (){

               showBottomSheet(context: context, builder: (context){
                 return Container(
                   color: Colors.blue,
                 );
               });

               //testFuture();
             },
             child: Text('empty widget hidden'),
           ),
         ],
       );
      }),

    );
  }
}
