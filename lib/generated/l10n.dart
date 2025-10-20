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

  /// `Your Bookish Soulmate Awaits`
  String get secondOnboardingTitle {
    return Intl.message(
      'Your Bookish Soulmate Awaits',
      name: 'secondOnboardingTitle',
      desc: '',
      args: [],
    );
  }

  /// `Let us be your guide to the perfect read. Discover books tailored to your tastes for a truly rewarding experience.`
  String get secondOnboardingBody {
    return Intl.message(
      'Let us be your guide to the perfect read. Discover books tailored to your tastes for a truly rewarding experience.',
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
