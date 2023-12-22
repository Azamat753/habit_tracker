part of 'habit_detail_bloc.dart';

@immutable
abstract class HabitsDetailState extends Equatable{}

class HabitDetailInitial extends HabitsDetailState {
  @override
  List<Object?> get props => [];
}

class HabitUpdateState extends HabitsDetailState{
  @override
  List<Object?> get props => [];
}

class HabitUpdateErrorState extends HabitsDetailState{
  HabitUpdateErrorState({required this.exception});

  final Object? exception;

  @override
  List<Object?> get props => [exception];

}