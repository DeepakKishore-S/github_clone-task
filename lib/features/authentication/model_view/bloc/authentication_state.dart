// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'authentication_bloc.dart';

@immutable
abstract class AuthenticationState {
  final bool isLoading;
  final Failure? error;
  const AuthenticationState({
    required this.isLoading,
    this.error,
  });
}

class AuthenticationBlocInitial extends AuthenticationState {
  const AuthenticationBlocInitial({required super.isLoading, super.error});
}

class AuthencticatedState extends AuthenticationState {
  final String message;
  const AuthencticatedState({
    required super.isLoading,
    super.error,
    required this.message,
  });
}
