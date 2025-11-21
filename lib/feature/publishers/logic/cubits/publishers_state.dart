part of 'publishers_cubit.dart';

abstract class PublishersState extends Equatable {
  const PublishersState();

  @override
  List<Object> get props => [];
}

class PublishersInitial extends PublishersState {
  const PublishersInitial();
}

class PublishersLoading extends PublishersState {
  const PublishersLoading();
}

class PublishersListLoaded extends PublishersState {
  final List<VendorModel> publishers;
  final int currentPage;
  final bool hasMoreData;

  const PublishersListLoaded(
    this.publishers, {
    required this.currentPage,
    required this.hasMoreData,
  });

  @override
  List<Object> get props => [publishers, currentPage, hasMoreData];
}

class PublisherDetailsLoaded extends PublishersState {
  final VendorModel publisher;
  final List<BookModel> publisherBooks;

  const PublisherDetailsLoaded(
    this.publisher, {
    this.publisherBooks = const [],
  });

  @override
  List<Object> get props => [publisher, publisherBooks];
}

class PublishersError extends PublishersState {
  final Failure failure;

  const PublishersError(this.failure);

  @override
  List<Object> get props => [failure];
}

class PublishersOffline extends PublishersState {
  final Failure failure;

  const PublishersOffline(this.failure);

  @override
  List<Object> get props => [failure];
}
