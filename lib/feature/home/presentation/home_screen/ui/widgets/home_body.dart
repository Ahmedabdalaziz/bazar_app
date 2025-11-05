import 'package:bazar_app/core/utils/app_strings.dart';
import 'package:bazar_app/core/utils/extentions.dart';
import 'package:bazar_app/core/widgets/spaces.dart';
import 'package:bazar_app/feature/home/logic/books_cubit/book_cubit.dart';
import 'package:bazar_app/feature/home/presentation/home_screen/ui/widgets/sales_widget.dart';
import 'package:bazar_app/feature/home/presentation/home_screen/ui/widgets/top_of_week_widget.dart'
    show TopOfWeekWidget;
import 'package:bazar_app/feature/splash/logic/settings_cubit/settings_cubit.dart';
import 'package:bazar_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icons_plus/icons_plus.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  @override
  void initState() {
    super.initState();
    context.read<BookCubit>().fetchPaginatedBooks(page: 0, pageSize: 5);
  }

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    final theme = Theme.of(context);
    return SafeArea(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      context.read<SettingsCubit>().toggleTheme();
                    },
                    icon: const Icon(Bootstrap.search),
                  ),
                  Text(s.home, style: theme.textTheme.titleLarge),
                  IconButton(
                    onPressed: () {
                      context.read<SettingsCubit>().toggleLanguage();
                    },
                    icon: const Icon(Bootstrap.bell),
                  ),
                ],
              ),
              verticalSpace(24),
              SizedBox(
                height: 200,
                width: double.infinity,
                child: AutoSlideBanner(
                  imageAssets: [
                    AppStrings.firstSales,
                    AppStrings.secondSales,
                    AppStrings.thirdSales,
                  ],
                ),
              ),
              verticalSpace(28),

              BlocConsumer<BookCubit, BookState>(
                listener: (context, state) {
                  if (state is BookError) {
                    context.showSnackBar(state.message.message);
                  }
                },
                builder: (context, state) {
                  if (state is BookLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is BookLoaded) {
                    return TopOfWeekWidget(books: state.books);
                  }
                  return const SizedBox.shrink();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
