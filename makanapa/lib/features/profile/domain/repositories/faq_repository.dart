import 'package:dartz/dartz.dart';
import 'package:makanapa/features/profile/domain/models/faq.dart';

abstract class FaqRepository {
  Stream<List<Faq>?> getFaq();
  Future<Either<String, void>> reloadFaqData();
}
