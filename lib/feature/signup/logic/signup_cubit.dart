import 'package:bazar_app/core/api/Auth_supabase.dart';
import 'package:bazar_app/core/error/failure.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit() : super(SignupInitial());

  Future<void> signUp({
    required BuildContext context,
    required String email,
    required String password,
    required String username,
  }) async {
    try {
      emit(SignupLoading());

      await SupaBaseEmailSignUp.signUp(
        email: email,
        password: password,
        username: username,
      );

      emit(SignupSuccess());
    } catch (e) {
      emit(SignupFailure(ExceptionHandler.handle(e)));
    }
  }
}
