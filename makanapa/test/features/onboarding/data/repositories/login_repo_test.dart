import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:makanapa/features/onboarding/data/data_source/login/login_data_source.dart';
import 'package:makanapa/features/onboarding/data/data_source/user/user_data_source.dart';
import 'package:makanapa/features/onboarding/data/models/response/auth_data_response.dart';
import 'package:makanapa/features/onboarding/data/models/response/user_data_response.dart';
import 'package:makanapa/features/onboarding/data/repositories/login_repo.dart';
import 'package:makanapa/features/onboarding/domain/models/auth.dart';
import 'package:makanapa/features/onboarding/domain/models/google_sign_in_request.dart';
import 'package:makanapa/features/onboarding/domain/models/signup_request.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'login_repo_test.mocks.dart';

@GenerateMocks([
  LoginRemoteDataSource,
  LoginLocalDataSource,
  UserRemoteDataSource,
  UserLocalDataSource,
])
void main() {
  late LoginRepositoryImp repository;
  late MockLoginRemoteDataSource mockLoginRemoteDataSource;
  late MockLoginLocalDataSource mockLoginLocalDataSource;
  late MockUserRemoteDataSource mockUserRemoteDataSource;
  late MockUserLocalDataSource mockUserLocalDataSource;

  setUp(() {
    mockLoginRemoteDataSource = MockLoginRemoteDataSource();
    mockLoginLocalDataSource = MockLoginLocalDataSource();
    mockUserRemoteDataSource = MockUserRemoteDataSource();
    mockUserLocalDataSource = MockUserLocalDataSource();
    repository = LoginRepositoryImp(
      remoteDataSource: mockLoginRemoteDataSource,
      localDataSource: mockLoginLocalDataSource,
      userRemoteDataSource: mockUserRemoteDataSource,
      userLocalDataSource: mockUserLocalDataSource,
    );
  });

  const tUserId = 'user_123';
  const tEmail = 'test@email.com';
  const tPassword = 'password';
  const tToken = 'token';
  const tRefreshToken = 'refresh_token';

  final tAuthResponse = AuthDataResponse(
    userId: tUserId,
    email: tEmail,
    role: 'user',
    provider: 'email',
    token: tToken,
    refreshToken: tRefreshToken,
  );

  final tUserDataResponse = UserDataResponse(
    userId: tUserId,
    name: 'Test User',
    email: tEmail,
    phone: '1234567890',
    avatar: 'avatar_url',
    salts: 'salt',
  );

  group('signInWithEmailAndPassword', () {
    test(
      'should return AuthData when login is successful and user profile exists',
      () async {
        // Arrange
        when(
          mockLoginRemoteDataSource.signInWithEmailAndPassword(any, any),
        ).thenAnswer((_) async => tAuthResponse);
        when(
          mockLoginLocalDataSource.setUserId(any),
        ).thenAnswer((_) async => {});
        when(
          mockLoginLocalDataSource.setUserLoginType(any),
        ).thenAnswer((_) async => {});
        when(
          mockUserRemoteDataSource.getUser(any),
        ).thenAnswer((_) async => tUserDataResponse);
        when(mockUserLocalDataSource.saveUser(any)).thenAnswer((_) async => {});

        // Act
        final result = await repository.signInWithEmailAndPassword(
          tEmail,
          tPassword,
        );

        // Assert
        expect(result, isA<Right<String, AuthData>>());
        verify(
          mockLoginRemoteDataSource.signInWithEmailAndPassword(
            tEmail,
            tPassword,
          ),
        );
        verify(mockLoginLocalDataSource.setUserId(tUserId));
        verify(mockUserRemoteDataSource.getUser(tUserId));
        verify(mockUserLocalDataSource.saveUser(any));
      },
    );

    test('should return error message when login fails', () async {
      // Arrange
      when(
        mockLoginRemoteDataSource.signInWithEmailAndPassword(any, any),
      ).thenThrow(const AuthException('Login failed'));

      // Act
      final result = await repository.signInWithEmailAndPassword(
        tEmail,
        tPassword,
      );

      // Assert
      expect(result, isA<Left<String, AuthData>>());
    });
  });

  group('signUpWithEmailAndPassword', () {
    final tSignupRequest = SignupRequest(
      email: tEmail,
      password: tPassword,
      userName: 'Test User',
      phone: '1234567890',
    );

    test('should return AuthData when signup is successful', () async {
      // Arrange
      when(
        mockLoginRemoteDataSource.signUpWithEmailAndPassword(any),
      ).thenAnswer((_) async => tAuthResponse);
      when(mockLoginLocalDataSource.setUserId(any)).thenAnswer((_) async => {});
      when(
        mockLoginLocalDataSource.setUserLoginType(any),
      ).thenAnswer((_) async => {});
      when(
        mockUserRemoteDataSource.createUser(
          any,
          userName: anyNamed('userName'),
          phoneNumber: anyNamed('phoneNumber'),
        ),
      ).thenAnswer((_) async => tUserDataResponse);
      when(mockUserLocalDataSource.saveUser(any)).thenAnswer((_) async => {});

      // Act
      final result = await repository.signUpWithEmailAndPassword(
        tSignupRequest,
      );

      // Assert
      expect(result, isA<Right<String, AuthData>>());
      verify(
        mockLoginRemoteDataSource.signUpWithEmailAndPassword(tSignupRequest),
      );
      verify(
        mockUserRemoteDataSource.createUser(
          tAuthResponse,
          userName: tSignupRequest.userName,
          phoneNumber: tSignupRequest.phone,
        ),
      );
    });

    test('should return error message when signup fails', () async {
      // Arrange
      when(
        mockLoginRemoteDataSource.signUpWithEmailAndPassword(any),
      ).thenThrow(const AuthException('Signup failed'));

      // Act
      final result = await repository.signUpWithEmailAndPassword(
        tSignupRequest,
      );

      // Assert
      expect(result, isA<Left<String, AuthData>>());
    });
  });

  group('signInWithGoogle', () {
    final tGoogleRequest = GoogleSignInRequest(
      email: tEmail,
      idToken: 'id_token',
      accessToken: 'access_token',
      userName: 'Google User',
      phone: '0987654321',
      avatar: 'avatar_url',
    );

    test('should return AuthData when google sign in is successful', () async {
      // Arrange
      when(
        mockLoginRemoteDataSource.signInWithGoogle(any, any),
      ).thenAnswer((_) async => tAuthResponse);
      when(mockLoginLocalDataSource.setUserId(any)).thenAnswer((_) async => {});
      when(
        mockLoginLocalDataSource.setUserLoginType(any),
      ).thenAnswer((_) async => {});
      when(
        mockUserRemoteDataSource.getUser(any),
      ).thenAnswer((_) async => tUserDataResponse);
      when(mockUserLocalDataSource.saveUser(any)).thenAnswer((_) async => {});

      // Act
      final result = await repository.signInWithGoogle(tGoogleRequest);

      // Assert
      expect(result, isA<Right<String, AuthData>>());
      verify(
        mockLoginRemoteDataSource.signInWithGoogle(
          tGoogleRequest.idToken,
          tGoogleRequest.accessToken,
        ),
      );
      verify(mockUserRemoteDataSource.getUser(tUserId));
    });

    test('should return error message when google sign in fails', () async {
      // Arrange
      when(
        mockLoginRemoteDataSource.signInWithGoogle(any, any),
      ).thenThrow(const AuthException('Google sign in failed'));

      // Act
      final result = await repository.signInWithGoogle(tGoogleRequest);

      // Assert
      expect(result, isA<Left<String, AuthData>>());
    });
  });
}
