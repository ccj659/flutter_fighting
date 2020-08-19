import 'dart:io';
import 'dart:convert';
import 'dart:async';

import 'package:flutter/material.dart';

//https://dart.ranyunlong.com/guide/handbook/functions.html#%E5%8F%AF%E9%80%89%E5%8F%82%E6%95%B0
void main() {

  //io, file操作.
  //基本都是异步操作, 需要用 /使用关键字await，外层函数用async声明返回值为Future
  fun1();
  fun2();
  fun3();
}

void fun1(){
  //直接调用同步模式函数，如：Directory.createSync
  var dir=new Directory("temp");
  dir.createSync();
  //  //absolute返回path为绝对路径的Directory对象
  print(dir.absolute.path);

}
void fun2(){
//将执行的之后的代码放到then函数中
  new Directory("temp2").create().then((dir)=>print(dir.absolute.path));
  

}
//异步, async 看起来怪,和java的 synchronized 类似 ,但是java写法是  synchronized fun3()
fun3() async{
//使用关键字await，外层函数用async声明返回值为Future
  //await 关键字用于等待 异步函数的返回,类比java的锁.
  var dir=await new Directory("temp3").create();
  print(dir.absolute.path);


}


handleDir() async {
  //可以用Platform.pathSeparator代替路径中的分隔符"/"
  //效果和"dir/subdir"一样
  //如果有子文件夹，需要设置recursive: true
  var directory = await new Directory("dir${Platform.pathSeparator}one").create(recursive: true);

  assert(await directory.exists() == true);
  //输出绝对路径
  print("Path: ${directory.absolute.path}");

  //重命名文件夹
  directory = await directory.rename("dir/subdir");
  print("Path: ${directory.absolute.path}\n");

  //创建临时文件夹
  //参数是文件夹的前缀，后面会自动添加随机字符串
  //参数可以是空参数
  var tempDir = await Directory.systemTemp.createTemp('temp_dir');
  assert(await tempDir.exists() == true);
  print("Temp Path: ${tempDir.path}");

  //返回上一级文件夹
  var parentDir = tempDir.parent;
  print("Parent Path: ${parentDir.path}");

  //列出所有文件，不包括链接和子文件夹
  Stream<FileSystemEntity> entityList = parentDir .list(recursive: false, followLinks: false);
  await for(FileSystemEntity entity in entityList) {

    //文件、目录和链接都继承自FileSystemEntity
    //FileSystemEntity.type静态函数返回值为FileSystemEntityType
    //FileSystemEntityType有三个常量：
    //Directory、FILE、LINK、NOT_FOUND
    //FileSystemEntity.isFile .isLink .isDerectory可用于判断类型
    print(entity.path);
  }

  //删除目录
  await tempDir.delete();
  assert(await tempDir.exists() == false);
}



handleFile() async{
  //提示：pub中有ini库可以方便的对ini文件进行解析
  File file = new File("default.ini");

  if(!await file.exists()){
    file= await file.create();
  }
  print(file);

  //直接调用File的writeAs函数时
  //默认文件打开方式为WRITE:如果文件存在，会将原来的内容覆盖
  //如果不存在，则创建文件

  //写入String，默认将字符串以UTF8进行编码
  file = await file.writeAsString("[General]\nCode=UTF8");
  //readAsString读取文件，并返回字符串
  //默认返回的String编码为UTF8
  //相关的编解码器在dart:convert包中
  //包括以下编解码器：ASCII、LANTI1、BASE64、UTF8、SYSTEM_ENCODING
  //SYSTEM_ENCODING可以自动检测并返回当前系统编码
  print("\nRead Strings:\n${await file.readAsString()}");

  //以行为单位读取文件到List<String>，默认为UTF8编码
  print("\nRead Lines:");
  List<String> lines = await file.readAsLines();
  lines.forEach(
          (String line) => print(line)
  );

//如果是以字节方式写入文件
  //建议设置好编码，避免汉字、特殊符号等字符出现乱码、或无法读取
  //将字符串编码为Utf8格式，然后写入字节

 // file = await file.writeAsBytes(Utf8Codec.encode("编码=UTF8"));
  //读取字节，并用Utf8解码
  //print("\nRead Bytes:");
 // print(UTF8.decode(await file.readAsBytes()));

//  //删除文件
//  await file.delete();
}


/*

Stream是dart:async库中的类，并非dart:io
从它的位置可以看出，Stream是一个异步数据事件的提供者
它提供了一种接收事件序列（数据或错误信息）的方式

因此，我们可以通过listen来监听并开始产生事件
当我们开始监听Stream的时候，会接收到一个StreamSubscription对象
通过该对象可以控制Stream进行暂停、取消等操作

数据流Stream有两种类型：

Single-subscription单一订阅数据流
broadcast广播数据流
Stream默认关闭广播数据流，可以通过isBroadcast测试
如果要打开，需在Stream子类中重写 isBroadcast返回true
或调用asBroadcastStream

Single-subscription对象不能监听2次
即使第1次的数据流已经被取消

同时，为了保证系统资源被释放
在使用数据流的时候
必须等待读取完数据，或取消

关于数据流Stream，虽然抽象，但也不是不能理解
问题在于很多人不知道【Dart中】数据流的好处，何时该用
我所理解的是一般用于处理较大的连续数据，如文件IO操作

下面的实例是用数据流来复制文件，只能算是抛砖引玉吧！
File.copy常用来复制文件到某路径，但是看不到复制的过程、进度
这里用Stream来实现复制文件的功能，并添加进度显示的功能*/
copyFileByStream() async {
  //电子书文件大小：10.9 MB (11,431,697 字节)
  File file = new File(r"E:\全职高手.txt");
  assert(await file.exists() == true);
  print("源文件：${file.path}");

  //以只读方式打开源文件数据流
  Stream<List<int>> inputStream = file.openRead();
  //数据流监听事件，这里onData是null
  //会在后面通过StreamSubscription来修改监听函数
  StreamSubscription subscription = inputStream.listen(null);

  File target = new File(r"E:\全职高手.back.txt");
  print("目标文件：${target.path}");
  //以WRITE方式打开文件，创建缓存IOSink
  IOSink sink = target.openWrite();

  //常用两种复制文件的方法，就速度来说，File.copy最高效
//  //经测试，用时21毫秒
//  await file.copy(target.path);
//  //输入流连接缓存，用时79毫秒，比想象中高很多
//  //也许是数据流存IOSink缓存中之后，再转存到文件中的原因吧！
//  await sink.addStream(inputStream);

  //手动处理输入流
  //接收数据流的时候，涉及一些简单的计算
  //如：当前进度、当前时间、构造字符串
  //但是最后测试下来，仅用时68毫秒，有些不可思议

  //文件大小
  int fileLength = await file.length();
  //已读取文件大小
  int count = 0;
  //模拟进度条
  String progress = "*";

/*  //当输入流传来数据时，设置当前时间、进度条，输出信息等
  subscription.onData((List<int> list) async {
    count = count + list.length;
    //进度百分比
    double num = (count*100)/fileLength;
    DateTime time = new DateTime.now();

    //输出样式：[1:19:197]**********[20.06%]
    //进度每传输2%，多一个"*"
    //复制结束进度为100%，共50个"*"
    print("[${time.hour}:${time.second}:${time.millisecond}]${progress*(num ~/ 2)}[${num.toStringAsFixed(2)}%]");

    //将数据添加到缓存池
    sink.add(list);
  });*/

  //数据流传输结束时，触发onDone事件
  subscription.onDone(() {
    print("复制文件结束！");
    //关闭缓存释放系统资源
    sink.close();
  });
}