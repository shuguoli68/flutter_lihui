import 'package:flutter/material.dart';

class PushHelper{
  void goAndFinish(BuildContext context,Widget to){
    try{
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (BuildContext context) {return to;}),
              (route) => route == null);
    }catch(e){
      print('页面跳转：'+e.toString());
    }
  }

  void go(BuildContext context,Widget to){
    try{
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => to));
    }catch(e){
      print('页面跳转：'+e.toString());
    }
  }
}