import 'package:bazar_app/core/widgets/spaces.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/books_model/books_model.dart';

class BookDetailsHeader extends StatefulWidget {
  final BookModel book;
  bool isFavorite;

  BookDetailsHeader({super.key, required this.book, this.isFavorite = false});

  @override
  State<BookDetailsHeader> createState() => _BookDetailsHeaderState();
}

class _BookDetailsHeaderState extends State<BookDetailsHeader> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8.r),
          child: CachedNetworkImage(
            imageUrl: widget.book.coverUrl ?? '',
            height: 180.h,
            width: 120.w,
            fit: BoxFit.cover,
            errorWidget: (context, url, error) => Container(
              height: 180.h,
              width: 120.w,
              color: theme.colorScheme.surfaceContainerHighest,
              child: const Icon(Icons.book),
            ),
          ),
        ),
        horizontalSpace(16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      widget.book.title,
                      style: theme.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        widget.isFavorite = !widget.isFavorite;
                      });
                    },
                    icon: Icon(
                      widget.isFavorite == true
                          ? Icons.favorite_rounded
                          : Icons.favorite_border_rounded,
                      color: theme.colorScheme.primary,
                      size: 28.sp,
                    ),
                  ),
                ],
              ),
              verticalSpace(8),
              Text(
                widget.book.authorName ?? 'Unknown Author',
                style: theme.textTheme.titleMedium?.copyWith(
                  color: theme.colorScheme.primary,
                ),
              ),
              verticalSpace(8),
              Row(
                children: [
                  Icon(Icons.star_rounded, color: Colors.amber, size: 20.sp),
                  horizontalSpace(4),
                  Text(
                    widget.book.avgRating?.toStringAsFixed(1) ?? '0.0',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  horizontalSpace(4),
                  Text(
                    '(${widget.book.reviewCount ?? 0})',
                    style: theme.textTheme.bodySmall,
                  ),
                ],
              ),
              verticalSpace(16),
              Text(
                '${widget.book.price?.toStringAsFixed(2) ?? '0.00'} EGP',
                style: theme.textTheme.titleLarge?.copyWith(
                  color: theme.colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
