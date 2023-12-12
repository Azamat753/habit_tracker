import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:habit_tracker/db/model/habit_model.dart';
import 'package:habit_tracker/repository/AbstractRepository.dart';
import 'package:habit_tracker/utils/widgets.dart';
import '../../utils/router.dart';
import 'bloc/dialog_habit_bloc.dart';

@RoutePage()
class ShowBottomSheet extends StatefulWidget {
  const ShowBottomSheet({super.key, required this.onButtonPressed});
  final VoidCallback onButtonPressed;

  @override
  State<ShowBottomSheet> createState() => _ShowBottomSheet();
}

class _ShowBottomSheet extends State<ShowBottomSheet> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emojiController = TextEditingController();

  final _dialogBloc = DialogHabitBloc(GetIt.I<AbstractRepository>());

  late HabitModel habitModel;

  @override
  void initState() {
    super.initState();
  }

  void addData(String name, String icon) {

    _dialogBloc.add(DialogAddHabitEvent(
        habitModel: habitModel = HabitModel(
            null, "category", name, icon, 0, 0, "history", 0, '', '')));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DialogHabitBloc, DialogHabitState>(
      bloc: _dialogBloc,
      builder: (context, state) {
        if (state is DialogLoadedState) {
          return Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: IntrinsicHeight(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  newHabit(),
                  editDialog(nameController),
                  editEmojiDialog(emojiController),
                  buttonDialog("Создать", () {
                    setState(() {});
                  }),
                ],
              ),
            ),
          );
        } else {
          return Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: IntrinsicHeight(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  newHabit(),
                  editDialog(nameController),
                  editEmojiDialog(emojiController),
                  buttonDialog("Создать", () {
                    setState(() {
                      _dialogBloc.add(DialogAddHabitEvent(
                          habitModel: habitModel= HabitModel(
                              null,
                              "category",
                              nameController.text,
                              emojiController.text,
                              0,
                              0,
                              "history",
                              0,
                              '0',
                              '')));
                      widget.onButtonPressed();
                      // addData(nameController.text, emojiController.text);
                    });
                    Navigator.pop(context);
                    AutoRouter.of(context).push(HabitDetailRoute(habitModel: habitModel));
                    // Navigator.of(context)
                    //     .push(createRoute(HabitDetailPage()));
                  }),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}

void makeGet(Function getList) {
  getList();
}
