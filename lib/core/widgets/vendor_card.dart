import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VendorCard extends StatelessWidget {
  final String imageUrl;
  final VoidCallback? onTap;

  const VendorCard({super.key, required this.imageUrl, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: 80.h,
        width: 80.w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16.r),
              child: AspectRatio(
                aspectRatio: 0.80,
                child: CachedNetworkImage(
                  imageUrl: imageUrl,
                  fit: BoxFit.cover,
                  maxHeightDiskCache: 80.h.round(),
                  maxWidthDiskCache: 80.w.round(),
                  errorWidget: (context, url, error) {
                    return const Center(
                      child: Icon(Icons.store, color: Colors.grey, size: 30),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
