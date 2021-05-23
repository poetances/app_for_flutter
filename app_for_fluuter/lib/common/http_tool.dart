
import 'package:dio/dio.dart';
import 'dart:async';



class HttpUtils {


  static String baseUrl = "http://wallettest.cros.work/";

  static Dio _dio;
  static Dio _createDio() {
    if (_dio == null) {
      BaseOptions dioOption = BaseOptions(baseUrl: baseUrl);
      _dio = Dio(dioOption);

    }
    return _dio;
  }


  // /wallet/user/wallet/userInfo
  static request(
      String url,
      {
        String method = "POST",
        Map<String, dynamic> parames
      }) async {


      Dio dio = _createDio();
      var responseData;

      try {

        Response response = await dio.request(url, queryParameters: parames, options: Options(method: method));
        responseData = response.data;
        print('请求结果:' + responseData.toString());

      }on DioError catch(error) {

        print('错误信息:' + error.toString());
      }

      return responseData;

  }


  static close() {
    _dio = null;
  }



}