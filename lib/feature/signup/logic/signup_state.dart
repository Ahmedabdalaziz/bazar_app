part of 'signup_cubit.dart';

@immutable
sealed class SignupState {}

final class SignupInitial extends SignupState {}

final class SignupLoading extends SignupState {}

final class SignupFailure extends SignupState {
  final Failure errorMessage;

  SignupFailure(this.errorMessage);
}

final class SignupSuccess extends SignupState {}

final class SignupValidationError extends SignupState {
  final String message;

  SignupValidationError(this.message);
}
