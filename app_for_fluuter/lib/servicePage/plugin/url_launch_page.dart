
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlLaunchPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _UrlLaunchPageState();
  }
}

class _UrlLaunchPageState extends State<UrlLaunchPage> {

  // 不添加返回值，默认是dynamic类型。
  _launchUrl() async{

    /*
    Scheme	Action
    http:<URL> , https:<URL>, e.g. http://flutter.dev	Open URL in the default browser
    mailto:<email address>?subject=<subject>&body=<body>, e.g. mailto:smith@example.org?subject=News&body=New%20plugin	Create email to
    tel:<phone number>, e.g. tel:+1 555 010 999	Make a phone call to
    sms:<phone number>, e.g. sms:5550101234	Send an SMS message to
    */

    const String url = 'http://www.baidu.com';
    bool canLaunchUrl = await canLaunch(url);

    print('canLaunchUrl:----------$canLaunchUrl');
    if(!canLaunchUrl) return;
    launch(url);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('UrlLaunchPage'),
      ),
      body: Center(
        child: RaisedButton(
            onPressed: (){
              _launchUrl();
            },
          child: Text('UrlLaunch'),
        ),
      ),
    );
  }
}