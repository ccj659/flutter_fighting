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
        title: new Text("Container Demo"),
      ),
      body: new Column(
        children: <Widget>[
          new Container(
            // color: Colors.amberAccent,
            //flutter中的view就是纯view, 它的除了自身之外的,属性,
            // 靠Container来界定,类似于LayoutParams,
            // 比如margin,pading,background,shape用于限定控件的边界,
            width: 300,
            height: 300,
            // margin: const EdgeInsets.all(10.0),
            //  padding: const EdgeInsets.all(10.0),
            decoration: new BoxDecoration(
                //类似于Android中自定义控件的描边,颜色,弧度等等shape.xml
                color: Colors.amberAccent,
                border: new Border.all(color: Colors.deepOrange, width: 0.1),
                borderRadius: new BorderRadius.circular(30)),
            child: new Text(
              "hello",
              textAlign: TextAlign.center,
            ),
          ),
          new Container(
            constraints: BoxConstraints.expand(
              height:
                  Theme.of(context).textTheme.display1.fontSize * 1.1 + 200.0,
            ),
            padding: const EdgeInsets.all(8.0),
            color: Colors.blue[600],
            alignment: Alignment.center,
            child: Text('Hello World',
                style: Theme.of(context)
                    .textTheme
                    .display1
                    .copyWith(color: Colors.white)),
            transform: Matrix4.rotationZ(0.1),
          )
        ],
      ),
    );
  }
}
