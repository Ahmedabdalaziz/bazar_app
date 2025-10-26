import 'package:flutter/material.dart';

import '../../../../core/widgets/spaces.dart';
import '../../../../generated/l10n.dart';

class SignUpNameInput extends StatelessWidget {
  final TextEditingController controller;

  const SignUpNameInput({required this.controller, super.key});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(s.name, style: theme.textTheme.bodyLarge),
        verticalSpace(8),
        TextFormField(
          controller: controller,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(hint: Text(s.yourName)),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return s.emptyEmailError;
            }
            return null;
          },
        ),
      ],
    );
  }
}
