import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:habit_tracker/utils/widgets.dart';

@RoutePage()
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
        body: Column(
          children: [
            SizedBox(height: 10.h,),
            buttonSettings("ПОДЕЛИТСЯ КОДОМ",(){}),
            buttonSettings("СМЕНИТЬ ЯЗЫК",(){}),
            buttonSettings("ПОМЕНЯТЬ ТЕМУ",(){}),
            buttonSettings("МОЙ КОД",(){}),
            buttonSettings("СИНХРОНИЗИРОВАТСЯ",(){}),
            buttonSettings("ВЫЙТИ С АККАУНТА",(){}),
          ],
        ),
    );
  }
}






