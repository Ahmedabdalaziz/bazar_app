import 'package:bazar_app/core/widgets/spaces.dart';
import 'package:bazar_app/feature/home/data/models/books_model/books_model.dart';
import 'package:bazar_app/generated/l10n.dart';
import 'package:flutter/material.dart';

class BookDetailsOverview extends StatelessWidget {
  final BookModel book;

  const BookDetailsOverview({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final s = S.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          s.overview,
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        verticalSpace(8),
        Text(
          book.description ?? s.noDescription,
          style: theme.textTheme.bodyMedium?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
            height: 1.5,
          ),
        ),
      ],
    );
  }
}
