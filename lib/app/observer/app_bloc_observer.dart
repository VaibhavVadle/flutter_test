import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/debug_log_utils.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    Debug.log("BLOC -> $bloc CREATED");
    super.onCreate(bloc);
  }

  @override
  void onClose(BlocBase bloc) {
    Debug.log("BLOC -> $bloc CLOSED");
    super.onClose(bloc);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    Debug.log("BLOC -> $bloc // ERROR -> $error", stackTrace);
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    Debug.log("BLOC -> $bloc // EVENT -> $event");
    super.onEvent(bloc, event);
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    Debug.log("BLOC -> $bloc // Change -> $change");
    super.onChange(bloc, change);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    Debug.log("BLOC -> $bloc // Transition -> $transition");
    super.onTransition(bloc, transition);
  }
}
