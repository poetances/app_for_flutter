
import 'package:flutter/services.dart';

class CustomMethodChannel {

  static const MethodChannel methodChannel = MethodChannel(
    'plugins.flutter.io/customPluginManager',
  );


  // async的返回类型一定是Future。因为async，所以函数内部会有异步操作。那么返回值就不可能立即执行。所以必须是future。
  Future<String> get iosInfo async{
    return await methodChannel.invokeMethod<String>("iosInfo","arguments: zhucj");
  }



}