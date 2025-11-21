import 'package:makanapa/features/onboarding/data/data_source/login/login_data_source.dart';
import 'package:makanapa/core/constants/pref_constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginLocalDataSourceImpl implements LoginLocalDataSource {
  final SharedPreferences prefs;

  LoginLocalDataSourceImpl({required this.prefs});

  @override
  Future<String?> getUserId() async {
    return prefs.getString(PrefConstant.currentUserId);
  }

  @override
  Future<void> setUserId(String userId) async {
    await prefs.setString(PrefConstant.currentUserId, userId);
  }

  @override
  Future<void> setUserLoginType(String type) async {
    await prefs.setString(PrefConstant.userLoginType, type);
  }
}
