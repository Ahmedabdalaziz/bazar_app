import 'package:bazar_app/core/error/failure.dart';
import 'package:bazar_app/core/helpers/local_storage/local_storage.dart';
import 'package:bazar_app/feature/home/data/models/books_model/books_model.dart';
import 'package:bazar_app/feature/home/data/models/vendors_model/vendor_model.dart';
import 'package:bazar_app/feature/home/data/repo/home_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../data/models/authors_model/author_model.dart';

part 'Home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepository _bookRepository;
  final BookCacheStorage _cache = BookCacheStorage();

  List<VendorModel>? _cachedVendors;

  HomeCubit(this._bookRepository) : super(BookInitial());

  ///////////////////////Books//////////////////////////

  Future<void> fetchPaginatedBooks({
    int page = 0,
    int size = 5,
    bool forceRefresh = false,
  }) async {
    try {
      if (!forceRefresh) {
        emit(BookLoading());
        final cached = _cache.getBooks();
        if (cached != null && cached.isNotEmpty) {
          emit(BookLoaded(cached, fromCache: true));
          _refreshBooksInBackground(page: page, pageSize: size);
          return;
        }
      }
      emit(BookLoading());

      final books = await _bookRepository.fetchPaginatedBooks(
        page: page,
        pageSize: size,
      );

      await _cache.saveBooks(books);

      emit(BookLoaded(books, fromCache: false));
    } catch (e) {
      final cached = _cache.getBooks();
      if (cached != null && cached.isNotEmpty) {
        emit(
          BookLoadedWithError(books: cached, error: ExceptionHandler.handle(e)),
        );
      } else {
        emit(BookError(ExceptionHandler.handle(e)));
      }
    }
  }

  Future<void> _refreshBooksInBackground({
    required int page,
    required int pageSize,
  }) async {
    try {
      final books = await _bookRepository.fetchPaginatedBooks(
        page: page,
        pageSize: pageSize,
      );

      await _cache.saveBooks(books);
      emit(BookLoaded(books, fromCache: false));
    } catch (e) {
      print('Background refresh failed: $e');
    }
  }

  Future<void> refreshBooks({int page = 0, int pageSize = 5}) async {
    return fetchPaginatedBooks(
      page: page,
      size: pageSize,
      forceRefresh: true,
    );
  }

  Future<void> clearCache() async {
    await _cache.clearBooks();
  }

  Future<void> fetchTop20Books() async {
    emit(BookLoading());
    try {
      final books = await _bookRepository.fetchTop20Books();
      await _cache.saveBooks(books);
      emit(BookLoaded(books, fromCache: false));
    } catch (e) {
      final cached = _cache.getBooks();
      if (cached != null && cached.isNotEmpty) {
        emit(
          BookLoadedWithError(books: cached, error: ExceptionHandler.handle(e)),
        );
      } else {
        emit(BookError(ExceptionHandler.handle(e)));
      }
    }
  }

  Future<void> searchBooks(String query) async {
    if (query.trim().isEmpty) return;
    emit(BookLoading());
    try {
      final books = await _bookRepository.searchBooks(query);
      emit(BookLoaded(books, fromCache: false));
    } catch (e) {
      emit(BookError(ExceptionHandler.handle(e)));
    }
  }

  Future<void> getBookById(String bookId) async {
    emit(BookLoading());
    try {
      final book = await _bookRepository.getBookById(bookId);
      if (book != null) {
        emit(BookDetailLoaded(book));
      } else {
        emit(BookError(ExceptionHandler.handle('Book not found')));
      }
    } catch (e) {
      emit(BookError(ExceptionHandler.handle(e)));
    }
  }

  Future<void> fetchAllBooks() async {
    emit(BookLoading());
    try {
      final books = await _bookRepository.fetchAllBooks();
      await _cache.saveBooks(books);
      emit(BookLoaded(books, fromCache: false));
    } catch (e) {
      final cached = _cache.getBooks();
      if (cached != null && cached.isNotEmpty) {
        emit(
          BookLoadedWithError(books: cached, error: ExceptionHandler.handle(e)),
        );
      } else {
        emit(BookError(ExceptionHandler.handle(e)));
      }
    }
  }

  Future<void> fetchBooksByAuthor(String authorId) async {
    emit(BookLoading());
    try {
      final books = await _bookRepository.fetchBooksByAuthor(authorId);
      emit(BookLoaded(books, fromCache: false));
    } catch (e) {
      emit(BookError(ExceptionHandler.handle(e)));
    }
  }

  Future<void> fetchBooksByVendor(String vendorId) async {
    emit(BookLoading());
    try {
      final books = await _bookRepository.fetchBooksByVendor(vendorId);
      emit(BookLoaded(books, fromCache: false));
    } catch (e) {
      emit(BookError(ExceptionHandler.handle(e)));
    }
  }

  ///////////////////////////vendors//////////////////////////

  Future<void> fetchAllVendors() async {
    emit(VendorLoading());
    try {
      final vendors = await _bookRepository.fetchAllVendors();
      emit(VendorLoaded(vendors));
    } catch (e) {
      emit(VendorError(ExceptionHandler.handle(e)));
    }
  }

  Future<void> fetchPaginatedVendors({
    required int size,
    required int page,
  }) async {
    try {
      emit(VendorLoading());

      final vendors = await _bookRepository.getPaginatedVendors(page, size);

      if (vendors.isEmpty) {
        emit(VendorEmpty());
      } else {
        // Cache the vendors
        _cachedVendors = vendors;
        emit(VendorLoaded(vendors));
      }
    } catch (e) {
      if (_cachedVendors != null && _cachedVendors!.isNotEmpty) {
        emit(VendorLoadedWithError(
          vendors: _cachedVendors!,
          error: ExceptionHandler.handle(e),
        ));
      } else {
        emit(VendorError(ExceptionHandler.handle(e)));
      }
    }
  }

  Future<void> getVendorById(String id) async {
    emit(VendorLoading());
    try {
      final vendor = await _bookRepository.getVendorById(id);
      if (vendor != null) {
        emit(VendorDetailLoaded(vendor));
      } else {
        emit(VendorError(ExceptionHandler.handle('Vendor not found')));
      }
    } catch (e) {
      emit(VendorError(ExceptionHandler.handle(e)));
    }
  }

  /////////////////////////Authors//////////////////////////

  Future<void> fetchAllAuthors() async {
    emit(AuthorLoading());
    try {
      final authors = await _bookRepository.fetchAllAuthors();
      emit(AuthorLoaded(authors));
    } catch (e) {
      emit(AuthorError(ExceptionHandler.handle(e)));
    }
  }

  Future<void> fetchPaginatedAuthors({
    required int size,
    required int page,
  }) async {
    try {
      emit(AuthorLoading());

      final authors = await _bookRepository.getPaginatedAuthors(page, size);

      if (authors.isEmpty) {
        emit(AuthorEmpty());
      } else {
        emit(AuthorLoaded(authors));
      }
    } catch (e) {
      emit(AuthorError(ExceptionHandler.handle(e)));
    }
  }

  Future<void> getAuthorById(String id) async {
    emit(AuthorLoading());
    try {
      final author = await _bookRepository.getAuthorById(id);
      if (author != null) {
        emit(AuthorDetailLoaded(author));
      } else {
        emit(AuthorError(ExceptionHandler.handle('Author not found')));
      }
    } catch (e) {
      emit(AuthorError(ExceptionHandler.handle(e)));
    }
  }

}
