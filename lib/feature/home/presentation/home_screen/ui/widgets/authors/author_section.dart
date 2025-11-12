import 'package:bazar_app/core/widgets/author_card.dart';
import 'package:bazar_app/feature/home/presentation/home_screen/ui/widgets/scroll_section_with_title.dart';
import 'package:flutter/material.dart';

import '../../../../../../../generated/l10n.dart';
import '../../../../../data/models/authors_model/author_model.dart';

class AuthorSection extends StatelessWidget {
  final List<AuthorModel> items;

  const AuthorSection({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    final S s = S.of(context);
    return ScrollableSection<AuthorModel>(
      title: s.authors,
      items: items,
      onSeeAllTap: () {},
      itemBuilder: (context, author) {
        return AuthorCard(imageUrl: "", onTap: () {});
      },
    );
  }
}
