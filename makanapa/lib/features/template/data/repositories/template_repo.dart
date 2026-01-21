/*
import 'package:dartz/dartz.dart';

class TemplateRepositoryImp implements TemplateRepository {
  final TemplateLocalDataSource localDataSource;
  final TemplateRemoteDataSource remoteDataSource;

  TemplateRepositoryImp({required this.remoteDataSource});

  @override
  Future<Either<String, List<Template>>> getTemplateList() async {
    try {
      await Future.delayed(const Duration(seconds: 2));
      final data = await remoteDataSource.getTemplateList();
      final result = data.map((raw) {
        return raw.toDomain();
      }).toList();
      await localDataSource.saveTemplate(result);
      return Right(result);
    } catch (e, stackTrace) {
      final message = handleError(e, stackTrace);
      return Left(message);
    }
  }

  @override
  Future<Either<String, Template>> getTemplateObject() async {
    try {
        await Future.delayed(const Duration(seconds: 2));
        final data = await remoteDataSource.getTemplateObject();
        final result = data.toDomain();
        await localDataSource.saveTemplate(result);
        return Right(result);
    }catch (e, stackTrace) {
      final message = handleError(e, stackTrace);
      return Left(message);
    }
  }
}
*/
