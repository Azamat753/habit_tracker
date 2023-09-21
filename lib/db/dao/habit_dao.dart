import 'package:floor/floor.dart';
import 'package:habit_tracker/db/model/habit_model.dart';
@dao
abstract class HabitDao {

  @Query("SELECT * FROM tasks_table WHERE category=:category")
  Future<List<HabitModel>> getAll(String category);

  @Insert()
  Future<void> insert(HabitModel model);
}