import 'dart:io';

import 'package:flutter/material.dart';

//https://dart.ranyunlong.com/guide/handbook/functions.html#%E5%8F%AF%E9%80%89%E5%8F%82%E6%95%B0
void main() {

  //函数
  //命名可选参数



}

void func1(){
  var dir=new Directory("temp");
  dir.createSync();
  print(dir.absolute.path);

}