import 'package:makanapa/features/onboarding/data/data_source/login/login_data_source.dart';
import 'package:makanapa/core/constants/pref_constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginLocalDataSourceImpl implements LoginLocalDataSource {
  final SharedPreferences prefs;

  LoginLocalDataSourceImpl({required this.prefs});

  @override
  Future<void> saveTokens({
    required String accessToken,
    required String refreshToken,
  }) async {
    await prefs.setString(PrefConstant.authToken, accessToken);
    await prefs.setString(PrefConstant.refreshToken, refreshToken);
  }

  @override
  Future<String?> getAccessToken() async {
    return prefs.getString(PrefConstant.authToken);
  }

  @override
  Future<String?> getRefreshToken() async {
    return prefs.getString(PrefConstant.refreshToken);
  }

  @override
  Future<void> clearTokens() async {
    await Future.wait([
      prefs.remove(PrefConstant.authToken),
      prefs.remove(PrefConstant.refreshToken),
    ]);
  }
}
