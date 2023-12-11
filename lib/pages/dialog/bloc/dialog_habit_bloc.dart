import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:habit_tracker/db/model/habit_model.dart';
import 'package:habit_tracker/repository/AbstractRepository.dart';
import 'package:meta/meta.dart';

part 'dialog_habit_event.dart';

part 'dialog_habit_state.dart';

class DialogHabitBloc extends Bloc<DialogHabitEvent, DialogHabitState> {
  DialogHabitBloc(this.repository) : super(DialogHabitInitial()) {
    on<DialogAddHabitEvent>((event, emit) async {
      try {
        if (state is! DialogLoadedState) {
          emit(DialogLoadingState());
        }

        await repository.addHabit(event.habitModel);
        emit(DialogLoadedState());
      } catch (e) {
        emit(DialogLoadedFailure(e));
      }
    });
  }

  final AbstractRepository repository;
}
