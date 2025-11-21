import 'package:makanapa/core/constants/pref_constant.dart';
import 'package:makanapa/features/shared/token/data/data_source/token_data_source.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class TokenLocaDataSourceImpl implements TokenLocalDataSource {
  final SupabaseClient supabase;
  final SharedPreferences prefs;

  TokenLocaDataSourceImpl({required this.prefs, required this.supabase});

  @override
  String? getAccessToken() {
    return supabase.auth.currentSession?.accessToken;
  }

  @override
  String? getRefreshToken() {
    return supabase.auth.currentSession?.refreshToken;
  }

  @override
  Future<void> clearTokens() async {
    await Future.wait([
      supabase.auth.signOut(scope: SignOutScope.local),
      prefs.remove(PrefConstant.currentUserId),
    ]);
  }

  @override
  Stream<String?> onTokenChanged() {
    return supabase.auth.onAuthStateChange.map((authState) {
      return authState.session?.accessToken;
    });
  }
}
