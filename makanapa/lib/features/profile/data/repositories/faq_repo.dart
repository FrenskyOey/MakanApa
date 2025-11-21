import 'package:dartz/dartz.dart';
import 'package:makanapa/core/handlers/error/error_handler.dart';
import 'package:makanapa/features/profile/data/data_source/faq/faq_data_source.dart';
import 'package:makanapa/features/profile/domain/models/faq.dart';
import 'package:makanapa/features/profile/domain/repositories/faq_repository.dart';

class FaqRepo implements FaqRepository {
  final FaqRemoteDataSource remoteDataSource;
  final FaqLocalDataSource localDataSource;

  FaqRepo({required this.remoteDataSource, required this.localDataSource});

  @override
  Stream<List<Faq>?> getFaq() {
    return localDataSource.getFaqsEntity().map((entity) {
      return entity.map((e) => e.toDomain()).toList();
    });
  }

  @override
  Future<Either<String, void>> reloadFaqData() async {
    try {
      final data = await remoteDataSource.getFaqsData();
      final domainData = data.map((raw) {
        return raw.toDomain();
      }).toList();
      await localDataSource.cacheFaqs(domainData);
      return Right(null);
    } catch (e, stackTrace) {
      final message = handleError(e, stackTrace);
      return Left(message);
    }
  }
}
