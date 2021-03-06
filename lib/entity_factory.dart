
import 'package:flutter_lihui/json_entity_model/login_entity.dart';
import 'package:flutter_lihui/json_entity_model/publish_entity.dart';
import 'package:flutter_lihui/json_entity_model/test_entity.dart';

import 'json_entity_model/banner_entity.dart';
import 'json_entity_model/common_bool_entity.dart';
import 'json_entity_model/diary_entity.dart';
import 'json_entity_model/diary_tag_entity.dart';
import 'json_entity_model/diary_theme_entity.dart';
import 'json_entity_model/file_entity.dart';
import 'json_entity_model/foot_entity.dart';
import 'json_entity_model/love_entity.dart';
import 'json_entity_model/sign_entity.dart';

class EntityFactory {
  static T generateOBJ<T>(json) {
    if (1 == 0) {
      return null;
    } else if (T.toString() == "LoveEntity") {
      return LoveEntity.fromJson(json) as T;
    }else if (T.toString() == "FootEntity") {
      return FootEntity.fromJson(json) as T;
    }else if (T.toString() == "SignEntity") {
      return SignEntity.fromJson(json) as T;
    }else if (T.toString() == "FileEntity") {
      return FileEntity.fromJson(json) as T;
    } else if (T.toString() == "DiaryTagEntity") {
      return DiaryTagEntity.fromJson(json) as T;
    }else if (T.toString() == "DiaryThemeEntity") {
      return DiaryThemeEntity.fromJson(json) as T;
    }else if (T.toString() == "DiaryEntity") {
      return DiaryEntity.fromJson(json) as T;
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
    }  else {
      return null;
    }
  }
}