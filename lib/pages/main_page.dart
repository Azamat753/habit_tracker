import 'package:flutter/material.dart';
import 'package:habit_tracker/utils/widgets.dart';

import '../resources/color_res.dart';

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
              Positioned(
                right: 1,
                bottom: 1,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: FloatingActionButton(
                    backgroundColor: ColorRes.white,
                    onPressed: () {
                      // _showCreateCategoryDialog(context);
                    },
                    child: Icon(
                      Icons.add,
                      color: ColorRes.lightBlue,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
