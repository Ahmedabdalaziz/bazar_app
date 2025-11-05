import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../core/api/Auth_supabase.dart';
import '../../../core/error/failure.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  Future<void> signInWithGoogle() async {
    try {
      emit(LoginLoading());
      await SupabaseSignupWithGoogle.signUp();
      emit(LoginSuccess());
    } catch (e) {
      emit(LoginError(ExceptionHandler.handle(e)));
    }
  }

  Future<void> signInWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      emit(LoginLoading());
      await SupabaseEmailSignIn.signIn(email: email, password: password);
      emit(LoginSuccess());
    } catch (e) {
      emit(LoginError(ExceptionHandler.handle(e)));
    }
  }
}
