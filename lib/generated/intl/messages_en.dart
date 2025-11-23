// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m0(name) => "Books by ${name}";

  static String m1(count) => "${count} reviews";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "Congratulation": MessageLookupByLibrary.simpleMessage("Congratulation!"),
    "HaveAnAccount": MessageLookupByLibrary.simpleMessage("Have an account?"),
    "UnknownTitle": MessageLookupByLibrary.simpleMessage("Unknown Title"),
    "about": MessageLookupByLibrary.simpleMessage("About"),
    "auth_email_exists": MessageLookupByLibrary.simpleMessage(
      "This email is already registered.",
    ),
    "auth_google_sign_in_failed": MessageLookupByLibrary.simpleMessage(
      "Failed to sign in with Google.",
    ),
    "auth_invalid_credentials": MessageLookupByLibrary.simpleMessage(
      "Invalid email or password.",
    ),
    "auth_invalid_token": MessageLookupByLibrary.simpleMessage(
      "Invalid authentication token.",
    ),
    "auth_token_expired": MessageLookupByLibrary.simpleMessage(
      "Session expired. Please log in again.",
    ),
    "auth_user_not_found": MessageLookupByLibrary.simpleMessage(
      "User not found.",
    ),
    "auth_weak_password": MessageLookupByLibrary.simpleMessage(
      "Password is too weak.",
    ),
    "authorDetails": MessageLookupByLibrary.simpleMessage("Author Details"),
    "authors": MessageLookupByLibrary.simpleMessage("Authors"),
    "bestVendors": MessageLookupByLibrary.simpleMessage("Best Vendors"),
    "bookDetails": MessageLookupByLibrary.simpleMessage("Book Details"),
    "books": MessageLookupByLibrary.simpleMessage("Books"),
    "booksBy": m0,
    "byClickingSignUp": MessageLookupByLibrary.simpleMessage(
      "By clicking Register, you agree to our",
    ),
    "cart": MessageLookupByLibrary.simpleMessage("Cart"),
    "category": MessageLookupByLibrary.simpleMessage("Category"),
    "comingSoon": MessageLookupByLibrary.simpleMessage("Coming soon"),
    "continueButton": MessageLookupByLibrary.simpleMessage("Continue"),
    "continueShopping": MessageLookupByLibrary.simpleMessage(
      "Continue Shopping",
    ),
    "createAccount": MessageLookupByLibrary.simpleMessage(
      "Create account and choose favorite menu",
    ),
    "db_foreign_key_violation": MessageLookupByLibrary.simpleMessage(
      "Invalid reference in database.",
    ),
    "db_not_null_violation": MessageLookupByLibrary.simpleMessage(
      "Missing required field.",
    ),
    "db_unique_violation": MessageLookupByLibrary.simpleMessage(
      "Duplicate entry detected.",
    ),
    "details": MessageLookupByLibrary.simpleMessage("Details"),
    "dontHaveAccount": MessageLookupByLibrary.simpleMessage(
      "Don\'t have an account? ",
    ),
    "email": MessageLookupByLibrary.simpleMessage("Email"),
    "emptyEmailError": MessageLookupByLibrary.simpleMessage(
      "Please enter your email",
    ),
    "emptyPasswordError": MessageLookupByLibrary.simpleMessage(
      "Please enter your password",
    ),
    "errorValidationEmail": MessageLookupByLibrary.simpleMessage(
      "Please enter a valid email address",
    ),
    "errorValidationPassword": MessageLookupByLibrary.simpleMessage(
      "Password must be at least 8 characters with letters and numbers",
    ),
    "fieldsCannotBeEmpty": MessageLookupByLibrary.simpleMessage(
      "Fields cannot be empty",
    ),
    "firstOnboardingBody": MessageLookupByLibrary.simpleMessage(
      "Discover new worlds, join a vibrant reading community. Start your reading adventure effortlessly with us.",
    ),
    "firstOnboardingTitle": MessageLookupByLibrary.simpleMessage(
      "Now reading being easier",
    ),
    "forgotPassword": MessageLookupByLibrary.simpleMessage("Forgot Password?"),
    "getStartedButton": MessageLookupByLibrary.simpleMessage("Get Started"),
    "getStartedPrompt": MessageLookupByLibrary.simpleMessage(
      "your account is complete, please enjoy the best menu from us.",
    ),
    "haveAccount": MessageLookupByLibrary.simpleMessage(
      "Already have an account? ",
    ),
    "home": MessageLookupByLibrary.simpleMessage("Home"),
    "invalidEmail": MessageLookupByLibrary.simpleMessage(
      "Please enter a valid email address",
    ),
    "invalidPassword": MessageLookupByLibrary.simpleMessage(
      "Password must contain uppercase, lowercase, number, symbol and be at least 8 characters long",
    ),
    "invalidUsername": MessageLookupByLibrary.simpleMessage(
      "Username must be between 3 and 20 characters without symbols",
    ),
    "language": MessageLookupByLibrary.simpleMessage("Language"),
    "login": MessageLookupByLibrary.simpleMessage("Login"),
    "loginSuccess": MessageLookupByLibrary.simpleMessage("Login successful"),
    "name": MessageLookupByLibrary.simpleMessage("Name"),
    "network_connection_error": MessageLookupByLibrary.simpleMessage(
      "Please check your internet connection.",
    ),
    "network_offline_showing_cached": MessageLookupByLibrary.simpleMessage(
      "Connection issue — showing cached data",
    ),
    "network_server_error": MessageLookupByLibrary.simpleMessage(
      "Server is not responding. Try again later.",
    ),
    "network_timeout": MessageLookupByLibrary.simpleMessage(
      "Request timed out. Try again later.",
    ),
    "nextButton": MessageLookupByLibrary.simpleMessage("Next"),
    "noAuthorsFound": MessageLookupByLibrary.simpleMessage("No authors found."),
    "noBooksFound": MessageLookupByLibrary.simpleMessage("No books found."),
    "noConnectionSnack": MessageLookupByLibrary.simpleMessage(
      "No internet connection.",
    ),
    "noDescription": MessageLookupByLibrary.simpleMessage(
      "No description available.",
    ),
    "noInternet": MessageLookupByLibrary.simpleMessage(
      "No internet connection",
    ),
    "noPublishersFound": MessageLookupByLibrary.simpleMessage(
      "No publishers found.",
    ),
    "orWith": MessageLookupByLibrary.simpleMessage("Or with"),
    "overview": MessageLookupByLibrary.simpleMessage("Overview"),
    "pages": MessageLookupByLibrary.simpleMessage("Pages"),
    "password": MessageLookupByLibrary.simpleMessage("Password"),
    "profile": MessageLookupByLibrary.simpleMessage("Profile"),
    "published": MessageLookupByLibrary.simpleMessage("Published"),
    "publisher": MessageLookupByLibrary.simpleMessage("Publisher"),
    "publisherDetails": MessageLookupByLibrary.simpleMessage(
      "Publisher Details",
    ),
    "publishers": MessageLookupByLibrary.simpleMessage("Publishers"),
    "rating": MessageLookupByLibrary.simpleMessage("Rating"),
    "register": MessageLookupByLibrary.simpleMessage("Register"),
    "resetPassword": MessageLookupByLibrary.simpleMessage("Reset Password"),
    "resetPasswordInstruction": MessageLookupByLibrary.simpleMessage(
      "Enter your email address below to receive password reset instructions.",
    ),
    "retry": MessageLookupByLibrary.simpleMessage("Retry"),
    "reviews": m1,
    "role": MessageLookupByLibrary.simpleMessage("Role"),
    "searchHint": MessageLookupByLibrary.simpleMessage(
      "Search for an author...",
    ),
    "searchPublishers": MessageLookupByLibrary.simpleMessage(
      "Search for a publisher...",
    ),
    "secondOnboardingBody": MessageLookupByLibrary.simpleMessage(
      "Guide to your perfect read. Books tailored to your taste for rewarding experience.",
    ),
    "secondOnboardingTitle": MessageLookupByLibrary.simpleMessage(
      "Your Bookish Soulmate",
    ),
    "seeAll": MessageLookupByLibrary.simpleMessage("See All"),
    "signIn": MessageLookupByLibrary.simpleMessage("Sign In"),
    "signToYourAccount": MessageLookupByLibrary.simpleMessage(
      "Sign to your account",
    ),
    "signUp": MessageLookupByLibrary.simpleMessage("Sign Up"),
    "signUpSuccess": MessageLookupByLibrary.simpleMessage("Sign up successful"),
    "signupFailed": MessageLookupByLibrary.simpleMessage(
      "Signup failed, please try again",
    ),
    "signupSuccess": MessageLookupByLibrary.simpleMessage(
      "Account created successfully",
    ),
    "signupWithFacebook": MessageLookupByLibrary.simpleMessage(
      "Sign up with Facebook",
    ),
    "signupWithGoogle": MessageLookupByLibrary.simpleMessage(
      "Sign up with Google",
    ),
    "skipButton": MessageLookupByLibrary.simpleMessage("Skip"),
    "termsOfService": MessageLookupByLibrary.simpleMessage("Terms of Service"),
    "thirdOnboardingBody": MessageLookupByLibrary.simpleMessage(
      "Ready to embark on a quest for inspiration and knowledge? Your adventure begins now. Let\'s go!",
    ),
    "thirdOnboardingTitle": MessageLookupByLibrary.simpleMessage(
      "Start Your Adventure",
    ),
    "topOfWeek": MessageLookupByLibrary.simpleMessage("Top of the Week"),
    "unknown_error": MessageLookupByLibrary.simpleMessage(
      "An unexpected error occurred. Please try again.",
    ),
    "validation_empty_field": MessageLookupByLibrary.simpleMessage(
      "This field cannot be empty.",
    ),
    "validation_invalid_email": MessageLookupByLibrary.simpleMessage(
      "Please enter a valid email address.",
    ),
    "validation_short_password": MessageLookupByLibrary.simpleMessage(
      "Password must be at least 6 characters.",
    ),
    "vendor": MessageLookupByLibrary.simpleMessage("Vendors"),
    "viewCart": MessageLookupByLibrary.simpleMessage("View Cart"),
    "welcomeMessage": MessageLookupByLibrary.simpleMessage("Welcome to Bazar"),
    "yourEmail": MessageLookupByLibrary.simpleMessage("Your Email"),
    "yourName": MessageLookupByLibrary.simpleMessage("Your Name"),
    "yourPassword": MessageLookupByLibrary.simpleMessage("Your Password"),
  };
}
