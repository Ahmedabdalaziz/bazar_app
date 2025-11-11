part of 'Home_cubit.dart';

@immutable
abstract class HomeState {}

class BookInitial extends HomeState {}

class BookLoading extends HomeState {}

class BookLoaded extends HomeState {
  final List<BookModel> books;

  BookLoaded(this.books);
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

class VendorDetailLoaded extends HomeState {
  final VendorModel vendors;

  VendorDetailLoaded(this.vendors);
}

class VendorError extends HomeState {
  final Failure message;

  VendorError(this.message);
}
