part of 'author_details_cubit.dart';

abstract class AuthorDetailsState {
  const AuthorDetailsState();
}

class AuthorDetailsInitial extends AuthorDetailsState {
  const AuthorDetailsInitial();
}

class AuthorDetailsLoading extends AuthorDetailsState {
  const AuthorDetailsLoading();
}

class AuthorDetailsLoaded extends AuthorDetailsState {
  final AuthorModel author;

  final List<BookModel>? authorBooks;

  const AuthorDetailsLoaded(this.author, {this.authorBooks});
}

class AuthorsListLoaded extends AuthorDetailsState {
  final List<AuthorModel> authors;
  final int currentPage;
  final bool hasMoreData;

  const AuthorsListLoaded(
    this.authors, {
    required this.currentPage,
    required this.hasMoreData,
  });
}

class AuthorDetailsOffline extends AuthorDetailsState {
  final AuthorModel? cachedAuthor;
  final Failure failure;

  const AuthorDetailsOffline({this.cachedAuthor, required this.failure});
}

class AuthorDetailsError extends AuthorDetailsState {
  final Failure failure;

  const AuthorDetailsError(this.failure);
}
