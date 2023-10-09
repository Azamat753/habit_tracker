import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:habit_tracker/resources/color_res.dart';
import 'package:habit_tracker/resources/text_style.dart';
import 'package:habit_tracker/utils/widgets.dart';

class HabitDetailPage extends StatefulWidget {
  const HabitDetailPage({super.key});

  @override
  State<HabitDetailPage> createState() => _HabitDetailPageState();
}

class _HabitDetailPageState extends State<HabitDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBarWithBack("Детали", () {
        Navigator.pop(context);
      }, "Ибрахим"),
      body: Column(
        children: [
          SizedBox(height: 28.h,),
          Center(child: emojiDetail("😂", 3.5, 50),),
          SizedBox(height: 16.h,),
          timerDetail(),
          buttonDetail("Рецидив"),
          buildRecordText("Попытка - 5", "Рекорд - 9 дней"),
          Padding(
            padding: EdgeInsets.only(left: 18),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "История",
                style: TextStyleMedium(
                  color: ColorRes.dark,
                  fontSize: 18.sp,
                ),
              ),
            ),
          ),
          buildHistoryText("15 января 2023 г. 16:30")
        ],
      ),
    );
  }
}
