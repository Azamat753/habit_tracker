import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:habit_tracker/utils/widgets.dart';
import '../../db/dao/habit_dao.dart';
import '../../repositury/AbstractRepository.dart';
import '../../utils/ext.dart';
import '../dialog/dialogHabit.dart';
import '../habit_detail_page.dart';
import 'bloc/main_bloc.dart';

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
    print(habitDao.getAllData());
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
            print('object');
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
                      final coin = state.habitList[i];
                      return habitMain(
                        coin.icon,
                        coin.title,
                        coin.record,
                        coin.attempts,
                        coin.currentDay,
                        () {
                          Navigator.of(context)
                              .push(createRoute(HabitDetailPage()));
                        },
                      );
                    },
                  ),
                  circleButton(
                      () => showBottomDetailDialog(context, ShowBottomSheet()))
                ],
              ),
            );
          }
          if (state is HabitListLoadingError) {
            return Text("${state.exception}");
          }
          return Center(
              child: Text(
            "Error",
            style: TextStyle(fontSize: 100),
          ));
        },
      ),
    ));
  }
}
