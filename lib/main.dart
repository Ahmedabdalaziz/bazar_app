import 'package:bazar_app/bazar_app.dart';
import 'package:bazar_app/core/DI/dependancy_injection.dart';
import 'package:bazar_app/core/api/Auth_supabase.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'core/helpers/shared_preference/local_storage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );
  await dotenv.load(fileName: ".env");
  await SupabaseService.initialize();
  await setupGetIt();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await LocalStorage.init();
  runApp(BazarApp());
}
