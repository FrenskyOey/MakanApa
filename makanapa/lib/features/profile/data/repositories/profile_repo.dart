import 'package:dartz/dartz.dart';
import 'dart:io';
import 'package:makanapa/core/handlers/error/error_handler.dart';
import 'package:makanapa/features/onboarding/data/data_source/user/user_data_source.dart';
import 'package:makanapa/features/onboarding/domain/models/user.dart';
import 'package:makanapa/features/profile/data/data_source/profile/profile_data_source.dart';
import 'package:makanapa/features/profile/domain/repositories/profile_repository.dart';

class ProfileRepo implements ProfileRepository {
  final ProfileRemoteDataSource remoteDataSource;
  final ProfileLocalDataSource localDataSource;
  final UserLocalDataSource userLocalDataSource;
  final UserRemoteDataSource userRemoteDataSource;

  ProfileRepo({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.userLocalDataSource,
    required this.userRemoteDataSource,
  });

  @override
  Future<Either<String, bool>> changePassword(
    String oldPassword,
    String newPassword,
  ) async {
    final userEntity = await userLocalDataSource.getCurrentUser();
    final userEmail = userEntity?.email ?? "";

    try {
      final checkUser = await remoteDataSource.checkPassword(
        userEmail,
        oldPassword,
      );
      if (checkUser == null) {
        return Left("404 | User not found");
      }
      await remoteDataSource.updatePassword(newPassword);
      return Right(true);
    } catch (e, stackTrace) {
      final message = handleError(e, stackTrace);
      return Left(message);
    }
  }

  @override
  Future<Either<String, void>> reloadUserProfile() async {
    try {
      final userIds = await localDataSource.getUserId();
      if (userIds == null) {
        return Left("User Id Not Found");
      }
      final data = await userRemoteDataSource.getUser(userIds);
      await userLocalDataSource.saveUser(data.toDomain());
      return Right(null);
    } catch (e, stackTrace) {
      final message = handleError(e, stackTrace);
      return Left(message);
    }
  }

  @override
  Stream<UserData?> getUserProfileStream() {
    final streams = localDataSource.getUserProfile().map((userEntity) {
      return userEntity?.toDomain();
    });
    return streams;
  }

  @override
  Future<Either<String, String>> updateUserAvatar(String imagePath) async {
    try {
      final userId = await localDataSource.getUserId();
      if (userId == null) {
        return Left("User Id Not Found");
      }

      final imageFile = File(imagePath);
      // upload image to server
      final newAvatarUrl = await remoteDataSource.updateUserAvatar(
        userId,
        imageFile,
      );

      // update profile data to server
      final userData = await userLocalDataSource.getCurrentUser();
      if (userData == null) {
        return Left("User Not Found");
      }
      final userDomain = userData.toDomain().copyWith(avatar: newAvatarUrl);
      await remoteDataSource.updateUserProfile(userDomain);
      // update local data
      await userLocalDataSource.saveUser(userDomain);
      return Right(newAvatarUrl);
    } catch (e, stackTrace) {
      final message = handleError(e, stackTrace);
      return Left(message);
    }
  }

  @override
  Future<Either<String, bool>> updateUserProfile(UserData userProfile) async {
    try {
      await remoteDataSource.updateUserProfile(userProfile);
      await userLocalDataSource.saveUser(userProfile);
      return Right(true);
    } catch (e, stackTrace) {
      final message = handleError(e, stackTrace);
      return Left(message);
    }
  }

  @override
  Future<String> getUserType() async {
    final type = await localDataSource.getUserLoginType();
    return type ?? "email";
  }
}
