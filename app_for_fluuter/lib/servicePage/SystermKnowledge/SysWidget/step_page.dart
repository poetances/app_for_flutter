import 'package:flutter/material.dart';

class StepperPage extends StatefulWidget {


  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _StepperPageState();
  }
}

class _StepperPageState extends State<StepperPage> {
  int _stepIndex = 0;


  void stepCancel() {

  }

  void stepContinue() {

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      appBar: AppBar(
        title: Text("StepperPage"),
      ),
      body: Center(
        child: Stepper(
            physics: NeverScrollableScrollPhysics(),
            onStepContinue: () {
              print("onStepContinue");
              _stepIndex = ++_stepIndex > 2?2:_stepIndex;
              setState(() {
              });
            },
            onStepTapped: (index) {
              print("onStepTapped-$index");
              _stepIndex = index;
              setState(() {

              });
            },
            onStepCancel: (){
              print("onStepCancel");
              _stepIndex = --_stepIndex < 0?0:_stepIndex;
              setState(() {
              });

            },
            controlsBuilder: (BuildContext context, {VoidCallback onStepContinue, VoidCallback onStepCancel}){
              return Container(
                height: 10,
                color: Colors.red,
              );
            },
            currentStep: _stepIndex,
            steps: <Step>[
              Step(
                  title: Text("Step 1"),
                  subtitle: Text("这是第一步-"),
                  content: Text("使用第一步能够干嘛----"),
                  isActive: _stepIndex >= 0
              ),
              Step(
                  title: Text("Step 2"),
                  subtitle: Text("这是第二步-"),
                  content: Text("使用第二步能够干嘛----"),
                  isActive: _stepIndex >= 1
              ),
              Step(
                  title: Text("Step 1"),
                  subtitle: Text("这是第三步-"),
                  content: Text(
                      "使用第三步能够干嘛----简介 通过使用标签或者描述性词语来过滤内容 FilterChip 是 checkbox 或 switch widget 的替换品。"
                  ),
                  isActive: _stepIndex == 2
              ),
            ]
        ),
      ),
    );
  }
}