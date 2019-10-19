
import 'package:flutter_lihui/common/my_config.dart';
import 'package:flutter_lihui/http/address.dart';
import 'package:flutter_lihui/http/date_helper.dart';
import 'package:flutter_lihui/http/http_manager.dart';

class Api {
  ///示例请求
  static test() {
    var params = DataHelper.getBaseMap();
    params['from'] = 'qianqian';
    params['version'] = '2.1.0';
    params['method'] = 'baidu.ting.artist.getList';
    params['format'] = 'jsonℴ=1';
    params['offset'] = 0;
    params['limit'] = 5;
    return HttpManager.getInstance().get(Address.TEST_API, params);
  }

  //加载用户列表
  static loadUsers() {
    var params = DataHelper.getBaseMap();
    return HttpManager.getInstance().get(Address.BASE_URL_RELEASE+'loadAll/', params);
  }

  static userList(int pageIndex) {
    var params = DataHelper.getBaseMap();
    params['pageIndex'] = pageIndex;
    params['pageNumber'] = 2;
    return HttpManager.getInstance().post(Address.BASE_URL_RELEASE+'userList', params);
  }

  //加载用户列表
  static login(userId, passWord) {
    var params = DataHelper.getBaseMap();
    params['userId'] = userId;
    params['passWord'] = passWord;
    return HttpManager.getInstance().post(Address.BASE_URL_RELEASE+'login', params);
  }

  //发布话题
  static publish(title, content) {
    var params = DataHelper.getBaseMap();
    params['title'] = title;
    params['content'] = content;
    params['theme'] = 1;
    params['subTheme'] = 5;
    params['ctTime'] = 18943285;
    params['utTime'] = 11255185;
    params['userId'] = MyConfig().userId;
    params['diaryId'] = MyConfig().userId+DateTime.now().millisecondsSinceEpoch.toString();
    return HttpManager.getInstance().post(Address.BASE_URL_RELEASE+'addTopic', params);
  }
}