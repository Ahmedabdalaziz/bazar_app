import 'package:bazar_app/core/app_routes/routes_strings.dart';
import 'package:bazar_app/core/utils/extentions.dart';
import 'package:bazar_app/core/widgets/author_card.dart';
import 'package:bazar_app/feature/authors/data/models/authors_model/author_model.dart';
import 'package:bazar_app/feature/home/presentation/home_screen/ui/widgets/scroll_section_with_title.dart'
    show ScrollableSection;
import 'package:bazar_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BestAuthors extends StatelessWidget {
  final List<AuthorModel> authors;

  const BestAuthors({super.key, required this.authors});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    return ScrollableSection<AuthorModel>(
      title: s.authors,
      high: 89.h,
      pageControllerViewportFraction: 0.30,
      items: authors,
      onSeeAllTap: () {
        context.pushNamed(Routing.authorsListPage);
      },
      itemBuilder: (context, author) => GestureDetector(
        onTap: () {
          context.pushNamed(Routing.authorDetailsPage, arguments: author.id);
        },
        child: AuthorCard(author: author),
      ),
    );
  }
}
