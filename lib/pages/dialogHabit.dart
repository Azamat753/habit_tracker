import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:habit_tracker/utils/widgets.dart';

import '../utils/ext.dart';
import 'habit_detail_page.dart';

class ShowBottomSheet extends StatefulWidget {
  const ShowBottomSheet({super.key});

  @override
  State<ShowBottomSheet> createState() => _ShowBottomSheet();
}

class _ShowBottomSheet extends State<ShowBottomSheet> {
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
              AutoRoute(page : HabitDetailPage);
              /*Navigator.of(context)
                  .push(createRoute(HabitDetailPage()));*/
            }),
          ],
        ),
      ),
    );
  }
}