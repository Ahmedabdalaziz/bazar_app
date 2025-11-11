import 'package:bazar_app/core/utils/app_strings.dart';
import 'package:bazar_app/core/utils/extentions.dart';
import 'package:bazar_app/core/widgets/shimmer/sales_banner_shimmer.dart';
import 'package:bazar_app/core/widgets/shimmer/top_of_week_shimmer.dart'
    show CategoryShimmerScrollable;
import 'package:bazar_app/core/widgets/shimmer/vendor_card_shimmer.dart';
import 'package:bazar_app/core/widgets/spaces.dart';
import 'package:bazar_app/feature/home/logic/books_cubit/Home_cubit.dart';
import 'package:bazar_app/feature/home/presentation/home_screen/ui/widgets/best_vendors.dart';
import 'package:bazar_app/feature/home/presentation/home_screen/ui/widgets/home_header.dart';
import 'package:bazar_app/feature/home/presentation/home_screen/ui/widgets/sales_widget.dart';
import 'package:bazar_app/feature/home/presentation/home_screen/ui/widgets/top_of_week_widget.dart'
    show TopOfWeekWidget;
import 'package:bazar_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  bool _isShimmering = true;

  @override
  void initState() {
    super.initState();
    context.read<HomeCubit>().fetchPaginatedVendors(page: 0, size: 5);
    context.read<HomeCubit>().fetchPaginatedBooks(page: 0, pageSize: 5);
    shimmerBanner();
  }

  Future<void> shimmerBanner() async {
    await Future.delayed(const Duration(seconds: 3));
    setState(() {
      _isShimmering = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    final theme = Theme.of(context);
    return SafeArea(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: HomeHeader(),
            ),
            verticalSpace(24),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: SizedBox(
                height: 200,
                width: double.infinity,
                child: _isShimmering
                    ? SalesBannerShimmer()
                    : AutoSlideBanner(
                        imageAssets: [
                          AppStrings.firstSales,
                          AppStrings.secondSales,
                          AppStrings.thirdSales,
                        ],
                      ),
              ),
            ),
            verticalSpace(28),
            BlocConsumer<HomeCubit, HomeState>(
              listenWhen: (previous, current) => current is BookError,
              listener: (context, state) {
                if (state is BookError) {
                  context.showSnackBar(state.message.message);
                }
              },
              buildWhen: (previous, current) =>
                  current is BookLoading || current is BookLoaded,
              builder: (context, state) {
                if (state is BookLoading) {
                  return CategoryShimmerScrollable();
                } else if (state is BookLoaded) {
                  return TopOfWeekWidget(books: state.books);
                }
                return const SizedBox.shrink();
              },
            ),
            verticalSpace(16),
            BlocConsumer<HomeCubit, HomeState>(
              listenWhen: (previous, current) => current is VendorError,
              listener: (context, state) {
                if (state is VendorError) {
                  context.showSnackBar(state.message.message);
                }
              },
              buildWhen: (previous, current) =>
                  current is VendorLoading || current is VendorLoaded,
              builder: (context, state) {
                if (state is VendorLoading) {
                  return VendorCardShimmer();
                } else if (state is VendorLoaded) {
                  return BestVendors(vendor: state.vendors);
                }
                return const SizedBox.shrink();
              },
            ),
          ],
        ),
      ),
    );
  }
}
