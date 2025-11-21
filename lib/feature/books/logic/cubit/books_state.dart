part of 'books_cubit.dart';

@immutable
sealed class BooksState {}

final class BooksInitial extends BooksState {}

final class BooksLoading extends BooksState {}

final class BooksLoaded extends BooksState {
  final List<BookModel> books;
  final bool hasReachedMax;

  BooksLoaded({required this.books, this.hasReachedMax = false});
}

final class BookDetailsLoaded extends BooksState {
  final BookModel book;

  BookDetailsLoaded({required this.book});
}

final class BooksError extends BooksState {
  final Failure failure;

  BooksError({required this.failure});
}

final class BooksOffline extends BooksState {
  final Failure failure;

  BooksOffline({required this.failure});
}
