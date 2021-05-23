import 'package:flutter/material.dart';

class DateTimeWidget extends StatelessWidget {



  @override
  Widget build(BuildContext context) {

    print('--------------DateTime---------------------');
    print(DateTime.now().millisecondsSinceEpoch);
    print(DateTime.now().toIso8601String());
    print(DateTime.now().year);
    print(DateTime.now().toString());
    print(DateTime.fromMillisecondsSinceEpoch(1560824247803));
    print('--------------DateTime---------------------');


    _showDatePicker() {

      // 返回的是异步对象，Future。
      showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(2017),
          lastDate: DateTime(2021),
          //locale: Locale('zh')
      ).then((resultTime){
        print(resultTime);
      });

    }

    // 获取异步的第二种方式。
    _showTimePicker() async {

     TimeOfDay day = await  showTimePicker(
          context: context,
          initialTime: TimeOfDay.now()
      );

     print(day.toString());
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('DateTime'),
      ),
      body: Center(
        child: InkWell(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(DateTime.now().toString()),
              Icon(Icons.arrow_drop_down)
            ],
          ),
          onTap: (){
            print('InkWell 点击');
            _showDatePicker();
//            _showTimePicker();
          },
        )
      ),
    );
  }
}