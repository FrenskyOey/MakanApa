import 'dart:io';

import 'package:makanapa/features/onboarding/domain/models/user.dart';
import 'package:makanapa/features/profile/data/data_source/profile/profile_data_source.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProfileRemoteDs implements ProfileRemoteDataSource {
  final SupabaseClient supabase;

  ProfileRemoteDs({required this.supabase});

  @override
  Future<(String, String)?> checkPassword(
    String userEmail,
    String oldPassword,
  ) async {
    try {
      final response = await supabase.auth.signInWithPassword(
        email: userEmail,
        password: oldPassword,
      );

      final session = response.session;
      final user = response.user;

      if (user == null || session == null) {
        return null;
      }
      return (session.accessToken, session.refreshToken ?? "");
    } catch (e) {
      return null;
    }
  }

  @override
  Future<void> updatePassword(String newPassword) async {
    await supabase.auth.updateUser(UserAttributes(password: newPassword));
  }

  @override
  Future<String> updateUserAvatar(String userId, File image) {
    final fileExtension = image.path.split('.').last;
    final fileName = '${DateTime.now().millisecondsSinceEpoch}.$fileExtension';
    final filePath = '$userId/$fileName';
    return supabase.storage
        .from('avatars')
        .upload(filePath, image)
        .then((_) => supabase.storage.from('avatars').getPublicUrl(filePath));
  }

  @override
  Future<void> updateUserProfile(UserData request) async {
    await supabase.from('user_profile').insert({
      'uid': authData.userId,
      'user_name': userName,
      'email': authData.email,
      'phone_number': phoneNumber,
      'avatar': avatar,
    });
  }
}
