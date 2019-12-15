import 'package:flutter/material.dart';

//https://www.yiibai.com/dart/dart_programming_for_loop.html
//https://zhuanlan.zhihu.com/p/88728224
void main() {
  //在次之前,要明白  在dart中, 一切皆对象, 方法也是对象.
 // 包括数字、函数等
  print('hello world');
  bool isClosed = true;
  //dart中没有float, short, long类型
  double pi = 3.14;
  int width = 200;
  int height = 300;
  print(width / height);
  print(pi is! num); // is 类似于java的 instanceof
  print(pi as num); //as 强转

  //Object和dynamic区别在于: Object会在编译阶段检查类型，而dynamic不会在编译阶段检查类型。
  Object color = 'black';
  color = 0xff00;
  dynamic color1 = 'white';
  color1 = 0xff0001;
//var 一旦开始初始化赋值后，它的类型就确定了，后续不能被改变。
  var colorkey = 'blue'; //var声明变量 自动根据赋值的类型，推导为String类型
  var color11 = {'red', 'yellow', 'blue', 'green'}; // 使用var声明集合变量
 // const定义的是编译时常量，只能用编译时常量来初始化
 // final定义的常量可以用变量来初始化
  const PI = 3.122; //常量是编译期就能初始化,
  final now = DateTime.now(); // 常量是运行时期初始化的就用final, 比如时间是运行时初始化才有效嘛

  //集合
  List<String> colors = ['red', 'yellow', 'blue', 'green']; //直接使用[]形式初始化
  var colorList = <String>['red', 'yellow', 'blue', 'green'];
  colors.removeAt(2);

  colors.forEach((color) => print(color));
  /* for(var color in colorList){
  print(color);
  }*/

  /*while(colorList.iterator.moveNext()){
    print(colorList.iterator.current);

  }*/

  //集合Set
  //集合Set和列表List的区别在于 集合中的元素是不能重复 的。所以添加重复的元素时会返回false,表示添加不成功.
  Set<String> colorSet = {'red', 'yellow', 'blue', 'green'}; //直接使用{}形式初始化

  //Map
  Map<String, int> colorMap = {'white': 0x0000, 'black': 0xfff};
  colorMap.containsKey(1);
  colorMap.containsValue(new Object());
  colorMap
      .forEach((key, value) => print('color is $key ,color value is$value'));

  //三目运算符
  var isOpened = (2 == 1) ? true : false;
  //空判断
  var expr1, expr2;
  var result = expr1 ?? expr2; //若expr1为null, 返回expr2的值，否则返回expr1的值
  result = expr1?.value; //若expr1为null, 就返回null,否则就返回expr1.value的值
  expr1 ??= expr2; //若expr1为null, 则把expr2的值赋值给expr1

  //级联操作符 ,用于链式调用
/*  var question;
  question
    ..id = 1
    ..age = 12;*/

  //异常
  /*int num = 18;
  int result2 = 0;
  try {
    result = num ~/ 0;
  } catch (e) {//捕获到IntegerDivisionByZeroException
    print(e.toString());
  } finally {
    print('$result2');
  }*/

  //函数
  //支持闭包和高阶函数
//num a, num b, num c, num d 最普通的传参: 调用时，参数个数和参数顺序必须固定
  add1(num a, num b, num c, num d) {
    print(a + b + c + d);
  }

  //[num a, num b, num c, num d]传参: 调用时，参数个数不固定，但是参数顺序需要一一对应, 不支持命名参数
  add2([num a, num b, num c, num d]) {
    print(a + b + c + d);
  }

  //{num a, num b, num c, num d}传参: 调用时，参数个数不固定，参数顺序也可以不固定，支持命名参数,也叫可选参数，是dart中的一大特性，这就是为啥Flutter代码那么多可选属性，大量使用可选参数
  add3({num a, num b, num c, num d}) {
    print(a + b + c + d);
  }

  //num a, num b, {num c, num d}传参: 调用时，a,b参数个数固定顺序固定，c,d参数个数和顺序也可以不固定
  add4(num a, num b, {num c, num d}) {
    print(a + b + c + d);
  }

  //方法1
  sayHello(name) {
    return "hello inner function$name";
  }

  //匿名的 方法1 为(name)=>'Hello $name!'
  //
  var sayHello2 = (name) => 'Hello $name!';
//函数闭包
  Function makeSubstract(num n) {
    return (num i) => n - i;
  }

  var x = makeSubstract(5);
  //将闭包作为方法的参数,比如list.each()方法
  print(x(2));

  add1(100, 100, 100, 100); //最普通的传参: 调用时，参数个数和参数顺序必须固定
  add2(100, 100); //调用时，参数个数不固定，但是参数顺序需要一一对应, 不支持命名参数(也就意味着顺序不变)
  add3(
      b: 200,
      a: 200,
      c: 100,
      d: 100); //调用时，参数个数不固定，参数顺序也可以不固定，支持命名参数(也就意味着顺序可变)
  add4(100, 100, d: 100, c: 100); //调用时，a,b参数个数固定顺序笃定，c,d参数个数和顺序也可以不固定

  //函数关系和高阶函数
  Function square = (a) {
    return a * a;
  };
  Function square2 = (a) {
    return a * a * a;
  };

  num add(num a, num b, [Function op, Function op2]) {
    return op(a) + op2(b);
  }

//方法add 的变式, 类似java的lambda表达式
  num add5(num a, num b, [Function op, Function op2]) => op(a) + op2(b);

  // 参数支持 传递 函数..类似于groovy的闭包概念
  add(3, 4, square, square2);
}

