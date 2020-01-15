import 'package:flutter/material.dart';
import 'main_home.dart';
import 'main_rank.dart';
import 'main_message.dart';
import 'main_my.dart';
import 'main_send.dart';

class MainNavigation extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _MainNavigation();
}

class _MainNavigation extends State<MainNavigation>{

  int _currentIndex = 0;
  var bng = [BottomNavigationBarItem(icon: Icon(Icons.home),title: Text('首页'))
    ,BottomNavigationBarItem(icon: Icon(Icons.storage),title: Text('榜单'))
    ,BottomNavigationBarItem(icon: Icon(Icons.add_a_photo),title: Text(''))
    ,BottomNavigationBarItem(icon: Icon(Icons.message),title: Text('消息'))
    ,BottomNavigationBarItem(icon: Icon(Icons.person),title: Text('我的'))];
  List<Widget> pages = new List();

  @override
  void initState() {
    // 初始化函数
    super.initState();
    pages
      ..add(MainHome())
      ..add(MainRank())
      ..add(MainSend())
      ..add(MainMessage())
      ..add(MainMy());
  }
  @override
  Widget build(BuildContext context) {
    // 返回一个脚手架，里面包含两个属性，一个是底部导航栏，另一个就是主体内容
    return Scaffold(
      bottomNavigationBar:BottomNavigationBar(items: [
        bng[0],bng[1],bng[2],bng[3],bng[4]
      ],
      key: ObjectKey(_currentIndex),
      currentIndex: _currentIndex,
      fixedColor: Colors.blue,
      type: BottomNavigationBarType.fixed,
      onTap: (i){
        setState(() {
          _currentIndex = i;
        });
      },
      ),
      body: pages[_currentIndex],
    );
  }

}