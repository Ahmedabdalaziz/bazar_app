import 'package:bazar_app/core/app_routes/routes_strings.dart';
import 'package:bazar_app/core/utils/app_strings.dart' show AppStrings;
import 'package:bazar_app/core/utils/extentions.dart';
import 'package:bazar_app/core/widgets/vendor_card.dart';
import 'package:bazar_app/feature/publishers/data/vendors_model/vendor_model.dart';
import 'package:bazar_app/feature/home/presentation/home_screen/ui/widgets/scroll_section_with_title.dart'
    show ScrollableSection;
import 'package:bazar_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BestVendors extends StatelessWidget {
  final List<VendorModel> vendor;

  const BestVendors({super.key, required this.vendor});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    return ScrollableSection<VendorModel>(
      title: s.bestVendors,
      high: 80.h,
      pageControllerViewportFraction: 0.25,
      items: vendor,
      onSeeAllTap: () {
        context.pushNamed(Routing.publishersListPage);
      },
      itemBuilder: (context, vendor) => GestureDetector(
        onTap: () {
          context.pushNamed(Routing.publisherDetailsPage, arguments: vendor.id);
        },
        child: VendorCard(
          imageUrl: vendor.logoUrl ?? AppStrings.defaultVendorUrl,
        ),
      ),
    );
  }
}
