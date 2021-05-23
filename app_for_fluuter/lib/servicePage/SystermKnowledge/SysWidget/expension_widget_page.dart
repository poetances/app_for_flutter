
import 'package:flutter/material.dart';

/* 用于可展示二级/多级菜单的控件，常放于listView */
class ExpensionWidgetPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _ExpensionWidgetPageState();
}

class _ExpensionWidgetPageState extends State<ExpensionWidgetPage> {

  bool _isExpancel = false;

  Widget _itemBuilder(context, index){

    return ExpansionTile(
      title: Text("ExpansionTile"),
      leading: CircleAvatar(
        child: SizedBox(
          width: 50,
          height: 50,
          child: Center(child: Text("M",),),
        ),
      ),
      children: <Widget>[
        Text("children-1"),
        Text("children-2"),
        Text("children-3"),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ExpensionTitlePage"),
        centerTitle: true,
        elevation: 1,
      ),
      body: SingleChildScrollView(
        child: ExpansionPanelList(
          animationDuration: Duration(seconds: 1),
          expansionCallback: (index, isExpance){
            print(index);
            _isExpancel = !_isExpancel;
            setState(() {

            });
          },
          children: <ExpansionPanel>[
            ExpansionPanel(
                headerBuilder: (context, isExpand){
                  String text = isExpand?"isExpand=YES":"isExpand=NO";
                  return ListTile(title: Text(text),);
                },
                canTapOnHeader: true,
                body: Container(
                  width: double.infinity,
                  height: 200,
                  child: ListView.separated(
                      itemBuilder: (context, index){
                        return Text("---$index");
                      },
                      separatorBuilder: (context, index){
                        return Divider();
                      },
                      itemCount: 10
                  ),
                ),
                isExpanded: _isExpancel
            ),
          ],
        ),
      )
//      body: ListView.separated(
//          itemBuilder: _itemBuilder,
//          separatorBuilder: (context, index) => Divider(),
//          itemCount: 10
//      )
    );
  }
}

class AspectionBoxP extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      child: AspectRatio(aspectRatio: 2, child: Container(color: Colors.purple,),),
    );
  }
}

class FittedBoxP extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Center(
      child: Container(
        width: 200,
        height: 100,
        color: Colors.black,
        child: FittedBox(
          fit: BoxFit.none,
          child: Container(color: Colors.purple, width: 100, height: 100,),
        ),
      ),
    );
  }
}