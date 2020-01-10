import 'package:flutter_lihui/view/common/input_page.dart';

class BaseRoute {
  ///
  /// 所有页面跳转
  ///
  static allRoute(){
    return {
      '/InputPage': (context) => InputPage()
    };
  }

/// 【1、不带参跳转】
/// Navigator.pushNamed(context, '/Second');
///
/// 【2、带参跳转】 可传自定义数据
/// Navigator.pushNamed(context, '/Second',arguments: CustomArgumnets('Android进阶之光'));
///
/// class CustomArgumnets {
///  String content;
///  PassArgumnets(this.content);
/// }
///
/// 【3、接收上个页面传过来的参数】
/// final CustomArgumnets customArgumnets =ModalRoute.of(context).settings.arguments;
///
/// 【4、返回上一页面传递参数】
/// Navigator.pop(context,CustomArgumnets('Android进阶解密'));
///
/// 【5、接收页面返回数据】
/// dynamic customArgumnets = await Navigator.pushNamed(context, '/Second',arguments: CustomArgumnets('Android进阶之光'));
///
}