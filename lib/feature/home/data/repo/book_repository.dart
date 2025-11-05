import 'package:bazar_app/core/api/crud_operation_supabase.dart';
import 'package:bazar_app/feature/home/data/models/books_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class BookRepository {
  final BookService _bookService;

  BookRepository(SupabaseClient client) : _bookService = BookService(client);

  Future<List<BookModel>> fetchPaginatedBooks({
    int page = 0,
    int pageSize = 5,
  }) async {
    try {
      final booksData = await _bookService.getPaginated(
        page: page,
        pageSize: pageSize,
      );

      if (booksData.isEmpty) return [];

      return booksData.map((json) => BookModel.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Failed to fetch paginated books: $e');
    }
  }

  Future<List<BookModel>> fetchTop20Books() async {
    try {
      final booksData = await _bookService.getTop20();
      if (booksData.isEmpty) return [];
      return booksData.map((json) => BookModel.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Failed to fetch top 20 books: $e');
    }
  }

  Future<List<BookModel>> searchBooks(String query) async {
    try {
      final searchData = await _bookService.search(query);
      if (searchData.isEmpty) return [];
      return searchData.map((json) => BookModel.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Failed to search books: $e');
    }
  }

  Future<BookModel?> getBookById(String bookId) async {
    try {
      final data = await _bookService.getById(bookId);
      return data != null ? BookModel.fromJson(data) : null;
    } catch (e) {
      throw Exception('Failed to fetch book by ID: $e');
    }
  }

  Future<List<BookModel>> fetchAllBooks() async {
    try {
      final allBooks = await _bookService.getAll();
      if (allBooks.isEmpty) return [];
      return allBooks.map((json) => BookModel.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Failed to fetch all books: $e');
    }
  }
}
