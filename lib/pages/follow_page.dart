import 'package:flutter/material.dart';
import 'package:habit_tracker/utils/widgets.dart';

class FollowPage extends StatefulWidget {
  const FollowPage({super.key});

  @override
  State<FollowPage> createState() => _FollowPageState();
}

class _FollowPageState extends State<FollowPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(appBar:buildAppBar("Подписки") ,);
  }
}
