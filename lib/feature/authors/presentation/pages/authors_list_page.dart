import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bazar_app/core/app_routes/routes_strings.dart';
import 'package:bazar_app/core/utils/extentions.dart';
import 'package:bazar_app/feature/authors/presentation/cubits/author_details_cubit.dart';
import 'package:bazar_app/feature/authors/presentation/widgets/author_card_widget.dart';
import 'package:bazar_app/generated/l10n.dart';

class AuthorsListPage extends StatefulWidget {
  const AuthorsListPage({super.key});

  @override
  State<AuthorsListPage> createState() => _AuthorsListPageState();
}

class _AuthorsListPageState extends State<AuthorsListPage> {
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<AuthorDetailsCubit>().fetchAllAuthors();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 500) {
      context.read<AuthorDetailsCubit>().loadMoreAuthors();
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final s = S.of(context);

    return Scaffold(
      appBar: AppBar(title: Text(s.authors), elevation: 0),
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: s.searchHint,
                prefixIcon: const Icon(Icons.search),
                suffixIcon: _searchController.text.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          _searchController.clear();
                          context.read<AuthorDetailsCubit>().fetchAllAuthors();
                        },
                      )
                    : null,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onChanged: (value) {
                setState(() {});
                if (value.isEmpty) {
                  context.read<AuthorDetailsCubit>().fetchAllAuthors();
                } else {
                  context.read<AuthorDetailsCubit>().searchAuthors(value);
                }
              },
            ),
          ),
          Expanded(
            child: BlocConsumer<AuthorDetailsCubit, AuthorDetailsState>(
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
                } else if (state is AuthorsListLoaded) {
                  if (state.authors.isEmpty) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.person_outline,
                            size: 80,
                            color: theme.disabledColor,
                          ),
                          const SizedBox(height: 16),
                          Text(
                            s.noAuthorsFound,
                            style: theme.textTheme.titleMedium,
                          ),
                        ],
                      ),
                    );
                  }
                  return GridView.builder(
                    controller: _scrollController,
                    padding: const EdgeInsets.all(16),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          childAspectRatio: 0.75,
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 12,
                        ),
                    itemCount: state.authors.length,
                    itemBuilder: (context, index) {
                      final author = state.authors[index];
                      return AuthorCardWidget(
                        author: author,
                        onTap: () {
                          context.pushNamed(
                            Routing.authorDetailsPage,
                            arguments: author.id,
                          );
                        },
                      );
                    },
                  );
                } else if (state is AuthorDetailsOffline) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.wifi_off,
                          size: 80,
                          color: theme.disabledColor,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          state.message,
                          style: theme.textTheme.titleMedium,
                          textAlign: TextAlign.center,
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
                      ],
                    ),
                  );
                }
                return Center(child: Text('Unknown state'));
              },
            ),
          ),
        ],
      ),
    );
  }
}
