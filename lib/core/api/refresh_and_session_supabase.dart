import 'package:supabase/supabase.dart';

import 'Auth_supabase.dart';

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

class SupabaseIsAuthenticated {
  static bool isAuthenticated() {
    final user = SupabaseService.client.auth.currentUser;
    return user != null;
  }
}

//Refresh token
class SupabaseRefreshSession {
  static Future<Session?> refreshSession() async {
    final response = await SupabaseService.client.auth.refreshSession();
    return response.session;
  }
}