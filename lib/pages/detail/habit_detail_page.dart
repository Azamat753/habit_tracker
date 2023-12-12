import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:habit_tracker/db/model/habit_model.dart';
import 'package:habit_tracker/repository/AbstractRepository.dart';
import 'package:habit_tracker/resources/color_res.dart';
import 'package:habit_tracker/resources/text_style.dart';
import 'package:habit_tracker/utils/widgets.dart';

import 'bloc/habit_detail_bloc.dart';

@RoutePage()
class HabitDetailPage extends StatefulWidget {
  const HabitDetailPage({super.key, required this.habitModel});

  final HabitModel habitModel;

  @override
  State<HabitDetailPage> createState() => _HabitDetailPageState();
}

class _HabitDetailPageState extends State<HabitDetailPage> {
  List<String> history = [
    'asfdasd',
    'asfdasd',
    'asfdasd',
    'asfdasd',
    'asfdasd',
    'asfdasd',
    'asfdasd',
  ];
  final _detailBloc = HabitDetailBloc(GetIt.I<AbstractRepository>());

  // void addDatas(String name, String icon) async {
  //   // Получаем текущий объект HabitModel из базы данных
  //   HabitModel existingHabit = await getHabitFromDatabase();
  //
  //   // Получаем текущий список элементов из поля history
  //   List<String> currentHistoryList = existingHabit.historyListFromJson;
  //
  //   // Добавляем новый элемент в список
  //   currentHistoryList.add("Новый элемент");
  //
  //   // Обновляем поле history с новым списком элементов
  //   existingHabit.history = existingHabit.historyListToJson;
  //
  //   // Добавляем обновленный объект HabitModel в базу данных
  //   _dialogBloc.add(DialogAddHabitEvent(habitModel: existingHabit));
  // }
  //
  // Future<HabitModel> getHabitFromDatabase() async {
  //   // Здесь вы должны использовать свой собственный метод для получения объекта из базы данных
  //   // Например, использовать Floor для выполнения запроса к базе данных и получения объекта HabitModel
  //   // Предположим, что у вас есть метод getHabitById, принимающий идентификатор и возвращающий HabitModel
  //   // Замените этот код соответствующим методом из вашего приложения
  //
  //   int habitId = 1; // Замените на актуальный идентификатор
  //   return await database.getHabitById(habitId);
  // }
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
          buttonDetail("Рецидив", () {
            history.add("${DateTime.now()}");
            print(history);
            _detailBloc.add(UpdateHabitEvent(habitModel: widget.habitModel));
          }),
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
          SizedBox(
            child: BlocBuilder<HabitDetailBloc, HabitDetailState>(
              bloc: _detailBloc,
              builder: (context, state) {
                if (state is HabitUpdateSucsesState) {
                  return ListView.separated(
                    padding: const EdgeInsets.only(top: 16),
                    itemCount: history.length,
                    physics: const BouncingScrollPhysics(),
                    separatorBuilder: (context, index) => const Divider(),
                    itemBuilder: (context, i) {
                      return buildHistoryText(history[i], () {});
                    },
                  );
                } else if (state is HabitUpdateFailureState) {
                  return Center(
                    child: Text("${state.exception}"),
                  );
                } else if (state is HabitUpdateLoadingState) {
                  return const Center(
                    child: Text(
                      "LOADING",
                      style: TextStyle(fontSize: 30),
                    ),
                  );
                } else {
                  print("Необработанное состояние: $state");
                  return const Center(
                    child: Text("Что то другое"),
                  );
                }
              },
            ),
          ),

          //buildHistoryText("15 января 2023 г. 16:30")
        ],
      ),
      // );
      //}
      //   if (state is HabitUpdateFailureState) {
      //     return Center(
      //       child: Text('${state.exception}'),
      //     );
      //   }
      //   return const Center(child: Text("Закгрузка"));
      // },
    );
  }
}
