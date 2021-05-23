
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class PathProviderPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _FileProviderPage();
  }
}

// ios的本地缓存。其实也就是沙盒。
// Document、Libary（Cache和Perference（NSUserDefault保存的plist在此存着））、Temp。
// 其中Document和Perference是会自动备份。而且，app更新后，会将其从旧的沙盒中拷贝到新的沙盒中。所以我们做引导页的时候，
// 如果想要使用NSUserDefault，那么就需要进行版本号匹配。

// Android的本地缓存要复杂的多。
// Android有内部存储和外部存储（SDCard）两大类。
// Internal Storage是一直可以使用的，而且不能被其它的app访问（也就是一个app，有相应的Internal Storage），而且当app卸载，那么会将其清空。
//    内部存储有一般我们会使用两部分。lib(getFilesDir())和cache(getCacheDir())其区别是cache目录下面的文件，当app内存不足的时候就会将其清空。
//    lib只有在app卸载的时候才会清空。
//    而且lib中的内存，在app更新的时候是不会清空的。有点类似ios的lib中的Perference目录。
// External Storage并不是一直可以访问的，因为用户可以将其设置为USB存储模式，这样就不可以访问了。
//    External Storage是所有的app都可以访问的。当app卸载的时候，只会清空External Storage里面相关的内容。
//    所以，如果我们保存的文件不需要控制权限，而且希望可以被其它app访问，那么我们就可以保存在该目录下面。
// Android中，读取内部存储是不需要访问权限的。但是要访问外部存储是需要访问权限的。需要在项目中，配置权限。

// 外部存储，因为有可能当app与pc连接的时候，设置为USB模式。所以这个时候我们是无法访问SDCard的。所以，我们需要在使用的时候，对其状态进行判断。
// 外部存储，也有私有概念。可以理解为相对私有。
// 就像我们在前面获取内部存储的方法一样，我们使用Context.getExternalCacheDir()和Context.getExternalFilesDir()就可以获取到外部存储的私有文件。
// 对于的目录是。我们创建的私有文件的地址是/sdcard/Android/date/package_name下面，Android文件夹是隐藏文件夹，用户无法操作。
// 外部存储，公共存储部分，用户可见。其他app可以访问。
// Environment.getExternalStorageDirectory() : 外部存储的更目录。
// Environment.getExternalStoragePublicDirectory() : 外部存储的公共目录。



class _FileProviderPage extends State<PathProviderPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FileProviderPage"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RaisedButton(
              onPressed: () async{
                Directory directory = await getTemporaryDirectory();
                print(directory.path);

                // ios就是沙盒中的temp文件夹。
                // Android是。/data/user/0/com.example.my_flutter/cache

              },
            child: Text('getTemporaryDirectory'),
          ),
          Divider(),
          RaisedButton(
            onPressed: () async{
              Directory directory = await getApplicationDocumentsDirectory();
              print(directory.path);

              // ios 就是沙盒的Document文件夹路径。
              // Android。 /data/user/0/com.example.my_flutter/app_flutter

            },
            child: Text('getApplicationDocumentsDirectory'),
          ),
          Divider(),
          RaisedButton(
            onPressed: () async{
              Directory directory = await getExternalStorageDirectory();
              print(directory.path);


              // Android。/storage/emulated/0/Android/data/com.example.my_flutter/files。
              // 其实该目录是Google官方建议存储的地方。相对内部存储，当app卸载，会将里面的内容删除，而且其他app无法访问该路径。
              // 但是，如果用户想要保存的内容，其他app可以访问。那么这样保存就有问题。

            },
            child: Text('getExternalStorageDirectory'),
          ),
          Divider(),
          RaisedButton(
            onPressed: () async{
              Directory directory = await getApplicationSupportDirectory();
              print(directory.path);

              // ios 会在。Lib下面创建一个Application Support文件夹。06B44587-B95E-4F7F-B87C-4BEF0AF7D90D/Library/Application Support
              // android是。/data/user/0/com.example.my_flutter/files
            },
            child: Text('getApplicationSupportDirectory'),
          )
        ],
      ),

    );
  }
}