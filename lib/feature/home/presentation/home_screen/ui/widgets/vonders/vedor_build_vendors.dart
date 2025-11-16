import 'package:bazar_app/core/utils/extentions.dart';
import 'package:bazar_app/core/widgets/shimmer/vendor_card_shimmer.dart';
import 'package:bazar_app/feature/home/logic/books_cubit/Home_cubit.dart';
import 'package:bazar_app/feature/home/presentation/home_screen/ui/widgets/vonders/best_vendors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bazar_app/generated/l10n.dart';

Widget buildVendorsSection() {
  return SliverToBoxAdapter(
    child: BlocConsumer<HomeCubit, HomeState>(
      listenWhen: (p, c) => c is VendorError || c is VendorLoadedWithError,
      listener: (context, state) {
        final s = S.of(context);
        if (state is VendorError) {
          context.showSnackBar(
            s.network_connection_error,
            isError: true,
          );
        } else if (state is VendorLoadedWithError) {
          context.showSnackBar(
            s.network_offline_showing_cached,
            backgroundColor: Colors.orange,
            icon: Icons.cloud_off,
          );
        }
      },
      buildWhen: (p, c) =>
          c is VendorLoading ||
          c is VendorLoaded ||
          c is VendorEmpty ||
          c is VendorError ||
          c is VendorLoadedWithError,

      builder: (context, state) {
        if (state is VendorLoading) {
          return const VendorCardShimmer();
        }
        if (state is VendorLoaded) {
          return BestVendors(vendor: state.vendors);
        }
        if (state is VendorLoadedWithError) {
          return BestVendors(vendor: state.vendors);
        }
        if (state is VendorEmpty) {
          return const SizedBox.shrink();
        }
        if (state is VendorError) {
          return const SizedBox.shrink();
        }
        return const SizedBox.shrink();
      },
    ),
  );
}
