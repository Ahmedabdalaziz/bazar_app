part of 'book_cubit.dart';

@immutable
abstract class BookState {}

class BookInitial extends BookState {}

class BookLoading extends BookState {}

class BookLoaded extends BookState {
  final List<BookModel> books;

  BookLoaded(this.books);
}

class BookDetailLoaded extends BookState {
  final BookModel book;

  BookDetailLoaded(this.book);
}

class BookError extends BookState {
  final Failure message;

  BookError(this.message);
}
