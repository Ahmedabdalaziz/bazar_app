import 'package:bazar_app/core/error/failure.dart';
import 'package:bazar_app/core/helpers/local_storage/local_storage.dart';
import 'package:bazar_app/feature/home/data/models/books_model/books_model.dart';
import 'package:bazar_app/feature/home/data/models/vendors_model/vendor_model.dart';
import 'package:bazar_app/feature/home/data/repo/home_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'Home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepository _bookRepository;
  final BookCacheStorage _cache = BookCacheStorage();

  HomeCubit(this._bookRepository) : super(BookInitial());

  ///////////////////////Books//////////////////////////
  Future<void> fetchPaginatedBooks({int page = 0, int pageSize = 5}) async {
    emit(BookLoading());
    try {
      final books = await _bookRepository.fetchPaginatedBooks(
        page: page,
        pageSize: pageSize,
      );
      await _cache.saveBooks(books);
      //TODO : remove print
      print(
        "----------------------------------$books --------------------------------",
      );
      emit(BookLoaded(books));
    } catch (e) {
      final cached = _cache.getBooks();
      if (cached != null && cached.isNotEmpty) {
        emit(BookLoaded(cached));
      }
      emit(BookError(ExceptionHandler.handle(e)));
    }
  }

  Future<void> fetchTop20Books() async {
    emit(BookLoading());
    try {
      final books = await _bookRepository.fetchTop20Books();
      await _cache.saveBooks(books);
      emit(BookLoaded(books));
    } catch (e) {
      final cached = _cache.getBooks();
      if (cached != null && cached.isNotEmpty) {
        emit(BookLoaded(cached));
      }
      emit(BookError(ExceptionHandler.handle(e)));
    }
  }

  Future<void> searchBooks(String query) async {
    if (query.trim().isEmpty) return;
    emit(BookLoading());
    try {
      final books = await _bookRepository.searchBooks(query);
      emit(BookLoaded(books));
    } catch (e) {
      final cached = _cache.getBooks();
      if (cached != null && cached.isNotEmpty) {
        emit(BookLoaded(cached));
      }
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
      emit(BookLoaded(books));
    } catch (e) {
      final cached = _cache.getBooks();
      if (cached != null && cached.isNotEmpty) {
        emit(BookLoaded(cached));
      }
      emit(BookError(ExceptionHandler.handle(e)));
    }
  }

  Future<void> fetchBooksByAuthor(String authorId) async {
    emit(BookLoading());
    try {
      final books = await _bookRepository.fetchBooksByAuthor(authorId);
      emit(BookLoaded(books));
    } catch (e) {
      emit(BookError(ExceptionHandler.handle(e)));
    }
  }

  Future<void> fetchBooksByVendor(String vendorId) async {
    emit(BookLoading());
    try {
      final books = await _bookRepository.fetchBooksByVendor(vendorId);
      emit(BookLoaded(books));
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
    emit(VendorLoading());
    try {
      final vendors = await _bookRepository.getPaginated(page, size);
      emit(VendorLoaded(vendors));
      //TODO : remove print
      print(
        "----------------------------------$vendors --------------------------------",
      );
    } catch (e) {
      emit(VendorError(ExceptionHandler.handle(e)));
    }
  }

  Future<void> getVendorById(String id) async {
    emit(VendorLoading());
    try {
      final vendor = await _bookRepository.getById(id);
      if (vendor != null) {
        emit(VendorDetailLoaded(vendor));
      } else {
        emit(VendorError(ExceptionHandler.handle('Vendor not found')));
      }
    } catch (e) {
      emit(VendorError(ExceptionHandler.handle(e)));
    }
  }
}
