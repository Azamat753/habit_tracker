import 'package:get_it/get_it.dart';
import 'package:habit_tracker/db/appdatabase.dart';
import 'package:habit_tracker/db/dao/habit_dao.dart';
import 'package:habit_tracker/db/model/habit_model.dart';
import 'package:habit_tracker/repositury/AbstractRepository.dart';

class Repository implements AbstractRepository {
  final habitDao = GetIt.instance<HabitDao>();

  @override
  Future<void> addHabit(HabitModel habitModel) async {
    habitDao.insert(habitModel);
  }

  @override
  Future<List<HabitModel>> getHabitList() async {
    return await habitDao.getAllData();
  }
}
