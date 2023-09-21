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
    return  Scaffold(appBar: buildAppBar("Настройки"),);
  }
}
