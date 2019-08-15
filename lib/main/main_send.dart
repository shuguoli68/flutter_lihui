import 'package:flutter/material.dart';

class MainSend extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _MainSend();
}

class _MainSend extends State<MainSend>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('发布'),
      ),
    );
  }

}