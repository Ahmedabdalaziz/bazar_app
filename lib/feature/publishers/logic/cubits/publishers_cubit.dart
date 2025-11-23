import 'package:bazar_app/core/error_handler/failure.dart';
import 'package:bazar_app/feature/publishers/data/vendors_model/vendor_model.dart';
import 'package:bazar_app/feature/publishers/data/repositories/publishers_repository.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../books/data/books_model/books_model.dart';

part 'publishers_state.dart';

class PublishersCubit extends Cubit<PublishersState> {
  final PublishersRepository _repository;
  final Connectivity _connectivity;

  PublishersCubit(this._repository, this._connectivity)
    : super(const PublishersInitial());

  Future<void> fetchPublishersPage({int page = 0, int pageSize = 10}) async {
    emit(const PublishersLoading());

    try {
      final connectivityResult = await _connectivity.checkConnectivity();

      if (connectivityResult.contains(ConnectivityResult.none)) {
        try {
          final cached = await _repository.getPaginatedPublishers(
            page: page,
            size: pageSize,
          );
          final hasMoreData = cached.length >= pageSize;
          emit(
            PublishersListLoaded(
              cached,
              currentPage: page,
              hasMoreData: hasMoreData,
            ),
          );
          emit(
            PublishersOffline(
              const NetworkFailure(message: 'No internet connection'),
            ),
          );
          return;
        } catch (e) {
          emit(
            PublishersOffline(
              const NetworkFailure(message: 'No internet connection'),
            ),
          );
          return;
        }
      }

      final publishers = await _repository.getPaginatedPublishers(
        page: page,
        size: pageSize,
      );

      final hasMoreData = publishers.length >= pageSize;

      emit(
        PublishersListLoaded(
          publishers,
          currentPage: page,
          hasMoreData: hasMoreData,
        ),
      );
    } catch (e) {
      emit(PublishersError(ExceptionHandler.handle(e)));
    }
  }

  Future<void> loadMorePublishers({int pageSize = 10}) async {
    if (state is! PublishersListLoaded) return;

    final currentState = state as PublishersListLoaded;
    final nextPage = currentState.currentPage + 1;

    try {
      final connectivityResult = await _connectivity.checkConnectivity();

      if (connectivityResult.contains(ConnectivityResult.none)) {
        emit(
          PublishersOffline(
            const NetworkFailure(message: 'No internet connection'),
          ),
        );
        return;
      }

      final newPublishers = await _repository.getPaginatedPublishers(
        page: nextPage,
        size: pageSize,
      );

      final allPublishers = [...currentState.publishers, ...newPublishers];
      final hasMoreData = newPublishers.length >= pageSize;

      emit(
        PublishersListLoaded(
          allPublishers,
          currentPage: nextPage,
          hasMoreData: hasMoreData,
        ),
      );
    } catch (e) {
      emit(PublishersError(ExceptionHandler.handle(e)));
    }
  }

  Future<void> fetchAllPublishers() async {
    emit(const PublishersLoading());

    try {
      final connectivityResult = await _connectivity.checkConnectivity();

      if (connectivityResult.contains(ConnectivityResult.none)) {
        try {
          final cached = await _repository.getAllPublishers();
          emit(
            PublishersListLoaded(cached, currentPage: 0, hasMoreData: false),
          );
          emit(
            PublishersOffline(
              const NetworkFailure(message: 'No internet connection'),
            ),
          );
          return;
        } catch (e) {
          emit(
            PublishersOffline(
              const NetworkFailure(message: 'No internet connection'),
            ),
          );
          return;
        }
      }

      final publishers = await _repository.getAllPublishers();
      emit(
        PublishersListLoaded(publishers, currentPage: 0, hasMoreData: false),
      );
    } catch (e) {
      emit(PublishersError(ExceptionHandler.handle(e)));
    }
  }

  Future<void> searchPublishers(String query) async {
    if (query.isEmpty) {
      emit(const PublishersListLoaded([], currentPage: 0, hasMoreData: false));
      return;
    }

    emit(const PublishersLoading());

    try {
      final connectivityResult = await _connectivity.checkConnectivity();

      if (connectivityResult.contains(ConnectivityResult.none)) {
        try {
          final all = await _repository.getAllPublishers();
          final results = all
              .where(
                (publisher) =>
                    publisher.name.toLowerCase().contains(query.toLowerCase()),
              )
              .toList();
          emit(
            PublishersListLoaded(results, currentPage: 0, hasMoreData: false),
          );
          emit(
            PublishersOffline(
              const NetworkFailure(message: 'No internet connection'),
            ),
          );
          return;
        } catch (e) {
          emit(
            PublishersOffline(
              const NetworkFailure(message: 'No internet connection'),
            ),
          );
          return;
        }
      }

      final results = await _repository.searchPublishers(query);
      emit(PublishersListLoaded(results, currentPage: 0, hasMoreData: false));
    } catch (e) {
      emit(PublishersError(ExceptionHandler.handle(e)));
    }
  }

  Future<void> fetchPublisherDetails(String publisherId) async {
    emit(const PublishersLoading());

    try {
      final connectivityResult = await _connectivity.checkConnectivity();

      if (connectivityResult.contains(ConnectivityResult.none)) {
        emit(
          PublishersOffline(
            const NetworkFailure(
              message: 'No internet connection. Please try again.',
            ),
          ),
        );
        return;
      }

      final publisher = await _repository.getPublisherDetailsById(publisherId);

      if (publisher != null) {
        final books = await _repository.getBooksByPublisher(publisherId);
        emit(PublisherDetailsLoaded(publisher, publisherBooks: books));
      } else {
        emit(
          PublishersError(const UnknownFailure(message: 'Publisher not found')),
        );
      }
    } catch (e) {
      emit(PublishersError(ExceptionHandler.handle(e)));
    }
  }

  void retry(String publisherId) {
    fetchPublisherDetails(publisherId);
  }
}
