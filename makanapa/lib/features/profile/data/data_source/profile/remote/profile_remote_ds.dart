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
    final response = await supabase.auth.signInWithPassword(
      email: userEmail,
      password: oldPassword,
    );
    final session = response.session;
    if (session == null) {
      return null;
    }
    return (session.accessToken, session.refreshToken ?? "");
  }

  @override
  Future<void> updatePassword(String newPassword) async {
    await supabase.auth.updateUser(UserAttributes(password: newPassword));
  }

  @override
  Future<String> updateUserAvatar(String userId, String imagePath) {
    final fileExtension = imagePath.split('.').last;
    final fileName = '${DateTime.now().millisecondsSinceEpoch}.$fileExtension';
    final filePath = '$userId/$fileName';
    return supabase.storage
        .from('avatars')
        .upload(filePath, File(imagePath))
        .then((_) => supabase.storage.from('avatars').getPublicUrl(filePath));
  }

  @override
  Future<void> updateUserProfile(UserData request) async {
    await supabase
        .from('user_profile')
        .update({
          'user_name': request.name,
          'phone_number': request.phone,
          'avatar': request.avatar,
        })
        .eq('uid', request.userId);
  }
}
