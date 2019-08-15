
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

  /**
   * 加载用户列表
   */
  static loadUsers() {
    var params = DataHelper.getBaseMap();
    return HttpManager.getInstance().get(Address.BASE_URL_RELEASE+'loadAll/', params);
  }
}