import 'package:bazar_app/core/utils/extentions.dart';
import 'package:bazar_app/core/widgets/spaces.dart';
import 'package:bazar_app/feature/login/logic/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/app_routes/routes_strings.dart';
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
            //google ya m3alm
            BlocConsumer<LoginCubit, LoginState>(
              listener: (context, state) {
                if (state is LoginError) {
                  context.showSnackBar(state.failure.message, isError: true);
                }
                if (state is LoginSuccess) {
                  context.pushNamedAndRemoveUntil(Routing.homeScreen);
                }
              },
              builder: (context, state) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.h),
                  child: SizedBox(
                    width: double.infinity,
                    height: 48.h,
                    child: GoogleSignInButton(
                      onPressed: context.read<LoginCubit>().signInWithGoogle,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
