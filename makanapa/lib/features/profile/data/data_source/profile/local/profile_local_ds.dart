import 'package:isar_community/isar.dart';
import 'package:makanapa/features/onboarding/data/models/entity/user_entity.dart';
import 'package:makanapa/features/profile/data/data_source/profile/profile_data_source.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileLocalDs implements ProfileLocalDataSource {
  final Isar isar;
  final SharedPreferences prefs;

  ProfileLocalDs({required this.isar, required this.prefs});

  @override
  Future<String?> getUserLoginType() {
    // TODO: implement getUserLoginType
    throw UnimplementedError();
  }

  @override
  Stream<UserEntity?> getUserProfile() {
    // TODO: implement getUserProfile
    throw UnimplementedError();
  }
}
