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

class SupabaseGetCurrentUser {
  static User? getCurrentUser() {
    return SupabaseService.client.auth.currentUser;
  }
}

class SupabaseGetSession {
  static Session? getSession() {
    return SupabaseService.client.auth.currentSession;
  }
}

class SupabaseRefreshSession {
  static Future<Session?> refreshSession() async {
    final response = await SupabaseService.client.auth.refreshSession();
    return response.session;
  }
}

class SupabaseIsAuthenticated {
  static bool isAuthenticated() {
    final user = SupabaseService.client.auth.currentUser;
    return user != null;
  }
}
