import 'package:dartz/dartz.dart';
import 'package:makanapa/features/onboarding/domain/models/user.dart';

abstract class UserRepository {
  Future<Either<String, UserData?>> getCurrentUser();
  Future<Either<String, bool>> clearLocalProfile();
}
