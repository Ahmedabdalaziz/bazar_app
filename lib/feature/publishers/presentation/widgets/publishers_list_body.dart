import 'package:bazar_app/core/app_routes/routes_strings.dart';
import 'package:bazar_app/core/utils/extentions.dart';
import 'package:bazar_app/core/widgets/shimmer/publisher_card_shimmer.dart';
import 'package:bazar_app/feature/publishers/logic/cubits/publishers_cubit.dart';
import 'package:bazar_app/feature/publishers/presentation/widgets/empty_publisher_list_state.dart';
import 'package:bazar_app/feature/publishers/presentation/widgets/message_publisher_list_page_state.dart';
import 'package:bazar_app/feature/publishers/presentation/widgets/publisher_card_widget.dart';
import 'package:bazar_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PublishersListBody extends StatelessWidget {
  final ScrollController scrollController;

  const PublishersListBody({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    final theme = Theme.of(context);

    return BlocConsumer<PublishersCubit, PublishersState>(
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
          return GridView.builder(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.85,
              crossAxisSpacing: 16.w,
              mainAxisSpacing: 16.h,
            ),
            itemCount: 6,
            itemBuilder: (context, index) => const PublisherCardShimmer(),
          );
        }
        if (state is PublishersListLoaded) {
          if (state.publishers.isEmpty) {
            return EmptyPublisherListStateWidget(
              icon: Icons.search_off_rounded,
              message: s.noPublishersFound,
            );
          }

          return GridView.builder(
            controller: scrollController,
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
            onRetry: () => context.read<PublishersCubit>().fetchAllPublishers(),
          );
        }

        if (state is PublishersError) {
          return MessagePublisherListPageStateWidget(
            icon: Icons.error_outline_rounded,
            message: state.failure.message,
            onRetry: () => context.read<PublishersCubit>().fetchAllPublishers(),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
