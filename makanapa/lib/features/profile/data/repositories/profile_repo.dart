import 'package:dartz/dartz.dart';
import 'package:makanapa/features/onboarding/domain/models/user.dart';
import 'package:makanapa/features/profile/data/data_source/profile/profile_data_source.dart';
import 'package:makanapa/features/profile/domain/repositories/profile_repository.dart';

class ProfileRepo implements ProfileRepository {
  final ProfileRemoteDataSource remoteDataSource;
  final ProfileLocalDataSource localDataSource;

  ProfileRepo({required this.remoteDataSource, required this.localDataSource});

  @override
  Future<Either<String, void>> changePassword(
    String oldPassword,
    String newPassword,
  ) {
    // TODO: implement changePassword
    throw UnimplementedError();
  }

  @override
  Stream<Either<String, UserData>> getUserProfile() {
    // TODO: implement getUserProfile
    throw UnimplementedError();
  }

  @override
  Future<Either<String, String>> updateUserAvatar(String image) {
    // TODO: implement updateUserAvatar
    throw UnimplementedError();
  }

  @override
  Future<Either<String, void>> updateUserProfile(UserData userProfile) {
    // TODO: implement updateUserProfile
    throw UnimplementedError();
  }
}
