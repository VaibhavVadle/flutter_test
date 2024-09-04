import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/core/debug_log_utils.dart';
import 'package:test_app/core/storage/app_storage.dart';
import 'package:test_app/models/user_model.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(const AuthState()) {
    on<SetInitState>(_setInitState);
    on<UserSignInEvent>(_userSignInEvent);
    on<UserSignUpEvent>(_userSignUpEvent);
    on<UserLogOutEvent>(_userLogOutEvent);
  }

  void _setInitState(SetInitState event, Emitter<AuthState> emit) {
    emit(const AuthState());
  }

  Future<void> _userSignInEvent(
      UserSignInEvent event, Emitter<AuthState> emit) async {
    emit(state.copyWith(
      loading: true,
      event: event,
      isSuccess: false,
    ));
    try {
      UserModel user = UserModel(email: event.email);
      await AppStorage.setUser(user);
      emit(state.copyWith(
        loading: false,
        isSuccess: true,
      ));
    } catch (e) {
      Debug.log(e);
      emit(state.copyWith(
        loading: false,
        isSuccess: false,
        errorMsg: e.toString(),
      ));
    }
  }

  Future<void> _userSignUpEvent(
      UserSignUpEvent event, Emitter<AuthState> emit) async {
    emit(state.copyWith(
      loading: true,
      isSuccess: false,
      event: event,
    ));
    try {
      UserModel user = UserModel(name: event.name, email: event.email);
      await AppStorage.setUser(user);
      emit(state.copyWith(
        loading: false,
        isSuccess: true,
      ));
    } catch (e) {
      Debug.log(e);
      emit(state.copyWith(
        loading: false,
        isSuccess: false,
        errorMsg: e.toString(),
      ));
    }
  }

  Future<void> _userLogOutEvent(UserLogOutEvent event, Emitter<AuthState> emit) async {
    emit(state.copyWith(
      loading: true,
      isSuccess: false,
      event: event,
    ));
    try {
      await AppStorage.clear();
      emit(state.copyWith(
        loading: false,
        isSuccess: true,
      ));
    } catch (e) {
      Debug.log(e);
      emit(state.copyWith(
        loading: false,
        isSuccess: false,
        errorMsg: e.toString(),
      ));
    }
  }
}
