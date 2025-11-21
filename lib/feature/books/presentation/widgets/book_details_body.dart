import 'package:bazar_app/core/utils/extentions.dart';
import 'package:bazar_app/core/widgets/shimmer/book_details_shimmer.dart';
import 'package:bazar_app/core/widgets/spaces.dart';
import 'package:bazar_app/feature/books/logic/cubit/books_cubit.dart';
import 'package:bazar_app/feature/books/presentation/widgets/book_details_header.dart';
import 'package:bazar_app/feature/books/presentation/widgets/book_details_info.dart';
import 'package:bazar_app/feature/books/presentation/widgets/book_details_overview.dart';
import 'package:bazar_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icons_plus/icons_plus.dart';

class BookDetailsBody extends StatelessWidget {
  final String bookId;

  const BookDetailsBody({super.key, required this.bookId});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final s = S.of(context);

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
          return const BookDetailsShimmer();
        } else if (state is BookDetailsLoaded) {
          final book = state.book;
          return SingleChildScrollView(
            padding: EdgeInsets.all(16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BookDetailsHeader(book: book),
                verticalSpace(24),
                BookDetailsOverview(book: book),
                verticalSpace(24),
                BookDetailsInfo(book: book),
              ],
            ),
          );
        } else if (state is BooksOffline) {
          return _buildErrorState(
            context,
            Icons.wifi_off,
            state.failure.message,
          );
        } else if (state is BooksError) {
          return _buildErrorState(
            context,
            Icons.error_outline,
            state.failure.message,
          );
        }
        return const SizedBox.shrink();
      },
    );
  }

  Widget _buildErrorState(BuildContext context, IconData icon, String message) {
    final theme = Theme.of(context);
    final s = S.of(context);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 80.sp, color: theme.disabledColor),
          verticalSpace(16),
          Text(
            message,
            style: theme.textTheme.titleMedium?.copyWith(fontSize: 16.sp),
            textAlign: TextAlign.center,
          ),
          verticalSpace(24),
          ElevatedButton.icon(
            onPressed: () => context.read<BooksCubit>().retry(bookId),
            icon: Icon(Bootstrap.arrow_clockwise, size: 20.sp),
            label: Text(s.retry),
          ),
        ],
      ),
    );
  }
}
