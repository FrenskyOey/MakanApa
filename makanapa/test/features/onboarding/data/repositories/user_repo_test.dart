import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:makanapa/features/onboarding/data/data_source/login/login_data_source.dart';
import 'package:makanapa/features/onboarding/data/data_source/user/user_data_source.dart';
import 'package:makanapa/features/onboarding/data/models/entity/user_entity.dart';
import 'package:makanapa/features/onboarding/data/models/response/user_data_response.dart';
import 'package:makanapa/features/onboarding/data/repositories/user_repo.dart';
import 'package:makanapa/features/onboarding/domain/models/user.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'user_repo_test.mocks.dart';

@GenerateMocks([
  UserRemoteDataSource,
  UserLocalDataSource,
  LoginLocalDataSource,
])
void main() {
  late UserRepositoryImp repository;
  late MockUserRemoteDataSource mockUserRemoteDataSource;
  late MockUserLocalDataSource mockUserLocalDataSource;
  late MockLoginLocalDataSource mockLoginLocalDataSource;

  setUp(() {
    mockUserRemoteDataSource = MockUserRemoteDataSource();
    mockUserLocalDataSource = MockUserLocalDataSource();
    mockLoginLocalDataSource = MockLoginLocalDataSource();
    repository = UserRepositoryImp(
      remoteDataSource: mockUserRemoteDataSource,
      localDataSource: mockUserLocalDataSource,
      authLocalSource: mockLoginLocalDataSource,
    );
  });

  const tUserId = 'user_123';
  final tUserData = UserData(
    userId: tUserId,
    name: 'Test User',
    email: 'test@email.com',
    phone: '1234567890',
    avatar: 'avatar_url',
  );
  // Assuming UserEntity has a fromEntity factory or similar constructor
  final tUserEntity = UserEntity.fromEntity(tUserData);
  final tUserDataResponse = UserDataResponse(
    userId: tUserId,
    name: 'Test User',
    email: 'test@email.com',
    phone: '1234567890',
    avatar: 'avatar_url',
    salts: 'salt',
  );

  group('clearLocalProfile', () {
    test(
      'should return true when clearing local profile is successful',
      () async {
        // Arrange
        when(mockUserLocalDataSource.clearUser()).thenAnswer((_) async => {});

        // Act
        final result = await repository.clearLocalProfile();

        // Assert
        expect(result, const Right(true));
        verify(mockUserLocalDataSource.clearUser());
      },
    );

    test(
      'should return error message when clearing local profile fails',
      () async {
        // Arrange
        when(mockUserLocalDataSource.clearUser()).thenThrow(Exception('Error'));

        // Act
        final result = await repository.clearLocalProfile();

        // Assert
        expect(result, isA<Left<String, bool>>());
      },
    );
  });

  group('getCurrentUser', () {
    test('should return UserData from local storage if available', () async {
      // Arrange
      when(
        mockUserLocalDataSource.getCurrentUser(),
      ).thenAnswer((_) async => tUserEntity);

      // Act
      final result = await repository.getCurrentUser();

      // Assert
      expect(result, isA<Right<String, UserData>>());
      verify(mockUserLocalDataSource.getCurrentUser());
      verifyZeroInteractions(mockUserRemoteDataSource);
    });

    test(
      'should fetch from remote if local is empty and userId exists',
      () async {
        // Arrange
        when(
          mockUserLocalDataSource.getCurrentUser(),
        ).thenAnswer((_) async => null);
        when(
          mockLoginLocalDataSource.getUserId(),
        ).thenAnswer((_) async => tUserId);
        when(
          mockUserRemoteDataSource.getUser(tUserId),
        ).thenAnswer((_) async => tUserDataResponse);
        when(mockUserLocalDataSource.saveUser(any)).thenAnswer((_) async => {});

        // Act
        final result = await repository.getCurrentUser();

        // Assert
        expect(result, isA<Right<String, UserData>>());
        verify(mockUserLocalDataSource.getCurrentUser());
        verify(mockLoginLocalDataSource.getUserId());
        verify(mockUserRemoteDataSource.getUser(tUserId));
        verify(mockUserLocalDataSource.saveUser(any));
      },
    );

    test('should return error if local is empty and userId is null', () async {
      // Arrange
      when(
        mockUserLocalDataSource.getCurrentUser(),
      ).thenAnswer((_) async => null);
      when(mockLoginLocalDataSource.getUserId()).thenAnswer((_) async => null);

      // Act
      final result = await repository.getCurrentUser();

      // Assert
      expect(result, const Left("User Id Not Founds"));
    });
  });
}
