part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthLoginLoading extends AuthState {}

final class AuthLoginSuccess extends AuthState {}

final class AuthLoginFailure extends AuthState {
  String errorMessage;
  AuthLoginFailure({required this.errorMessage});
}

final class AuthRegisterLoading extends AuthState {}

final class AuthRegisterSuccess extends AuthState {}

final class AuthRegisterFailure extends AuthState {
  String errorMessage;
  AuthRegisterFailure({required this.errorMessage});
}

final class AuthResetLoading extends AuthState {}

final class AuthResetSuccess extends AuthState {}

final class AuthResetFailure extends AuthState {
  String errorMessage;
  AuthResetFailure({required this.errorMessage});
}
