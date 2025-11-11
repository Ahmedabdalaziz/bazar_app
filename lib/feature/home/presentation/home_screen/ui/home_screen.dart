import 'package:bazar_app/core/DI/dependancy_injection.dart';
import 'package:bazar_app/core/widgets/bottom_navigation_bar.dart';
import 'package:bazar_app/feature/home/logic/books_cubit/Home_cubit.dart';
import 'package:bazar_app/feature/home/presentation/home_screen/ui/widgets/home_body.dart'
    show HomeBody;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../cart/cart_screen/cart_screen.dart';
import '../../../../category/categories_screen/categories_screen.dart';
import '../../../../profile/profile_screen/profile_screen.dart';
import '../../../logic/bottom_navigation_cubit/bottom_navigation_cubit.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final PageStorageBucket _bucket = PageStorageBucket();

  final List<Widget> _pages = [
    BlocProvider(create: (context) => getIt<HomeCubit>(), child: HomeBody()),
    CategoriesScreen(),
    CartScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<BottomNavigationCubit, BottomNavigationState>(
        builder: (context, state) {
          int selectedIndex = 0;
          if (state is BottomNavigationInitial) {
            selectedIndex = state.selectedIndex;
          } else if (state is BottomNavigationChanged) {
            selectedIndex = state.selectedIndex;
          }
          return PopScope(
            canPop: false,
            child: PageStorage(
              bucket: _bucket,
              child: IndexedStack(index: selectedIndex, children: _pages),
            ),
          );
        },
      ),
      bottomNavigationBar:
          BlocBuilder<BottomNavigationCubit, BottomNavigationState>(
            builder: (context, state) {
              int selectedIndex = 0;
              if (state is BottomNavigationInitial) {
                selectedIndex = state.selectedIndex;
              } else if (state is BottomNavigationChanged) {
                selectedIndex = state.selectedIndex;
              }

              return BottomNavigationBarWidget(
                context: context,
                selectedIndex: selectedIndex,
                onItemTapped: (index) {
                  context.read<BottomNavigationCubit>().selectTab(index);
                },
              );
            },
          ),
    );
  }
}
