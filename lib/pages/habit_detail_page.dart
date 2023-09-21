import 'package:flutter/material.dart';
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
      appBar: buildAppBar("Детали"),
    );
  }
}
