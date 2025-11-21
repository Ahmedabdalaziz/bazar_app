import 'package:bazar_app/core/error/failure.dart';
import 'package:bazar_app/feature/books/data/repos/books_repo.dart';
import 'package:bazar_app/feature/home/data/models/books_model/books_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'books_state.dart';

class BooksCubit extends Cubit<BooksState> {
  final BooksRepo _booksRepo;
  int _currentPage = 0;
  final int _pageSize = 8;
  List<BookModel> _allBooks = [];
  bool _isFetching = false;

  BooksCubit(this._booksRepo) : super(BooksInitial());

  Future<void> fetchAllBooks() async {
    if (_isFetching) return;
    _isFetching = true;
    emit(BooksLoading());
    try {
      _currentPage = 0;
      final books = await _booksRepo.fetchBooks(
        page: _currentPage,
        size: _pageSize,
      );
      _allBooks = books;
      emit(
        BooksLoaded(books: _allBooks, hasReachedMax: books.length < _pageSize),
      );
    } catch (e) {
      final failure = ExceptionHandler.handle(e);
      if (failure is NetworkFailure) {
        emit(BooksOffline(failure: failure));
      } else {
        emit(BooksError(failure: failure));
      }
    } finally {
      _isFetching = false;
    }
  }

  Future<void> loadMoreBooks() async {
    if (_isFetching) return;
    final currentState = state;
    if (currentState is BooksLoaded && currentState.hasReachedMax) return;

    _isFetching = true;
    try {
      _currentPage++;
      final books = await _booksRepo.fetchBooks(
        page: _currentPage,
        size: _pageSize,
      );
      if (books.isEmpty) {
        emit(BooksLoaded(books: _allBooks, hasReachedMax: true));
      } else {
        _allBooks.addAll(books);
        emit(
          BooksLoaded(
            books: _allBooks,
            hasReachedMax: books.length < _pageSize,
          ),
        );
      }
    } catch (e) {
      final failure = ExceptionHandler.handle(e);
      if (failure is NetworkFailure) {
        emit(BooksOffline(failure: failure));
      } else {
        emit(BooksError(failure: failure));
      }
    } finally {
      _isFetching = false;
    }
  }

  Future<void> fetchBookDetails(String id) async {
    emit(BooksLoading());
    try {
      final book = await _booksRepo.fetchBookDetails(id);
      if (book != null) {
        emit(BookDetailsLoaded(book: book));
      } else {
        emit(BooksError(failure: UnknownFailure(message: 'Book not found')));
      }
    } catch (e) {
      final failure = ExceptionHandler.handle(e);
      if (failure is NetworkFailure) {
        emit(BooksOffline(failure: failure));
      } else {
        emit(BooksError(failure: failure));
      }
    }
  }

  Future<void> searchBooks(String query) async {
    emit(BooksLoading());
    try {
      final books = await _booksRepo.searchBooks(query);
      emit(BooksLoaded(books: books, hasReachedMax: true));
    } catch (e) {
      final failure = ExceptionHandler.handle(e);
      if (failure is NetworkFailure) {
        emit(BooksOffline(failure: failure));
      } else {
        emit(BooksError(failure: failure));
      }
    }
  }

  Future<void> retry(String id) async {
    fetchBookDetails(id);
  }
}
