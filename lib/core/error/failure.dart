import 'package:supabase/supabase.dart';

abstract class Failure {
  final String message;
  final String? code;

  const Failure({required this.message, this.code});
}

class AuthFailure extends Failure {
  const AuthFailure({required String message, String? code})
      : super(message: message, code: code);
}

class NetworkFailure extends Failure {
  const NetworkFailure({required String message, String? code})
      : super(message: message, code: code);
}

class UnknownFailure extends Failure {
  const UnknownFailure({required String message, String? code})
      : super(message: message, code: code);
}

class ExceptionHandler {
  static Failure handle(dynamic error) {
    if (error is AuthException) {
      return AuthFailure(
        message: error.message,
        code: error.statusCode,
      );
    }

    if (error is PostgrestException) {
      return NetworkFailure(
        message: error.message,
        code: error.code,
      );
    }

    return UnknownFailure(
      message: error.toString(),
      code: '500',
    );
  }
}
