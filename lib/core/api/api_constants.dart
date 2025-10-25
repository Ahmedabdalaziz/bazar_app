import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiConstants {
  static final supabaseUrl = dotenv.env['SUPABASE_URL']!;

  static final supabaseAnonKey = dotenv.env['SUPABASE_ANON_KEY']!;

  static final googleWebClientId = dotenv.env['GOOGLE_WEB_CLIENT_ID']!;
}
