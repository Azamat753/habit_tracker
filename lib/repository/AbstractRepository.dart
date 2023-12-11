import 'package:habit_tracker/db/model/habit_model.dart';

abstract class AbstractRepository {
  Future<List<HabitModel>> getHabitList();


  Future<void> addHabit(HabitModel habitModel);

  Future<void> deleteHabit(HabitModel habitModel);
}
