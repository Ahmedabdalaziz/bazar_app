import 'package:bazar_app/feature/authors/data/models/authors_model/author_model.dart';
import 'package:bazar_app/feature/publishers/data/vendors_model/vendor_model.dart';

import '../../feature/books/data/books_model/books_model.dart';


List<BookModel> parseBooks(List<dynamic> items) {
  return items
      .map((e) => BookModel.fromJson(e as Map<String, dynamic>))
      .toList();
}

List<VendorModel> parseVendors(List<dynamic> items) {
  return items
      .map((e) => VendorModel.fromJson(e as Map<String, dynamic>))
      .toList();
}

List<AuthorModel> parseAuthors(List<dynamic> items) {
  return items
      .map((e) => AuthorModel.fromJson(e as Map<String, dynamic>))
      .toList();
}

AuthorModel? parseAuthor(Map<String, dynamic>? json) {
  if (json == null) return null;
  return AuthorModel.fromJson(json);
}
