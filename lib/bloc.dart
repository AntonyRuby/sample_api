import 'package:bloc/bloc.dart';

class EchoBlocDelegate extends BlocObserver {
  @override
  // ignore: unnecessary_overrides, always_specify_types
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
  }

  @override
  // ignore: always_specify_types
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);

    @override
    // ignore: unused_element, always_specify_types
    void onError(Cubit bloc, Object error, StackTrace stacktrace) {
      super.onError(bloc, error, stacktrace);
    }
  }
}
