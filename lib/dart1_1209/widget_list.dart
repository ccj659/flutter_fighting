import 'package:flutter/material.dart';

//https://zhuanlan.zhihu.com/p/88728224
void main() {
  runApp(MyWigetAPP());
}

final title = "listview demo";

class MyWigetAPP extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: title,
      theme: ThemeData.light(),
      //home: ListPage(),
      home: ListDataPage(),
    );
  }
}

/**
 * 数据加载list中
 */
class ListDataPage extends StatelessWidget {
  List<String> dataStr = <String>[];
   List<int> colorCodes = <int>[600, 500, 100];

  ListDataPage() {
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
      body: ListView.separated(
          itemBuilder: (BuildContext context, int index) {
            return Container(
              height: 50,
             // color: Colors.amber[colorCodes[index]],
              child: Center(child: Text( dataStr[index])),
            );
          },
          separatorBuilder: (BuildContext context, int index) => const Divider(),
          itemCount: dataStr.length),
    );
  }
}

class ListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(title),
      ),
      body: new Container(
        margin: new EdgeInsets.symmetric(vertical: 20.0),
        child: new ListView(
          //  scrollDirection: Axis.horizontal,//水平 竖直
          children: <Widget>[
            new Container(
              height: 200,
              color: Colors.yellow,
              child: new Image.network(
                  "https://dss0.bdstatic.com/6Ox1bjeh1BF3odCf/it/u=1499715532,534546394&fm=74&app=80&f=PNG&size=f121,121?sec=1880279984&t=a99d9993576e7c852f53a2ec624cf529"),
            ),
            new Container(
              height: 200,
              color: Colors.blue,
              child: new Image.network(
                  "https://dss0.bdstatic.com/6Ox1bjeh1BF3odCf/it/u=1499715532,534546394&fm=74&app=80&f=PNG&size=f121,121?sec=1880279984&t=a99d9993576e7c852f53a2ec624cf529"),
            ),
            new Container(
              height: 200,
              color: Colors.lightGreenAccent,
              child: new Image.network(
                  "https://dss0.bdstatic.com/6Ox1bjeh1BF3odCf/it/u=1499715532,534546394&fm=74&app=80&f=PNG&size=f121,121?sec=1880279984&t=a99d9993576e7c852f53a2ec624cf529"),
            ),
          ],
        ),
      ),
    );
  }
}
