import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:habit_tracker/utils/router.dart';
import 'package:habit_tracker/utils/widgets.dart';
import '../../db/dao/habit_dao.dart';
import '../../repository/AbstractRepository.dart';
import '../../utils/ext.dart';
import '../dialog/dialogHabit.dart';
import 'bloc/main_bloc.dart';

@RoutePage()
class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final habitDao = GetIt.instance<HabitDao>();
  final _habitListBloc = MainBloc(GetIt.I<AbstractRepository>());

  @override
  void initState() {
    super.initState();
    _habitListBloc.add(LoadHabitList());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: buildAppBar("Главная"),
      body: BlocBuilder<MainBloc, MainState>(
        bloc: _habitListBloc,
        builder: (context, state) {
          if (state is HabitListLoaded) {
            return SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Stack(
                children: [
                  ListView.separated(
                    padding: const EdgeInsets.only(top: 16),
                    itemCount: state.habitList.length,
                    physics: const BouncingScrollPhysics(),
                    separatorBuilder: (context, index) => const Divider(),
                    itemBuilder: (context, i) {
                      final habit = state.habitList[i];
                      return habitMain(
                        habit.icon,
                        habit.title,
                        habit.record,
                        habit.attempts,
                        habit.currentDay,
                        () {
                          AutoRouter.of(context).push(HabitDetailRoute(habitModel: habit));
                          // Navigator.of(context)
                          //     .push(createRoute(const HabitDetailPage()));
                        },
                        () {
                          showMyDialog(context, () {
                            _habitListBloc.add(DeleteHabit(habitModel: habit));
                            Navigator.of(context).pop();
                          });
                        },
                      );
                    },
                  ),
                  circleButton(
                      () => showBottomDetailDialog(context, ShowBottomSheet(
                            onButtonPressed: () {
                              _habitListBloc.add(LoadHabitList());
                            },
                          )))
                ],
              ),
            );
          }
          if (state is HabitListLoadingError) {
            return Text("${state.exception}");
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    ));
  }
}
