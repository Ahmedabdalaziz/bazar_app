import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bazar_app/generated/l10n.dart';

import '../../../books/data/books_model/books_model.dart';

class AuthorBooksListWidget extends StatelessWidget {
  final List<BookModel> books;

  final String authorName;

  const AuthorBooksListWidget({
    super.key,
    required this.books,
    required this.authorName,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final s = S.of(context);

    if (books.isEmpty) return const SizedBox.shrink();

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            s.booksBy(authorName),
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 18.sp,
            ),
          ),
          SizedBox(height: 12.h),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: books.length,
            separatorBuilder: (context, index) => SizedBox(height: 12.h),
            itemBuilder: (context, index) {
              final book = books[index];
              return Container(
                decoration: BoxDecoration(
                  color: theme.cardColor,
                  borderRadius: BorderRadius.circular(12.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 4.r,
                      offset: Offset(0, 2.h),
                    ),
                  ],
                ),
                child: ListTile(
                  contentPadding: EdgeInsets.all(8.w),
                  leading: Container(
                    width: 50.w,
                    height: 75.h,
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
                        ? Icon(
                            Icons.book,
                            color: theme.disabledColor,
                            size: 24.sp,
                          )
                        : null,
                  ),
                  title: Text(
                    book.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 14.sp,
                    ),
                  ),
                  subtitle: Padding(
                    padding: EdgeInsets.only(top: 4.h),
                    child: Text(
                      '\$${(book.price ?? 0).toStringAsFixed(2)}',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                  onTap: () {
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
