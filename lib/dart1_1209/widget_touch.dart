import 'package:flutter/material.dart';

//https://zhuanlan.zhihu.com/p/88728224
void main() {
  runApp(MyWigetAPP());
}

final title = "点击事件 demo";

class MyWigetAPP extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: title,
      theme: ThemeData.light(),
      //home: ListPage(),
      home: TouchDataPage(),
    );
  }
}

class TouchDataPage extends StatelessWidget {
  List<String> dataStr = <String>[];
  List<int> colorCodes = <int>[600, 500, 100];

  TouchDataPage() {
    for (var i = 0; i < 100; i++) {
      dataStr.add("item--$i");
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(title),
      ),
      body:  new Center(
        child: new MyButton(),
      ),
/*          ListView.separated(
              itemBuilder: (BuildContext context, int index){
                return Container(
                  height: 50,
                  // color: Colors.amber[colorCodes[index]],
                  child: Center(child: Text( dataStr[index])),
                );
              },
              separatorBuilder:  (BuildContext context, int index){
                return const Divider();
              },
              itemCount: dataStr.length),*/


    );
  }
}

class MyButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new GestureDetector(
      onTap: () {
        final snackBar = new SnackBar(
          content: new Text("Tab Clicked!!!"),
        );
        Scaffold.of(context).showSnackBar(snackBar);

      },
      child: new Container(
        padding: new EdgeInsets.all(10),
        decoration: new BoxDecoration(
            color: ThemeData.light().buttonColor,
            borderRadius: new BorderRadius.circular(10)),
        child: new Text("ChaunceyTab"),
      ),
    );
  }
}
