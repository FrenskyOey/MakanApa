import 'dart:io';

import 'package:makanapa/features/onboarding/data/models/response/auth_data_response.dart';
import 'package:makanapa/features/onboarding/domain/models/user.dart';
import 'package:makanapa/features/profile/data/data_source/profile/profile_data_source.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProfileRemoteDs implements ProfileRemoteDataSource {
  final SupabaseClient supabase;

  ProfileRemoteDs({required this.supabase});

  @override
  Future<AuthDataResponse> checkPassword(String userEmail, String oldPassword) {
    // TODO: implement checkPassword
    throw UnimplementedError();
  }

  @override
  Future<void> updatePassword(String newPassword) {
    // TODO: implement updatePassword
    throw UnimplementedError();
  }

  @override
  Future<String> updateUserAvatar(File image) {
    // TODO: implement updateUserAvatar
    throw UnimplementedError();
  }

  @override
  Future<void> updateUserProfile(UserData request) {
    // TODO: implement updateUserProfile
    throw UnimplementedError();
  }
}
