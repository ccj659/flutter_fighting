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
      title: "Container Demo",
      theme: ThemeData.light(),
      home: StakePage(),
    );
  }
}

// ignore: must_be_immutable
class StakePage extends StatelessWidget {
  var stack = new Stack(
    alignment: const FractionalOffset(0.8, 0.8),
    children: <Widget>[
      new CircleAvatar(

        backgroundImage: new AssetImage('assets/images/1.png'),
        radius: 100,
      ),
    new Container(
      decoration: new BoxDecoration(color: Colors.amber),
      child: new Text("这是我本人"),

    )
    ],
  );

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        title: new Text("Container Demo"),
      ),
      body: new Center(child: stack,),
    );
  }
}
