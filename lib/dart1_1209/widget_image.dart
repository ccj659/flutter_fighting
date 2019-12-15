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
      title: "Widget Image",
      theme: ThemeData.light(),
      home: ImagePage(),
    );
  }
}

class ImagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        title: new Text("Widget Image"),
      ),
      body: new Column(
        children: <Widget>[
          //疑问:控件貌似没有background这一说, 可能需要用container
          new Image.network(
            "https://dss0.bdstatic.com/5aV1bjqh_Q23odCf/static/superman/img/logo_top-e3b63a0b1b.png",
            fit: BoxFit.fitHeight,

          ),
        //new Image, for obtaining an image from an ImageProvider.
          //new Image.asset, for obtaining an image from an AssetBundle using a key.
          //new Image.network, for obtaining an image from a URL.
          //new Image.file, for obtaining an image from a File.
          //new Image.memory, for obtaining an image from a Uint8List.

        ],
      ),
    );
  }
}
