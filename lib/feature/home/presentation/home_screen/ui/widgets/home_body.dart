import 'package:bazar_app/core/utils/app_strings.dart';
import 'package:bazar_app/core/widgets/spaces.dart';
import 'package:bazar_app/feature/home/presentation/home_screen/ui/widgets/best_vendors.dart';
import 'package:bazar_app/feature/home/presentation/home_screen/ui/widgets/sales_widget.dart';
import 'package:bazar_app/feature/home/presentation/home_screen/ui/widgets/top_of_week_widget.dart'
    show TopOfWeekWidget;
import 'package:bazar_app/feature/splash/logic/settings_cubit/settings_cubit.dart';
import 'package:bazar_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
        physics: BouncingScrollPhysics(),
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
                    icon: Icon(Bootstrap.search),
                  ),
                  Text(s.home, style: theme.textTheme.titleLarge),
                  IconButton(
                    onPressed: () {
                      context.read<SettingsCubit>().toggleLanguage();
                    },
                    icon: Icon(Bootstrap.bell),
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
              TopOfWeekWidget(),
              BestVendors(),
              BestVendors(),
            ],
          ),
        ),
      ),
    );
  }
}
