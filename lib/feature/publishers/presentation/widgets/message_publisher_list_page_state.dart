import 'package:bazar_app/core/widgets/spaces.dart';
import 'package:bazar_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MessagePublisherListPageStateWidget extends StatelessWidget {
  final IconData icon;
  final String message;
  final VoidCallback onRetry;

  const MessagePublisherListPageStateWidget({
    super.key,
    required this.icon,
    required this.message,
    required this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 80.sp, color: theme.disabledColor.withOpacity(0.8)),
          verticalSpace(16),
          Text(
            message,
            style: theme.textTheme.titleMedium?.copyWith(fontSize: 16.sp),
            textAlign: TextAlign.center,
          ),
          verticalSpace(24),
          ElevatedButton.icon(
            onPressed: onRetry,
            icon: Icon(Icons.refresh, size: 20.sp),
            label: Text(S.of(context).retry),
          ),
        ],
      ),
    );
  }
}
