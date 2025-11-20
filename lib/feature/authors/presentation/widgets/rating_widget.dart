import 'package:flutter/material.dart';
import 'package:bazar_app/generated/l10n.dart';

class RatingWidget extends StatelessWidget {
  final double rating;
  final int reviewCount;
  final bool isInteractive;
  final Function(double)? onRatingChanged;

  const RatingWidget({
    super.key,
    required this.rating,
    required this.reviewCount,
    this.isInteractive = false,
    this.onRatingChanged,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final s = S.of(context);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            s.rating,
            style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              // Stars
              Expanded(
                child: Row(
                  children: List.generate(5, (index) {
                    return GestureDetector(
                      onTap: isInteractive
                          ? () => onRatingChanged?.call((index + 1).toDouble())
                          : null,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 2),
                        child: Icon(
                          index < rating.floor()
                              ? Icons.star
                              : index < rating
                                  ? Icons.star_half
                                  : Icons.star_outline,
                          color: Colors.amber,
                          size: 20,
                        ),
                      ),
                    );
                  }),
                ),
              ),
              const SizedBox(width: 12),
              // Rating Text
              Text(
                '${rating.toStringAsFixed(1)}/5.0',
                style: theme.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            s.reviews(reviewCount.toString()),
            style: theme.textTheme.bodySmall?.copyWith(
                  color: Colors.grey[600],
                ),
          ),
        ],
      ),
    );
  }
}
