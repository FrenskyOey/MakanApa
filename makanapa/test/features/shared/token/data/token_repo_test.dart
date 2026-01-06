import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:makanapa/features/onboarding/data/data_source/user/user_data_source.dart';
import 'package:makanapa/features/shared/token/data/data_source/token_data_source.dart';
import 'package:makanapa/features/shared/token/data/token_repo.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'token_repo_test.mocks.dart';

@GenerateMocks([
  TokenRemoteDataSource,
  TokenLocalDataSource,
  UserLocalDataSource,
])
void main() {
  late TokenRepositoryImp repository;
  late MockTokenRemoteDataSource mockRemoteDataSource;
  late MockTokenLocalDataSource mockLocalDataSource;
  late MockUserLocalDataSource mockUserLocalDataSource;

  setUp(() {
    mockRemoteDataSource = MockTokenRemoteDataSource();
    mockLocalDataSource = MockTokenLocalDataSource();
    mockUserLocalDataSource = MockUserLocalDataSource();
    repository = TokenRepositoryImp(
      remoteDataSource: mockRemoteDataSource,
      localDataSource: mockLocalDataSource,
      userLocalDataSource: mockUserLocalDataSource,
    );
  });

  group('TokenRepositoryImp', () {
    const tAccessToken = 'access_token';
    const tRefreshToken = 'refresh_token';

    group('performTokenRefresh', () {
      test('should return new access token when successful', () async {
        when(
          mockRemoteDataSource.refreshToken(),
        ).thenAnswer((_) async => (tAccessToken, tRefreshToken));

        final result = await repository.performTokenRefresh();

        expect(result, const Right(tAccessToken));
        verify(mockRemoteDataSource.refreshToken());
      });

      test('should return error message when fails', () async {
        when(
          mockRemoteDataSource.refreshToken(),
        ).thenThrow(Exception('Refresh failed'));

        final result = await repository.performTokenRefresh();

        expect(result, isA<Left<String, String>>());
      });
    });

    group('getRefreshToken', () {
      test('should return refresh token from local source', () {
        when(mockLocalDataSource.getRefreshToken()).thenReturn(tRefreshToken);

        final result = repository.getRefreshToken();

        expect(result, tRefreshToken);
        verify(mockLocalDataSource.getRefreshToken());
      });
    });

    group('getAccessToken', () {
      test('should return access token from local source', () {
        when(mockLocalDataSource.getAccessToken()).thenReturn(tAccessToken);

        final result = repository.getAccessToken();

        expect(result, tAccessToken);
        verify(mockLocalDataSource.getAccessToken());
      });
    });

    group('logout', () {
      test('should call remote signOut and clear local data', () async {
        when(mockRemoteDataSource.signOut()).thenAnswer((_) async {});
        when(mockLocalDataSource.clearTokens()).thenAnswer((_) async {});
        when(mockUserLocalDataSource.clearUser()).thenAnswer((_) async {});

        final result = await repository.logout();

        expect(result, const Right(null));
        verify(mockRemoteDataSource.signOut());
        verify(mockLocalDataSource.clearTokens());
        verify(mockUserLocalDataSource.clearUser());
      });

      test(
        'should continue to clear local data even if remote signOut fails',
        () async {
          when(
            mockRemoteDataSource.signOut(),
          ).thenThrow(Exception('Network error'));
          when(mockLocalDataSource.clearTokens()).thenAnswer((_) async {});
          when(mockUserLocalDataSource.clearUser()).thenAnswer((_) async {});

          final result = await repository.logout();

          expect(result, const Right(null));
          verify(mockRemoteDataSource.signOut());
          verify(mockLocalDataSource.clearTokens());
          verify(mockUserLocalDataSource.clearUser());
        },
      );
    });

    group('onTokenChanged', () {
      test('should return stream from local source', () {
        final tStream = Stream.value(tAccessToken);
        when(mockLocalDataSource.onTokenChanged()).thenAnswer((_) => tStream);

        final result = repository.onTokenChanged();

        expect(result, tStream);
        verify(mockLocalDataSource.onTokenChanged());
      });
    });
  });
}
