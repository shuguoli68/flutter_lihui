import 'package:flutter/material.dart';

class MainMy extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _MainMy();
}

class _MainMy extends State<MainMy>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('我的'),
      ),
    );
  }

}