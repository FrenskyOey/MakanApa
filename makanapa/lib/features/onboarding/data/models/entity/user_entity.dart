import 'package:isar_community/isar.dart';
import 'package:makanapa/features/onboarding/domain/models/user.dart';

part 'user_entity.g.dart';

@collection
class UserEntity {
  Id id = Isar.autoIncrement;

  final String userId;
  final String name;
  final String email;
  final String role;
  final String? phone;
  final String? avatar;

  UserEntity({
    required this.userId,
    required this.name,
    required this.email,
    required this.phone,
    required this.avatar,
    this.role = "",
  });

  factory UserEntity.fromEntity(UserData user) {
    return UserEntity(
      userId: user.userId,
      name: user.name,
      email: user.email,
      phone: user.phone,
      avatar: user.avatar,
    );
  }

  // converting TemplateDTO object to Template entity
  UserData toDomain() {
    return UserData(
      userId: userId,
      name: name,
      email: email,
      phone: phone,
      avatar: avatar,
    );
  }
}
