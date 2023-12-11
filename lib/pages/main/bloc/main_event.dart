part of 'main_bloc.dart';

@immutable
abstract class MainEvent {}

class LoadHabitList extends MainEvent{
}

class DeleteHabit extends MainEvent {
  DeleteHabit({required this.habitModel});

  final HabitModel habitModel;
}