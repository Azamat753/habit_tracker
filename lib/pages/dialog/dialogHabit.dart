import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:habit_tracker/db/dao/habit_dao.dart';
import 'package:habit_tracker/db/model/habit_model.dart';
import 'package:habit_tracker/utils/widgets.dart';

import '../../utils/ext.dart';
import '../habit_detail_page.dart';



class ShowBottomSheet extends StatefulWidget {
  const ShowBottomSheet({super.key});


  @override
  State<ShowBottomSheet> createState() => _ShowBottomSheet();
}

class _ShowBottomSheet extends State<ShowBottomSheet> {

  final habitDao = GetIt.instance<HabitDao>();
  @override
  void initState() {
    habitDao.insert(HabitModel(1, "category", "title", "icon", 3, 1, "history", 2, "21", 'fbName'));
    habitDao.insert(HabitModel(2, "category", "title", "icon", 3, 1, "history", 2, "21", 'fbName'));
    habitDao.insert(HabitModel(3, "category", "title", "icon", 3, 1, "history", 2, "21", 'fbName'));
    habitDao.insert(HabitModel(4, "category", "title", "icon", 3, 1, "history", 2, "21", 'fbName'));
    habitDao.insert(HabitModel(5, "category", "title", "icon", 3, 1, "history", 2, "21", 'fbName'));
    habitDao.insert(HabitModel(6, "category", "title", "icon", 3, 1, "history", 2, "21", 'fbName'));
    habitDao.insert(HabitModel(7, "category", "title", "icon", 3, 1, "history", 2, "21", 'fbName'));
    habitDao.insert(HabitModel(8, "category", "title", "icon", 3, 1, "history", 2, "21", 'fbName'));
    habitDao.insert(HabitModel(9, "category", "title", "icon", 3, 1, "history", 2, "21", 'fbName'));
    habitDao.insert(HabitModel(0, "category", "title", "icon", 3, 1, "history", 2, "21", 'fbName'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: IntrinsicHeight(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            newHabit(),
            editDialog(),
            editEmojiDialog(),
            buttonDialog("Создать",(){
              Navigator.pop(context);
              Navigator.of(context).push(createRoute(const HabitDetailPage()));
            }),
          ],
        ),
      ),
    );
  }
}