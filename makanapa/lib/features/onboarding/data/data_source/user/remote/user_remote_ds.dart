import 'package:makanapa/features/onboarding/data/data_source/user/user_data_source.dart';
import 'package:makanapa/features/onboarding/data/models/response/auth_data_response.dart';
import 'package:makanapa/features/onboarding/data/models/response/user_data_response.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final SupabaseClient supabase;

  UserRemoteDataSourceImpl({required this.supabase});

  @override
  Future<UserDataResponse> getUser(String userId) async {
    try {
      final response = await supabase
          .from('user_profile')
          .select()
          .eq('uid', userId)
          .single();
      return UserDataResponse.fromJson(response);
    } on PostgrestException catch (_) {
      // if result null, it will throw this exception
      rethrow;
    } catch (e) {
      // Catch any other potential errors
      throw Exception('An unexpected error occurred: $e');
    }
  }

  @override
  Future<UserDataResponse> createUser(
    AuthDataResponse authData, {
    String? userName,
    String? phoneNumber,
    String? avatar,
  }) async {
    try {
      await supabase.from('user_profile').insert({
        'uid': authData.userId,
        'user_name': userName,
        'email': authData.email,
        'phone_number': phoneNumber,
        'avatar': avatar,
      });

      return UserDataResponse(
        userId: authData.userId,
        name: userName ?? '',
        email: authData.email,
        phone: phoneNumber ?? '',
        avatar: avatar ?? '',
        salts: '',
      );
    } on PostgrestException catch (_) {
      // if result null, it will throw this exception
      rethrow;
    } catch (e) {
      // Catch any other potential errors
      throw Exception('An unexpected error occurred: $e');
    }
  }
}
