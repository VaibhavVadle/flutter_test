import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(const AuthState()) {
    on<UserSignInEvent>(_userSignInEvent);
    on<UserSignUpEvent>(_userSignUpEvent);
    on<UserLogOutEvent>(_userLogOutEvent);
  }

  Future<void> _userSignInEvent(
      UserSignInEvent event, Emitter<AuthState> emit) async {}

  Future<void> _userSignUpEvent(
      UserSignUpEvent event, Emitter<AuthState> emit) async {}

  Future<void> _userLogOutEvent(
      UserLogOutEvent event, Emitter<AuthState> emit) async {}
}
