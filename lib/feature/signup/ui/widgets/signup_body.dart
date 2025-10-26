import 'package:bazar_app/core/app_routes/routes_strings.dart';
import 'package:bazar_app/core/utils/extentions.dart';
import 'package:bazar_app/core/widgets/email_input.dart';
import 'package:bazar_app/core/widgets/spaces.dart';
import 'package:bazar_app/feature/signup/logic/signup_cubit.dart';
import 'package:bazar_app/feature/signup/ui/widgets/signup_header.dart';
import 'package:bazar_app/feature/signup/ui/widgets/signup_name_input.dart';
import 'package:bazar_app/feature/signup/ui/widgets/signup_password_input.dart';
import 'package:bazar_app/feature/signup/ui/widgets/signup_row.dart'
    show SignUp;
import 'package:bazar_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icons_plus/icons_plus.dart';

class SignupBody extends StatefulWidget {
  const SignupBody({super.key});

  @override
  State<SignupBody> createState() => _SignupBodyState();
}

class _SignupBodyState extends State<SignupBody> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _handleSignUp() {
    if (_formKey.currentState!.validate()) {
      final username = _nameController.text.trim();
      final email = _emailController.text.trim();
      final password = _passwordController.text.trim();

      context.read<SignupCubit>().signUp(
        context: context,
        email: email,
        password: password,
        username: username,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    final theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.sp),
          child: Form(
            key: _formKey,
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SignupHeader(),
                  verticalSpace(24),
                  SignUpNameInput(controller: _nameController),
                  verticalSpace(16),
                  EmailInput(controller: _emailController),
                  verticalSpace(16),
                  SignUpPasswordInput(controller: _passwordController),
                  verticalSpace(24),
                  SizedBox(
                    height: 44.h,
                    child: BlocConsumer<SignupCubit, SignupState>(
                      listener: (context, state) {
                        if (state is SignupSuccess) {
                          context.showSnackBar(
                            s.signUpSuccess,
                            isSuccess: true,
                          );
                          context.pushNamedAndRemoveUntil(
                            Routing.welcomeScreen,
                          );
                        } else if (state is SignupFailure) {
                          context.showSnackBar(
                            state.errorMessage.message,
                            isError: true,
                          );
                        } else if (state is SignupValidationError) {
                          context.showSnackBar(state.message, isError: true);
                        }
                      },
                      builder: (context, state) {
                        final isLoading = state is SignupLoading;
                        return ElevatedButton(
                          onPressed: isLoading ? null : _handleSignUp,
                          child: isLoading
                              ? const SizedBox(
                                  width: 18,
                                  height: 18,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                  ),
                                )
                              : Text(s.register),
                        );
                      },
                    ),
                  ),
                  verticalSpace(24),
                  SignUp(),
                  const Spacer(flex: 5),
                  Align(
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        Text(
                          s.byClickingSignUp,
                          style: theme.textTheme.bodyLarge!.copyWith(
                            color: theme.colorScheme.secondary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        horizontalSpace(8),
                        GestureDetector(
                          onTap: () {
                            context.showSnackBar(
                              "ياعم متدقش ما كلنا عارفين اللي فيها",
                              isError: false,
                              icon: Bootstrap.emoji_kiss_fill,
                            );
                          },
                          child: Text(
                            s.termsOfService,
                            style: theme.textTheme.bodyLarge!.copyWith(
                              color: theme.colorScheme.primary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(flex: 1),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
