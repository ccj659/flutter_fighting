import 'package:flutter/material.dart';

//https://zhuanlan.zhihu.com/p/88728224
void main() {
  runApp(MyWigetAPP());
}

final title = "widget_view_gridview.dart";

class MyWigetAPP extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: title,
      theme: ThemeData.light(),
      //home: ListPage(),
      home: GridViewDataPage(),
    );
  }
}

/**
 * 数据加载list中
 */
class GridViewDataPage extends StatelessWidget {
  List<String> dataStr = <String>[];
  List<int> colorCodes = <int>[600, 500, 100];

  GridViewDataPage() {
    for (var i = 0; i < 50; i++) {
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
body: CustomScrollView(
  primary: false,
  slivers: <Widget>[
    SliverPadding(
      padding: const EdgeInsets.all(20),
      sliver: SliverGrid.count(
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 2,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(8),
            child: const Text('He\'d have you all unravel at the'),
            color: Colors.green[100],
          ),
          Container(
            padding: const EdgeInsets.all(8),
            child: const Text('Heed not the rabble'),
            color: Colors.green[200],
          ),
          Container(
            padding: const EdgeInsets.all(8),
            child: const Text('Sound of screams but the'),
            color: Colors.green[300],
          ),
          Container(
            padding: const EdgeInsets.all(8),
            child: const Text('Who scream'),
            color: Colors.green[400],
          ),
          Container(
            padding: const EdgeInsets.all(8),
            child: const Text('Revolution is coming...'),
            color: Colors.green[500],
          ),
          Container(
            padding: const EdgeInsets.all(8),
            child: const Text('Revolution, they...'),
            color: Colors.green[600],
          ),
        ],
      ),
    ),
  ],
),

/*
//静态填充
body: GridView.count(
        crossAxisCount: 2,
        padding: const EdgeInsets.all(20),
        crossAxisSpacing: 10,
        children: <Widget>[
          Text("1"),
          Text("2"),
          Text("3")
        ],

      ),*/
    );
  }
}
