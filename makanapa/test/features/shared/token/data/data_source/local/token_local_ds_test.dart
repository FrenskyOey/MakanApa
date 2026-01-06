import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:makanapa/core/constants/pref_constant.dart';
import 'package:makanapa/features/shared/token/data/data_source/local/token_local_ds.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'token_local_ds_test.mocks.dart';

@GenerateMocks([
  SupabaseClient,
  GoTrueClient,
  Session,
  SharedPreferences,
  AuthState,
])
void main() {
  late TokenLocaDataSourceImpl dataSource;
  late MockSupabaseClient mockSupabase;
  late MockGoTrueClient mockGoTrue;
  late MockSharedPreferences mockPrefs;
  late MockSession mockSession;

  setUp(() {
    mockSupabase = MockSupabaseClient();
    mockGoTrue = MockGoTrueClient();
    mockPrefs = MockSharedPreferences();
    mockSession = MockSession();

    when(mockSupabase.auth).thenReturn(mockGoTrue);

    dataSource = TokenLocaDataSourceImpl(
      prefs: mockPrefs,
      supabase: mockSupabase,
    );
  });

  group('TokenLocaDataSourceImpl', () {
    const tAccessToken = 'access_token';
    const tRefreshToken = 'refresh_token';

    group('getAccessToken', () {
      test('should return access token when session exists', () {
        when(mockGoTrue.currentSession).thenReturn(mockSession);
        when(mockSession.accessToken).thenReturn(tAccessToken);

        final result = dataSource.getAccessToken();

        expect(result, tAccessToken);
      });

      test('should return null when session is null', () {
        when(mockGoTrue.currentSession).thenReturn(null);

        final result = dataSource.getAccessToken();

        expect(result, null);
      });
    });

    group('getRefreshToken', () {
      test('should return refresh token when session exists', () {
        when(mockGoTrue.currentSession).thenReturn(mockSession);
        when(mockSession.refreshToken).thenReturn(tRefreshToken);

        final result = dataSource.getRefreshToken();

        expect(result, tRefreshToken);
      });

      test('should return null when session is null', () {
        when(mockGoTrue.currentSession).thenReturn(null);

        final result = dataSource.getRefreshToken();

        expect(result, null);
      });
    });

    group('clearTokens', () {
      test('should sign out locally and remove user id from prefs', () async {
        when(
          mockGoTrue.signOut(scope: SignOutScope.local),
        ).thenAnswer((_) async {});
        when(
          mockPrefs.remove(PrefConstant.currentUserId),
        ).thenAnswer((_) async => true);

        await dataSource.clearTokens();

        verify(mockGoTrue.signOut(scope: SignOutScope.local)).called(1);
        verify(mockPrefs.remove(PrefConstant.currentUserId)).called(1);
      });
    });

    group('onTokenChanged', () {
      test('should emit access token when auth state changes', () {
        final mockAuthState = MockAuthState();
        when(mockAuthState.session).thenReturn(mockSession);
        when(mockSession.accessToken).thenReturn(tAccessToken);

        when(
          mockGoTrue.onAuthStateChange,
        ).thenAnswer((_) => Stream.value(mockAuthState));

        final stream = dataSource.onTokenChanged();

        expectLater(stream, emits(tAccessToken));
      });
    });
  });
}
