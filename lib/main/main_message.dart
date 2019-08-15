import 'package:flutter/material.dart';

class MainMessage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _MainMessage();
}

class _MainMessage extends State<MainMessage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('消息'),
      ),
    );
  }

}