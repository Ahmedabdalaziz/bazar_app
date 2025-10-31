import 'package:bazar_app/core/api/crud_operation_supabase.dart';
import 'package:bazar_app/feature/home/presentation/home_screen/data/repo/book_repository.dart';
import 'package:bazar_app/feature/home/presentation/home_screen/logic/books_cubit/book_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final getIt = GetIt.instance;

Future<GetIt> setupGetIt() async {
  final supabase = Supabase.instance.client;
  getIt.registerSingleton(supabase);

  // Crud Operation
  getIt.registerLazySingleton(() => BookService(getIt()));
  getIt.registerLazySingleton(() => AuthorService(getIt()));
  getIt.registerLazySingleton(() => VendorService(getIt()));
  getIt.registerLazySingleton(() => OrderService(getIt()));
  getIt.registerLazySingleton(() => AddressService(getIt()));
  getIt.registerLazySingleton(() => WishlistService(getIt()));

  //books
  getIt.registerFactory(() => BookCubit(getIt()));
  getIt.registerLazySingleton<BookRepository>(() => BookRepository(supabase));

  return getIt;
}
