import 'package:bazar_app/core/utils/extentions.dart';
import 'package:bazar_app/core/widgets/shimmer/top_of_week_shimmer.dart';
import 'package:bazar_app/feature/home/logic/books_cubit/Home_cubit.dart';
import 'package:bazar_app/feature/home/presentation/home_screen/ui/widgets/top_of_the_week/build_book_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show BlocConsumer;

Widget buildBooksSection() {
  return SliverToBoxAdapter(
    child: BlocConsumer<HomeCubit, HomeState>(
      listenWhen: (previous, current) =>
          current is BookError || current is BookLoadedWithError,

      listener: (context, state) {
        if (state is BookError) {
          context.showSnackBar(state.message.message, isError: true);
        } else if (state is BookLoadedWithError) {
          context.showSnackBar(
            'عرض البيانات المحفوظة',
            backgroundColor: Colors.orange,
            icon: Icons.cloud_off,
          );
        }
      },

      buildWhen: (previous, current) =>
          current is BookLoading ||
          current is BookLoaded ||
          current is BookLoadedWithError,

      builder: (context, state) {
        if (state is BookLoading) {
          return const CategoryShimmerScrollable();
        } else if (state is BookLoaded) {
          return buildBooksLoadedWidget(state, context);
        } else if (state is BookLoadedWithError) {
          return buildBooksWithErrorWidget(state, context);
        }

        return const SizedBox.shrink();
      },
    ),
  );
}
