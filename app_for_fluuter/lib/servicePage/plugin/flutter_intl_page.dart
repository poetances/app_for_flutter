
import 'package:flutter/material.dart';
import 'package:app_for_fluuter/generated/l10n.dart';

class FlutterIntlPage extends StatefulWidget {
  const FlutterIntlPage({Key key}) : super(key: key);

  @override
  _FlutterIntlPageState createState() => _FlutterIntlPageState();
}

class _FlutterIntlPageState extends State<FlutterIntlPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flutter intl'),),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Text(S.of(context).name),
          Divider(),
          Text(S.of(context).age),

        ],
      ),
    );
  }
}
