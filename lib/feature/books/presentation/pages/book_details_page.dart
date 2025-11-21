import 'package:bazar_app/feature/books/logic/cubit/books_cubit.dart';
import 'package:bazar_app/feature/books/presentation/widgets/book_details_body.dart';
import 'package:bazar_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookDetailsPage extends StatefulWidget {
  final String bookId;

  const BookDetailsPage({super.key, required this.bookId});

  @override
  State<BookDetailsPage> createState() => _BookDetailsPageState();
}

class _BookDetailsPageState extends State<BookDetailsPage> {
  @override
  void initState() {
    super.initState();
    context.read<BooksCubit>().fetchBookDetails(widget.bookId);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final s = S.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          s.bookDetails,
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: 20.sp,
          ),
        ),
        elevation: 0,
        centerTitle: true,
      ),
      body: BookDetailsBody(bookId: widget.bookId),
    );
  }
}
