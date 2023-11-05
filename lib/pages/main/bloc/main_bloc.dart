import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:habit_tracker/db/model/habit_model.dart';
import 'package:habit_tracker/repositury/AbstractRepository.dart';
import 'package:meta/meta.dart';

part 'main_event.dart';

part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc(this.repository) : super(MainInitial()) {
    on<LoadHabitList>((event, emit) async {
      try {
        if (state is! HabitListLoaded) {
          emit(HabitListLoading());
        }
        final coinsList = await repository.getHabitList();
        emit((HabitListLoaded(habitList: coinsList)));
      } catch (e) {
        emit((HabitListLoadingError(exception: e)));
      }
    });
  }

  final AbstractRepository repository;
}
