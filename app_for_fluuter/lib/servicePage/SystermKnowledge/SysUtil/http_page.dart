
import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:convert';



class HttpPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _HttpPage();
  }
}

class _HttpPage extends State<HttpPage> {

  String _netWorkResources = 'Null';


  void _fetchNetWorkResource() async {

    // flutter 网络请求，几个步骤。

    // 1、创建HttpClient。
    HttpClient client = HttpClient();

    Uri url = Uri.parse('https://www.baidu.com');

    // 如果服务器需要验证，可以通过client进行验证配置。目前flutter，支持，basic和digest两种认证凭据。
    // 一般我们发送网络氢气，如果该请求需要进行验证，那么reponseCode = 401，而且会增加www-authenticte 字段。
    // 如WWW-Authenticate: Basic realm="admin" 。realm表示认证域。
    // 服务器及需要增加authenticate字段。如 Authorization: Basic YXXFISDJFISJFGIJIJG
    // client.addCredentials(url, 'admin', HttpClientBasicCredentials('', ''));

    // 还有一种是动态验证。即，我们可以监听client是否需要验证的毁掉，如果需要验证，那么我们就动态的添加验证。
//    client.authenticate = (url, schem, realm) async {
//
//      if(url.host=="xx.com" && realm=="admin") {
//        client.addCredentials(url,
//          "admin",
//          new HttpClientBasicCredentials("username","pwd"),
//        );
//        return true;
//      }
//      return false;
//    };


    // 同样可以设置代理。和认证的过程有点相似。


    // Https中为了防止通过伪造证书而发起的中间人攻击，客户端应该对自签名或非CA颁发的证书进行校验。HttpClient对证书校验的逻辑如下：
    //如果请求的Https证书是可信CA颁发的，并且访问host包含在证书的domain列表中(或者符合通配规则)并且证书未过期，则验证通过。
    //如果第一步验证失败，但在创建HttpClient时，已经通过SecurityContext将证书添加到证书信任链中，那么当服务器返回的证书在信任链中的话，则验证通过。
    //如果1、2验证都失败了，如果用户提供了badCertificateCallback回调，则会调用它，如果回调返回true，则允许继续链接，如果返回false，则终止链接。
    //综上所述，我们的证书校验其实就是提供一个badCertificateCallback回调，下面通过一个示例来说明。

    // 其中CA是电子商务认证机构。负责专门的数字证书认证。如果是可信CA颁发的，一般会认证证书可信赖。

//    String PEM="XXXXX";//可以从文件读取
//
//    client.badCertificateCallback=(X509Certificate cert, String host, int port){
//      if(cert.pem==PEM){
//           return true; //证书一致，则允许发送数据
//      }
//          return false;
//    };

//    SecurityContext sc=new SecurityContext();
////file为证书路径
//    sc.setTrustedCertificates(file);
////创建一个HttpClient
//    HttpClient httpClient = new HttpClient(context: sc);


    // 2、打开http链接。
    HttpClientRequest request = await client.getUrl(url);

    request.headers.add(
        "user-agent",
        "Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_1 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/10.0 Mobile/14E304 Safari/602.1"
    );


    // 3、等待链接服务器（会将请求信息发送给服务器）。
    HttpClientResponse response = await request.close();


    // 4、读取响应信息。
    String responseString = await response.transform(utf8.decoder).join();

    setState(() {
      _netWorkResources = responseString;
    });

    // 4、关闭client。关闭后，通过该client发送的请求，都将终止。
    client.close();

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HttpPage"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          RaisedButton(
            onPressed: (){
              _fetchNetWorkResource();
            },
            child: Text('获取网络数据'),
            textColor: Colors.purple,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          ),
          Divider(),
          Container(
            child: Text(_netWorkResources, overflow: TextOverflow.ellipsis, maxLines: 20,),
          ),

        ],
      ),
    );
  }
}