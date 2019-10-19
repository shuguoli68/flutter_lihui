import 'package:flutter_lihui/json_entity_model/account_entity.dart';
import 'package:flutter_lihui/json_entity_model/publish_entity.dart';
import 'package:flutter_lihui/json_entity_model/test_entity.dart';
import 'package:flutter_lihui/json_entity_model/user_entity.dart';

class EntityFactory {
  static T generateOBJ<T>(json) {
    if (1 == 0) {
      return null;
    } else if (T.toString() == "AccountEntity") {
      return AccountEntity.fromJson(json) as T;
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