import 'dart:convert';

import 'package:bazar_app/core/helpers/local_storage/preference_keys.dart'
    show PrefKeys;
import 'package:bazar_app/feature/home/data/models/books_model/books_model.dart';
import 'package:hive/hive.dart';

class LocalStorage {
  static late Box _box;
  static final LocalStorage _instance = LocalStorage._internal();

  factory LocalStorage() => _instance;

  LocalStorage._internal();

  static Future<void> init() async {
    _box = await Hive.openBox('appBox');
  }

  dynamic getData(String key) => _box.get(key);

  Future<void> setData(String key, dynamic value) async {
    await _box.put(key, value);
  }

  Future<void> remove(String key) async {
    await _box.delete(key);
  }

  Future<void> clearAll() async {
    await _box.clear();
  }
}

class ThemeStorage {
  static const String _key = PrefKeys.currentTheme;

  Future<void> saveTheme(String theme) async {
    await LocalStorage().setData(_key, theme);
  }

  String? getTheme() => LocalStorage().getData(_key);

  Future<void> clearTheme() async => LocalStorage().remove(_key);
}

class LanguageStorage {
  static const String _key = PrefKeys.currentLanguage;

  Future<void> saveLanguage(String lang) async {
    await LocalStorage().setData(_key, lang);
  }

  String? getLanguage() => LocalStorage().getData(_key);

  Future<void> clearLanguage() async => LocalStorage().remove(_key);
}

class OnboardingStorage {
  static const String _key = PrefKeys.onboardingCompleted;

  Future<void> saveSeen(bool seen) async {
    await LocalStorage().setData(_key, seen);
  }

  bool? isSeen() => LocalStorage().getData(_key);

  Future<void> clearSeen() async => LocalStorage().remove(_key);
}

class BookCacheStorage {
  static const String _key = 'cached_books';

  Future<void> saveBooks(List<BookModel> books) async {
    final jsonString = jsonEncode(books.map((book) => book.toJson()).toList());
    await LocalStorage().setData(_key, jsonString);
  }

  List<BookModel>? getBooks() {
    final jsonString = LocalStorage().getData(_key);
    if (jsonString == null) return null;
    final List<dynamic> decoded = jsonDecode(jsonString);
    return decoded.map((e) => BookModel.fromJson(e)).toList();
  }

  Future<void> clearBooks() async {
    await LocalStorage().remove(_key);
  }
}
