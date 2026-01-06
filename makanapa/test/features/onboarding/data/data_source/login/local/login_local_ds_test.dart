import 'package:flutter_test/flutter_test.dart';
import 'package:makanapa/core/constants/pref_constant.dart';
import 'package:makanapa/features/onboarding/data/data_source/login/local/login_local_ds.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login_local_ds_test.mocks.dart';

@GenerateMocks([SharedPreferences])
void main() {
  late LoginLocalDataSourceImpl dataSource;
  late MockSharedPreferences mockPrefs;

  setUp(() {
    mockPrefs = MockSharedPreferences();
    dataSource = LoginLocalDataSourceImpl(prefs: mockPrefs);
  });

  group('LoginLocalDataSourceImpl', () {
    const tUserId = 'user_123';
    const tLoginType = 'email';

    group('getUserId', () {
      test(
        'should return userId from SharedPreferences when present',
        () async {
          // Arrange
          when(
            mockPrefs.getString(PrefConstant.currentUserId),
          ).thenReturn(tUserId);

          // Act
          final result = await dataSource.getUserId();

          // Assert
          verify(mockPrefs.getString(PrefConstant.currentUserId));
          expect(result, tUserId);
        },
      );

      test(
        'should return null when userId is not present in SharedPreferences',
        () async {
          // Arrange
          when(
            mockPrefs.getString(PrefConstant.currentUserId),
          ).thenReturn(null);

          // Act
          final result = await dataSource.getUserId();

          // Assert
          verify(mockPrefs.getString(PrefConstant.currentUserId));
          expect(result, null);
        },
      );
    });

    group('setUserId', () {
      test('should call SharedPreferences to save the userId', () async {
        // Arrange
        when(mockPrefs.setString(any, any)).thenAnswer((_) async => true);

        // Act
        await dataSource.setUserId(tUserId);

        // Assert
        verify(mockPrefs.setString(PrefConstant.currentUserId, tUserId));
      });
    });

    group('setUserLoginType', () {
      test('should call SharedPreferences to save the login type', () async {
        // Arrange
        when(mockPrefs.setString(any, any)).thenAnswer((_) async => true);

        // Act
        await dataSource.setUserLoginType(tLoginType);

        // Assert
        verify(mockPrefs.setString(PrefConstant.userLoginType, tLoginType));
      });
    });
  });
}
