import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../generated/l10n.dart';

Widget BottomNavigationBarWidget({
  required int selectedIndex,
  required Function(int) onItemTapped,
  required BuildContext context,
}) {
  final S s = S.of(context);
  return SizedBox(
    height: 84.h,
    child: Theme(
      data: Theme.of(context).copyWith(
        splashFactory: NoSplash.splashFactory,
        highlightColor: Colors.transparent,
      ),
      child: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: onItemTapped,
        type: BottomNavigationBarType.fixed,
        iconSize: 26.sp,
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Bootstrap.house_fill),

            label: s.home,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Bootstrap.file_earmark_text_fill),
            label: s.category,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Bootstrap.cart_fill),
            label: s.cart,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Bootstrap.person_fill),
            label: s.profile,
          ),
        ],
      ),
    ),
  );
}
