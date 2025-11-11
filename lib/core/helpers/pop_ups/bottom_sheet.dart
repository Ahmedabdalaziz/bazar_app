import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBottomSheet extends StatelessWidget {
  final String img;
  final String name;

  const CustomBottomSheet({super.key, required this.img, required this.name});

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height * 0.7;
    return SizedBox(
      height: height,
      child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(16.r),
                child: AspectRatio(
                  aspectRatio: 0.80,
                  child: CachedNetworkImage(
                    imageUrl: img,
                    fit: BoxFit.cover,
                    maxHeightDiskCache: 280.h.round(),
                    maxWidthDiskCache: 230.w.round(),
                    errorWidget: (context, url, error) => const Icon(
                      Icons.image_not_supported,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
              Text(name, style: Theme.of(context).textTheme.titleMedium),
            ],
          ),
        ),
      ),
    );
  }
}
