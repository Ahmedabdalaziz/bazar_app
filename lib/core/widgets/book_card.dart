import 'package:bazar_app/core/widgets/spaces.dart';
import 'package:cached_network_image/cached_network_image.dart'
    show CachedNetworkImage;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_strings.dart';

class BookCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final double price;
  final VoidCallback? onTap;

  const BookCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.price,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: 198.h,
        width: 127.w,
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
                  memCacheHeight: 200,
                  memCacheWidth: 130,
                  maxHeightDiskCache: 400,
                  maxWidthDiskCache: 260,
                  fadeInDuration: const Duration(milliseconds: 200),
                  fadeOutDuration: const Duration(milliseconds: 100),
                  errorWidget: (context, url, error) => Image.network(
                    AppStrings.defaultCardUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            verticalSpace(8),
            Row(
              children: [
                Flexible(
                  child: Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            verticalSpace(4),
            Row(
              children: [
                Text(
                  '\$${price.toStringAsFixed(2)}',
                  style: theme.textTheme.titleMedium!.copyWith(
                    color: theme.colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
