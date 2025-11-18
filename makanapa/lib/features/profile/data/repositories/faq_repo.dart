import 'package:dartz/dartz.dart';
import 'package:makanapa/features/profile/data/data_source/faq/faq_data_source.dart';
import 'package:makanapa/features/profile/domain/models/faq.dart';
import 'package:makanapa/features/profile/domain/repositories/faq_repository.dart';

class FaqRepo implements FaqRepository {
  final FaqRemoteDataSource remoteDataSource;
  final FaqLocalDataSource localDataSource;

  FaqRepo({required this.remoteDataSource, required this.localDataSource});

  @override
  Stream<List<Faq>?> getFaq() {
    // TODO: implement getFaq
    throw UnimplementedError();
  }

  @override
  Future<Either<String, void>> reloadFaqData() async {
    // TODO: implement getFaq
    throw UnimplementedError();
  }
}
