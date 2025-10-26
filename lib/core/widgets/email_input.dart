import 'package:flutter/material.dart';

import '../../../../core/helpers/validations/validation.dart';
import '../../../../core/widgets/spaces.dart';
import '../../../../generated/l10n.dart';

class EmailInput extends StatelessWidget {
  final TextEditingController controller;

  const EmailInput({required this.controller, super.key});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(s.email, style: theme.textTheme.bodyLarge),
        verticalSpace(8),
        TextFormField(
          controller: controller,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(hint: Text(s.yourEmail)),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return s.emptyEmailError;
            }
            if (!AuthValidation.isValidEmail(value)) {
              return s.errorValidationEmail;
            }
            return null;
          },
        ),
      ],
    );
  }
}
