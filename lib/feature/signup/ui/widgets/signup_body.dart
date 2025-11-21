import 'package:bazar_app/core/widgets/email_input.dart';
import 'package:bazar_app/core/widgets/spaces.dart';
import 'package:bazar_app/feature/signup/logic/signup_cubit.dart';
import 'package:bazar_app/feature/signup/ui/widgets/signup_button.dart';
import 'package:bazar_app/feature/signup/ui/widgets/signup_footer.dart';
import 'package:bazar_app/feature/signup/ui/widgets/signup_header.dart';
import 'package:bazar_app/feature/signup/ui/widgets/signup_name_input.dart';
import 'package:bazar_app/feature/signup/ui/widgets/signup_password_input.dart';
import 'package:bazar_app/feature/signup/ui/widgets/signup_row.dart'
    show SignUp;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
                    child: SignupButton(onSignup: _handleSignUp),
                  ),
                  verticalSpace(24),
                  const SignUp(),
                  const Spacer(flex: 5),
                  const SignupFooter(),
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
