import 'package:bazar_app/core/app_routes/routes_strings.dart';
import 'package:bazar_app/core/utils/app_strings.dart';
import 'package:bazar_app/core/utils/extentions.dart';
import 'package:bazar_app/core/widgets/book_card.dart';
import 'package:bazar_app/feature/home/presentation/home_screen/ui/widgets/scroll_section_with_title.dart'
    show ScrollableSection;
import 'package:bazar_app/generated/l10n.dart';
import 'package:flutter/material.dart';

import '../../../../../../books/data/books_model/books_model.dart';

class TopOfWeekWidget extends StatelessWidget {
  final List<BookModel> books;

  const TopOfWeekWidget({super.key, required this.books});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    return ScrollableSection<BookModel>(
      title: s.topOfWeek,
      items: books,
      onSeeAllTap: () {
        context.pushNamed(Routing.booksListPage);
      },
      itemBuilder: (context, book) => GestureDetector(
        onTap: () {
          context.pushNamed(Routing.bookDetailsPage, arguments: book.id);
        },
        child: BookCard(
          imageUrl: book.coverUrl ?? AppStrings.defaultCardUrl,
          title: book.title,
          price: book.price ?? 0.0,
        ),
      ),
    );
  }
}
