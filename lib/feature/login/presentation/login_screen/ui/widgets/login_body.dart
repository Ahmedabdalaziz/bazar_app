import 'package:bazar_app/core/widgets/spaces.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'google_sign_in_button.dart';
import 'login_form.dart';
import 'login_header.dart';
import 'or_divider.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            verticalSpace(38),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const LoginHeader(),
                const LoginForm(),
                verticalSpace(32),
                const OrDivider(),
              ],
            ),
            verticalSpace(32),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.h),
              child: SizedBox(
                width: double.infinity,
                height: 48.h,
                child: const GoogleSignInButton(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
