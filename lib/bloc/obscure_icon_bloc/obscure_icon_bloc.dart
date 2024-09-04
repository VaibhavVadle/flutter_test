import 'package:flutter_bloc/flutter_bloc.dart';

part 'obscure_icon_event.dart';
part 'obscure_icon_state.dart';

class ObscureIconBloc extends Bloc<ObscureIconEvents, ObscureIconState> {
  ObscureIconBloc() : super(ObscuredState()) {
    on<ObscureIconPressed>(_obscureIconPressed);
  }

  void _obscureIconPressed(
      ObscureIconPressed event, Emitter<ObscureIconState> emit) {
    if (state is ObscuredState) {
      emit(UnObscuredState());
    } else {
      emit(ObscuredState());
    }
  }
}
