import 'package:bazar_app/core/app_routes/routes_strings.dart';
import 'package:bazar_app/core/utils/extentions.dart';
import 'package:bazar_app/core/widgets/shimmer/book_card_shimmer.dart';
import 'package:bazar_app/feature/books/logic/cubit/books_cubit.dart';
import 'package:bazar_app/core/widgets/book_card.dart';
import 'package:bazar_app/feature/publishers/presentation/widgets/empty_publisher_list_state.dart';
import 'package:bazar_app/feature/publishers/presentation/widgets/message_publisher_list_page_state.dart';
import 'package:bazar_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BooksListBody extends StatelessWidget {
  final ScrollController scrollController;

  const BooksListBody({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    final theme = Theme.of(context);

    return BlocConsumer<BooksCubit, BooksState>(
      listener: (context, state) {
        if (state is BooksError) {
          context.showSnackBar(state.failure.message, isError: true);
        } else if (state is BooksOffline) {
          context.showSnackBar(
            s.noConnectionSnack,
            backgroundColor: theme.colorScheme.secondary,
          );
        }
      },
      builder: (context, state) {
        if (state is BooksLoading) {
          return GridView.builder(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.65,
              crossAxisSpacing: 16.w,
              mainAxisSpacing: 16.h,
            ),
            itemCount: 6,
            itemBuilder: (context, index) => const BookCardShimmer(),
          );
        }
        if (state is BooksLoaded) {
          if (state.books.isEmpty) {
            return EmptyPublisherListStateWidget(
              icon: Icons.search_off_rounded,
              message: s.noBooksFound,
            );
          }

          return GridView.builder(
            controller: scrollController,
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.65,
              crossAxisSpacing: 16.w,
              mainAxisSpacing: 16.h,
            ),
            itemCount: state.books.length,
            itemBuilder: (context, index) {
              final book = state.books[index];
              return BookCard(
                imageUrl: book.coverUrl ?? '',
                title: book.title,
                price: book.price ?? 0.0,
                onTap: () => context.pushNamed(
                  Routing.bookDetailsPage,
                  arguments: book.id,
                ),
              );
            },
          );
        }
        if (state is BooksOffline) {
          return MessagePublisherListPageStateWidget(
            icon: Icons.wifi_off_rounded,
            message: state.failure.message,
            onRetry: () => context.read<BooksCubit>().fetchAllBooks(),
          );
        }

        if (state is BooksError) {
          return MessagePublisherListPageStateWidget(
            icon: Icons.error_outline_rounded,
            message: state.failure.message,
            onRetry: () => context.read<BooksCubit>().fetchAllBooks(),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
