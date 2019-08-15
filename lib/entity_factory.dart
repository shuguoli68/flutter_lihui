import 'package:flutter_lihui/json_entity_model/test_entity.dart';

class EntityFactory {
  static T generateOBJ<T>(json) {
    if (1 == 0) {
      return null;
    } else if (T.toString() == "TestEntity") {
      return TestEntity.fromJson(json) as T;
    } else {
      return null;
    }
  }
}