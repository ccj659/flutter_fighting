import 'package:flutter/material.dart';

import 'route_base_2.dart';

class MyRoute1 extends StatelessWidget {
  MyRoute1({
    Key key,
    @required this.text,
  }) : super(key: key);
  String text = "aa";
  String param = "MyRoute1参数";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("路由页面1"),
      ),
      body: Center(
        //  child: Text("这是一个新路由,这是返回参数"+text),
        child: Column(
          children: <Widget>[
            Text("接收下个页面的返回参数"),
            RaisedButton(
                child: Text("点击跳转下个页面,携带参数"),
                onPressed: () async {
                 var result=await  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return MyRoute2(text: param);
                      },
                    ),
                  );
                 print("路由返回值:: $result");
                }),
          ],
        ),
      ),
    );
  }
}
