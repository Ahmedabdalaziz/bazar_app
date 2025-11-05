import 'package:bazar_app/core/error/failure.dart';
import 'package:bazar_app/core/helpers/local_storage/local_storage.dart';
import 'package:bazar_app/feature/home/data/models/books_model.dart';
import 'package:bazar_app/feature/home/data/repo/book_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'book_state.dart';

class BookCubit extends Cubit<BookState> {
  final BookRepository _bookRepository;
  final BookCacheStorage _cache = BookCacheStorage();

  BookCubit(this._bookRepository) : super(BookInitial());

  Future<void> fetchPaginatedBooks({int page = 0, int pageSize = 5}) async {
    emit(BookLoading());
    try {
      final books = await _bookRepository.fetchPaginatedBooks(
        page: page,
        pageSize: pageSize,
      );
      await _cache.saveBooks(books);
      print("----------------------------------$books --------------------------------");
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
}
