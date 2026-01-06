import 'package:flutter_test/flutter_test.dart';
import 'package:makanapa/core/constants/pref_constant.dart';
import 'package:makanapa/features/shared/data-sources/local/shared_local_ds.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'shared_local_ds_test.mocks.dart';

@GenerateMocks([SharedPreferences])
void main() {
  late SharedLocalDataSourceImpl dataSource;
  late MockSharedPreferences mockPrefs;

  setUp(() {
    mockPrefs = MockSharedPreferences();
    dataSource = SharedLocalDataSourceImpl(prefs: mockPrefs);
  });

  group('SharedLocalDataSourceImpl', () {
    group('authToken', () {
      test('should return token string when cached token is present', () {
        // Arrange
        const tToken = 'some_token';
        when(mockPrefs.getString(PrefConstant.authToken)).thenReturn(tToken);

        // Act
        final result = dataSource.authToken();

        // Assert
        verify(mockPrefs.getString(PrefConstant.authToken));
        expect(result, tToken);
      });

      test('should return empty string when cached token is not present', () {
        // Arrange
        when(mockPrefs.getString(PrefConstant.authToken)).thenReturn(null);

        // Act
        final result = dataSource.authToken();

        // Assert
        verify(mockPrefs.getString(PrefConstant.authToken));
        expect(result, '');
      });
    });
  });
}
