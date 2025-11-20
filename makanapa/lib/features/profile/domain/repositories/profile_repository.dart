import 'package:dartz/dartz.dart';
import 'package:makanapa/features/onboarding/domain/models/user.dart';

abstract class ProfileRepository {
  Stream<UserData?> getUserProfileStream();
  Future<Either<String, void>> reloadUserProfile();
  Future<Either<String, bool>> updateUserProfile(UserData userProfile);
  Future<Either<String, String>> updateUserAvatar(String imagePath);
  Future<String> getUserType();
  Future<Either<String, bool>> changePassword(
    String oldPassword,
    String newPassword,
  );
}
