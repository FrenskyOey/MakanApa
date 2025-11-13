/*
import 'package:dartz/dartz.dart';

class TemplateRepositoryImp implements TemplateRepository {
  final TemplateRemoteDataSource remoteDataSource;

  TemplateRepositoryImp({required this.remoteDataSource});

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
