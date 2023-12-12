import 'package:get_it/get_it.dart';
import 'package:habit_tracker/db/dao/habit_dao.dart';
import 'package:habit_tracker/db/model/habit_model.dart';
import 'package:habit_tracker/repository/AbstractRepository.dart';

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

  @override
  Future<void> deleteHabit(HabitModel habitModel) async {
    habitDao.deleteHabit(habitModel);
  }

  @override
  Future<void> updateHabit(HabitModel habitModel) async {
    habitDao.updateHabit(habitModel);
  }

}
