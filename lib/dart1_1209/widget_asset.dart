import 'package:flutter/material.dart';

//https://zhuanlan.zhihu.com/p/88728224
void main() {
  runApp(MyWigetAPP());
}

final title = "静态资源展示 demo";

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
      body: new ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            final item = dataStr[index];
            return new Dismissible(
              key: new Key(item),
              child: new Center(
                child: new ListTile(title:new Text(dataStr[index])),
              ),
              onDismissed: ( direction) {

                Scaffold.of(context).showSnackBar(
                    new SnackBar(content: new Text("滑动方向为--> $direction ")));

               if(direction==DismissDirection.startToEnd){
                  dataStr.removeAt(index);
                  Scaffold.of(context).showSnackBar(
                      new SnackBar(content: new Text("$item b被删除")));
                }

              },
            );
          },
          itemCount: dataStr.length),
    );
  }
}
