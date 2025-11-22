import 'package:bazar_app/core/widgets/spaces.dart';
import 'package:bazar_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../books/data/books_model/books_model.dart';

class PublisherBooksListWidget extends StatelessWidget {
  final List<BookModel> books;
  final String publisherName;

  const PublisherBooksListWidget({
    super.key,
    required this.books,
    required this.publisherName,
  });

  @override
  Widget build(BuildContext context) {
    if (books.isEmpty) {
      return const SizedBox.shrink();
    }

    final theme = Theme.of(context);
    final s = S.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          s.booksBy(publisherName),
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        verticalSpace(16),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 0.65,
            crossAxisSpacing: 12.w,
            mainAxisSpacing: 12.h,
          ),
          itemCount: books.length,
          itemBuilder: (context, index) {
            final book = books[index];
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),
                      color: theme.colorScheme.surfaceContainerHighest,
                      image: book.coverUrl != null
                          ? DecorationImage(
                              image: NetworkImage(book.coverUrl!),
                              fit: BoxFit.cover,
                            )
                          : null,
                    ),
                    child: book.coverUrl == null
                        ? Center(
                            child: Icon(
                              Icons.book,
                              size: 30.sp,
                              color: theme.colorScheme.onSurfaceVariant,
                            ),
                          )
                        : null,
                  ),
                ),
                verticalSpace(4),
                Text(
                  book.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
