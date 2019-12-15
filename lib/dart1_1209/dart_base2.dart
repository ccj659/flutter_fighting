import 'dart:io';

import 'package:flutter/material.dart';

//https://dart.ranyunlong.com/guide/handbook/functions.html#%E5%8F%AF%E9%80%89%E5%8F%82%E6%95%B0
void main() {

  //io
  fun1();
  fun2();
  fun3();
}

void fun1(){
  var dir=new Directory("temp");
  dir.createSync();
  //  //absolute返回path为绝对路径的Directory对象
  print(dir.absolute.path);

}
void fun2(){

  new Directory("temp2").create().then((dir)=>print(dir.absolute.path));
  

}
//异步, async 看起来怪,和java的 synchronized 类似 ,但是java写法是  synchronized fun3()
fun3() async{
  var dir=await new Directory("temp3").create();
  print(dir.absolute.path);


}
