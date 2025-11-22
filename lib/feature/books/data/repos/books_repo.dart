import 'package:bazar_app/core/api/crud_operation_supabase.dart';

import '../books_model/books_model.dart';

class BooksRepo {
  final BookService _bookService;

  BooksRepo(this._bookService);

  Future<List<BookModel>> fetchBooks({int page = 0, int size = 8}) async {
    return await _bookService.getPaginated(page: page, size: size);
  }

  Future<BookModel?> fetchBookDetails(String id) async {
    return await _bookService.getById(id);
  }

  Future<List<BookModel>> searchBooks(String query) async {
    return await _bookService.search(query: query);
  }

  Future<List<BookModel>> fetchTopBooks() async {
    return await _bookService.getTop20();
  }
}
