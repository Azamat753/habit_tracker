import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:habit_tracker/db/model/habit_model.dart';
import 'package:habit_tracker/pages/detail/bloc/habit_detail_bloc.dart';
import 'package:habit_tracker/repository/AbstractRepository.dart';
import 'package:habit_tracker/resources/color_res.dart';
import 'package:habit_tracker/resources/text_style.dart';
import 'package:habit_tracker/utils/widgets.dart';
import 'cubit/habit_detail_cubit.dart';

@RoutePage()
class HabitDetailPage extends StatefulWidget {
  const HabitDetailPage({super.key, required this.habitModel});

  final HabitModel habitModel;

  @override
  State<HabitDetailPage> createState() => _HabitDetailPageState();
}

class _HabitDetailPageState extends State<HabitDetailPage> {
  List<String> dateTime = [
    '${DateTime.now()}',
  ];

  final _detailCubit = HabitDetailCubit(GetIt.I<AbstractRepository>());
  final _detailBloc = HabitDetailBloc(GetIt.I<AbstractRepository>());

  @override
  void initState() {
    // updateData('date');
    _detailBloc.add(HabitUpdateEvent(habitModel: widget.habitModel));
//    _detailCubit.updateHabit(widget.habitModel);
    super.initState();
  }

  void updateData(String date) {
    setState(() {});
    _detailBloc.add(HabitUpdateEvent(habitModel: HabitModel(
        widget.habitModel.id,
        widget.habitModel.category,
        'Bloc',
        widget.habitModel.icon,
        widget.habitModel.allDays,
        widget.habitModel.currentDay,
        date,
        //history
        widget.habitModel.attempts,
        widget.habitModel.record,
        widget.habitModel.fbName)));
  }

  void addRecovery() {
    setState(() {
      dateTime.add('${DateTime.now()}');
    });
  }

  void removeRecovery(int index) {
    setState(() {
      dateTime.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return
      // BlocProvider(
      // create: (context) => _detailCubit,
      // child: BlocBuilder<HabitDetailCubit, HabitDetailState>(
      //   builder: (context, state) {
      //     if (state is Update) {
      //       return
      BlocBuilder<HabitDetailBloc, HabitsDetailState>(
        bloc: _detailBloc,
        builder: (context, state) {
          if (state is HabitUpdateState) {
            return
              Scaffold(
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
                        addRecovery();
                        updateData('${DateTime.now()}');
                        _detailBloc.add(
                            HabitUpdateEvent(habitModel: widget.habitModel));
                      }),
                      buildRecordText("Попытка - ${widget.habitModel.attempts}",
                          "Рекорд - ${widget.habitModel.record}"),
                      Padding(
                        padding: const EdgeInsets.only(left: 18),
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
                      Expanded(
                        child: ListView.separated(
                          physics: const BouncingScrollPhysics(),
                          separatorBuilder: (context, index) => Container(),
                          itemCount: dateTime.length,
                          itemBuilder: (BuildContext context, int index) {
                            return buildHistoryText(dateTime[index], () {
                              removeRecovery(index);
                            });
                          },
                        ),

                      )
                    ]
                ),
              );
          }
          if (state is HabitUpdateErrorState) {
            return Center(child: Text('${state.exception}'),);
          }
          return const Center(child: Text("Center"),);
        },);
//   if (state is Error) {
//     return Center(child: Text('${state.exception}'));
//   }
//   return const Text("Что то другое");
// },
// ),
//);
//}
  }
}