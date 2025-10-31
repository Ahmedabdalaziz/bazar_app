import 'package:bazar_app/core/error/failure.dart';
import 'package:bazar_app/feature/home/presentation/home_screen/data/models/books_model.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../data/repo/book_repository.dart';

part 'book_state.dart';

class BookCubit extends Cubit<BookState> {
  final BookRepository _bookRepository;

  BookCubit(this._bookRepository) : super(BookInitial());

  Future<void> fetchPaginatedBooks({int page = 0, int pageSize = 5}) async {
    emit(BookLoading());
    try {
      final books = await _bookRepository.fetchPaginatedBooks(
        page: page,
        pageSize: pageSize,
      );
      emit(BookLoaded(books));
    } catch (e) {
      emit(BookError(ExceptionHandler.handle(e)));
    }
  }

  Future<void> fetchTop20Books() async {
    emit(BookLoading());
    try {
      final books = await _bookRepository.fetchTop20Books();
      emit(BookLoaded(books));
    } catch (e) {
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
      emit(BookLoaded(books));
    } catch (e) {
      emit(BookError(ExceptionHandler.handle(e)));
    }
  }
}
