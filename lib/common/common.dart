
import 'package:flutter/material.dart';
import 'package:flutter_lihui/util/log_util.dart';
import 'package:fluttertoast/fluttertoast.dart';


const int baseBg = 0xFFECECEC;

log(String s){
  LogUtil.segmentationLog(s);
}

myToast(String s){
  Fluttertoast.showToast(msg: s, backgroundColor: Color(0xFF222222), textColor: Color(0xFFFFFFFF),gravity: ToastGravity.CENTER);
}

goTo(BuildContext context, Widget key){
  Navigator.of(context).push(MaterialPageRoute(builder: (_){
    return key;
  }));
}

goToRm(BuildContext context, Widget key){
  Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (_){
    return key;
  }), (route) => route == null);
}

goPop(BuildContext context, Map key){
  Navigator.of(context).pop(key);
}

goPoP(BuildContext context){
  Navigator.pop(context);
}

numStr(int count){
  if(count<11000){
    return count.toString();
  }else if(count<10000*100){
    return (count/10000.0).toStringAsFixed(2)+'万';
  }else{
    return (count/10000.0).toStringAsFixed(1)+'万';
  }
}

strTime(int tim){
  return DateTime.fromMillisecondsSinceEpoch(tim);
}


