part of 'dialog_habit_bloc.dart';

@immutable
abstract class DialogHabitState extends Equatable {
  @override
  List<Object?> get props => [];
}

class DialogHabitInitial extends DialogHabitState {}

class DialogLoadingState extends DialogHabitState {}

class DialogLoadedState extends DialogHabitState {

}

class DialogLoadedFailure extends DialogHabitState {
  DialogLoadedFailure(this.exception);

  final Object exception;

  @override
  List<Object?> get props => super.props..add(exception);
}
