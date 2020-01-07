
import 'package:flutter_lihui/json_entity_model/login_entity.dart';
import 'package:flutter_lihui/json_entity_model/publish_entity.dart';
import 'package:flutter_lihui/json_entity_model/test_entity.dart';
import 'package:flutter_lihui/json_entity_model/user_entity.dart';

import 'json_entity_model/banner_entity.dart';
import 'json_entity_model/common_bool_entity.dart';

class EntityFactory {
  static T generateOBJ<T>(json) {
    if (1 == 0) {
      return null;
    } else if (T.toString() == "BannerEntity") {
      return BannerEntity.fromJson(json) as T;
    }else if (T.toString() == "LoginEntity") {
      return LoginEntity.fromJson(json) as T;
    } else if (T.toString() == "CommonBoolEntity") {
      return CommonBoolEntity.fromJson(json) as T;
    } else if (T.toString() == "PublishEntity") {
      return PublishEntity.fromJson(json) as T;
    } else if (T.toString() == "TestEntity") {
      return TestEntity.fromJson(json) as T;
    } else if (T.toString() == "UserEntity") {
      return UserEntity.fromJson(json) as T;
    } else {
      return null;
    }
  }
}