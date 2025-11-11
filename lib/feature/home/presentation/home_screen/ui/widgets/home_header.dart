import 'package:bazar_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../../../../splash/logic/settings_cubit/settings_cubit.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final s = S.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {
            context.read<SettingsCubit>().toggleTheme();
          },
          icon: const Icon(Bootstrap.search),
        ),
        Text(s.home, style: theme.textTheme.titleLarge),
        IconButton(
          onPressed: () {
            context.read<SettingsCubit>().toggleLanguage();
          },
          icon: const Icon(Bootstrap.bell),
        ),
      ],
    );
  }
}
