import 'package:makanapa/features/shared/token/data/data_source/token_data_source.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class TokenRemoteDataSourceImpl implements TokenRemoteDataSource {
  final SupabaseClient supabase;

  TokenRemoteDataSourceImpl({required this.supabase});

  @override
  Future<void> signOut() async {
    try {
      await supabase.auth.signOut();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<(String, String)> refreshToken() async {
    try {
      final response = await supabase.auth.refreshSession();

      final newAccessToken = response.session?.accessToken;
      final newRefreshToken = response.session?.refreshToken ?? "";

      if (newAccessToken == null) {
        throw const AuthException(
          'Failed to refresh token: New session is null.',
        );
      }

      return (newAccessToken, newRefreshToken);
    } on AuthException {
      rethrow;
    }
  }
}
