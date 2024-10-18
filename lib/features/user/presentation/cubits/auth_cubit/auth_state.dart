part of 'auth_cubit.dart';

sealed class AuthState {
  const AuthState();
}
final class AuthInitial extends AuthState {
  const AuthInitial();
}
final class RequestTokenLoading extends AuthState {
  const RequestTokenLoading();
}
final class RequestTokenSuccess extends AuthState {
  final Token token;

  const RequestTokenSuccess({required this.token});
}
final class RequestTokenError extends AuthState {
  final String message;

  const RequestTokenError({required this.message});
}
final class GetSessionIdLoading extends AuthState {
  const GetSessionIdLoading();
}
final class GetSessionIdSuccess extends AuthState {
  final Token token;
  const GetSessionIdSuccess({required this.token});
}
final class GetSessionIdError extends AuthState {
  final String message;
  const GetSessionIdError({required this.message});
}
final class LogOutLoading extends AuthState {
  const LogOutLoading();
}
final class LogOutSuccess extends AuthState {
  const LogOutSuccess();
}
final class LogOutError extends AuthState {
  final String message;
  const LogOutError({required this.message});
}