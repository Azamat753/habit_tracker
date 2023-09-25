import 'package:flutter/material.dart';
import 'package:habit_tracker/utils/widgets.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar("Настройки"),
      body:  GridView.count(
        crossAxisCount: 2, // Количество колонок в сетке (в данном случае 2)
        children: <Widget>[
          buildHabit("Вставать в 6 утра", "😋", "1 / 21"),

          // Другие элементы сетки добавляются здесь
        ],
      ),
      // Container(
      //   width: 85.0,
      //   height: 85.0,
      //   margin: EdgeInsets.only(left: 14.0, top: 12.0),
      //   child: CircularProgressIndicator(
      //     value: 0.7, // Установите значение прогресса (в данном случае, 70%)
      //     strokeWidth: 8.0, // Ширина линии индикатора
      //     backgroundColor: Colors.grey, // Цвет фона индикатора
      //     valueColor: AlwaysStoppedAnimation<Color>(Colors.blue), // Цвет индикатора прогресса
      //   ),
      // )

    );
  }
}
