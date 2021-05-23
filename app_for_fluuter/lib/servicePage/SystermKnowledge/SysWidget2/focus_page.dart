
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FocusPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _FocusDemoSate1();

}

class _FocusPageState extends State<FocusPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FocusPage'),
      ),

      body: Focus(
        onFocusChange: (change){
          print('onFocusChange');
        },
        child:  _FocusPageBody(),
      ),
    );
  }
}

class _FocusPageBody extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _FocustPageBodyState();
  }
}

class _FocustPageBodyState extends State<_FocusPageBody> {

  FocusNode _focusNode = FocusNode();


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextField(
            focusNode: _focusNode,
          ),
          TextField(

          ),
          TextField(

          ),

          Divider(height: 50,color: Colors.red,),

          IconButton(icon: Icon(Icons.arrow_downward), onPressed: (){

            Focus.of(context).nextFocus();
          }),

          IconButton(icon: Icon(Icons.arrow_upward), onPressed: (){
            Focus.of(context).previousFocus();
          }),

          IconButton(icon: Icon(Icons.close), onPressed: (){
            Focus.of(context).unfocus();
          }),
        ],
      ),
    );
  }
}



class _FocusDemoSate1 extends State<FocusPage> {

   Color _color = Colors.white;
  
   bool _handleKeyPress(FocusNode node, RawKeyEvent event) {

     Navigator.of(context);
     if (event is RawKeyDownEvent) {
       print('Focus node ${node.debugLabel} got key event: ${event.logicalKey}');
       if (event.logicalKey == LogicalKeyboardKey.keyR) {
         print('Changing color to red.');
         setState(() {
           _color = Colors.red;
         });
         return true;
       } else if (event.logicalKey == LogicalKeyboardKey.keyG) {
         print('Changing color to green.');
         setState(() {
           _color = Colors.green;
         });
         return true;
       } else if (event.logicalKey == LogicalKeyboardKey.keyB) {
         print('Changing color to blue.');
         setState(() {
           _color = Colors.blue;
         });
         return true;
       }
     }
     return false;
   }
  
   @override
   Widget build(BuildContext context) {
     final TextTheme textTheme = Theme.of(context).textTheme;
     return Scaffold(
       appBar: AppBar(
         title: Text('FocustPage'),
       ),
       body: FocusScope(
         debugLabel: 'Scope',
         autofocus: true,
         child: DefaultTextStyle(
           style: textTheme.display1,
           child: Focus(
             onKey: _handleKeyPress,
             debugLabel: 'Button',
             child: Builder(
               builder: (BuildContext context) {
                 final FocusNode focusNode = Focus.of(context);
                 final bool hasFocus = focusNode.hasFocus;
                 return GestureDetector(
                   onTap: () {
                     if (hasFocus) {
                       focusNode.unfocus();
                     } else {
                       focusNode.requestFocus();
                     }
                   },
                   child: Center(
                     child: Container(
                       width: 400,
                       height: 100,
                       alignment: Alignment.center,
                       color: hasFocus ? _color : Colors.white,
                       child: Text(hasFocus ? "I'm in color! Press R,G,B!" : 'Press to focus'),
                     ),
                   ),
                 );
               },
             ),
           ),
         ),
       ),
     );
   }
}