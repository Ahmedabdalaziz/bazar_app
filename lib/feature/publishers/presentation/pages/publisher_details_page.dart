import 'package:bazar_app/core/utils/extentions.dart';
import 'package:bazar_app/core/widgets/spaces.dart';
import 'package:bazar_app/feature/publishers/presentation/cubits/publishers_cubit.dart';
import 'package:bazar_app/feature/publishers/presentation/widgets/publisher_about_widget.dart';
import 'package:bazar_app/feature/publishers/presentation/widgets/publisher_books_list_widget.dart';
import 'package:bazar_app/feature/publishers/presentation/widgets/publisher_header_widget.dart';
import 'package:bazar_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icons_plus/icons_plus.dart';

class PublisherDetailsPage extends StatefulWidget {
  final String publisherId;

  const PublisherDetailsPage({super.key, required this.publisherId});

  @override
  State<PublisherDetailsPage> createState() => _PublisherDetailsPageState();
}

class _PublisherDetailsPageState extends State<PublisherDetailsPage> {
  @override
  void initState() {
    super.initState();
    context.read<PublishersCubit>().fetchPublisherDetails(widget.publisherId);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final s = S.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          s.publisherDetails ?? '',
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: 20.sp,
          ),
        ),
        elevation: 0,
        centerTitle: true,
      ),
      body: BlocConsumer<PublishersCubit, PublishersState>(
        listener: (context, state) {
          if (state is PublishersError) {
            context.showSnackBar(state.failure.message, isError: true);
          } else if (state is PublishersOffline) {
            context.showSnackBar(
              s.noConnectionSnack,
              backgroundColor: theme.colorScheme.secondary,
            );
          }
        },
        builder: (context, state) {
          if (state is PublishersLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is PublisherDetailsLoaded) {
            final publisher = state.publisher;
            final books = state.publisherBooks;

            return SingleChildScrollView(
              padding: EdgeInsets.all(16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PublisherHeaderWidget(publisher: publisher),
                  verticalSpace(24),
                  PublisherAboutWidget(publisher: publisher),
                  PublisherBooksListWidget(
                    books: books,
                    publisherName: publisher.name,
                  ),
                ],
              ),
            );
          } else if (state is PublishersOffline) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.wifi_off, size: 80.sp, color: theme.disabledColor),
                  verticalSpace(16),
                  Text(
                    state.failure.message,
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontSize: 16.sp,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  verticalSpace(24),
                  ElevatedButton.icon(
                    onPressed: () {
                      context.read<PublishersCubit>().retry(widget.publisherId);
                    },
                    icon: Icon(Bootstrap.arrow_clockwise, size: 20.sp),
                    label: Text(s.retry),
                  ),
                ],
              ),
            );
          } else if (state is PublishersError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.error_outline,
                    size: 80.sp,
                    color: theme.colorScheme.error,
                  ),
                  verticalSpace(16),
                  Text(
                    state.failure.message,
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontSize: 16.sp,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  verticalSpace(24),
                  ElevatedButton.icon(
                    onPressed: () {
                      context.read<PublishersCubit>().retry(widget.publisherId);
                    },
                    icon: Icon(Bootstrap.arrow_clockwise, size: 20.sp),
                    label: Text(s.retry),
                  ),
                ],
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
