import 'package:bazar_app/core/widgets/spaces.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBottomSheet extends StatelessWidget {
  final String img;
  final String name;

  const CustomBottomSheet({super.key, required this.img, required this.name});

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height * 0.94;
    final theme = Theme.of(context);

    return SizedBox(
      height: height,
      child: Column(
        children: [
          Center(
            child: Container(
              width: 40.w,
              height: 4.h,
              margin: EdgeInsets.only(top: 12.h),
              decoration: BoxDecoration(
                color: theme.colorScheme.onSurface.withOpacity(0.3),
                borderRadius: BorderRadius.circular(2.r),
              ),
            ),
          ),
          verticalSpace(18),
          SizedBox(
            height: 310.h,
            width: 230.w,
            child: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16.r),
                      child: AspectRatio(
                        aspectRatio: 0.80,
                        child: CachedNetworkImage(
                          imageUrl: img,
                          fit: BoxFit.cover,
                          maxHeightDiskCache: 280.h.round(),
                          maxWidthDiskCache: 230.w.round(),
                          // errorWidget: (context, url, error) => Icon(
                          //   Icons.image_not_supported,
                          //   color: theme.colorScheme.onSurface,
                          // ),
                        ),
                      ),
                    ),
                    Text(name, style: Theme.of(context).textTheme.titleMedium),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
