import 'package:bazar_app/feature/home/presentation/home_screen/ui/widgets/sales_widgets/sales_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../core/utils/app_strings.dart';
import '../../../../../../../core/widgets/shimmer/sales_banner_shimmer.dart';

class SalesPart extends StatelessWidget {
  final bool isShimmering;

  const SalesPart({super.key, required this.isShimmering});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: SizedBox(
        height: 200,
        width: double.infinity,
        child: isShimmering
            ? const SalesBannerShimmer()
            : AutoSlideBanner(
          imageAssets: [
            AppStrings.firstSales,
            AppStrings.secondSales,
            AppStrings.thirdSales,
          ],
        ),
      ),
    );
  }
}
