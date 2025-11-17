import 'package:dartz/dartz.dart';
import 'package:makanapa/features/onboarding/domain/models/user.dart';

abstract class ProfileRepository {
  Stream<Either<String, UserData>> getUserProfile();
  Future<Either<String, void>> updateUserProfile(UserData userProfile);
  Future<Either<String, String>> updateUserAvatar(String image);
  Future<Either<String, void>> changePassword(
    String oldPassword,
    String newPassword,
  );
}
