import 'package:supabase_flutter/supabase_flutter.dart';

import 'api_constants.dart';

class SupabaseService {
  static Future<void> initialize() async {
    await Supabase.initialize(
      url: ApiConstants.supabaseUrl,
      anonKey: ApiConstants.supabaseAnonKey,
    );
  }

  static SupabaseClient get client => Supabase.instance.client;
}

class SupabaseSignupWithGoogle {
  static Future<void> signUp() async {
    final supabase = Supabase.instance.client;

    await supabase.auth.signInWithOAuth(
      OAuthProvider.google,
      redirectTo: 'io.supabase.flutter://login-callback/',
    );
  }
}

class SupabaseEmailAuth {
  static Future<void> signIn({
    required String email,
    required String password,
  }) async {
    final supabase = SupabaseService.client;

    final response = await supabase.auth.signInWithPassword(
      email: email,
      password: password,
    );

    if (response.user == null) {
      throw Exception('Unknown authentication error');
    }
  }
}