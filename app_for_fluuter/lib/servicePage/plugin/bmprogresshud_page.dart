
import 'package:app_for_fluuter/common/mixin.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:app_for_fluuter/common/progress_hud.dart';

import 'dart:async';



class BMProgressHudPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _BMProgressHudState();
  }
}


class _BMProgressHudState extends State<BMProgressHudPage>   {


  List<String> _contents = ['show','showLoading','showSuccessAndDismiss','showErrorAndDismiss','showAndDismiss','showMessage', "---"];
  double progress = 0;

  GlobalKey<ProgressHudState> _progressKey = GlobalKey();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    
    // _progressKey.currentState.showLoading();
  }

  @override
  Widget build(BuildContext context) {


    return GestureDetector(
      onTap: (){

        //Navigator.of(context).pop();
      },
      child: WillPopScope(
        child: Scaffold(
            appBar: AppBar(
              title: Text('BMProgressHudPage'),
            ),
            body: ProgressHud(
              key: _progressKey,
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return _itemCreate(context, index);
                },
                separatorBuilder: (context, index) => Divider(),
                itemCount: _contents.length,
              ),
            )
        ),
        onWillPop: (){
          print("WillPopScope----------");
          return Future.value(true);
        },
      ),
    );
  }

  Widget _itemCreate(BuildContext context, int index) {
    return ListTile(
      title: Text('${_contents[index]}-----$index'),
      onTap: (){

        if(index == 0) {

          _progressKey.currentState.show(ProgressHudType.loading, text: '加载中...');

          Future.delayed(Duration(seconds: 3)).then((value){
            _progressKey.currentState.dismiss();

          });
        }else if(index == 1) {
          _progressKey.currentState.showLoading();

          Future.delayed(Duration(seconds: 3)).then((value){
            _progressKey.currentState.showSuccess(text: 'chenggong');

          });
        }else if(index == 2) {
          _progressKey.currentState.showSuccess(text: 'showSuccessAndDismissshowSuccessAndDismissshowSuccessAndDismissshowSuccessAndDismissshowSuccessAndDismissshowSuccessAndDismissshowSuccessAndDismissshowSuccessAndDismissshowSuccessAndDismissshowSuccessAndDismissshowSuccessAndDismissshowSuccessAndDismissshowSuccessAndDismissshowSuccessAndDismissshowSuccessAndDismiss');
        }else if(index == 3) {
          _progressKey.currentState.showError();
        }else if(index == 4) {
          _progressKey.currentState.showProgress(progress, text: '下载中...');


          Timer.periodic(Duration(seconds: 1 ), (timer){
            progress += 0.1;
            if(progress > 1) {
              timer.cancel();
              _progressKey.currentState.dismiss();
              return;
            }
           _progressKey.currentState.updateProgress(progress, text:'下载中...');
          });

        }else if(index == 5) {
          _progressKey.currentState.showHint(hint:'下载失败');
        }else {

        }
      },
    );
  }

}

