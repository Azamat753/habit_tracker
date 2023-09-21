import 'package:floor/floor.dart';
import 'dao/habit_dao.dart';
import 'model/habit_model.dart';

@Database(version:1,entities : [HabitModel])
abstract class AppDataBase extends FloorDatabase {
  HabitDao get dao;
}
