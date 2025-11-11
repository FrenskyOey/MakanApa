/*
import 'package:dartz/dartz.dart';

class LoginRepositoryImp implements LoginRepository {
  final LoginRemoteDataSource remoteDataSource;

  LoginRepositoryImp({required this.remoteDataSource});

  @override
  Future<Either<String, Template>> getTemplate() async {
    try {
      await Future.delayed(const Duration(seconds: 2));
      final response = await remoteDataSource.getTemplate();
      final result = response.toDomain();
      return Right(result);
    } catch (e, stackTrace) {
      final message = handleError(e, stackTrace);
      return Left(message);
    }
  }
}
*/
