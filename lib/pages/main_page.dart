import 'package:flutter/material.dart';
import 'package:habit_tracker/utils/widgets.dart';
import '../utils/ext.dart';
import 'dialogHabit.dart';
import 'habit_detail_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: buildAppBar("Главная"),
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              habitMain("😀", "Вставать в 6 утра", "Рекорд - 9 дней",
                  "Попыток - 1", "5/14", () {
                Navigator.of(context).push(createRoute(HabitDetailPage()));
              }),
              circleButton(
                  () => showBottomDetailDialog(context, ShowBottomSheet()))
            ],
          ),
        ),
      ),
    );
  }
}
