import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:habit_tracker/db/model/habit_model.dart';
import 'package:habit_tracker/resources/color_res.dart';
import 'package:habit_tracker/resources/text_style.dart';
import 'package:habit_tracker/utils/widgets.dart';

@RoutePage()
class HabitDetailPage extends StatefulWidget {
  const HabitDetailPage({super.key, required this.habitModel});

  final HabitModel habitModel;

  @override
  State<HabitDetailPage> createState() => _HabitDetailPageState();
}

class _HabitDetailPageState extends State<HabitDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBarWithBack(widget.habitModel.title, () {
        Navigator.pop(context);
      }, "Ибрахим"),
      body: Column(
        children: [
          SizedBox(
            height: 28.h,
          ),
          Center(
            child: emojiDetail(widget.habitModel.icon, 3.5, 50),
          ),
          SizedBox(
            height: 16.h,
          ),
          timerDetail(),
          buttonDetail("Рецидив", () {}),
          buildRecordText("Попытка - ${widget.habitModel.attempts}",
              "Рекорд - ${widget.habitModel.record}"),
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
          buildHistoryText('${DateTime.timestamp()}',(){})
          //buildHistoryText("15 января 2023 г. 16:30")
        ],
      ),
    );
  }
}
