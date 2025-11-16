import 'package:bazar_app/feature/home/logic/books_cubit/Home_cubit.dart';
import 'package:bazar_app/feature/home/presentation/home_screen/ui/widgets/top_of_the_week/top_of_week_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget buildBooksLoadedWidget(BookLoaded state, BuildContext context) {
  return Column(
    children: [
      if (state.fromCache)
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          child: Row(
            children: [
              Icon(Icons.offline_bolt, size: 14.sp, color: Colors.grey[600]),
              SizedBox(width: 4.w),
              Text(
                'محفوظة مؤقتًا',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Colors.grey[600],
                  fontSize: 11.sp,
                ),
              ),
            ],
          ),
        ),
      TopOfWeekWidget(books: state.books),
    ],
  );
}
Widget buildBooksWithErrorWidget(BookLoadedWithError state, BuildContext context) {
  return Column(
    children: [
      Container(
        margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: Colors.orange.withOpacity(0.1),
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(color: Colors.orange.withOpacity(0.3), width: 1),
        ),
        child: Row(
          children: [
            Icon(Icons.cloud_off, size: 16.sp, color: Colors.orange[700]),
            SizedBox(width: 8.w),
            Expanded(
              child: Text(
                'عرض البيانات المحفوظة - تحقق من الاتصال',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Colors.orange[800],
                  fontSize: 12.sp,
                ),
              ),
            ),
          ],
        ),
      ),
      TopOfWeekWidget(books: state.books),
    ],
  );
}
