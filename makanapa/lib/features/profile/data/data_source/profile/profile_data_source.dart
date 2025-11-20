import 'package:makanapa/features/onboarding/data/models/entity/user_entity.dart';
import 'package:makanapa/features/onboarding/domain/models/user.dart';

abstract class ProfileRemoteDataSource {
  Future<void> updateUserProfile(UserData request);
  Future<String> updateUserAvatar(String userId, String image);
  Future<(String token, String refreshToken)?> checkPassword(
    String userEmail,
    String oldPassword,
  );
  Future<void> updatePassword(String newPassword);
}

abstract class ProfileLocalDataSource {
  Stream<UserEntity?> getUserProfile();
  Future<String?> getUserLoginType();
  Future<String?> getUserId();
}
