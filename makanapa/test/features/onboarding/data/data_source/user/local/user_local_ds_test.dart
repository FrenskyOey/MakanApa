import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:isar_community/isar.dart';
import 'package:makanapa/core/constants/pref_constant.dart';
import 'package:makanapa/features/onboarding/data/data_source/user/local/user_local_ds.dart';
import 'package:makanapa/features/onboarding/data/models/entity/user_entity.dart';
import 'package:makanapa/features/onboarding/domain/models/user.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'user_local_ds_test.mocks.dart';

@GenerateMocks([SharedPreferences])
void main() {
  late Isar isar;
  late UserLocalDataSourceImpl dataSource;
  late MockSharedPreferences mockPrefs;
  late Directory tempDir;

  setUpAll(() async {
    await Isar.initializeIsarCore(download: true);
  });

  setUp(() async {
    tempDir = await Directory.systemTemp.createTemp('');

    // Open Isar with UserEntitySchema
    isar = await Isar.open(
      [UserEntitySchema],
      directory: tempDir.path,
      name: 'test_user_${DateTime.now().millisecondsSinceEpoch}',
    );

    mockPrefs = MockSharedPreferences();
    dataSource = UserLocalDataSourceImpl(isar: isar, prefs: mockPrefs);
  });

  tearDown(() async {
    await isar.close(deleteFromDisk: true);
    if (await tempDir.exists()) {
      await tempDir.delete(recursive: true);
    }
  });

  group('UserLocalDataSourceImpl', () {
    const tUserId = 'user_123';
    final tUserData = UserData(
      userId: tUserId,
      name: 'Test User',
      email: 'test@email.com',
      phone: '1234567890',
      avatar: 'avatar_url',
    );

    group('saveUser', () {
      test('should save user to Isar', () async {
        // Act
        await dataSource.saveUser(tUserData);

        // Assert
        final savedUser = await isar.userEntitys
            .filter()
            .userIdEqualTo(tUserId)
            .findFirst();

        expect(savedUser, isNotNull);
        expect(savedUser!.userId, tUserId);
        expect(savedUser.name, tUserData.name);
        expect(savedUser.email, tUserData.email);
      });

      test('should update existing user in Isar (upsert)', () async {
        // Arrange - Save initial user
        await dataSource.saveUser(tUserData);

        // Create updated user with same ID
        final updatedUserData = tUserData.copyWith(name: 'Updated Name');

        // Act
        await dataSource.saveUser(updatedUserData);

        // Assert
        final users = await isar.userEntitys.where().findAll();
        expect(users.length, 1); // Should still be 1 record
        expect(users.first.userId, tUserId);
        expect(users.first.name, 'Updated Name');
      });
    });

    group('getCurrentUser', () {
      test(
        'should return null when userId is not in SharedPreferences',
        () async {
          // Arrange
          when(
            mockPrefs.getString(PrefConstant.currentUserId),
          ).thenReturn(null);

          // Act
          final result = await dataSource.getCurrentUser();

          // Assert
          expect(result, null);
          verify(mockPrefs.getString(PrefConstant.currentUserId));
        },
      );

      test('should return user when userId exists in Prefs and Isar', () async {
        // Arrange
        when(
          mockPrefs.getString(PrefConstant.currentUserId),
        ).thenReturn(tUserId);
        await dataSource.saveUser(tUserData);

        // Act
        final result = await dataSource.getCurrentUser();

        // Assert
        expect(result, isNotNull);
        expect(result!.userId, tUserId);
        expect(result.name, tUserData.name);
      });

      test(
        'should return null when userId exists in Prefs but not in Isar',
        () async {
          // Arrange
          when(
            mockPrefs.getString(PrefConstant.currentUserId),
          ).thenReturn(tUserId);
          // Ensure Isar is empty
          await isar.writeTxn(() async => await isar.userEntitys.clear());

          // Act
          final result = await dataSource.getCurrentUser();

          // Assert
          expect(result, null);
        },
      );
    });

    group('clearUser', () {
      test('should remove all users from Isar', () async {
        // Arrange
        await dataSource.saveUser(tUserData);
        expect(await isar.userEntitys.count(), 1);

        // Act
        await dataSource.clearUser();

        // Assert
        expect(await isar.userEntitys.count(), 0);
      });
    });
  });
}
