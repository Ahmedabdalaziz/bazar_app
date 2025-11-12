import 'package:bazar_app/core/api/crud_operation_supabase.dart';
import 'package:bazar_app/feature/home/data/models/books_model/books_model.dart';
import 'package:bazar_app/feature/home/data/models/vendors_model/vendor_model.dart';

class HomeRepository {
  final BookService _bookService;
  final VendorService _vendorService;

  HomeRepository(this._bookService, this._vendorService);

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

  Future<List<BookModel>> fetchTop20Books() async {
    try {
      return await _bookService.getTop20();
    } catch (e) {
      throw Exception('Failed to fetch top 20 books');
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

  Future<List<BookModel>> fetchAllBooks() async {
    try {
      return await _bookService.getAll();
    } catch (e) {
      throw Exception('Failed to fetch all books');
    }
  }

  Future<List<BookModel>> fetchBooksByAuthor(String authorId) async {
    try {
      return await _bookService.getByAuthor(authorId);
    } catch (e) {
      throw Exception('Failed to fetch books by authors');
    }
  }

  Future<List<BookModel>> fetchBooksByVendor(String vendorId) async {
    try {
      return await _bookService.getByVendor(vendorId);
    } catch (e) {
      throw Exception('Failed to fetch books by vendor');
    }
  }

  //////////////////Vendor//////////////////////
  Future<List<VendorModel>> fetchAllVendors() async {
    try {
      return await _vendorService.getAll();
    } catch (e) {
      throw Exception('Failed to fetch all vendors');
    }
  }

  Future<List<VendorModel>> getPaginated(int page, int size) async {
    try {
      return await _vendorService.getPaginated(size: 5, page: 0);
    } catch (e) {
      throw Exception('Failed to fetch paginated vendors');
    }
  }

  Future<VendorModel?> getById(String id) async {
    try {
      return _vendorService.getById(id);
    } catch (e) {
      throw Exception('Failed to fetch vendor by ID');
    }
  }
}
