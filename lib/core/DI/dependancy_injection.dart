import 'package:bazar_app/core/api/crud_operation_supabase.dart';
import 'package:bazar_app/feature/home/data/repo/home_repository.dart';
import 'package:bazar_app/feature/authors/data/repositories/author_details_repository.dart';
import 'package:bazar_app/feature/authors/presentation/cubits/author_details_cubit.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../feature/home/logic/books_cubit/Home_cubit.dart';
import '../../feature/home/logic/bottom_navigation_cubit/bottom_navigation_cubit.dart';

final getIt = GetIt.instance;

Future<GetIt> setupGetIt() async {
  final supabase = Supabase.instance.client;
  getIt.registerSingleton<SupabaseClient>(supabase);

  // Crud Operation Services
  getIt.registerLazySingleton<BookService>(
    () => BookService(getIt<SupabaseClient>()),
  );
  getIt.registerLazySingleton<AuthorService>(
    () => AuthorService(getIt<SupabaseClient>()),
  );
  getIt.registerLazySingleton<VendorService>(
    () => VendorService(getIt<SupabaseClient>()),
  );
  getIt.registerLazySingleton<OrderService>(
    () => OrderService(getIt<SupabaseClient>()),
  );
  getIt.registerLazySingleton<AddressService>(
    () => AddressService(getIt<SupabaseClient>()),
  );
  getIt.registerLazySingleton<WishlistService>(
    () => WishlistService(getIt<SupabaseClient>()),
  );
  //----------------------------------------------------------------------//
  // Books
  getIt.registerLazySingleton<HomeRepository>(
    () => HomeRepository(
      getIt<BookService>(),
      getIt<VendorService>(),
      getIt<AuthorService>(),
    ),
  );
  getIt.registerFactory(() => HomeCubit(getIt<HomeRepository>()));

  //----------------------------------------------------------------------//
  // Authors Details
  getIt.registerLazySingleton<AuthorDetailsRepository>(
    () => AuthorDetailsRepository(
      getIt<AuthorService>(),
      getIt<BookService>(),
    ),
  );
  getIt.registerFactory(() => AuthorDetailsCubit(
    getIt<AuthorDetailsRepository>(),
    Connectivity(),
  ));

  //----------------------------------------------------------------------//
  //navigation bar
  getIt.registerFactory(() => BottomNavigationCubit());
  //----------------------------------------------------------------------//
  return getIt;
}
