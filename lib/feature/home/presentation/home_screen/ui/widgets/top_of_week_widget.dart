import 'package:bazar_app/core/utils/app_strings.dart';
import 'package:bazar_app/core/utils/extentions.dart';
import 'package:bazar_app/core/widgets/book_card.dart';
import 'package:bazar_app/feature/home/data/models/books_model.dart';
import 'package:bazar_app/feature/home/presentation/home_screen/ui/widgets/scroll_section_with_title.dart'
    show ScrollableSection;
import 'package:bazar_app/generated/l10n.dart';
import 'package:flutter/material.dart';

class TopOfWeekWidget extends StatelessWidget {
  final List<BookModel> books;

  const TopOfWeekWidget({super.key, required this.books});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    return ScrollableSection<BookModel>(
      title: s.topOfWeek,
      items: books,
      onSeeAll: () {
        context.showSnackBar(
          backgroundColor: null,
          "لسه بنجهزها",
          isSuccess: false,
          isError: false,
        );
      },
      itemBuilder: (context, book) => BookCard(
        imageUrl: book.coverUrl ?? AppStrings.defaultCardUrl,
        title: book.title ?? 'Unknown Title',
        price: book.price ?? 5.0,
      ),
    );
  }
}
