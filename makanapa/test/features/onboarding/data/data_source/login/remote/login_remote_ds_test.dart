import 'package:flutter_test/flutter_test.dart';
import 'package:makanapa/features/onboarding/data/data_source/login/remote/login_remote_ds.dart';
import 'package:makanapa/features/onboarding/data/models/response/auth_data_response.dart';
import 'package:makanapa/features/onboarding/domain/models/signup_request.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'login_remote_ds_test.mocks.dart';

@GenerateMocks([
  SupabaseClient,
  GoTrueClient,
  AuthResponse,
  Session,
  User,
  SignupRequest,
])
void main() {
  late LoginRemoteDataSourceImpl dataSource;
  late MockSupabaseClient mockSupabaseClient;
  late MockGoTrueClient mockGoTrueClient;

  setUp(() {
    mockSupabaseClient = MockSupabaseClient();
    mockGoTrueClient = MockGoTrueClient();

    // Setup mock for supabase.auth to return our mocked GoTrueClient
    when(mockSupabaseClient.auth).thenReturn(mockGoTrueClient);

    dataSource = LoginRemoteDataSourceImpl(supabase: mockSupabaseClient);
  });

  group('LoginRemoteDataSourceImpl', () {
    group('signInWithEmailAndPassword', () {
      const tEmail = 'test@email.com';
      const tPassword = 'password';
      const tUserId = 'user_id';
      const tToken = 'token';
      const tRefreshToken = 'refresh_token';

      test('should return AuthDataResponse when login is successful', () async {
        // Arrange
        final mockAuthResponse = MockAuthResponse();
        final mockSession = MockSession();
        final mockUser = MockUser();

        when(mockSession.accessToken).thenReturn(tToken);
        when(mockSession.refreshToken).thenReturn(tRefreshToken);

        when(mockUser.id).thenReturn(tUserId);
        when(mockUser.role).thenReturn('user');
        when(mockUser.email).thenReturn(tEmail);
        when(mockUser.appMetadata).thenReturn({'provider': 'email'});

        when(mockAuthResponse.session).thenReturn(mockSession);
        when(mockAuthResponse.user).thenReturn(mockUser);

        when(
          mockGoTrueClient.signInWithPassword(
            email: tEmail,
            password: tPassword,
          ),
        ).thenAnswer((_) async => mockAuthResponse);

        // Act
        final result = await dataSource.signInWithEmailAndPassword(
          tEmail,
          tPassword,
        );

        // Assert
        expect(result, isA<AuthDataResponse>());
        expect(result.userId, tUserId);
        expect(result.email, tEmail);
        expect(result.token, tToken);
        verify(
          mockGoTrueClient.signInWithPassword(
            email: tEmail,
            password: tPassword,
          ),
        );
      });

      test('should throw AuthException when user or session is null', () async {
        // Arrange
        final mockAuthResponse = MockAuthResponse();
        when(mockAuthResponse.session).thenReturn(null);
        when(mockAuthResponse.user).thenReturn(null);

        when(
          mockGoTrueClient.signInWithPassword(
            email: tEmail,
            password: tPassword,
          ),
        ).thenAnswer((_) async => mockAuthResponse);

        // Act & Assert
        expect(
          () => dataSource.signInWithEmailAndPassword(tEmail, tPassword),
          throwsA(isA<AuthException>()),
        );
      });

      test(
        'should rethrow AuthException when Supabase throws AuthException',
        () async {
          // Arrange
          when(
            mockGoTrueClient.signInWithPassword(
              email: tEmail,
              password: tPassword,
            ),
          ).thenThrow(const AuthException('Login failed'));

          // Act & Assert
          expect(
            () => dataSource.signInWithEmailAndPassword(tEmail, tPassword),
            throwsA(isA<AuthException>()),
          );
        },
      );
    });

    group('signInWithGoogle', () {
      const tIdToken = 'id_token';
      const tAccessToken = 'access_token';
      const tUserId = 'user_id';
      const tEmail = 'test@google.com';
      const tToken = 'token';
      const tRefreshToken = 'refresh_token';

      test('should return AuthDataResponse when login is successful', () async {
        // Arrange
        final mockAuthResponse = MockAuthResponse();
        final mockSession = MockSession();
        final mockUser = MockUser();

        when(mockSession.accessToken).thenReturn(tToken);
        when(mockSession.refreshToken).thenReturn(tRefreshToken);

        when(mockUser.id).thenReturn(tUserId);
        when(mockUser.role).thenReturn('user');
        when(mockUser.email).thenReturn(tEmail);
        when(mockUser.appMetadata).thenReturn({'provider': 'google'});

        when(mockAuthResponse.session).thenReturn(mockSession);
        when(mockAuthResponse.user).thenReturn(mockUser);

        when(
          mockGoTrueClient.signInWithIdToken(
            provider: OAuthProvider.google,
            idToken: tIdToken,
            accessToken: tAccessToken,
          ),
        ).thenAnswer((_) async => mockAuthResponse);

        // Act
        final result = await dataSource.signInWithGoogle(
          tIdToken,
          tAccessToken,
        );

        // Assert
        expect(result, isA<AuthDataResponse>());
        expect(result.userId, tUserId);
        expect(result.provider, 'google');
        verify(
          mockGoTrueClient.signInWithIdToken(
            provider: OAuthProvider.google,
            idToken: tIdToken,
            accessToken: tAccessToken,
          ),
        );
      });

      test('should throw AuthException when user or session is null', () async {
        // Arrange
        final mockAuthResponse = MockAuthResponse();
        when(mockAuthResponse.session).thenReturn(null);
        when(mockAuthResponse.user).thenReturn(null);

        when(
          mockGoTrueClient.signInWithIdToken(
            provider: OAuthProvider.google,
            idToken: tIdToken,
            accessToken: tAccessToken,
          ),
        ).thenAnswer((_) async => mockAuthResponse);

        // Act & Assert
        expect(
          () => dataSource.signInWithGoogle(tIdToken, tAccessToken),
          throwsA(isA<AuthException>()),
        );
      });
    });

    group('signUpWithEmailAndPassword', () {
      const tEmail = 'test@email.com';
      const tPassword = 'password';
      const tUserName = 'Test User';
      const tPhone = '1234567890';
      const tUserId = 'user_id';
      const tToken = 'token';

      test(
        'should return AuthDataResponse when signup is successful',
        () async {
          // Arrange
          final signupRequest = SignupRequest(
            userName: tUserName,
            password: tPassword,
            email: tEmail,
            phone: tPhone,
          );
          final mockAuthResponse = MockAuthResponse();
          final mockSession = MockSession();
          final mockUser = MockUser();

          when(mockSession.accessToken).thenReturn(tToken);
          when(mockSession.refreshToken).thenReturn('refresh_token');

          when(mockUser.id).thenReturn(tUserId);
          when(mockUser.role).thenReturn('user');
          when(mockUser.email).thenReturn(tEmail);
          when(mockUser.appMetadata).thenReturn({'provider': 'email'});

          when(mockAuthResponse.session).thenReturn(mockSession);
          when(mockAuthResponse.user).thenReturn(mockUser);

          when(
            mockGoTrueClient.signUp(
              email: tEmail,
              password: tPassword,
              data: {'user_name': tUserName, 'phone': tPhone},
            ),
          ).thenAnswer((_) async => mockAuthResponse);

          // Act
          final result = await dataSource.signUpWithEmailAndPassword(
            signupRequest,
          );

          // Assert
          expect(result, isA<AuthDataResponse>());
          expect(result.userId, tUserId);
          verify(
            mockGoTrueClient.signUp(
              email: tEmail,
              password: tPassword,
              data: {'user_name': tUserName, 'phone': tPhone},
            ),
          );
        },
      );
    });
  });
}
