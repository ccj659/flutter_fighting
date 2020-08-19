import 'package:flutter/material.dart';

//https://zhuanlan.zhihu.com/p/88728224
void main() {
  runApp(MyWigetAPP());
}

final title = "滚动布局 demo";

class MyWigetAPP extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: title,
      theme: ThemeData.light(),
      //home: ListPage(),
      home: ScrollDataPage(),
    );
  }
}


class ScrollDataPage extends StatelessWidget {
  List<String> dataStr = <String>[];
   List<int> colorCodes = <int>[600, 500, 100];

  ScrollDataPage() {
    for (var i = 0; i < 100; i++) {
      dataStr.add("item--$i");
    }

  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(title),
      ),
      body: ListView.separated(

        //类似于java的匿名内部类,new lstener(BuildContext context, int index){xxx}
          //在dart中 叫匿名函数 ,别的地方会调用本方法,执行此处的方法体实现
        //  typedef IndexedWidgetBuilder = Widget Function(BuildContext context, int index);


        itemBuilder: (BuildContext context, int index) {

           if(index==1){
              return Container(
               // color: Colors.amber[colorCodes[index]],
              child: Center(child: new Text(

                  '''
青岛市市名以古代渔村青岛得名。青岛市专名“青岛”本指城区前海一海湾内的一座小岛，因岛上绿树成荫，终年郁郁葱葱而得名“青岛”，后于明嘉靖年间首度被记载于王士性的《广志绎》中。明万历七年（1579年），即墨县令许铤主持修编的《地方事宜议·海防》中，有关青岛之名记述为：“本县东南滨海，即中国东界，望之了无津涯，惟岛屿罗峙其间。岛之可人居者，曰青、曰福、曰管……”这里的“青”，即指青岛。青岛所在的海湾因岛得名青岛湾，由此入海的一条小河也被称为青岛河。青岛河口于明万历年间建港，称青岛口；河两岸的两个村落分别得名上青岛村和下青岛村；河源头的一座山于1923年也被定名为青岛山。 [21] 
新石器时代，青岛是东夷人繁衍生息的主要地区之一，遗留了丰富多彩的大汶口文化、龙山文化和岳石文化， [22] 
商周时期，青岛是中国海盐的发祥地，位列中国“四大古盐区”和“五大古港”。 [23] 
春秋战国时期，青岛建立了山东地区第二大市镇—即墨，“即墨故城”（平度市境内）是中国现存最早的古代城池遗址。
秦始皇统一中国后，五巡天下，三登琅琊（青岛黄岛区境内）。据记载，中国最早的一次涉洋远航——徐福东渡朝鲜、日本，就是从琅琊起航的。
汉武帝少年时代在不其（城阳区境内）做过胶东王，是中国有记载的到青岛地域巡游次数最多的皇帝。
唐宋时期，青岛作为衔接南北航运的“中转站”，成为中国北方沿海最重要的交通枢纽和贸易口岸。宋时专门在板桥镇（胶州市境内）设“市舶司”管理对外贸易。
元朝，为方便海运漕粮，开凿了中国唯一的海运河——纵贯山东半岛的胶莱运河。
明清时期，青岛是中国北方重要的海防要塞，属山东莱州府境内。
清光绪十七年（1891年）6月14日，清政府在胶澳设防，青岛由此建置。清光绪二十三年（1897年）11月14日，德国以“巨野教案”为借口侵占青岛，青岛沦为殖民地。 [6] 
民国三年（1914年），第一次世界大战爆发，日本取代德国占领青岛。民国八年（1919年），中国以收回青岛主权为导火索，爆发了“五四运动”，这是中国近、现代历史的分水岭。民国十一年（1922年）12月10日，中国北洋政府收回青岛，辟为商埠。民国十八年（1929年）7月，国民政府设青岛特别市，1930年改称青岛市。民国二十七年（1938年）1月，日本再次侵占青岛。 [6]  民国三十四年（1945年）9月，国民政府接管青岛，仍为特别市。
1949年6月2日，青岛成为华北地区最后一座解放的城市，改属山东省辖市。
              ''',
                  style:new TextStyle(fontSize: 22.0)
              )),
            );
          }


            return Container(
              height: 50,
             // color: Colors.amber[colorCodes[index]],
              child: Center(child: Text( dataStr[index])),
            );
          },
          separatorBuilder: (BuildContext context, int index) => const Divider(),
          itemCount: 2),
    );
  }
}
