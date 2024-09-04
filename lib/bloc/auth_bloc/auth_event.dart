part of 'auth_bloc.dart';

sealed class AuthEvent {}

class SetInitState extends AuthEvent {}

class UserSignInEvent extends AuthEvent {
  final String email;

  UserSignInEvent({required this.email});
}

class UserSignUpEvent extends AuthEvent {
  final String name;
  final String email;

  UserSignUpEvent({
    required this.name,
    required this.email,
  });
}

class UserLogOutEvent extends AuthEvent {}
