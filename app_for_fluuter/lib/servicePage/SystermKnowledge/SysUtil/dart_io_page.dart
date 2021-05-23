
import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:convert';
import 'dart:async';
import 'package:path_provider/path_provider.dart';

class DartIoPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DartIoPageState();
  }
}

// Dart中关于文件的操作，有两个。Directory文件夹操作。 File 文件操作。
// 两个类的方法其实差不错。
// creatSync 和 create是同步或者是异步创建。
// reverse，是否递归。也就是如果有中间文件/文件夹是否创建中间文件或者文件夹。

// 对于我们前端人员来说。我们使用这两个类的基础是，知道app的路径。可以借助path_provider工具。

class _DartIoPageState extends State<DartIoPage> {


  List<String> _listTitles = ["file","fileStream","directory",""];

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: Text("DartIoPage"),
      ),
      body: ListView.separated(
          itemBuilder: (context, index){
            return ListTile(
              onTap: (){

                if(index == 0){

                  // file相当于操作文件。

                  // /Users/zhuchaojun/Documents/宝藏/FlutterApp/app_for_fluuter
                  File file = File("/Users/zhuchaojun/Documents/宝藏/FlutterApp/back/back.txt");

                  // 判断文件是否存在。
                  if(!file.existsSync()) {
                    // 和create的区别是，这个是同步创建的意思。recursive递归，也就是是否创建中间文件夹。
                    file.createSync(recursive: true);
                  }

                  // 向文件里面写内容。字符流的两种方式，字符串和bytes。
                  file.writeAsStringSync('这是我写入的内容----');
                  // 通过bytes的方式写。 注意写文件会覆盖原来的内容。
                  file.writeAsBytesSync(Utf8Encoder().convert("hello,world"));

                  file.writeAsBytesSync("hello.world".codeUnits);

                  print(file.absolute.path);


                  // 读取文件内容。 file.readAsLines 一行一行的读。
                  String stringContent = file.readAsStringSync();
                  print("当前文件内容是:$stringContent");

                  // file.rename 给文件重新命名。

                }else if(index == 1) {

                  // fileStream 其实就是文件流的方式。 其实这个模拟stream操作。我们其实可以直接copy进行操作。
                  File readFile = File("/Users/zhuchaojun/Documents/宝藏/个人简历.docx");
                  // 输出流。通过该流，listsen进行读取操作。
                  Stream<List<int>> readStream = readFile.openRead();

                  File writeFile = File("/Users/zhuchaojun/Documents/宝藏/FlutterApp/back.txt");
                  // 输入流。通过sink.add，进行写内容。
                  IOSink sink = writeFile.openWrite();

                  int readCount = 0, totalLength = readFile.lengthSync();
                  // 这补也可以分为两部分。 1、获取StreamSubscription，stream的订阅者。2、streamSubscription.ondata监听到的内容。
                  readStream.listen((List<int> read){

                    readCount += read.length;

                    double progress = readCount/totalLength;
                    print("读取进度为：${progress * 100}%");
                    // 向里面写内容。
                    sink.add(read);
                  }, onDone: (){

                    print("读取完成。");
                    sink.close(); // 需要关闭流。

                  });
                  

                }else if(index == 2) {

                  // Directory对文件夹（目录）操作。
                  Directory directory = Directory("/Users/zhuchaojun/Documents/宝藏/FlutterApp/BackDirectory");

                  if(!directory.existsSync()){

                    // 同样。里面有一个是否递归的参数。需要知道其含义。
                    directory.createSync();
                  }

                  print("当前文件夹路径:${directory.absolute.path}");

                }


              },
              title: Text('${_listTitles[index]}:-----$index'),
            );
          },
          separatorBuilder: (context, index) => Divider(),
          itemCount: _listTitles.length
      )
    );
  }
}