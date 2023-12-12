import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:habit_tracker/db/model/habit_model.dart';
import 'package:habit_tracker/repository/AbstractRepository.dart';
import 'package:meta/meta.dart';

part 'habit_detail_event.dart';

part 'habit_detail_state.dart';

class HabitDetailBloc extends Bloc<HabitDetailEvent, HabitDetailState> {
  HabitDetailBloc(this.repository) : super(HabitDetailInitial()) {
    on<UpdateHabitEvent>((event, emit) async {
      try {
        if(state is! HabitUpdateSucsesState){
          emit(HabitUpdateLoadingState());
        }

        await repository.updateHabit(event.habitModel);
        emit(HabitUpdateSucsesState());
      } catch (e) {
        HabitUpdateFailureState(exception: e);
      }
    });
  }

  final AbstractRepository repository;
}
