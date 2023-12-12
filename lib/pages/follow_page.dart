import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:habit_tracker/utils/widgets.dart';

@RoutePage()
class FollowPage extends StatefulWidget {
  const FollowPage({super.key});

  @override
  State<FollowPage> createState() => _FollowPageState();
}

class _FollowPageState extends State<FollowPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar("Подписки"),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          nameFollow(
            "Terc",
          ),
          // GridView.count(
          //   // Create a grid with 2 columns. If you change the scrollDirection to
          //   // horizontal, this produces 2 rows.
          //   crossAxisCount: 2,
          //   // Generate 100 widgets that display their index in the List.
          //   children: List.generate(100, (index) {
          //     return habitMain("😀", "Вставать в 6 утра", "Рекорд - 9 дней", "Попыток - 1",
          //         "5/14", () {});
          //   }),
          // ),
        ],
      ),
    );
  }
}
