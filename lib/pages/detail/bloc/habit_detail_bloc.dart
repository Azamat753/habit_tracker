import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:habit_tracker/db/model/habit_model.dart';
import 'package:habit_tracker/repository/AbstractRepository.dart';
import 'package:meta/meta.dart';

part 'habit_detail_event.dart';

part 'habits_detail_state.dart';

class HabitDetailBloc extends Bloc<HabitDetailEvent, HabitsDetailState> {
  HabitDetailBloc(this.repository) : super(HabitDetailInitial()) {
    on<HabitUpdateEvent>((event, emit) async {
      try {
        await repository.updateHabit(event.habitModel);
        emit(HabitUpdateState());
      } catch (e) {
        emit(HabitUpdateErrorState(exception: e));
      }
    });
  }

  final AbstractRepository repository;
}
