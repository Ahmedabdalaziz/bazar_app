import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:bazar_app/feature/authors/presentation/cubits/author_details_cubit.dart';
import 'package:bazar_app/feature/authors/presentation/widgets/author_header_widget.dart';
import 'package:bazar_app/feature/authors/presentation/widgets/rating_widget.dart';
import 'package:bazar_app/generated/l10n.dart';

class AuthorDetailsPage extends StatefulWidget {
  final String authorId;

  const AuthorDetailsPage({Key? key, required this.authorId}) : super(key: key);

  @override
  State<AuthorDetailsPage> createState() => _AuthorDetailsPageState();
}

class _AuthorDetailsPageState extends State<AuthorDetailsPage> {
  @override
  void initState() {
    super.initState();
    context.read<AuthorDetailsCubit>().fetchAuthorDetails(widget.authorId);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final s = S.of(context);

    return Scaffold(
      appBar: AppBar(title: Text(s.authorDetails), elevation: 0),
      body: BlocConsumer<AuthorDetailsCubit, AuthorDetailsState>(
        listener: (context, state) {
          if (state is AuthorDetailsError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: theme.colorScheme.error,
              ),
            );
          } else if (state is AuthorDetailsOffline) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(s.noConnectionSnack),
                backgroundColor: theme.colorScheme.secondary,
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is AuthorDetailsLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is AuthorDetailsLoaded) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  AuthorHeaderWidget(author: state.author),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: RatingWidget(
                      rating: state.author.avgRating ?? 0.0,
                      reviewCount: state.author.reviewCount,
                      isInteractive: false,
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Bio Section
                  if (state.author.about != null)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            s.about,
                            style: theme.textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            state.author.about!,
                            style: theme.textTheme.bodyMedium,
                          ),
                        ],
                      ),
                    ),
                  const SizedBox(height: 16),
                  // Role Section
                  if (state.author.role != null)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            s.role,
                            style: theme.textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Chip(
                            label: Text(state.author.role!),
                            backgroundColor:
                                theme.colorScheme.surfaceContainerHighest,
                          ),
                        ],
                      ),
                    ),
                  const SizedBox(height: 16),
                  // Books by Author Section
                  if (state.authorBooks != null &&
                      state.authorBooks!.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            s.booksBy(state.author.name),
                            style: theme.textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: state.authorBooks!.length,
                            itemBuilder: (context, index) {
                              final book = state.authorBooks![index];
                              return ListTile(
                                leading: Container(
                                  width: 50,
                                  height: 70,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    image: book.coverUrl != null
                                        ? DecorationImage(
                                            image: NetworkImage(book.coverUrl!),
                                            fit: BoxFit.cover,
                                          )
                                        : null,
                                  ),
                                  child: book.coverUrl == null
                                      ? Container(
                                          color: theme.disabledColor,
                                          child: const Icon(Icons.book),
                                        )
                                      : null,
                                ),
                                title: Text(
                                  book.title,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                subtitle: Text(
                                  '\$${(book.price ?? 0).toStringAsFixed(2)}',
                                  style: const TextStyle(
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  const SizedBox(height: 32),
                ],
              ),
            );
          } else if (state is AuthorDetailsOffline) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.wifi_off, size: 80, color: theme.disabledColor),
                  const SizedBox(height: 16),
                  Text(
                    state.message,
                    style: theme.textTheme.titleMedium,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton.icon(
                    onPressed: () {
                      context.read<AuthorDetailsCubit>().retry(widget.authorId);
                    },
                    icon: const Icon(Icons.refresh),
                    label: Text(s.retry),
                  ),
                ],
              ),
            );
          } else if (state is AuthorDetailsError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.error_outline,
                    size: 80,
                    color: theme.colorScheme.error,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    state.message,
                    style: theme.textTheme.titleMedium,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton.icon(
                    onPressed: () {
                      context.read<AuthorDetailsCubit>().retry(widget.authorId);
                    },
                    icon: const Icon(Icons.refresh),
                    label: Text(s.retry),
                  ),
                ],
              ),
            );
          }
          return const Center(child: Text('Unknown state'));
        },
      ),
    );
  }
}
