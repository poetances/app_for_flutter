
import 'package:flutter/material.dart';
import 'package:app_for_fluuter/common/http_tool.dart';



// 模拟的假数据
const searchList = [
  "lao-老王",
  "lao-老张",
  "xiao-小王",
  "xiao-小张"
];

const recentSuggest = [
  "马云-1",
  "马化腾-2"
];

class SearchBarWidget extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SearchBarWidgetState();
  }
}

class _SearchBarWidgetState extends State<SearchBarWidget> {



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('SearchBar')
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            IconButton(
                icon: Icon(Icons.search),
                onPressed: (){
                  showSearch(context: context, delegate: SearchBarDelegate());
                }
            ),

            CircularProgressIndicator(),




            Container(
              height: 2,
              child: LinearProgressIndicator(
                value: 0.5,
              ),
            ),

            Container(

              child: Text('加载状态'),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey
              ),
              height: 400,
              width: 400,
            ),

            FutureBuilder(
              builder: (context, snapShot){
                if (snapShot.connectionState == ConnectionState.active) {
                  return Text('active');
                }else if(snapShot.connectionState == ConnectionState.waiting) {
                  return Text('waiting');

                }else if(snapShot.connectionState == ConnectionState.done) {

                  if(snapShot.hasError) {
                    return Text('hasError');
                  }else if (snapShot.hasData) {
                    return Text('hasDate');
                  }
                  return Text('Done');
                }
              },
              future: HttpUtils.request('http://cache.video.iqiyi.com/jp/avlist/202861101/1/?callback=jsonp9'),
            ),

          ],
        )
      )
    );
  }
}


class SearchBarDelegate extends SearchDelegate<String> {
  @override
  List<Widget> buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = "";
          //showSuggestions(context);
          //showResults(context);


        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
      icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow, progress: transitionAnimation),
      onPressed: () {
        if (query.isEmpty) {
          close(context, null);
        } else {
          query = "";
          showSuggestions(context);
        }
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return Container(
      width: 100,
      height: 100,
      child: Card(
        color: Colors.red,
        child: Center(
          child: Text(query),
        ),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    // 定义变量 并进行判断
    final suggestionList = query.isEmpty
        ? recentSuggest
        : searchList.where((input) => input.startsWith(query)).toList();
    return ListView.builder(
        itemCount: suggestionList.length,
        itemBuilder: (context, index) {
          return ListTile(
              title: RichText(
                  text: TextSpan(
                    // 获取搜索框内输入的字符串，设置它的颜色并让让加粗
                      text: suggestionList[index].substring(0, query.length),
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                      children: [
                        TextSpan(
                          //获取剩下的字符串，并让它变成灰色
                            text: suggestionList[index].substring(query.length),
                            style: TextStyle(color: Colors.grey))
                      ]
                  )
              )
          );
        }
    );
  }


 @override
  ThemeData appBarTheme(BuildContext context) {
    // TODO: implement appBarTheme
    //return super.appBarTheme(context);
   final ThemeData theme = Theme.of(context);
   return theme.copyWith(
     primaryColor: Colors.white,
     primaryIconTheme: theme.primaryIconTheme.copyWith(color: Colors.purple),
     primaryColorBrightness: Brightness.light,
     primaryTextTheme: theme.textTheme,
   );
  }

}