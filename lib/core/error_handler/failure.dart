import 'dart:io';

import 'package:supabase/supabase.dart';

abstract class Failure {
  final String message;
  final String? code;

  const Failure({required this.message, this.code});
}

class AuthFailure extends Failure {
  const AuthFailure({required super.message, super.code});
}

class NetworkFailure extends Failure {
  const NetworkFailure({required super.message, super.code});
}

class UnknownFailure extends Failure {
  const UnknownFailure({required super.message, super.code});
}

class ExceptionHandler {
  static Failure handle(dynamic error) {
    if (error is AuthException) {
      return AuthFailure(
        message: error.message.isNotEmpty
            ? error.message
            : "حدث خطأ أثناء تسجيل الدخول أو التسجيل",
        code: error.statusCode,
      );
    }

    if (error is PostgrestException) {
      return NetworkFailure(
        message: error.message.isNotEmpty
            ? error.message
            : "فشل الاتصال بقاعدة البيانات",
        code: error.code,
      );
    }

    if (error is SocketException) {
      return NetworkFailure(
        message: "تحقق من اتصالك بالإنترنت",
        code: "no_connection",
      );
    }

    return UnknownFailure(
      message: error.toString(),
      code: "unknown",
    );
  }
}
