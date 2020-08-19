import 'package:flutter/material.dart';

//https://zhuanlan.zhihu.com/p/88728224
void main() {
  runApp(MyWigetAPP());
}

final title = "widget_view_appbar.dart";

class MyWigetAPP extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: title,
      theme: ThemeData.light(),
      //home: ListPage(),
      home: LayoutPage(),
    );
  }
}

//row 水平排列不急
// Column 竖直布局
class LayoutPage extends StatelessWidget {
  List<String> dataStr = <String>[];
  List<int> colorCodes = <int>[600, 500, 100];

  LayoutPage() {
    for (var i = 0; i < 50; i++) {
      dataStr.add("item--$i");
    }
  }

  @override
  Widget build(BuildContext context) {


    return new Scaffold(
      appBar: new AppBar(
        title: new Text(title),

      ),
    );
  }
}
