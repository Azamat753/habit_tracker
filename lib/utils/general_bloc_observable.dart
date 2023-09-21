import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loggy/loggy.dart';

class GeneralBlocObservable extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    logInfo("onEvent -- bloc: ${bloc.runtimeType}, event: $event");
    super.onEvent(bloc, event);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    logError("onError -- bloc: ${bloc.runtimeType}, error: $error");
    super.onError(bloc, error, stackTrace);
  }
}