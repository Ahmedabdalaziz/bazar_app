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

  /// `Sign In`
  String get signInButton {
    return Intl.message('Sign In', name: 'signInButton', desc: '', args: []);
  }

  /// `Sign Up`
  String get signUpButton {
    return Intl.message('Sign Up', name: 'signUpButton', desc: '', args: []);
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
