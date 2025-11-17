import 'package:dartz/dartz.dart';
import 'package:makanapa/features/profile/domain/models/faq.dart';

abstract class FaqRepository {
  Stream<Either<String, List<Faq>>> getFaq();
}
