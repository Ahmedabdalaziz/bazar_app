import 'package:bazar_app/core/app_routes/routes_strings.dart';
import 'package:bazar_app/core/utils/extentions.dart';
import 'package:bazar_app/core/widgets/spaces.dart';
import 'package:bazar_app/feature/publishers/logic/cubits/publishers_cubit.dart';
import 'package:bazar_app/feature/publishers/presentation/widgets/empty_publisher_list_state.dart';
import 'package:bazar_app/feature/publishers/presentation/widgets/message_publisher_list_page_state.dart';
import 'package:bazar_app/feature/publishers/presentation/widgets/publisher_card_widget.dart';
import 'package:bazar_app/feature/publishers/presentation/widgets/publishers_search_bar_widget.dart';
import 'package:bazar_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PublishersListPage extends StatefulWidget {
  const PublishersListPage({super.key});

  @override
  State<PublishersListPage> createState() => _PublishersListPageState();
}

class _PublishersListPageState extends State<PublishersListPage> {
  final _scrollController = ScrollController();
  final _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<PublishersCubit>().fetchAllPublishers();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 500) {
      context.read<PublishersCubit>().loadMorePublishers();
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final s = S.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          s.publisherDetails,
          style: theme.appBarTheme.titleTextStyle,
        ),
      ),
      body: Column(
        children: [
          verticalSpace(8),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: PublishersSearchBarWidget(
              controller: _searchController,
              onChanged: (value) {
                setState(() {});
                if (value.isEmpty) {
                  context.read<PublishersCubit>().fetchAllPublishers();
                } else {
                  context.read<PublishersCubit>().searchPublishers(value);
                }
              },
              onClear: () {
                _searchController.clear();
                context.read<PublishersCubit>().fetchAllPublishers();
                setState(() {});
              },
            ),
          ),
          verticalSpace(16),
          Expanded(
            child: BlocConsumer<PublishersCubit, PublishersState>(
              listener: (context, state) {
                if (state is PublishersError) {
                  context.showSnackBar(state.failure.message, isError: true);
                } else if (state is PublishersOffline) {
                  context.showSnackBar(
                    s.noConnectionSnack,
                    backgroundColor: theme.colorScheme.secondary,
                  );
                }
              },
              builder: (context, state) {
                if (state is PublishersLoading) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (state is PublishersListLoaded) {
                  if (state.publishers.isEmpty) {
                    return EmptyPublisherListStateWidget(
                      icon: Icons.search_off_rounded,
                      message: s.noPublishersFound,
                    );
                  }

                  return GridView.builder(
                    controller: _scrollController,
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.85,
                      crossAxisSpacing: 16.w,
                      mainAxisSpacing: 16.h,
                    ),
                    itemCount: state.publishers.length,
                    itemBuilder: (context, index) {
                      final publisher = state.publishers[index];
                      return PublisherCardWidget(
                        publisher: publisher,
                        onTap: () => context.pushNamed(
                          Routing.publisherDetailsPage,
                          arguments: publisher.id,
                        ),
                      );
                    },
                  );
                }
                if (state is PublishersOffline) {
                  return MessagePublisherListPageStateWidget(
                    icon: Icons.wifi_off_rounded,
                    message: state.failure.message,
                    onRetry: () =>
                        context.read<PublishersCubit>().fetchAllPublishers(),
                  );
                }

                if (state is PublishersError) {
                  return MessagePublisherListPageStateWidget(
                    icon: Icons.error_outline_rounded,
                    message: state.failure.message,
                    onRetry: () =>
                        context.read<PublishersCubit>().fetchAllPublishers(),
                  );
                }
                return const SizedBox.shrink();
              },
            ),
          ),
        ],
      ),
    );
  }
}
