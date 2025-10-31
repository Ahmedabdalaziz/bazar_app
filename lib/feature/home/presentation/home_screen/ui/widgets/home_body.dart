import 'package:bazar_app/core/utils/app_strings.dart';
import 'package:bazar_app/core/widgets/spaces.dart';
import 'package:bazar_app/feature/home/presentation/home_screen/ui/widgets/sales_widget.dart';
import 'package:bazar_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icons_plus/icons_plus.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    final theme = Theme.of(context);
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(onPressed: () {}, icon: Icon(Bootstrap.search)),
                Text(s.home, style: theme.textTheme.titleLarge),
                IconButton(onPressed: () {}, icon: Icon(Bootstrap.bell)),
              ],
            ),
            verticalSpace(24),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.h),
              child: SizedBox(
                height: 200,
                width: double.infinity,
                child: LocalAutoSlideBanner(
                  imageAssets: [
                    AppStrings.firstSales,
                    AppStrings.secondSales,
                    AppStrings.thirdSales,
                  ],
                ),
              ),
            ),
            verticalSpace(28),

          ],
        ),
      ),
    );
  }
}
