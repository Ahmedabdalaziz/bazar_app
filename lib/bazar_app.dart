import 'package:bazar_app/feature/splash/logic/settings_cubit/settings_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/app_routes/app_router.dart';
import 'core/app_routes/routes_strings.dart';
import 'core/app_themes/themes/app_themes.dart';
import 'generated/l10n.dart';

class BazarApp extends StatelessWidget {
  const BazarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return BlocProvider(
          create: (context) => SettingsCubit()..initSettings(),
          child: BlocBuilder<SettingsCubit, SettingsState>(
            builder: (context, state) {
              final themeMode = state is SettingsThemeSuccess
                  ? state.themeMode
                  : ThemeMode.system;

              final locale = state is SettingsLanguageSuccess
                  ? state.locale
                  : null;

              return MaterialApp(
                theme: AppThemes.light(),
                darkTheme: AppThemes.dark(),
                themeMode: themeMode,
                locale: locale,
                localizationsDelegates: [
                  S.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: S.delegate.supportedLocales,
                debugShowCheckedModeBanner: false,
                onGenerateRoute: AppRouter.generateRoute,
                initialRoute: Routing.splashScreen,
              );
            },
          ),
        );
      },
    );
  }
}
