import 'package:sqflite/sqflite.dart' as sqflite; // Add this import

import 'dart:async';
import 'package:floor/floor.dart';
import 'dao/habit_dao.dart';
import 'model/habit_model.dart';

part 'appdatabase.g.dart';

@Database(version: 1, entities: [HabitModel])
abstract class AppDatabase extends FloorDatabase {
  HabitDao get dao;
}

// ... rest of your code ...
