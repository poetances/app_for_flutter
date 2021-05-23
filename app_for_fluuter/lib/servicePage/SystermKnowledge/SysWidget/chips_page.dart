
import 'package:flutter/material.dart';

class ChipsPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _ChipsPageState();
  }
}

class _ChipsPageState extends State<ChipsPage> {

  List<String> _wrapChip = ["enha","中国","李四","这还少一个很长的标题","中国","李四"];
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ChipsPage"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Chip(label: Text("Chip")),
            Divider(),
            Chip(
              label: Text("Chip2", style: TextStyle(fontSize: 20),),
              autofocus: true,
              avatar: CircleAvatar(child: Container(color: Colors.purple, child: Text(""),),),
              deleteButtonTooltipMessage: "enha",
              deleteIcon: Icon(Icons.delete),
              onDeleted: (){
                print("onDeleted");
              },
            ),
            Divider(),
            Wrap(
              spacing: 10,
              alignment: WrapAlignment.start,
              children: _wrapChip.map((value){
                return Chip(
                  label: Text(value),
                  padding: EdgeInsets.all(5),
                  avatar: CircleAvatar(
                    child: Container(
                      child: Text(value.substring(0, 1)),
                    ),
                  ),
                );
              }).toList(),
            ),
            Divider(),
            ActionChip(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                label: Text("ActionChip"),
                onPressed: (){
                  print("ActionChip");
                },
            ),
            Divider(),
            FilterChip(
                label: Text("FilterChip"),
                onSelected: (isSelected){
                  print(isSelected);
                  _isSelected = !_isSelected;
                  setState(() {

                  });
                },
              selectedColor: Colors.purple,
              selected: _isSelected,
            ),
            Divider(),
            ChoiceChip(
              label: Text("ChoiceChip"),
              selected: _isSelected,
              selectedColor: Colors.black26,
              disabledColor: Colors.purple,
              labelStyle: TextStyle(fontSize: 15, color: Colors.deepOrange),
              onSelected: (isSelected) {
                _isSelected = !_isSelected;
                setState(() {

                });
              },
            ),
            Divider(),
            ChoiceChip(
                label: Text("ChoiceChip"),
                //未选定的时候背景
                selectedColor: Color(0xff182740),
                //被禁用得时候背景
                disabledColor: Colors.grey[300],
                labelStyle: TextStyle(fontWeight: FontWeight.w200, fontSize: 15.0),
                labelPadding: EdgeInsets.only(left: 8.0, right: 8.0),
                materialTapTargetSize: MaterialTapTargetSize.padded,
                onSelected: (bool value) {
                  _isSelected = !_isSelected;
                  setState(() {

                  });
                },
                selected: _isSelected
            ),






          ],
        ),
      ),
    );
  }
}