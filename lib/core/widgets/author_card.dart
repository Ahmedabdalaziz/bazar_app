import 'package:bazar_app/core/widgets/spaces.dart';
import 'package:bazar_app/feature/home/data/models/authors_model/author_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_strings.dart';

class AuthorCard extends StatelessWidget {
  final AuthorModel author;
  final VoidCallback? onTap;

  const AuthorCard({super.key, required this.author, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          SizedBox(
            height: 84.h,
            width: 88.w,
            child: ClipOval(
              child: CachedNetworkImage(
                imageUrl: author.photoUrl ?? AppStrings.defaultCardUrl,
                fit: BoxFit.cover,
                maxHeightDiskCache: 84.h.round(),
                maxWidthDiskCache: 84.w.round(),
                errorWidget: (context, url, error) =>
                    Image.network(AppStrings.defaultAuthorUrl, fit: BoxFit.cover),
              ),
            ),
          ),
          verticalSpace(4),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                author.name,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                maxLines: 1,
              ),
              verticalSpace(4),
              Text(
                author.role!,
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                maxLines: 1,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
