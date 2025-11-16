import 'package:bazar_app/core/DI/dependancy_injection.dart';
import 'package:bazar_app/core/widgets/spaces.dart';
import 'package:bazar_app/feature/home/logic/books_cubit/Home_cubit.dart';
import 'package:bazar_app/feature/home/presentation/home_screen/ui/widgets/home_header.dart';
import 'package:bazar_app/feature/home/presentation/home_screen/ui/widgets/sales_widgets/sales_part.dart';
import 'package:bazar_app/feature/home/presentation/home_screen/ui/widgets/top_of_the_week/book_section.dart';
import 'package:bazar_app/feature/home/presentation/home_screen/ui/widgets/vonders/vedor_build_vendors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'authors/authors _build_section.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  final ValueNotifier<bool> _isShimmering = ValueNotifier(true);

  @override
  void initState() {
    super.initState();
    _initializeData();
  }

  @override
  void dispose() {
    _isShimmering.dispose();
    super.dispose();
  }

  void _initializeData() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;

      final cubit = context.read<HomeCubit>();
      cubit.fetchPaginatedVendors(page: 0, size: 6);
      cubit.fetchPaginatedBooks(page: 0, size: 6);
      cubit.fetchPaginatedAuthors(page: 0, size: 6);
    });

    Future.delayed(const Duration(seconds: 4), () {
      if (mounted) {
        _isShimmering.value = false;
      }
    });
  }

  Future<void> _onRefresh() async {
    final cubit = getIt<HomeCubit>();
    await Future.wait([
      cubit.refreshBooks(page: 0, pageSize: 6),
      cubit.fetchPaginatedVendors(page: 0, size: 6),
      cubit.fetchPaginatedAuthors(page: 0, size: 6),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: RefreshIndicator(
        onRefresh: _onRefresh,
        child: CustomScrollView(
          physics: const AlwaysScrollableScrollPhysics(
            parent: BouncingScrollPhysics(),
          ),
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: const HomeHeader(),
              ),
            ),

            SliverToBoxAdapter(child: verticalSpace(24)),

            SliverToBoxAdapter(
              child: ValueListenableBuilder<bool>(
                valueListenable: _isShimmering,
                builder: (context, isShimmering, _) {
                  return SalesPart(isShimmering: isShimmering);
                },
              ),
            ),

            SliverToBoxAdapter(child: verticalSpace(28)),

            buildBooksSection(),

            SliverToBoxAdapter(child: verticalSpace(8)),

            buildVendorsSection(),

            buildAuthorsSection(),

            SliverToBoxAdapter(child: verticalSpace(16)),
          ],
        ),
      ),
    );
  }
}
