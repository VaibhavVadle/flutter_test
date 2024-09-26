part of 'auth_bloc.dart';

sealed class AuthEvent {}

class UserSignInEvent extends AuthEvent {}

class UserSignUpEvent extends AuthEvent {}

class UserLogOutEvent extends AuthEvent {}
