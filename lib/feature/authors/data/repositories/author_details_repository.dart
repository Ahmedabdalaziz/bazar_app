import 'package:bazar_app/core/api/crud_operation_supabase.dart';
import 'package:bazar_app/feature/authors/data/models/authors_model/author_model.dart';
import 'package:bazar_app/feature/home/data/models/books_model/books_model.dart';
import 'package:bazar_app/core/DI/dependancy_injection.dart';
import 'package:bazar_app/feature/home/data/repo/home_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:bazar_app/core/utils/json_parsers.dart';

class AuthorDetailsRepository {
  final AuthorService _authorService;
  final BookService _bookService;

  AuthorDetailsRepository(this._authorService, this._bookService);

  Future<AuthorModel?> getAuthorDetailsById(String authorId) async {
    try {
      final res = await _authorService.getById(authorId);
      return res != null ? AuthorModel.fromJson(res) : null;
    } catch (e) {
      try {
        final HomeRepository homeRepo = getIt<HomeRepository>();
        final cached = await homeRepo.getAuthorById(authorId);
        return cached != null ? AuthorModel.fromJson(cached.toJson()) : null;
      } catch (inner) {
        throw Exception(
          'Failed to fetch author details: $e | fallback: $inner',
        );
      }
    }
  }

  Future<List<AuthorModel>> getPaginatedAuthors({
    int page = 0,
    int size = 10,
  }) async {
    try {
      final res = await _authorService.getPaginated(page: page, size: size);
      return compute(parseAuthors, res);
    } catch (e) {
      throw Exception('Failed to fetch paginated authors: $e');
    }
  }

  Future<List<AuthorModel>> getAllAuthors() async {
    try {
      final res = await _authorService.getAll();
      return compute(parseAuthors, res);
    } catch (e) {
      try {
        final HomeRepository homeRepo = getIt<HomeRepository>();
        final cached = await homeRepo.fetchAllAuthors();
        return cached.map((a) => AuthorModel.fromJson(a.toJson())).toList();
      } catch (inner) {
        throw Exception('Failed to fetch all authors: $e | fallback: $inner');
      }
    }
  }

  Future<List<BookModel>> getBooksByAuthor(String authorId) async {
    try {
      return await _bookService.getByAuthor(authorId);
    } catch (e) {
      throw Exception('Failed to fetch books by author: $e');
    }
  }

  Future<List<AuthorModel>> searchAuthors(String query) async {
    try {
      final allAuthors = await getAllAuthors();
      return allAuthors
          .where(
            (author) => author.name.toLowerCase().contains(query.toLowerCase()),
          )
          .toList();
    } catch (e) {
      throw Exception('Failed to search authors: $e');
    }
  }
}
