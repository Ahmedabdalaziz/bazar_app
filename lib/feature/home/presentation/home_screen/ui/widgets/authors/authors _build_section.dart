import 'package:bazar_app/core/utils/extentions.dart';
import 'package:bazar_app/core/widgets/shimmer/vendor_card_shimmer.dart';
import 'package:bazar_app/feature/home/logic/books_cubit/Home_cubit.dart';
import 'package:bazar_app/feature/home/presentation/home_screen/ui/widgets/authors/best_author_section.dart';
import 'package:bazar_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Widget buildAuthorsSection() {
  return SliverToBoxAdapter(
    child: BlocConsumer<HomeCubit, HomeState>(
      listenWhen: (p, c) => c is AuthorError,
      listener: (context, state) {
        final s = S.of(context);
        if (state is AuthorError) {
          context.showSnackBar(s.network_connection_error, isError: true);
        }
      },
      buildWhen: (p, c) =>
          c is AuthorLoading ||
          c is AuthorLoaded ||
          c is AuthorEmpty ||
          c is AuthorError,

      builder: (context, state) {
        if (state is AuthorLoading) {
          return const VendorCardShimmer();
        }
        if (state is AuthorLoaded) {
          return BestAuthors(authors: state.authors);
        }
        if (state is AuthorEmpty) {
          return const SizedBox.shrink();
        }
        if (state is AuthorError) {
          return const SizedBox.shrink();
        }
        return const SizedBox.shrink();
      },
    ),
  );
}
