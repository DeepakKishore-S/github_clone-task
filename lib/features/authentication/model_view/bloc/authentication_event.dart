part of 'authentication_bloc.dart';

@immutable
abstract class AuthenticationEvent {
  const AuthenticationEvent();
}

class AuthenticateUserEvent extends AuthenticationEvent {
  const AuthenticateUserEvent();
}

class AppEventInitialize extends AuthenticationEvent {
  const AppEventInitialize();
}
