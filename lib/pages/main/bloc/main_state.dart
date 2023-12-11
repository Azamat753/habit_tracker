part of 'main_bloc.dart';

@immutable
abstract class MainState {}

class MainInitial extends MainState {}

class HabitListLoading extends MainState {}

class HabitListLoaded extends MainState {
  HabitListLoaded({required this.habitList});

  final List<HabitModel> habitList;
}

class HabitListLoadingError extends MainState {
  HabitListLoadingError({required this.exception});
  final Object? exception;
}

class HabitDeleteLoadingState extends MainState {}

class HabitDeleteLoadedState extends MainState {

}

class HabitDeleteLoadedFailure extends MainState {
  HabitDeleteLoadedFailure(this.exception);
  final Object exception;
}
