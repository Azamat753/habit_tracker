import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:habit_tracker/db/model/habit_model.dart';
import 'package:habit_tracker/repository/AbstractRepository.dart';

part 'habit_detail_state.dart';
part 'habit_detail_cubit.freezed.dart';

class HabitDetailCubit extends Cubit<HabitDetailState> {
  HabitDetailCubit(this.repository) : super(const HabitDetailState.initial());

  Future<void> updateHabit(HabitModel habitModel) async {
    repository.updateHabit(habitModel);
    emit(const Update());
  }

  final AbstractRepository repository;
}
