import 'package:bazar_app/feature/authors/data/models/authors_model/author_model.dart';
import 'package:flutter/material.dart';
import 'package:bazar_app/generated/l10n.dart';

class AuthorCardWidget extends StatelessWidget {
  final AuthorModel author;
  final VoidCallback onTap;

  const AuthorCardWidget({
    super.key,
    required this.author,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final s = S.of(context);

    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 96,
            height: 96,
            decoration: BoxDecoration(
              color: theme.colorScheme.surfaceContainerHighest,
              borderRadius: BorderRadius.circular(12),
              image: author.photoUrl != null
                  ? DecorationImage(
                      image: NetworkImage(author.photoUrl!),
                      fit: BoxFit.contain,
                    )
                  : null,
            ),
            child: author.photoUrl == null
                ? Center(
                    child: Icon(
                      Icons.person,
                      size: 36,
                      color: theme.disabledColor,
                    ),
                  )
                : null,
          ),
          const SizedBox(height: 8),
          SizedBox(
            width: 100,
            child: Text(
              author.name,
              style: theme.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 6),
          // Stars row
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(5, (index) {
              final rating = author.avgRating ?? 0.0;
              final filled = index < rating.round();
              return Icon(
                Icons.star,
                size: 14,
                color: filled ? Colors.amber : theme.disabledColor,
              );
            }),
          ),
          const SizedBox(height: 4),
          Text(
            s.reviews(author.reviewCount.toString()),
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.textTheme.bodySmall?.color?.withOpacity(0.6),
              fontSize: 11,
            ),
          ),
        ],
      ),
    );
  }
}
