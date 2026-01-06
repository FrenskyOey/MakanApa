import 'package:flutter_test/flutter_test.dart';
import 'package:makanapa/features/shared/token/data/data_source/remote/token_remote_ds.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'token_remote_ds_test.mocks.dart';

@GenerateMocks([SupabaseClient, GoTrueClient, AuthResponse, Session])
void main() {
  late TokenRemoteDataSourceImpl dataSource;
  late MockSupabaseClient mockSupabase;
  late MockGoTrueClient mockGoTrue;

  setUp(() {
    mockSupabase = MockSupabaseClient();
    mockGoTrue = MockGoTrueClient();
    when(mockSupabase.auth).thenReturn(mockGoTrue);
    dataSource = TokenRemoteDataSourceImpl(supabase: mockSupabase);
  });

  group('TokenRemoteDataSourceImpl', () {
    group('signOut', () {
      test('should call signOut on Supabase client', () async {
        when(mockGoTrue.signOut()).thenAnswer((_) async {});

        await dataSource.signOut();

        verify(mockGoTrue.signOut()).called(1);
      });

      test('should rethrow exception when signOut fails', () async {
        when(mockGoTrue.signOut()).thenThrow(Exception('Sign out failed'));

        expect(() => dataSource.signOut(), throwsException);
      });
    });

    group('refreshToken', () {
      const tAccessToken = 'new_access_token';
      const tRefreshToken = 'new_refresh_token';

      test('should return new tokens when refresh is successful', () async {
        final mockAuthResponse = MockAuthResponse();
        final mockSession = MockSession();

        when(mockSession.accessToken).thenReturn(tAccessToken);
        when(mockSession.refreshToken).thenReturn(tRefreshToken);
        when(mockAuthResponse.session).thenReturn(mockSession);

        when(
          mockGoTrue.refreshSession(),
        ).thenAnswer((_) async => mockAuthResponse);

        final result = await dataSource.refreshToken();

        expect(result.$1, tAccessToken);
        expect(result.$2, tRefreshToken);
        verify(mockGoTrue.refreshSession()).called(1);
      });

      test('should throw AuthException when session is null', () async {
        final mockAuthResponse = MockAuthResponse();
        when(mockAuthResponse.session).thenReturn(null);

        when(
          mockGoTrue.refreshSession(),
        ).thenAnswer((_) async => mockAuthResponse);

        expect(() => dataSource.refreshToken(), throwsA(isA<AuthException>()));
      });

      test('should rethrow AuthException from Supabase', () async {
        when(
          mockGoTrue.refreshSession(),
        ).thenThrow(const AuthException('Fail'));

        expect(() => dataSource.refreshToken(), throwsA(isA<AuthException>()));
      });
    });
  });
}
