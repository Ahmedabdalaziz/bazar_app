import 'package:bazar_app/core/app_routes/routes_strings.dart';
import 'package:bazar_app/core/utils/extentions.dart';
import 'package:bazar_app/feature/signup/logic/signup_cubit.dart';
import 'package:bazar_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupButton extends StatelessWidget {
  final VoidCallback onSignup;

  const SignupButton({super.key, required this.onSignup});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    return BlocConsumer<SignupCubit, SignupState>(
      listener: (context, state) {
        if (state is SignupSuccess) {
          context.showSnackBar(s.signUpSuccess, isSuccess: true);
          context.pushNamedAndRemoveUntil(Routing.welcomeScreen);
        } else if (state is SignupFailure) {
          context.showSnackBar(state.errorMessage.message, isError: true);
        } else if (state is SignupValidationError) {
          context.showSnackBar(state.message, isError: true);
        }
      },
      builder: (context, state) {
        final isLoading = state is SignupLoading;
        return ElevatedButton(
          onPressed: isLoading ? null : onSignup,
          child: isLoading
              ? const SizedBox(
                  width: 18,
                  height: 18,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : Text(s.register),
        );
      },
    );
  }
}
