import 'package:flutter/material.dart';

//https://zhuanlan.zhihu.com/p/88728224
void main() {
  runApp(MyWigetAPP());
}

class MyWigetAPP extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "Widget 1212",
      theme: ThemeData.light(),
      home: IndexPage(),
    );
  }
}

class IndexPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("文本控件"),
      ),
      body: new Column(

        children: <Widget>[
          new Text(
            "带删除线,红色字体",
            style: new TextStyle(
                color: Color(0xffff0000),
                 fontStyle: FontStyle.italic,
                decoration:TextDecoration.lineThrough,fontSize: 25.0),
          ),
          new  Text(//文本样式
            'Hello,! How are you?',
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          new Text.rich(//富文本
            TextSpan(
              text: 'Hello', // default text style
              children: <TextSpan>[
                TextSpan(text: ' beautiful ', style: TextStyle(fontStyle: FontStyle.italic)),
                TextSpan(text: 'world', style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),)
        ],

      ),
    );
  }
}
