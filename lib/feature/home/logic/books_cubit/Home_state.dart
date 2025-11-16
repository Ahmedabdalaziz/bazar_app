part of 'Home_cubit.dart';

@immutable
abstract class HomeState {}

class BookInitial extends HomeState {}

class BookLoading extends HomeState {}

class BookLoaded extends HomeState {
  final List<BookModel> books;
  final bool fromCache;

  BookLoaded(this.books, {this.fromCache = false});
}

class BookLoadedWithError extends HomeState {
  final List<BookModel> books;
  final Failure error;

  BookLoadedWithError({required this.books, required this.error});
}

class BookDetailLoaded extends HomeState {
  final BookModel book;

  BookDetailLoaded(this.book);
}

class BookError extends HomeState {
  final Failure message;

  BookError(this.message);
}

////////////////////////Vendors//////////////////////////
class VendorInitial extends HomeState {}

class VendorLoading extends HomeState {}

class VendorLoaded extends HomeState {
  final List<VendorModel> vendors;

  VendorLoaded(this.vendors);
}

class VendorLoadedWithError extends HomeState {
  final List<VendorModel> vendors;
  final Failure error;

  VendorLoadedWithError({required this.vendors, required this.error});
}

class VendorDetailLoaded extends HomeState {
  final VendorModel vendors;

  VendorDetailLoaded(this.vendors);
}

class VendorError extends HomeState {
  final Failure message;

  VendorError(this.message);
}

class VendorEmpty extends HomeState {}

////////////////////////Authors//////////////////////////
class AuthorInitial extends HomeState {}

class AuthorLoading extends HomeState {}

class AuthorLoaded extends HomeState {
  final List<AuthorModel> authors;

  AuthorLoaded(this.authors);
}

class AuthorDetailLoaded extends HomeState {
  final AuthorModel author;

  AuthorDetailLoaded(this.author);
}

class AuthorError extends HomeState {
  final Failure message;

  AuthorError(this.message);
}

class AuthorEmpty extends HomeState {}
