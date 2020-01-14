import 'package:flutter/material.dart';

class MyAppBar {

  static final MyAppBar _singleton = new MyAppBar._internal();

  factory MyAppBar() {
    return _singleton;
  }

  MyAppBar._internal();

  simAppBar(String title){
    return AppBar(
      title: Text(title),
    );
  }

}