//在dart中一切皆是对象
abstract class Person {
  String name;
  int age;

  double height;

  //一个dart的语法糖。但是这里不如Kotlin，Kotlin是直接把this.name传值的过程都省了。
  Person(this.name, this.age, this.height);

//与上述的等价代码,当然这也是Java中必须要写的代码
/*  Person(String name, int age, double height) {
    this.name = name;
    this.age = age;
    this.height = height;
  }*/
  Person.fromeList(var list)
      : //命名构造函数，格式为Class.name(var param)
        name = list[0],
        age = list[1],
        height = list[2] {
    //使用冒号初始化变量
  }
}

//继承对象
class Student extends Person {
  //和Java一样同时使用extends关键字表示继承
  Student(String name, int age, double height, double grade)
      : super(name, age,
            height); //在 Dart里：类名(变量，变量,...) 是构造函数的写法, :super()表示该构造调用父类，这里构造时传入三个参数
}

//不可变对象, 类似于java的final class
class ImmutablePoint {
  final num x;
  final num y;

  const ImmutablePoint(this.x, this.y); // 常量构造函数
  static final ImmutablePoint origin =
      const ImmutablePoint(0, 0); // 创建一个常量对象不能用new，要用const
}

//Getters And Setters
//Getter和Setter是用来读写一个对象属性的方法
//每个字段都对应一个隐式的Getter和Setter
//但是调用的时候是obj.x，而不是obj.x()
//如果字段为final或者const的话，那么它只有一个getter方法
class Rectangle {
  num left;
  num top;
  num width;
  num height;

  Rectangle(this.left, this.top, this.width, this.height);

  // right 和 bottom 两个属性的计算方法
  num get right => left + width;

  set right(num value) => left = value - width;

  num get bottom => top + height;

  set bottom(num value) => top = value - height;
}

// 接口, 在Dart中类和接口是统一的，类就是接口
//模拟flutter中widget创建过程
abstract class MyWidget {
  MyWidget current;

  MyWidget build(); // 这是一个抽象方法，不需要abstract关键字，是隐式接口的一部分。

  buidWidget() {
    current = build();
  }
}

class MyStatelessWidget extends MyWidget {
  final num height, width;

  MyStatelessWidget({this.height, this.width}):super();

  @override
  MyWidget build() {
    // TODO: implement build
    return new MyStatelessWidget(height:10,width:10);
  }
}


//工厂构造函数



main1() {
  var rect = new Rectangle(3, 4, 20, 15);
  assert(rect.left == 3);
  rect.right = 12;
  assert(rect.left == -8);
}
