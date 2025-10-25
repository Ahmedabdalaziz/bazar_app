import 'package:bazar_app/core/utils/extentions.dart';
import 'package:bazar_app/core/widgets/spaces.dart';
import 'package:bazar_app/feature/login/logic/login_cubit.dart';
import 'package:bazar_app/feature/splash/logic/settings_cubit/settings_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/app_routes/routes_strings.dart';
import '../../../../../../generated/l10n.dart';
import 'email_input.dart';
import 'login_button.dart';
import 'password_input.dart';
import 'signup_row.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final ValueNotifier<bool> _obscurePassword = ValueNotifier<bool>(true);

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _obscurePassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    final theme = Theme.of(context);

    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginError) {
          context.showSnackBar(state.failure.message, isError: true);
        } else if (state is LoginSuccess) {
          context.showSnackBar(s.loginSuccess, isSuccess: true);
          context.pushNamedAndRemoveUntil(Routing.homeScreen);
        }
      },
      child: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              EmailInput(controller: _emailController),
              verticalSpace(16),
              PasswordInput(
                controller: _passwordController,
                obscureNotifier: _obscurePassword,
              ),
              verticalSpace(16),
              GestureDetector(
                onTap: () {
                  context.read<SettingsCubit>().toggleTheme();
                },
                child: Text(
                  s.forgotPassword,
                  style: theme.textTheme.bodyLarge!.copyWith(
                    color: theme.colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              verticalSpace(24),
              LoginButton(
                formKey: _formKey,
                emailController: _emailController,
                passwordController: _passwordController,
              ),
              verticalSpace(24),
              const SignupRow(),
            ],
          ),
        ),
      ),
    );
  }
}
