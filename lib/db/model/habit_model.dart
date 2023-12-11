import 'dart:core';

import 'package:floor/floor.dart';

@entity
class HabitModel {
  @PrimaryKey(autoGenerate: true)
  final int? id;
  final String category;
  final String title;
  final String icon;
  final int allDays;
  final int currentDay;
  final String history;
  final int attempts;
  final String record;
  final String fbName;
  // final DateTime startDate;
  // final DateTime endDate;

  HabitModel(this.id,
      this.category,
      this.title,
      this.icon,
      this.allDays,
      this.currentDay,
      this.history,
      this.attempts,
      this.record,
      this.fbName,
      // this.startDate,
      // this.endDate
      );
}
