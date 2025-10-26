import 'package:bazar_app/core/helpers/validations/validation.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../../../../../core/widgets/spaces.dart';
import '../../../../../../generated/l10n.dart';

class SignUpPasswordInput extends StatelessWidget {
  final TextEditingController controller;
  final ValueNotifier<bool> obscureNotifier = ValueNotifier<bool>(true);

  SignUpPasswordInput({required this.controller, super.key});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(s.password, style: theme.textTheme.bodyLarge),
        verticalSpace(8),
        ValueListenableBuilder<bool>(
          valueListenable: obscureNotifier,
          builder: (context, isObscure, child) {
            return TextFormField(
              controller: controller,
              obscureText: isObscure,
              decoration: InputDecoration(
                hint: Text(s.yourPassword),
                suffixIcon: GestureDetector(
                  onTap: () => obscureNotifier.value = !obscureNotifier.value,
                  child: Icon(isObscure ? Bootstrap.eye_slash : Bootstrap.eye),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return s.emptyPasswordError;
                }
                if (!AuthValidation.isValidPassword(value)) {
                  return s.errorValidationPassword;
                }
                return null;
              },
            );
          },
        ),
      ],
    );
  }
}
