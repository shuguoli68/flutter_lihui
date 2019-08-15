import 'package:flutter/material.dart';

class MainRank extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _MainRank();
}

class _MainRank extends State<MainRank>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('榜单'),
      ),
    );
  }

}