part of 'dialog_habit_bloc.dart';

@immutable
abstract class DialogHabitEvent extends Equatable {
  const DialogHabitEvent();

  @override
  List<Object?> get props => [];
}

class DialogAddHabitEvent extends DialogHabitEvent {
  const DialogAddHabitEvent({required this.habitModel});

  final HabitModel habitModel;

  @override
  List<Object?> get props => super.props..add(habitModel);
}
