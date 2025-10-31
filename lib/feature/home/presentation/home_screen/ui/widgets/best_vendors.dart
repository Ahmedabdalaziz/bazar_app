import 'package:bazar_app/core/utils/extentions.dart';
import 'package:bazar_app/core/widgets/book_card.dart';
import 'package:bazar_app/feature/home/presentation/home_screen/ui/widgets/scroll_section_with_title.dart'
    show ScrollableSection;
import 'package:bazar_app/generated/l10n.dart';
import 'package:flutter/material.dart';

class BestVendors extends StatelessWidget {
  const BestVendors({super.key});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    final books = [
      {
        'imageUrl':
            'https://ichef.bbci.co.uk/ace/standard/976/cpsprodpb/14235/production/_100058428_mediaitem100058424.jpg.webp',
        'title': 'Book 1',
        'price': 12.4,
      },
      {
        'imageUrl':
            'https://m.media-amazon.com/images/I/51Zymoq7UnL._SY291_BO1,204,203,200_QL40_FMwebp_.jpg',
        'title': 'Book 2',
        'price': 15.3,
      },
      {
        'imageUrl':
            'https://m.media-amazon.com/images/I/51Zymoq7UnL._SY291_BO1,204,203,200_QL40_FMwebp_.jpg',
        'title': 'Book 2',
        'price': 15.3,
      },
      {
        'imageUrl':
            'https://ichef.bbci.co.uk/ace/standard/976/cpsprodpb/14235/production/_100058428_mediaitem100058424.jpg.webp',
        'title': 'Book 1',
        'price': 12.4,
      },
      {
        'imageUrl':
            'https://m.media-amazon.com/images/I/51Zymoq7UnL._SY291_BO1,204,203,200_QL40_FMwebp_.jpg',
        'title': 'Book 2',
        'price': 15.3,
      },
      {
        'imageUrl':
            'https://ichef.bbci.co.uk/ace/standard/976/cpsprodpb/14235/production/_100058428_mediaitem100058424.jpg.webp',
        'title': 'Book 1',
        'price': 12.4,
      },
      {
        'imageUrl':
            'https://m.media-amazon.com/images/I/51Zymoq7UnL._SY291_BO1,204,203,200_QL40_FMwebp_.jpg',
        'title': 'Book 2',
        'price': 15.3,
      },
      {
        'imageUrl':
            'https://ichef.bbci.co.uk/ace/standard/976/cpsprodpb/14235/production/_100058428_mediaitem100058424.jpg.webp',
        'title': 'Book 1',
        'price': 12.4,
      },
    ];

    return ScrollableSection<Map<String, dynamic>>(
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
      itemBuilder: (context, item) => BookCard(
        imageUrl: item['imageUrl'],
        title: item['title'],
        price: item['price'],
      ),
    );
  }
}
