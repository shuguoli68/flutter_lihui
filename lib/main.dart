import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_lihui/view/sub/login.dart';
import 'package:provide/provide.dart';
import 'package:flutter_lihui/common/my_public.dart';

import 'base/base_route.dart';
import 'common/sp_key.dart';
import 'common/theme_colors.dart';
import 'common/theme_provide.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  var providers = Providers();

  providers.provide(Provider.function((context)=> ThemeProvide()));

  int themeIndex;
  SPKey.spGetInt(SPKey.themeIndex).then((onValue){
    log('theme:$themeIndex, $onValue');
    themeIndex = onValue;
  });
  themeIndex =  null == themeIndex ? 0 : themeIndex;
  runApp(ProviderNode(child: MyApp(themeIndex: themeIndex,), providers: providers));
}

class MyApp extends StatelessWidget {
  int themeIndex = 0;

  MyApp({this.themeIndex});

  _themeColor(ThemeProvide theme, String type){
    return THColors.themeColor[theme.value != null ? theme.value: themeIndex][type];
  }
  @override
  Widget build(BuildContext context) {
    return Provide<ThemeProvide>(
      builder: (context,child,theme){
        return MaterialApp(
          title: 'LiHui',
          theme: ThemeData(
            primaryColor: _themeColor(theme,'primaryColor'),
            primaryColorDark: _themeColor(theme,'colorPrimaryDark'),
            primaryColorLight: _themeColor(theme,'colorPrimaryLight'),
            accentColor:  _themeColor(theme,'colorAccent'),
          ),
          debugShowCheckedModeBanner: false,
          home: MyHomePage(),
          routes: BaseRoute.allRoute(),
        );
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var timer;

  @override
  void initState() {
    super.initState();
    LogUtil.init(isDebug: MyConfig.logIsDebug, title: MyConfig.logTitle,);
    timer = Timer(const Duration(milliseconds: 150),(){
      SPKey.spGetBool(SPKey.IS_LOGIN).then((onValue){
//        if(onValue){
//          goToRm(context, MainApp());
//        }else{
          goToRm(context, Login());
//        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      appBar: AppBar(
//        title: Text('LiHui'),
//      ),
      body:Center(
        child: Text('闪屏'),
      )
    );
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }
}
