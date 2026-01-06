import 'package:flutter_test/flutter_test.dart';
import 'package:makanapa/features/onboarding/data/data_source/user/remote/user_remote_ds.dart';
import 'package:makanapa/features/onboarding/data/models/response/auth_data_response.dart';
import 'package:makanapa/features/onboarding/data/models/response/user_data_response.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'fake_postgrest_filter_builder.dart';
import 'fake_postgrest_transform_builder.dart';
import 'user_remote_ds_test.mocks.dart';

@GenerateMocks([SupabaseClient, SupabaseQueryBuilder, PostgrestFilterBuilder])
void main() {
  late UserRemoteDataSourceImpl dataSource;
  late MockSupabaseClient mockSupabase;
  late MockSupabaseQueryBuilder mockQueryBuilder;
  late MockPostgrestFilterBuilder<List<Map<String, dynamic>>> mockFilterBuilder;

  setUp(() {
    mockSupabase = MockSupabaseClient();
    mockQueryBuilder = MockSupabaseQueryBuilder();
    mockFilterBuilder = MockPostgrestFilterBuilder();
    dataSource = UserRemoteDataSourceImpl(supabase: mockSupabase);
  });

  group('UserRemoteDataSourceImpl', () {
    const testUserId = 'user_123';
    final mockUserData = <String, dynamic>{
      'uid': testUserId,
      'user_name': 'Test User',
      'email': 'test@test.com',
      'phone_number': '1234567890',
      'avatar': 'avatar_url',
    };

    group('getUser', () {
      test('should return UserDataResponse when user is found', () async {
        // Arrange
        when(
          mockSupabase.from('user_profile'),
        ).thenAnswer((_) => mockQueryBuilder);
        when(mockQueryBuilder.select()).thenAnswer((_) => mockFilterBuilder);
        when(
          mockFilterBuilder.eq('uid', testUserId),
        ).thenAnswer((_) => mockFilterBuilder);

        when(mockFilterBuilder.single()).thenAnswer(
          (_) => FakePostgrestTransformBuilder(mockUserData) as dynamic,
        );

        // Act
        final result = await dataSource.getUser(testUserId);

        // Assert
        expect(result, isA<UserDataResponse>());
        expect(result.userId, testUserId);
        verify(mockSupabase.from('user_profile')).called(1);
        verify(mockQueryBuilder.select()).called(1);
        verify(mockFilterBuilder.eq('uid', testUserId)).called(1);
        verify(mockFilterBuilder.single()).called(1);
      });

      test('should rethrow PostgrestException when error occurs', () async {
        // Arrange
        when(
          mockSupabase.from('user_profile'),
        ).thenAnswer((_) => mockQueryBuilder);
        when(mockQueryBuilder.select()).thenAnswer((_) => mockFilterBuilder);
        when(
          mockFilterBuilder.eq('uid', testUserId),
        ).thenAnswer((_) => mockFilterBuilder);

        when(
          mockFilterBuilder.single(),
        ).thenThrow(const PostgrestException(message: 'Error'));

        // Act & Assert
        expect(
          () => dataSource.getUser(testUserId),
          throwsA(isA<PostgrestException>()),
        );
      });
    });

    group('createUser', () {
      final authData = AuthDataResponse(
        userId: testUserId,
        email: 'test@test.com',
        role: 'user',
        provider: 'email',
        token: 'token',
        refreshToken: 'refresh',
      );

      test('should create user and return UserDataResponse', () async {
        // Arrange
        when(
          mockSupabase.from('user_profile'),
        ).thenAnswer((_) => mockQueryBuilder);
        when(
          mockQueryBuilder.insert(any),
        ).thenAnswer((_) => FakePostgrestFilterBuilder(null) as dynamic);

        // Act
        final result = await dataSource.createUser(
          authData,
          userName: 'Test User',
          phoneNumber: '1234567890',
          avatar: 'avatar_url',
        );

        // Assert
        expect(result, isA<UserDataResponse>());
        expect(result.userId, testUserId);
        expect(result.name, 'Test User');
        verify(mockSupabase.from('user_profile')).called(1);
        verify(mockQueryBuilder.insert(any)).called(1);
      });

      test('should rethrow PostgrestException when error occurs', () async {
        // Arrange
        when(
          mockSupabase.from('user_profile'),
        ).thenAnswer((_) => mockQueryBuilder);
        when(
          mockQueryBuilder.insert(any),
        ).thenThrow(const PostgrestException(message: 'Error'));

        // Act & Assert
        expect(
          () => dataSource.createUser(authData),
          throwsA(isA<PostgrestException>()),
        );
      });
    });
  });
}
