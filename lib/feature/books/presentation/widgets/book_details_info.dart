import 'package:bazar_app/core/widgets/spaces.dart';
import 'package:bazar_app/feature/home/data/models/books_model/books_model.dart';
import 'package:bazar_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookDetailsInfo extends StatelessWidget {
  final BookModel book;

  const BookDetailsInfo({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          s.details,
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        verticalSpace(16),
        GridView(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3,
            crossAxisSpacing: 16.w,
            mainAxisSpacing: 16.h,
          ),
          children: [
            _buildInfoItem(context, s.publisher, book.publisher ?? '-'),
            _buildInfoItem(context, s.language, book.language ?? '-'),
            _buildInfoItem(context, s.pages, book.pages?.toString() ?? '-'),
            _buildInfoItem(context, s.published, _formatDate(book.createdAt)),
          ],
        ),
      ],
    );
  }

  Widget _buildInfoItem(BuildContext context, String label, String value) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: theme.textTheme.bodySmall?.copyWith(
            color: theme.colorScheme.secondary,
          ),
        ),
        verticalSpace(4),
        Text(
          value,
          style: theme.textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w500,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }

  String _formatDate(String? dateStr) {
    if (dateStr == null) return '-';
    try {
      final date = DateTime.parse(dateStr);
      return '${date.year}';
    } catch (e) {
      return '-';
    }
  }
}
