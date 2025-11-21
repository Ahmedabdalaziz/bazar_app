import 'package:bazar_app/core/api/crud_operation_supabase.dart';
import 'package:bazar_app/feature/home/data/models/books_model/books_model.dart';
import 'package:bazar_app/feature/publishers/data/vendors_model/vendor_model.dart';
import 'package:bazar_app/feature/authors/data/models/authors_model/author_model.dart';
import 'package:flutter/foundation.dart';
import 'package:bazar_app/core/utils/json_parsers.dart';

class HomeRepository {
  final BookService _bookService;
  final VendorService _vendorService;
  final AuthorService _authorService;

  HomeRepository(this._bookService, this._vendorService, this._authorService);

  //////////////////books////////////////////////
  Future<List<BookModel>> fetchPaginatedBooks({
    int page = 0,
    int pageSize = 8,
  }) async {
    try {
      return await _bookService.getPaginated(page: page, size: pageSize);
    } catch (e) {
      throw Exception('Failed to fetch paginated books');
    }
  }

  Future<List<BookModel>> searchBooks(String query) async {
    try {
      return await _bookService.search(query: query);
    } catch (e) {
      throw Exception('Failed to search books');
    }
  }

  Future<BookModel?> getBookById(String bookId) async {
    try {
      return await _bookService.getById(bookId);
    } catch (e) {
      throw Exception('Failed to fetch book by ID');
    }
  }

  //////////////////Vendor//////////////////////

  Future<List<VendorModel>> getPaginatedVendors(int page, int size) async {
    try {
      return await _vendorService.getPaginated(size: size, page: page);
    } catch (e) {
      throw Exception('Failed to fetch paginated vendors');
    }
  }

  Future<VendorModel?> getVendorById(String id) async {
    try {
      return _vendorService.getById(id);
    } catch (e) {
      throw Exception('Failed to fetch vendor by ID');
    }
  }

  //////////////////Authors//////////////////////
  Future<List<AuthorModel>> fetchAllAuthors() async {
    try {
      final res = await _authorService.getAll();
      return compute(parseAuthors, res);
    } catch (e) {
      throw Exception('Failed to fetch all authors');
    }
  }

  Future<List<AuthorModel>> getPaginatedAuthors(int page, int size) async {
    try {
      final res = await _authorService.getPaginated(page: page, size: size);
      return compute(parseAuthors, res);
    } catch (e) {
      throw Exception('Failed to fetch paginated authors');
    }
  }

  Future<AuthorModel?> getAuthorById(String id) async {
    try {
      final res = await _authorService.getById(id);
      return compute(parseAuthor, res);
    } catch (e) {
      throw Exception('Failed to fetch author by ID');
    }
  }
}
