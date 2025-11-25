import 'package:bazar_app/core/widgets/spaces.dart';
import 'package:bazar_app/feature/publishers/data/vendors_model/vendor_model.dart';
import 'package:bazar_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PublisherAboutWidget extends StatelessWidget {
  final VendorModel publisher;

  const PublisherAboutWidget({super.key, required this.publisher});

  @override
  Widget build(BuildContext context) {
    if (publisher.description == null || publisher.description!.isEmpty) {
      return const SizedBox.shrink();
    }

    final theme = Theme.of(context);
    final s = S.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          s.about,
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: 20.sp,
          ),
        ),
        verticalSpace(8),
        Text(
          publisher.description!,
          style: theme.textTheme.bodyLarge?.copyWith(
            color: theme.textTheme.bodyMedium?.color?.withOpacity(0.8),
            height: 1.5,
            fontSize: 16.sp,
          ),
        ),
        verticalSpace(24),
      ],
    );
  }
}
