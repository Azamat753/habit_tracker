import 'package:floor/floor.dart';
import 'package:habit_tracker/db/model/habit_model.dart';
@dao
abstract class HabitDao {

  @Query("SELECT * FROM HabitModel")
  Future<List<HabitModel>> getAllData();

  @Insert()
  Future<void> insert(HabitModel model);

  @delete
  Future<void> deleteHabit(HabitModel model);

  @update
  Future<void> updateHabit(HabitModel model);

}