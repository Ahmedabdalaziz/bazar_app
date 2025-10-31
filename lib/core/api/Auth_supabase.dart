import 'package:google_sign_in/google_sign_in.dart';
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

//Authentication
class SupaBaseEmailSignUp {
  static Future<void> signUp({
    required String email,
    required String password,
    required String username,
  }) async {
    final response = await SupabaseService.client.auth.signUp(
      email: email,
      password: password,
      data: {'username': username},
    );
    if (response.session == null) {
      throw Exception('Unknown authentication error');
    }
  }
}

class SupabaseEmailSignIn {
  static final _supabase = Supabase.instance.client;

  static Future<void> signIn({
    required String email,
    required String password,
  }) async {
    final response = await _supabase.auth.signInWithPassword(
      email: email,
      password: password,
    );

    if (response.user != null) {
      _supabase.from('profiles').upsert({
        'id': response.user!.id,
        'email': email,
        'updated_at': DateTime.now().toIso8601String(),
      }, onConflict: 'id').ignore();
    }
  }
}

class SupabaseSignupWithGoogle {
  static Future<void> signUp() async {
    final webClientId = ApiConstants.googleWebClientId;

    final googleSignIn = GoogleSignIn(clientId: webClientId);

    final googleUser = await googleSignIn.signIn();
    if (googleUser == null) {
      throw Exception('Sign in aborted by user');
    }

    final googleAuth = await googleUser.authentication;

    final idToken = googleAuth.idToken;
    final accessToken = googleAuth.accessToken;

    if (idToken == null || accessToken == null) {
      throw Exception('Failed to retrieve Google tokens');
    }

    await Supabase.instance.client.auth.signInWithIdToken(
      provider: OAuthProvider.google,
      idToken: idToken,
      accessToken: accessToken,
    );
  }
}

class SupabaseSignOut {
  static Future<void> signOut() async {
    await SupabaseService.client.auth.signOut();
  }
}
