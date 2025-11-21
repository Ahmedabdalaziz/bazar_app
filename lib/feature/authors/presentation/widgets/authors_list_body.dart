import 'package:bazar_app/core/app_routes/routes_strings.dart';
import 'package:bazar_app/core/utils/extentions.dart';
import 'package:bazar_app/core/widgets/shimmer/author_card_shimmer.dart';
import 'package:bazar_app/feature/authors/presentation/cubits/author_details_cubit.dart';
import 'package:bazar_app/feature/authors/presentation/widgets/author_card_widget.dart';
import 'package:bazar_app/feature/authors/presentation/widgets/empty_author_list_state.dart';
import 'package:bazar_app/feature/authors/presentation/widgets/message_author_list_page_state.dart';
import 'package:bazar_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthorsListBody extends StatelessWidget {
  final ScrollController scrollController;

  const AuthorsListBody({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    final theme = Theme.of(context);

    return BlocConsumer<AuthorDetailsCubit, AuthorDetailsState>(
      listener: (context, state) {
        if (state is AuthorDetailsError) {
          context.showSnackBar(state.failure.message, isError: true);
        } else if (state is AuthorDetailsOffline) {
          context.showSnackBar(
            s.noConnectionSnack,
            backgroundColor: theme.colorScheme.secondary,
          );
        }
      },
      builder: (context, state) {
        if (state is AuthorDetailsLoading) {
          return GridView.builder(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.85,
              crossAxisSpacing: 16.w,
              mainAxisSpacing: 16.h,
            ),
            itemCount: 6,
            itemBuilder: (context, index) => const AuthorCardShimmer(),
          );
        }
        if (state is AuthorsListLoaded) {
          if (state.authors.isEmpty) {
            return EmptyAuthorListPageStateWidget(
              icon: Icons.search_off_rounded,
              message: s.noAuthorsFound,
            );
          }

          return GridView.builder(
            controller: scrollController,
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.85,
              crossAxisSpacing: 16.w,
              mainAxisSpacing: 16.h,
            ),
            itemCount: state.authors.length,
            itemBuilder: (context, index) {
              final author = state.authors[index];
              return AuthorCardWidget(
                author: author,
                onTap: () => context.pushNamed(
                  Routing.authorDetailsPage,
                  arguments: author.id,
                ),
              );
            },
          );
        }

        if (state is AuthorDetailsOffline) {
          return MessageAuthorListPageStateWidget(
            icon: Icons.wifi_off_rounded,
            message: state.failure.message,
            onRetry: () => context.read<AuthorDetailsCubit>().fetchAllAuthors(),
          );
        }

        if (state is AuthorDetailsError) {
          return MessageAuthorListPageStateWidget(
            icon: Icons.error_outline_rounded,
            message: state.failure.message,
            onRetry: () => context.read<AuthorDetailsCubit>().fetchAllAuthors(),
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}
