import 'package:makanapa/features/onboarding/data/data_source/login/login_data_source.dart';
import 'package:makanapa/features/onboarding/domain/models/signup_request.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:makanapa/features/onboarding/data/models/response/auth_data_response.dart';

class LoginRemoteDataSourceImpl implements LoginRemoteDataSource {
  final SupabaseClient supabase;

  LoginRemoteDataSourceImpl({required this.supabase});

  @override
  Future<AuthDataResponse> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      final response = await supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );

      final session = response.session;
      final user = response.user;

      if (user == null || session == null) {
        throw const AuthException('Login failed: User or session is null.');
      }

      return AuthDataResponse(
        userId: user.id,
        role: user.role ?? 'user',
        email: user.email ?? '',
        provider: user.appMetadata['provider'] as String? ?? 'email',
        token: session.accessToken,
        refreshToken: session.refreshToken ?? '',
      );
    } on AuthException {
      rethrow;
    }
  }

  @override
  Future<AuthDataResponse> signInWithGoogle(
    String idToken,
    String accessToken,
  ) async {
    try {
      final response = await supabase.auth.signInWithIdToken(
        provider: OAuthProvider.google,
        idToken: idToken,
        accessToken: accessToken,
      );
      final session = response.session;
      final user = response.user;

      if (user == null || session == null) {
        throw const AuthException('Login failed: User or session is null.');
      }

      return AuthDataResponse(
        userId: user.id,
        role: user.role ?? 'user',
        email: user.email ?? '',
        provider: user.appMetadata['provider'] as String? ?? 'google',
        token: session.accessToken,
        refreshToken: session.refreshToken ?? '',
      );
    } on AuthException {
      rethrow;
    }
  }

  @override
  Future<AuthDataResponse> signUpWithEmailAndPassword(
    SignupRequest request,
  ) async {
    try {
      final response = await supabase.auth.signUp(
        email: request.email,
        password: request.password!,
        data: {'user_name': request.userName, 'phone': request.phone},
      );

      final session = response.session;
      final user = response.user;

      if (user == null || session == null) {
        throw const AuthException('Signup failed: User or session is null.');
      }

      return AuthDataResponse(
        userId: user.id,
        role: user.role ?? 'user',
        email: user.email ?? '',
        provider: user.appMetadata['provider'] as String? ?? 'email',
        token: session.accessToken,
        refreshToken: session.refreshToken ?? '',
      );
    } on AuthException {
      rethrow;
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await supabase.auth.signOut();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<(String, String)> refreshToken(String refreshToken) async {
    try {
      final response = await supabase.auth.setSession(refreshToken);
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
