import 'package:isar_community/isar.dart';
import 'package:makanapa/core/constants/pref_constant.dart';
import 'package:makanapa/features/onboarding/data/models/entity/user_entity.dart';
import 'package:makanapa/features/profile/data/data_source/profile/profile_data_source.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileLocalDs implements ProfileLocalDataSource {
  final Isar isar;
  final SharedPreferences prefs;

  ProfileLocalDs({required this.isar, required this.prefs});

  @override
  Future<String?> getUserLoginType() async {
    return prefs.getString(PrefConstant.userLoginType);
  }

  @override
  Future<String?> getUserId() async {
    return prefs.getString(PrefConstant.currentUserId);
  }

  @override
  Stream<UserEntity?> getUserProfile() {
    final userId = prefs.getString(PrefConstant.currentUserId);
    if (userId == null) {
      return Stream.value(null);
    }

    return isar.userEntitys
        .filter()
        .userIdEqualTo(userId)
        .watch(fireImmediately: true)
        .map((users) => users.isNotEmpty ? users.first : null);
  }
}
