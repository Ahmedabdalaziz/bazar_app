import 'package:bazar_app/core/widgets/spaces.dart';
import 'package:bazar_app/feature/books/logic/cubit/books_cubit.dart';
import 'package:bazar_app/feature/books/presentation/widgets/books_list_body.dart';
import 'package:bazar_app/feature/publishers/presentation/widgets/publishers_search_bar_widget.dart';
import 'package:bazar_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BooksListPage extends StatefulWidget {
  const BooksListPage({super.key});

  @override
  State<BooksListPage> createState() => _BooksListPageState();
}

class _BooksListPageState extends State<BooksListPage> {
  final _scrollController = ScrollController();
  final _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<BooksCubit>().fetchAllBooks();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 500) {
      context.read<BooksCubit>().loadMoreBooks();
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
        title: Text(s.books, style: theme.appBarTheme.titleTextStyle),
      ),
      body: Column(
        children: [
          verticalSpace(8),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: PublishersSearchBarWidget(
              controller: _searchController,
              onChanged: (value) {
                setState(() {});
                if (value.isEmpty) {
                  context.read<BooksCubit>().fetchAllBooks();
                } else {
                  context.read<BooksCubit>().searchBooks(value);
                }
              },
              onClear: () {
                _searchController.clear();
                context.read<BooksCubit>().fetchAllBooks();
                setState(() {});
              },
            ),
          ),
          verticalSpace(16),
          Expanded(child: BooksListBody(scrollController: _scrollController)),
        ],
      ),
    );
  }
}
