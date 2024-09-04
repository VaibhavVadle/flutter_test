part of 'auth_bloc.dart';

class AuthState extends Equatable {
  final bool loading;
  final String? errorMsg;
  final bool isSuccess;
  final AuthEvent? event;

  const AuthState({
    this.loading = false,
    this.errorMsg,
    this.isSuccess = false,
    this.event,
  });

  AuthState copyWith({
    bool? loading,
    String? errorMsg,
    bool? isSuccess,
    AuthEvent? event,
  }) =>
      AuthState(
        loading: loading ?? this.loading,
        errorMsg: errorMsg ?? this.errorMsg,
        isSuccess: isSuccess ?? this.isSuccess,
        event: event ?? this.event,
      );

  @override
  List<Object?> get props => [loading,errorMsg,isSuccess,event];
}
