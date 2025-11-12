import 'package:bazar_app/core/utils/extentions.dart';
import 'package:bazar_app/core/widgets/shimmer/top_of_week_shimmer.dart'
    show CategoryShimmerScrollable;
import 'package:bazar_app/core/widgets/shimmer/vendor_card_shimmer.dart';
import 'package:bazar_app/core/widgets/spaces.dart';
import 'package:bazar_app/feature/home/data/models/authors_model/author_model.dart';
import 'package:bazar_app/feature/home/logic/books_cubit/Home_cubit.dart';
import 'package:bazar_app/feature/home/presentation/home_screen/ui/widgets/authors/author_section.dart';
import 'package:bazar_app/feature/home/presentation/home_screen/ui/widgets/home_header.dart';
import 'package:bazar_app/feature/home/presentation/home_screen/ui/widgets/sales_widgets/sales_part.dart';
import 'package:bazar_app/feature/home/presentation/home_screen/ui/widgets/top_of_the_week/top_of_week_widget.dart'
    show TopOfWeekWidget;
import 'package:bazar_app/feature/home/presentation/home_screen/ui/widgets/vonders/best_vendors.dart';
import 'package:bazar_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  bool _isShimmering = true;

  @override
  void initState() {
    super.initState();
    context.read<HomeCubit>().fetchPaginatedVendors(page: 0, size: 5);
    context.read<HomeCubit>().fetchPaginatedBooks(page: 0, pageSize: 5);
    shimmerBanner();
  }

  Future<void> shimmerBanner() async {
    await Future.delayed(const Duration(seconds: 3));
    setState(() {
      _isShimmering = false;
    });
  }

  final List<AuthorModel> mockAuthors = [
    AuthorModel(
      id: '1',
      name: 'أحمد خالد توفيق',
      photoUrl: 'https://static.srpcdigital.com/styles/1037xauto/public/2024-12/887758_0.jpeg.webp',
      about:
          'طبيب مصري، وأشهر كاتب عربي في أدب الرعب والخيال العلمي، وصاحب سلسلة "ما وراء الطبيعة".',
      role: 'كاتب',
      avgRating: 4.8,
      reviewCount: 1250,
      createdAt: DateTime(2020, 5, 10),
      updatedAt: DateTime(2023, 11, 5),
    ),
    AuthorModel(
      id: '2',
      name: 'نورا ناجي',
      photoUrl: 'https://s3.amazonaws.com/new.contributors.hindawi.org/Images/59624258.jpg',
      about: 'روائية وصحفية مصرية، تكتب في قضايا المرأة والمجتمع.',
      role: 'روائي',
      avgRating: 4.5,
      reviewCount: 890,
      createdAt: DateTime(2021, 3, 15),
      updatedAt: DateTime(2023, 10, 20),
    ),
    AuthorModel(
      id: '3',
      name: 'يوسف زيدان',
      photoUrl: 'https://www.aljazeera.net/wp-content/uploads/2017/11/f58e7cc7-9d9b-406c-ac99-d4bce5ae28af.jpeg?resize=686%2C513&quality=80',
      about: 'مفكر وروائي مصري، حاصل على جائزة البوكر العربية عام 2009.',
      role: 'مفكر/روائي',
      avgRating: 4.7,
      reviewCount: 2100,
      createdAt: DateTime(2019, 7, 1),
      updatedAt: DateTime(2023, 9, 30),
    ),
    AuthorModel(
      id: '4',
      name: 'عز الدين شكري فشير',
      photoUrl: 'https://i.pravatar.cc/150?img=4',
      about: 'روائي مصري، يكتب في أدب الجريمة والتشويق.',
      role: 'روائي',
      avgRating: 4.3,
      reviewCount: 650,
      createdAt: DateTime(2022, 1, 20),
      updatedAt: DateTime(2023, 11, 1),
    ),
    AuthorModel(
      id: '5',
      name: 'رنا أديب',
      photoUrl: 'https://i.pravatar.cc/150?img=5',
      about: 'كاتبة لبنانية، تكتب في أدب الرومانسية والخيال.',
      role: 'كاتبة',
      avgRating: 4.2,
      reviewCount: 430,
      createdAt: DateTime(2021, 8, 5),
      updatedAt: DateTime(2023, 10, 15),
    ),
    AuthorModel(
      id: '6',
      name: 'محمد صادق',
      photoUrl: 'https://i.pravatar.cc/150?img=6',
      about: 'كاتب مصري شاب، يكتب في أدب الخيال العلمي والشباب.',
      role: 'كاتب',
      avgRating: 4.0,
      reviewCount: 320,
      createdAt: DateTime(2022, 6, 10),
      updatedAt: DateTime(2023, 11, 2),
    ),
    AuthorModel(
      id: '7',
      name: 'ليلى أبو زيد',
      photoUrl: 'https://i.pravatar.cc/150?img=7',
      about: 'روائية مغربية، تكتب في أدب السيرة والتاريخ.',
      role: 'روائية',
      avgRating: 4.6,
      reviewCount: 780,
      createdAt: DateTime(2020, 11, 25),
      updatedAt: DateTime(2023, 10, 28),
    ),
    AuthorModel(
      id: '8',
      name: 'خالد الباتلي',
      photoUrl: 'https://i.pravatar.cc/150?img=8',
      about: 'كاتب كويتي، يكتب في أدب الرعب والغموض.',
      role: 'كاتب',
      avgRating: 4.4,
      reviewCount: 560,
      createdAt: DateTime(2021, 12, 12),
      updatedAt: DateTime(2023, 11, 3),
    ),
    AuthorModel(
      id: '9',
      name: 'سارة الشامي',
      photoUrl: 'https://i.pravatar.cc/150?img=9',
      about: 'كاتبة سورية، تكتب في أدب الرومانسية والواقعية.',
      role: 'كاتبة',
      avgRating: 4.1,
      reviewCount: 290,
      createdAt: DateTime(2022, 4, 8),
      updatedAt: DateTime(2023, 10, 25),
    ),
    AuthorModel(
      id: '10',
      name: 'طارق إمام',
      photoUrl: 'https://i.pravatar.cc/150?img=10',
      about: 'روائي مصري، يكتب في أدب الفانتازيا والتاريخ.',
      role: 'روائي',
      avgRating: 4.5,
      reviewCount: 920,
      createdAt: DateTime(2020, 9, 30),
      updatedAt: DateTime(2023, 11, 6),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    final theme = Theme.of(context);
    return SafeArea(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: HomeHeader(),
            ),
            verticalSpace(24),
            SalesPart(isShimmering: _isShimmering),
            verticalSpace(28),
            BlocConsumer<HomeCubit, HomeState>(
              listenWhen: (previous, current) => current is BookError,
              listener: (context, state) {
                if (state is BookError) {
                  context.showSnackBar(state.message.message);
                }
              },
              buildWhen: (previous, current) =>
                  current is BookLoading || current is BookLoaded,
              builder: (context, state) {
                if (state is BookLoading) {
                  return CategoryShimmerScrollable();
                } else if (state is BookLoaded) {
                  return TopOfWeekWidget(books: state.books);
                }
                return const SizedBox.shrink();
              },
            ),
            verticalSpace(16),
            BlocConsumer<HomeCubit, HomeState>(
              listenWhen: (previous, current) => current is VendorError,
              listener: (context, state) {
                if (state is VendorError) {
                  context.showSnackBar(state.message.message);
                }
              },
              buildWhen: (previous, current) =>
                  current is VendorLoading || current is VendorLoaded,
              builder: (context, state) {
                if (state is VendorLoading) {
                  return VendorCardShimmer();
                } else if (state is VendorLoaded) {
                  return BestVendors(vendor: state.vendors);
                }
                return const SizedBox.shrink();
              },
            ),
            verticalSpace(16),
            AuthorSection(items: mockAuthors),
            verticalSpace(24),
          ],
        ),
      ),
    );
  }
}
