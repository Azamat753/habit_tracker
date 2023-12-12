part of 'habit_detail_bloc.dart';

@immutable
abstract class HabitDetailState extends Equatable {
  @override
  List<Object?> get props => [];
}

class HabitDetailInitial extends HabitDetailState {}

class HabitUpdateSucsesState extends HabitDetailState {
  // HabitUpdateSucsesState({required this.habitModel});
  //
  // final HabitModel habitModel;
  //
  // @override
  // List<Object?> get props => super.props..add(habitModel);
}

class HabitUpdateLoadingState extends HabitDetailState {}

class HabitUpdateFailureState extends HabitDetailState {
  HabitUpdateFailureState({required this.exception});

  final Object exception;

  @override
  List<Object?> get props => super.props..add(exception);
}
