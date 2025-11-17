import 'dart:io';

import 'package:makanapa/features/onboarding/data/models/entity/user_entity.dart';
import 'package:makanapa/features/onboarding/data/models/response/auth_data_response.dart';
import 'package:makanapa/features/onboarding/domain/models/user.dart';

abstract class ProfileRemoteDataSource {
  // Updates the user profile data in Supabase.
  Future<void> updateUserProfile(UserData request);
  // Uploads a new user avatar to Supabase Storage.
  Future<String> updateUserAvatar(File image);
  // Check user's password in Supabase Auth.
  Future<AuthDataResponse> checkPassword(String userEmail, String oldPassword);
  // Updates the user's password in Supabase Auth.
  Future<void> updatePassword(String newPassword);
}

abstract class ProfileLocalDataSource {
  // Retrieves the cached user profile from Isar.
  Stream<UserEntity?> getUserProfile();
  Future<String?> getUserLoginType();
}
