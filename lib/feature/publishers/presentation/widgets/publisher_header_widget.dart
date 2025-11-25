import 'package:bazar_app/core/widgets/spaces.dart';
import 'package:bazar_app/feature/publishers/data/vendors_model/vendor_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PublisherHeaderWidget extends StatelessWidget {
  final VendorModel publisher;

  const PublisherHeaderWidget({super.key, required this.publisher});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: Column(
        children: [
          if (publisher.logoUrl != null)
            CircleAvatar(
              radius: 50.r,
              backgroundImage: NetworkImage(publisher.logoUrl!),
              backgroundColor: theme.colorScheme.surfaceContainerHighest,
            )
          else
            CircleAvatar(
              radius: 50.r,
              backgroundColor: theme.colorScheme.surfaceContainerHighest,
              child: Icon(
                Icons.business,
                size: 50.sp,
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
          verticalSpace(16),
          Text(
            publisher.name,
            style: theme.textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 24.sp,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
