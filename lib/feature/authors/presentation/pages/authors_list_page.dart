import 'package:bazar_app/feature/authors/presentation/cubits/author_details_cubit.dart';
import 'package:bazar_app/feature/authors/presentation/widgets/authors_list_body.dart';
import 'package:bazar_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthorsListPage extends StatefulWidget {
  const AuthorsListPage({super.key});

  @override
  State<AuthorsListPage> createState() => _AuthorsListPageState();
}

class _AuthorsListPageState extends State<AuthorsListPage> {
  final _scrollController = ScrollController();
  final _searchController = TextEditingController();

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
      appBar: AppBar(
        title: Text(s.authors, style: theme.appBarTheme.titleTextStyle),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(16.w, 8.h, 16.w, 16.h),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: s.searchHint,
                prefixIcon: Icon(Icons.search, size: 22.sp),
                suffixIcon: _searchController.text.isNotEmpty
                    ? IconButton(
                        icon: Icon(Icons.clear, size: 22.sp),
                        onPressed: () {
                          _searchController.clear();
                          context.read<AuthorDetailsCubit>().fetchAllAuthors();
                          setState(() {});
                        },
                      )
                    : null,
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
          Expanded(child: AuthorsListBody(scrollController: _scrollController)),
        ],
      ),
    );
  }
}
