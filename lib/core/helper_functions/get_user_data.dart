import 'dart:convert';

import 'package:seave/core/services/shared_preferences_single_ton.dart';
import 'package:seave/core/utils/constants.dart';
import 'package:seave/featuer/auth/data/user_model.dart';
import 'package:seave/featuer/auth/domin/entity/user_entity.dart';

UserEntity getUser() {
  var userJson = Prefs.getString(kUserData);
  UserEntity userMap = UserModel.fromJson(jsonDecode(userJson));
  return userMap;
}
