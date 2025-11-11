import 'package:bazar_app/core/widgets/spaces.dart';
import 'package:cached_network_image/cached_network_image.dart'
    show CachedNetworkImage;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
                  maxHeightDiskCache: 198.h.round(),
                  maxWidthDiskCache: 127.w.round(),
                  errorWidget: (context, url, error) =>
                      const Icon(Icons.image_not_supported, color: Colors.grey),
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
