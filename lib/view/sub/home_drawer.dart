import 'dart:convert';

import 'package:flutter_lihui/common/my_public.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lihui/common/my_request.dart';
import 'package:flutter_lihui/common/theme_colors.dart';
import 'package:flutter_lihui/common/theme_provide.dart';
import 'package:provide/provide.dart';

import 'SignRecordPage.dart';
import 'login.dart';


class HomeDrawer {

  BuildContext context;
  static String name = '点击头像登录';

  HomeDrawer(@required this.context);

  Widget _drawerHerder(){
    if(MyConfig.userId.isNotEmpty) name = MyConfig.userId;
    return UserAccountsDrawerHeader(
      accountName: Text(name),
      accountEmail: Text(name+'-email@163.com'),
      currentAccountPicture: CircleAvatar(
        backgroundImage: AssetImage('images/user_ba.png'),
        child: GestureDetector(
          onTap: (){
            if(MyConfig.userId.isEmpty){
              goToRm(context, Login());
            }
          },
          child: Padding(padding: EdgeInsets.all(5),child: Text(MyConfig.userId.isNotEmpty?'':'未登录', style: TextStyle(color: Colors.red),),),
        ),
      ),
      onDetailsPressed: (){
        myToast('点击了');
        print('点击');
      },
    );
  }

  void showThemeDialog() {
    showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('切换主题'),
          content: SingleChildScrollView(
            child: Container(
              //包含ListView要指定宽高
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.5,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: THColors.themeColor.keys.length,
                itemBuilder: (BuildContext context, int position) {
                  return GestureDetector(
                    child: Container(
                      padding: EdgeInsets.all(20.0),
                      margin: EdgeInsets.only(bottom: 15),
                      color: THColors.themeColor[position]["primaryColor"],
                    ),
                    onTap: () async {
                      Provide.value<ThemeProvide>(context).setTheme(position);
                      //存储主题下标
                      SPKey.spSetInt(SPKey.themeIndex, position);
                      Navigator.of(context).pop();
                    },
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }

  Widget homeDrawer(){
    return ListView(
      padding: EdgeInsets.all(0.0),
      children: <Widget>[

        _drawerHerder(),

        Container(
          decoration: BoxDecoration(
            border: Border(
                bottom: Divider.createBorderSide(context,color: Colors.green,width: 1)
            ),
          ),
          child: ListTile(
            leading: CircleAvatar(child: Text('签'),),
            title: Text('签到记录'),
            onTap: (){
              SignRecordPage.goTo(context, '');
            },
          ),
        ),

        Container(
          decoration: BoxDecoration(
            border: Border(
                bottom: Divider.createBorderSide(context,color: Colors.green,width: 1)
            ),
          ),
          child: ListTile(
            leading: CircleAvatar(child: Text('本'),),
            title: Text('本地收藏'),
            onTap: (){

            },
          ),
        ),

        Container(
          decoration: BoxDecoration(
            border: Border(
                bottom: Divider.createBorderSide(context,color: Colors.green,width: 1)
            ),
          ),
          child: ListTile(
            leading: CircleAvatar(child: Text('分'),),
            title: Text('积分排行榜'),
            onTap: (){
              goPoP(context);
            },
          ),
        ),

        Container(
          decoration: BoxDecoration(
            border: Border(
                bottom: Divider.createBorderSide(context,color: Colors.green,width: 1)
            ),
          ),
          child: ListTile(
            leading: CircleAvatar(child: Text('切'),),
            title: Text('切换主题'),
            onTap: (){
              print('切换主题');
              showThemeDialog();
            },
          ),
        ),

        Container(
          decoration: BoxDecoration(
            border: Border(
                bottom: Divider.createBorderSide(context,color: Colors.green,width: 1)
            ),
          ),
          child: ListTile(
            leading: CircleAvatar(child: Text('退'),),
            title: Text('退出登录'),
            onTap: (){
              MyRequest().logout(context);
            },
          ),
        ),

      ],
    );
  }
}