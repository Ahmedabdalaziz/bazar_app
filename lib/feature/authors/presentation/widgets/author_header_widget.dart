import 'package:bazar_app/feature/authors/data/models/authors_model/author_model.dart';
import 'package:bazar_app/generated/l10n.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class AuthorHeaderWidget extends StatelessWidget {
  final AuthorModel author;

  const AuthorHeaderWidget({super.key, required this.author});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final s = S.of(context);

    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: author.photoUrl != null
                  ? DecorationImage(
                      image: NetworkImage(author.photoUrl!),
                      fit: BoxFit.cover,
                    )
                  : null,
            ),
            child: author.photoUrl == null
                ? Container(
                    color: Colors.grey[300],
                    child: const Icon(Icons.person, size: 80),
                  )
                : null,
          ),
          const SizedBox(height: 16),
          // Author Name
          Text(
            author.name,
            style: theme.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          // Author Role
          if (author.role != null)
            Text(
              author.role!,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: Colors.grey[600],
              ),
              textAlign: TextAlign.center,
            ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.star, color: Colors.amber, size: 20),
              const SizedBox(width: 4),
              Text(
                (author.avgRating ?? 0.0).toStringAsFixed(1),
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                tr(
                  'reviews',
                  namedArgs: {'count': author.reviewCount.toString()},
                ),
                style: theme.textTheme.bodySmall,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
