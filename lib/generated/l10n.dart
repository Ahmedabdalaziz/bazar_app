// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Invalid email or password.`
  String get auth_invalid_credentials {
    return Intl.message(
      'Invalid email or password.',
      name: 'auth_invalid_credentials',
      desc: '',
      args: [],
    );
  }

  /// `User not found.`
  String get auth_user_not_found {
    return Intl.message(
      'User not found.',
      name: 'auth_user_not_found',
      desc: '',
      args: [],
    );
  }

  /// `This email is already registered.`
  String get auth_email_exists {
    return Intl.message(
      'This email is already registered.',
      name: 'auth_email_exists',
      desc: '',
      args: [],
    );
  }

  /// `Password is too weak.`
  String get auth_weak_password {
    return Intl.message(
      'Password is too weak.',
      name: 'auth_weak_password',
      desc: '',
      args: [],
    );
  }

  /// `Session expired. Please log in again.`
  String get auth_token_expired {
    return Intl.message(
      'Session expired. Please log in again.',
      name: 'auth_token_expired',
      desc: '',
      args: [],
    );
  }

  /// `Invalid authentication token.`
  String get auth_invalid_token {
    return Intl.message(
      'Invalid authentication token.',
      name: 'auth_invalid_token',
      desc: '',
      args: [],
    );
  }

  /// `Failed to sign in with Google.`
  String get auth_google_sign_in_failed {
    return Intl.message(
      'Failed to sign in with Google.',
      name: 'auth_google_sign_in_failed',
      desc: '',
      args: [],
    );
  }

  /// `Please check your internet connection.`
  String get network_connection_error {
    return Intl.message(
      'Please check your internet connection.',
      name: 'network_connection_error',
      desc: '',
      args: [],
    );
  }

  /// `Request timed out. Try again later.`
  String get network_timeout {
    return Intl.message(
      'Request timed out. Try again later.',
      name: 'network_timeout',
      desc: '',
      args: [],
    );
  }

  /// `Server is not responding. Try again later.`
  String get network_server_error {
    return Intl.message(
      'Server is not responding. Try again later.',
      name: 'network_server_error',
      desc: '',
      args: [],
    );
  }

  /// `Duplicate entry detected.`
  String get db_unique_violation {
    return Intl.message(
      'Duplicate entry detected.',
      name: 'db_unique_violation',
      desc: '',
      args: [],
    );
  }

  /// `Invalid reference in database.`
  String get db_foreign_key_violation {
    return Intl.message(
      'Invalid reference in database.',
      name: 'db_foreign_key_violation',
      desc: '',
      args: [],
    );
  }

  /// `Missing required field.`
  String get db_not_null_violation {
    return Intl.message(
      'Missing required field.',
      name: 'db_not_null_violation',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid email address.`
  String get validation_invalid_email {
    return Intl.message(
      'Please enter a valid email address.',
      name: 'validation_invalid_email',
      desc: '',
      args: [],
    );
  }

  /// `This field cannot be empty.`
  String get validation_empty_field {
    return Intl.message(
      'This field cannot be empty.',
      name: 'validation_empty_field',
      desc: '',
      args: [],
    );
  }

  /// `Password must be at least 6 characters.`
  String get validation_short_password {
    return Intl.message(
      'Password must be at least 6 characters.',
      name: 'validation_short_password',
      desc: '',
      args: [],
    );
  }

  /// `An unexpected error occurred. Please try again.`
  String get unknown_error {
    return Intl.message(
      'An unexpected error occurred. Please try again.',
      name: 'unknown_error',
      desc: '',
      args: [],
    );
  }

  /// `Now reading being easier`
  String get firstOnboardingTitle {
    return Intl.message(
      'Now reading being easier',
      name: 'firstOnboardingTitle',
      desc: '',
      args: [],
    );
  }

  /// `Discover new worlds, join a vibrant reading community. Start your reading adventure effortlessly with us.`
  String get firstOnboardingBody {
    return Intl.message(
      'Discover new worlds, join a vibrant reading community. Start your reading adventure effortlessly with us.',
      name: 'firstOnboardingBody',
      desc: '',
      args: [],
    );
  }

  /// `Your Bookish Soulmate`
  String get secondOnboardingTitle {
    return Intl.message(
      'Your Bookish Soulmate',
      name: 'secondOnboardingTitle',
      desc: '',
      args: [],
    );
  }

  /// `Guide to your perfect read. Books tailored to your taste for rewarding experience.`
  String get secondOnboardingBody {
    return Intl.message(
      'Guide to your perfect read. Books tailored to your taste for rewarding experience.',
      name: 'secondOnboardingBody',
      desc: '',
      args: [],
    );
  }

  /// `Start Your Adventure`
  String get thirdOnboardingTitle {
    return Intl.message(
      'Start Your Adventure',
      name: 'thirdOnboardingTitle',
      desc: '',
      args: [],
    );
  }

  /// `Ready to embark on a quest for inspiration and knowledge? Your adventure begins now. Let's go!`
  String get thirdOnboardingBody {
    return Intl.message(
      'Ready to embark on a quest for inspiration and knowledge? Your adventure begins now. Let\'s go!',
      name: 'thirdOnboardingBody',
      desc: '',
      args: [],
    );
  }

  /// `Get Started`
  String get getStartedButton {
    return Intl.message(
      'Get Started',
      name: 'getStartedButton',
      desc: '',
      args: [],
    );
  }

  /// `Skip`
  String get skipButton {
    return Intl.message('Skip', name: 'skipButton', desc: '', args: []);
  }

  /// `Next`
  String get nextButton {
    return Intl.message('Next', name: 'nextButton', desc: '', args: []);
  }

  /// `Continue`
  String get continueButton {
    return Intl.message('Continue', name: 'continueButton', desc: '', args: []);
  }

  /// `Login`
  String get login {
    return Intl.message('Login', name: 'login', desc: '', args: []);
  }

  /// `Sign Up`
  String get signUp {
    return Intl.message('Sign Up', name: 'signUp', desc: '', args: []);
  }

  /// `Welcome to Bazar`
  String get welcomeMessage {
    return Intl.message(
      'Welcome to Bazar',
      name: 'welcomeMessage',
      desc: '',
      args: [],
    );
  }

  /// `Sign to your account`
  String get signToYourAccount {
    return Intl.message(
      'Sign to your account',
      name: 'signToYourAccount',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message('Email', name: 'email', desc: '', args: []);
  }

  /// `Password`
  String get password {
    return Intl.message('Password', name: 'password', desc: '', args: []);
  }

  /// `Your Email`
  String get yourEmail {
    return Intl.message('Your Email', name: 'yourEmail', desc: '', args: []);
  }

  /// `Your Password`
  String get yourPassword {
    return Intl.message(
      'Your Password',
      name: 'yourPassword',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password?`
  String get forgotPassword {
    return Intl.message(
      'Forgot Password?',
      name: 'forgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account? `
  String get dontHaveAccount {
    return Intl.message(
      'Don\'t have an account? ',
      name: 'dontHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account? `
  String get haveAccount {
    return Intl.message(
      'Already have an account? ',
      name: 'haveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Reset Password`
  String get resetPassword {
    return Intl.message(
      'Reset Password',
      name: 'resetPassword',
      desc: '',
      args: [],
    );
  }

  /// `Enter your email address below to receive password reset instructions.`
  String get resetPasswordInstruction {
    return Intl.message(
      'Enter your email address below to receive password reset instructions.',
      name: 'resetPasswordInstruction',
      desc: '',
      args: [],
    );
  }

  /// `Or with`
  String get orWith {
    return Intl.message('Or with', name: 'orWith', desc: '', args: []);
  }

  /// `Sign up with Google`
  String get signupWithGoogle {
    return Intl.message(
      'Sign up with Google',
      name: 'signupWithGoogle',
      desc: '',
      args: [],
    );
  }

  /// `Sign up with Facebook`
  String get signupWithFacebook {
    return Intl.message(
      'Sign up with Facebook',
      name: 'signupWithFacebook',
      desc: '',
      args: [],
    );
  }

  /// `Password must be at least 8 characters with letters and numbers`
  String get errorValidationPassword {
    return Intl.message(
      'Password must be at least 8 characters with letters and numbers',
      name: 'errorValidationPassword',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your password`
  String get emptyPasswordError {
    return Intl.message(
      'Please enter your password',
      name: 'emptyPasswordError',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid email address`
  String get errorValidationEmail {
    return Intl.message(
      'Please enter a valid email address',
      name: 'errorValidationEmail',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your email`
  String get emptyEmailError {
    return Intl.message(
      'Please enter your email',
      name: 'emptyEmailError',
      desc: '',
      args: [],
    );
  }

  /// `Login successful`
  String get loginSuccess {
    return Intl.message(
      'Login successful',
      name: 'loginSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Create account and choose favorite menu`
  String get createAccount {
    return Intl.message(
      'Create account and choose favorite menu',
      name: 'createAccount',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message('Name', name: 'name', desc: '', args: []);
  }

  /// `Your Name`
  String get yourName {
    return Intl.message('Your Name', name: 'yourName', desc: '', args: []);
  }

  /// `Register`
  String get register {
    return Intl.message('Register', name: 'register', desc: '', args: []);
  }

  /// `Have an account?`
  String get HaveAnAccount {
    return Intl.message(
      'Have an account?',
      name: 'HaveAnAccount',
      desc: '',
      args: [],
    );
  }

  /// `Sign In`
  String get signIn {
    return Intl.message('Sign In', name: 'signIn', desc: '', args: []);
  }

  /// `By clicking Register, you agree to our`
  String get byClickingSignUp {
    return Intl.message(
      'By clicking Register, you agree to our',
      name: 'byClickingSignUp',
      desc: '',
      args: [],
    );
  }

  /// `Terms of Service`
  String get termsOfService {
    return Intl.message(
      'Terms of Service',
      name: 'termsOfService',
      desc: '',
      args: [],
    );
  }

  /// `Sign up successful`
  String get signUpSuccess {
    return Intl.message(
      'Sign up successful',
      name: 'signUpSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Fields cannot be empty`
  String get fieldsCannotBeEmpty {
    return Intl.message(
      'Fields cannot be empty',
      name: 'fieldsCannotBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Username must be between 3 and 20 characters without symbols`
  String get invalidUsername {
    return Intl.message(
      'Username must be between 3 and 20 characters without symbols',
      name: 'invalidUsername',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid email address`
  String get invalidEmail {
    return Intl.message(
      'Please enter a valid email address',
      name: 'invalidEmail',
      desc: '',
      args: [],
    );
  }

  /// `Password must contain uppercase, lowercase, number, symbol and be at least 8 characters long`
  String get invalidPassword {
    return Intl.message(
      'Password must contain uppercase, lowercase, number, symbol and be at least 8 characters long',
      name: 'invalidPassword',
      desc: '',
      args: [],
    );
  }

  /// `Account created successfully`
  String get signupSuccess {
    return Intl.message(
      'Account created successfully',
      name: 'signupSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Signup failed, please try again`
  String get signupFailed {
    return Intl.message(
      'Signup failed, please try again',
      name: 'signupFailed',
      desc: '',
      args: [],
    );
  }

  /// `Congratulation!`
  String get Congratulation {
    return Intl.message(
      'Congratulation!',
      name: 'Congratulation',
      desc: '',
      args: [],
    );
  }

  /// `your account is complete, please enjoy the best menu from us.`
  String get getStartedPrompt {
    return Intl.message(
      'your account is complete, please enjoy the best menu from us.',
      name: 'getStartedPrompt',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message('Home', name: 'home', desc: '', args: []);
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
