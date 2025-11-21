import 'package:dartz/dartz.dart';

abstract class TokenRepository {
  String? getRefreshToken();
  String? getAccessToken();
  Future<Either<String, void>> logout();
  Future<Either<String, String>> performTokenRefresh();
}
