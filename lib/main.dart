import 'package:bazar_app/bazar_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await LocalStorage.init();
  runApp(BazarApp());
}
