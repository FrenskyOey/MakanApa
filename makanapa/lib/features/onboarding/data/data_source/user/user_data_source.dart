import 'package:makanapa/features/onboarding/data/models/entity/user_entity.dart';
import 'package:makanapa/features/onboarding/data/models/response/user_data_response.dart';
import 'package:makanapa/features/onboarding/domain/models/user.dart';

abstract class UserRemoteDataSource {
  Future<UserDataResponse> getUser(String userId);
}

abstract class UserLocalDataSource {
  Future<void> saveUser(UserData user);
  Future<UserEntity?> getCurrentUser();
  Future<void> clearUser();
}
