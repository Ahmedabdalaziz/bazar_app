import 'package:bazar_app/core/widgets/email_input.dart';
import 'package:bazar_app/core/widgets/spaces.dart';
import 'package:bazar_app/feature/signup/ui/widgets/signup_header.dart';
import 'package:bazar_app/feature/signup/ui/widgets/signup_name_input.dart';
import 'package:bazar_app/feature/signup/ui/widgets/signup_password_input.dart';
import 'package:bazar_app/feature/signup/ui/widgets/signup_row.dart'
    show SignUp;
import 'package:bazar_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignupBody extends StatelessWidget {
  const SignupBody({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final s = S.of(context);
    final theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.sp),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SignupHeader(),
                verticalSpace(24),
                const SignUpNameInput(),
                verticalSpace(16),
                EmailInput(controller: emailController),
                verticalSpace(16),
                SignUpPasswordInput(controller: passwordController),
                verticalSpace(24),
                SizedBox(
                  height: 44.h,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(s.register),
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
                        onTap: () {},
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
    );
  }
}
