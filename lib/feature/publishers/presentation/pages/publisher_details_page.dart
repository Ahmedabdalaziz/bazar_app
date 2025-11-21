import 'package:bazar_app/feature/publishers/logic/cubits/publishers_cubit.dart';
import 'package:bazar_app/feature/publishers/presentation/widgets/publisher_details_body.dart';
import 'package:bazar_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
          s.publisherDetails,
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: 20.sp,
          ),
        ),
        elevation: 0,
        centerTitle: true,
      ),
      body: PublisherDetailsBody(publisherId: widget.publisherId),
    );
  }
}
