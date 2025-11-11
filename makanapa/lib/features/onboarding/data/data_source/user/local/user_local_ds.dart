import 'package:isar_community/isar.dart';
import 'package:makanapa/features/onboarding/data/data_source/user/user_data_source.dart';
import 'package:makanapa/features/onboarding/data/models/entity/user_entity.dart';
import 'package:makanapa/features/onboarding/domain/models/user.dart';

class UserLocalDataSourceImpl implements UserLocalDataSource {
  final Isar isar;
  UserLocalDataSourceImpl({required this.isar});
  @override
  Future<void> saveUser(UserData user) async {
    await isar.writeTxn(() async {
      // Convert the domain model to an Isar entity
      final userEntity = UserEntity.fromEntity(user);

      // Check if a user with the same userId already exists to perform an upsert.
      final existingUser = await isar.userEntitys
          .filter()
          .userIdEqualTo(user.userId)
          .findFirst();

      if (existingUser != null) {
        userEntity.id = existingUser.id;
      }

      // 'put' will insert a new entry or update an existing one.
      await isar.userEntitys.put(userEntity);
    });
  }

  @override
  Future<void> clearUser() async {
    await isar.writeTxn(() async {
      // This will delete all records in the UserEntity collection.
      await isar.userEntitys.clear();
    });
  }

  @override
  Future<UserEntity?> getCurrentUser() async {
    // Since there should only be one user saved at a time,
    // we can just get the first one found.
    return await isar.userEntitys.where().findFirst();
  }
}
