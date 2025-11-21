import 'package:bazar_app/core/error/failure.dart';
import 'package:bazar_app/feature/authors/data/models/authors_model/author_model.dart';
import 'package:bazar_app/feature/authors/data/repositories/author_details_repository.dart';
import 'package:bazar_app/feature/home/data/models/books_model/books_model.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'author_details_state.dart';

class AuthorDetailsCubit extends Cubit<AuthorDetailsState> {
  final AuthorDetailsRepository _repository;
  final Connectivity _connectivity;

  AuthorDetailsCubit(this._repository, this._connectivity)
    : super(const AuthorDetailsInitial());

  Future<void> fetchAuthorDetails(String authorId) async {
    emit(const AuthorDetailsLoading());

    try {
      final connectivityResult = await _connectivity.checkConnectivity();

      if (connectivityResult.contains(ConnectivityResult.none)) {
        emit(
          const AuthorDetailsOffline(
            failure: NetworkFailure(
              message: 'No internet connection. Please try again.',
            ),
          ),
        );
        return;
      }

      final author = await _repository.getAuthorDetailsById(authorId);

      if (author != null) {
        final books = await _repository.getBooksByAuthor(authorId);
        emit(AuthorDetailsLoaded(author, authorBooks: books));
      } else {
        emit(
          const AuthorDetailsError(UnknownFailure(message: 'Author not found')),
        );
      }
    } catch (e) {
      emit(AuthorDetailsError(ExceptionHandler.handle(e)));
    }
  }

  Future<void> fetchAuthorsPage({int page = 0, int pageSize = 10}) async {
    emit(const AuthorDetailsLoading());

    try {
      final connectivityResult = await _connectivity.checkConnectivity();

      if (connectivityResult.contains(ConnectivityResult.none)) {
        try {
          final cached = await _repository.getPaginatedAuthors(
            page: page,
            size: pageSize,
          );
          final hasMoreData = cached.length >= pageSize;
          emit(
            AuthorsListLoaded(
              cached,
              currentPage: page,
              hasMoreData: hasMoreData,
            ),
          );
          emit(
            const AuthorDetailsOffline(
              failure: NetworkFailure(message: 'No internet connection'),
            ),
          );
          return;
        } catch (e) {
          emit(
            const AuthorDetailsOffline(
              failure: NetworkFailure(message: 'No internet connection'),
            ),
          );
          return;
        }
      }

      final authors = await _repository.getPaginatedAuthors(
        page: page,
        size: pageSize,
      );

      final hasMoreData = authors.length >= pageSize;

      emit(
        AuthorsListLoaded(authors, currentPage: page, hasMoreData: hasMoreData),
      );
    } catch (e) {
      emit(AuthorDetailsError(ExceptionHandler.handle(e)));
    }
  }

  Future<void> loadMoreAuthors({int pageSize = 10}) async {
    if (state is! AuthorsListLoaded) return;

    final currentState = state as AuthorsListLoaded;
    final nextPage = currentState.currentPage + 1;

    try {
      final connectivityResult = await _connectivity.checkConnectivity();

      if (connectivityResult.contains(ConnectivityResult.none)) {
        emit(
          const AuthorDetailsOffline(
            failure: NetworkFailure(message: 'No internet connection'),
          ),
        );
        return;
      }

      final newAuthors = await _repository.getPaginatedAuthors(
        page: nextPage,
        size: pageSize,
      );

      final allAuthors = [...currentState.authors, ...newAuthors];
      final hasMoreData = newAuthors.length >= pageSize;

      emit(
        AuthorsListLoaded(
          allAuthors,
          currentPage: nextPage,
          hasMoreData: hasMoreData,
        ),
      );
    } catch (e) {
      emit(AuthorDetailsError(ExceptionHandler.handle(e)));
    }
  }

  Future<void> fetchAllAuthors() async {
    emit(const AuthorDetailsLoading());

    try {
      final connectivityResult = await _connectivity.checkConnectivity();

      if (connectivityResult.contains(ConnectivityResult.none)) {
        try {
          final cached = await _repository.getAllAuthors();
          emit(AuthorsListLoaded(cached, currentPage: 0, hasMoreData: false));
          emit(
            const AuthorDetailsOffline(
              failure: NetworkFailure(message: 'No internet connection'),
            ),
          );
          return;
        } catch (e) {
          emit(
            const AuthorDetailsOffline(
              failure: NetworkFailure(message: 'No internet connection'),
            ),
          );
          return;
        }
      }

      final authors = await _repository.getAllAuthors();
      emit(AuthorsListLoaded(authors, currentPage: 0, hasMoreData: false));
    } catch (e) {
      emit(AuthorDetailsError(ExceptionHandler.handle(e)));
    }
  }

  Future<void> searchAuthors(String query) async {
    if (query.isEmpty) {
      emit(const AuthorsListLoaded([], currentPage: 0, hasMoreData: false));
      return;
    }

    emit(const AuthorDetailsLoading());

    try {
      final connectivityResult = await _connectivity.checkConnectivity();

      if (connectivityResult.contains(ConnectivityResult.none)) {
        // try searching cached
        try {
          final all = await _repository.getAllAuthors();
          final results = all
              .where(
                (author) =>
                    author.name.toLowerCase().contains(query.toLowerCase()),
              )
              .toList();
          emit(AuthorsListLoaded(results, currentPage: 0, hasMoreData: false));
          emit(
            const AuthorDetailsOffline(
              failure: NetworkFailure(message: 'No internet connection'),
            ),
          );
          return;
        } catch (e) {
          emit(
            const AuthorDetailsOffline(
              failure: NetworkFailure(message: 'No internet connection'),
            ),
          );
          return;
        }
      }

      final results = await _repository.searchAuthors(query);
      emit(AuthorsListLoaded(results, currentPage: 0, hasMoreData: false));
    } catch (e) {
      emit(AuthorDetailsError(ExceptionHandler.handle(e)));
    }
  }

  Future<void> retry(String authorId) async {
    await fetchAuthorDetails(authorId);
  }
}
