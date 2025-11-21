import 'package:bazar_app/core/widgets/spaces.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bazar_app/core/utils/extentions.dart';
import 'package:bazar_app/feature/authors/presentation/cubits/author_details_cubit.dart';
import 'package:bazar_app/feature/authors/presentation/widgets/author_bio_widget.dart';
import 'package:bazar_app/feature/authors/presentation/widgets/author_books_list_widget.dart';
import 'package:bazar_app/feature/authors/presentation/widgets/author_header_widget.dart';
import 'package:bazar_app/core/widgets/shimmer/author_details_shimmer.dart';
import 'package:bazar_app/generated/l10n.dart';
import 'package:icons_plus/icons_plus.dart';

class AuthorDetailsPage extends StatefulWidget {
  final String authorId;

  const AuthorDetailsPage({super.key, required this.authorId});

  @override
  State<AuthorDetailsPage> createState() => _AuthorDetailsPageState();
}

class _AuthorDetailsPageState extends State<AuthorDetailsPage> {
  @override
  void initState() {
    super.initState();
    context.read<AuthorDetailsCubit>().fetchAuthorDetails(widget.authorId);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final s = S.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          s.authorDetails,
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: 20.sp,
          ),
        ),
        elevation: 0,
        centerTitle: true,
      ),
      body: BlocConsumer<AuthorDetailsCubit, AuthorDetailsState>(
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
            return const AuthorDetailsShimmer();
          } else if (state is AuthorDetailsLoaded) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  AuthorHeaderWidget(author: state.author),
                  verticalSpace(16),
                  if (state.author.about != null) ...[
                    AuthorBioWidget(bio: state.author.about!),
                    verticalSpace(16),
                  ],
                  if (state.authorBooks != null &&
                      state.authorBooks!.isNotEmpty)
                    AuthorBooksListWidget(
                      books: state.authorBooks!,
                      authorName: state.author.name,
                    ),
                  verticalSpace(32),
                ],
              ),
            );
          } else if (state is AuthorDetailsOffline) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.wifi_off, size: 80.sp, color: theme.disabledColor),
                  verticalSpace(16),
                  Text(
                    state.failure.message,
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontSize: 16.sp,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  verticalSpace(24),
                  ElevatedButton.icon(
                    onPressed: () {
                      context.read<AuthorDetailsCubit>().retry(widget.authorId);
                    },
                    icon: Icon(Bootstrap.arrow_clockwise, size: 20.sp),
                    label: Text(s.retry),
                  ),
                ],
              ),
            );
          } else if (state is AuthorDetailsError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.error_outline,
                    size: 80.sp,
                    color: theme.colorScheme.error,
                  ),
                  verticalSpace(16),
                  Text(
                    state.failure.message,
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontSize: 16.sp,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  verticalSpace(24),
                  ElevatedButton.icon(
                    onPressed: () {
                      context.read<AuthorDetailsCubit>().retry(widget.authorId);
                    },
                    icon: Icon(Bootstrap.arrow_clockwise, size: 20.sp),
                    label: Text(s.retry),
                  ),
                ],
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
