part of 'obscure_icon_bloc.dart';

abstract class ObscureIconState {
  bool get iconState;
}

// obscure icon state for visibilty
class ObscuredState extends ObscureIconState {
  @override
  final bool iconState = true;
}

class UnObscuredState extends ObscureIconState {
  @override
  final bool iconState = false;
}
