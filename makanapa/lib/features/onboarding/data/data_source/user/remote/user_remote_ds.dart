import 'package:makanapa/features/onboarding/data/data_source/user/user_data_source.dart';
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
}
