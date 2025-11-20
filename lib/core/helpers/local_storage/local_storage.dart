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
    final wrapper = {
      'timestamp': DateTime.now().millisecondsSinceEpoch,
      'data': books.map((b) => b.toJson()).toList(),
    };

    final jsonString = jsonEncode(wrapper);
    await LocalStorage().setData(_key, jsonString);
  }

  List<BookModel>? getBooks({Duration? ttl, bool returnExpiredOnError = true}) {
    final jsonString = LocalStorage().getData(_key);
    if (jsonString == null) return null;

    try {
      final decoded = jsonDecode(jsonString);

      if (decoded is List) {
        return decoded.map((e) => BookModel.fromJson(e)).toList();
      }

      if (decoded is Map &&
          decoded.containsKey('timestamp') &&
          decoded.containsKey('data')) {
        final dynamic ts = decoded['timestamp'];
        final dynamic data = decoded['data'];

        if (data is List) {
          final books = data.map((e) => BookModel.fromJson(e)).toList();

          if (ttl == null) return books;

          final now = DateTime.now().millisecondsSinceEpoch;
          final int timestampMillis = ts is int
              ? ts
              : int.tryParse(ts.toString()) ?? 0;
          final age = now - timestampMillis;

          if (age <= ttl.inMilliseconds) {
            return books;
          } else {
            return returnExpiredOnError ? books : null;
          }
        }
      }

      return null;
    } catch (e) {
      return null;
    }
  }

  int? getBooksTimestampMillis() {
    final jsonString = LocalStorage().getData(_key);
    if (jsonString == null) return null;

    try {
      final decoded = jsonDecode(jsonString);
      if (decoded is Map && decoded.containsKey('timestamp')) {
        final dynamic ts = decoded['timestamp'];
        if (ts is int) return ts;
        final parsed = int.tryParse(ts.toString());
        return parsed;
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  Future<void> clearBooks() async {
    await LocalStorage().remove(_key);
  }
}
