import 'package:flutter/material.dart';

class MyRoute2 extends StatelessWidget{

  MyRoute2({Key key,@required this.text,}):super(key:key);
  String text;
  String callBack="MyRoute2返回参数";
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("路由页面2"),
      ),
      body: Center(
        //  child: Text("这是一个新路由,这是返回参数"+text),
        child: Column(
          children: <Widget>[
            Text("这是一个新路由,接收的参数::" + text),
            RaisedButton(
              child: Text("返回上一页,携带参数::"+callBack),
              onPressed:()=>
                  Navigator.pop(context,  callBack),


            ),

          ],
        ),
      ),

    );
  }


}