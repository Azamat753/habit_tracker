part of 'habit_detail_bloc.dart';

@immutable
abstract class HabitDetailEvent extends Equatable {
  const HabitDetailEvent();

  @override
  List<Object?> get props => [];
}

class UpdateHabitEvent extends HabitDetailEvent {
  const UpdateHabitEvent({required this.habitModel});

  final HabitModel habitModel;

  @override
  List<Object?> get props => super.props..add(habitModel);
}
