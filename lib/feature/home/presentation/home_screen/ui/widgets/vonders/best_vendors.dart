import 'package:bazar_app/core/helpers/pop_ups/bottom_sheet.dart';
import 'package:bazar_app/core/utils/app_strings.dart' show AppStrings;
import 'package:bazar_app/core/utils/extentions.dart';
import 'package:bazar_app/core/widgets/vendor_card.dart';
import 'package:bazar_app/feature/home/data/models/vendors_model/vendor_model.dart';
import 'package:bazar_app/feature/home/presentation/home_screen/ui/widgets/scroll_section_with_title.dart'
    show ScrollableSection;
import 'package:bazar_app/generated/l10n.dart';
import 'package:flutter/material.dart';

class BestVendors extends StatelessWidget {
  final List<VendorModel> vendor;

  const BestVendors({super.key, required this.vendor});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    return ScrollableSection<VendorModel>(
      title: s.bestVendors,
      high: 130,
      pageControllerViewportFraction: 0.25,
      items: vendor,
      onSeeAllTap: () {
        context.showSnackBar(
          backgroundColor: null,
          "لسه بنجهزها",
          isSuccess: false,
          isError: false,
        );
      },
      itemBuilder: (context, vendor) => GestureDetector(
        onTap: () {
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (context) => CustomBottomSheet(
              name: vendor.name,
              img: vendor.logoUrl ?? AppStrings.defaultCardUrl,
            ),
          );
        },
        child: VendorCard(
          imageUrl: vendor.logoUrl ?? AppStrings.defaultCardUrl,
        ),
      ),
    );
  }
}
