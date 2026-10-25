import 'package:shared_preferences/shared_preferences.dart';

class AuthHelper {
  static const _mobileKey = 'user_mobile';
  static Future<String?> currentMobile() async =>
      (await SharedPreferences.getInstance()).getString(_mobileKey);
  static Future<void> saveMobile(String value) async =>
      (await SharedPreferences.getInstance()).setString(_mobileKey, value);
  static Future<void> clear() async =>
      (await SharedPreferences.getInstance()).remove(_mobileKey);
}
