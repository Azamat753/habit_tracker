part of 'habit_detail_bloc.dart';

@immutable
abstract class HabitDetailEvent extends Equatable{}

class HabitUpdateEvent extends HabitDetailEvent{
  HabitUpdateEvent({required this.habitModel});

  final HabitModel habitModel;

  @override
  List<Object?> get props => [habitModel];

}
