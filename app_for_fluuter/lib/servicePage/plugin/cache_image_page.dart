
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:app_for_fluuter/common/mixin.dart';

class CacheImagePage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _CacheImagePageState();
  }
}

class _CacheImagePageState extends State<CacheImagePage> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // 监听到.built完成。第一帧完成。只会调用一次。
    WidgetsBinding.instance.addPostFrameCallback((value){
      print('WidgetsBinding.instance.addPostFrameCallback--$value');
    });



    // 会频繁调用。界面每刷新一次。都会调用一次。
//    WidgetsBinding.instance.addPersistentFrameCallback((value){
//      print('WidgetsBinding.instance.addPersistentFrameCallback--$value');
//
//    });


    //showLoadingEmptyWidget();


    

  }

  @override
  Widget build(BuildContext context) {

    print('build');

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('CacheImagePage'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image.asset('assets/home/image0.png', width: 200, height: 100,),
          RaisedButton(onPressed: (){

          }, child: Text('fetchImage'),),
          Divider(),

          CachedNetworkImage(
            imageUrl: 'http://via.placeholder.com/200x150',
            errorWidget: (context, url, error){
              return Icon(Icons.error);
            },
            placeholder: (context, url){
              return CircularProgressIndicator();
            },
            width: 200,
            height: 400,
          )
        ],
      )
    );
  }
}