class AuthValidation {
  static bool isValidEmail(String email) {
    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    return emailRegex.hasMatch(email.trim());
  }

  static bool isValidPassword(String password) {
    final passwordRegex = RegExp(
      r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#\$%^&*_\-]).{8,}$',
    );
    return passwordRegex.hasMatch(password);
  }

  static bool isValidUsername(String username) {
    final usernameRegex = RegExp(r'^[a-zA-Z0-9_]{3,20}$');
    return usernameRegex.hasMatch(username.trim());
  }

  static bool isValidPhoneNumber(String phoneNumber) {
    final phoneRegex = RegExp(r'^\+?[0-9]{7,15}$');
    return phoneRegex.hasMatch(phoneNumber.trim());
  }
}
