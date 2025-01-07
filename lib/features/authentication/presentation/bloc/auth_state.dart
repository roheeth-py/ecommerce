part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}
sealed class AuthActionState extends AuthState {}

final class AuthInitialState extends AuthState {}
final class AuthLoadingState extends AuthActionState {}

final class AuthSuccessState extends AuthActionState {
  final UserEntity user;

  AuthSuccessState({required this.user});
}
final class AuthFailureState extends AuthActionState {
  final Failure failure;

  AuthFailureState({required this.failure});
}
final class AuthForgotpasswordSuccessState extends AuthState {
  AuthForgotpasswordSuccessState();
}
