import 'package:dartz/dartz.dart';
import 'package:makanapa/core/handlers/error/error_handler.dart';
import 'package:makanapa/features/onboarding/data/data_source/login/login_data_source.dart';
import 'package:makanapa/features/onboarding/data/data_source/user/user_data_source.dart';
import 'package:makanapa/features/onboarding/domain/models/user.dart';
import 'package:makanapa/features/onboarding/domain/repositories/user_repository.dart';

class UserRepositoryImp implements UserRepository {
  final UserRemoteDataSource remoteDataSource;
  final UserLocalDataSource localDataSource;
  final LoginLocalDataSource authLocalSource;

  UserRepositoryImp({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.authLocalSource,
  });

  @override
  Future<Either<String, bool>> clearLocalProfile() async {
    try {
      await localDataSource.clearUser();
      return Right(true);
    } catch (e, stackTrace) {
      final message = handleError(e, stackTrace);
      return Left(message);
    }
  }

  @override
  Future<Either<String, UserData>> getCurrentUser() async {
    try {
      final user = await localDataSource.getCurrentUser();
      if (user != null) {
        return Right(user.toDomain());
      }

      final userId = await authLocalSource.getUserId();
      if (userId == null) {
        return Left("User Id Not Founds");
      }

      final userResponse = await remoteDataSource.getUser(userId);
      final userData = userResponse.toDomain();
      await localDataSource.saveUser(userData);
      return Right(userData);
    } catch (e, stackTrace) {
      final message = handleError(e, stackTrace);
      return Left(message);
    }
  }
}
