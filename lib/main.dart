import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:habit_tracker/db/appdatabase.dart';
import 'package:habit_tracker/repository/AbstractRepository.dart';
import 'package:habit_tracker/repository/repository.dart';
import 'package:habit_tracker/resources/color_res.dart';
import 'package:habit_tracker/utils/general_bloc_observable.dart';
import 'package:loggy/loggy.dart';
import 'db/dao/habit_dao.dart';
import 'di/di.dart';
import 'utils/router.dart';

void setupLocator() {
  GetIt.instance.registerSingletonAsync<AppDatabase>(() async {
    final database =
        await $FloorAppDatabase.databaseBuilder('app_database.db').build();
    return database;
  });

  GetIt.instance
      .registerLazySingleton<HabitDao>(() => GetIt.instance<AppDatabase>().dao);
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();

  GetIt.I.registerLazySingleton<AbstractRepository>(() => Repository());

  await ScreenUtil.ensureScreenSize();
  Loggy.initLoggy(logPrinter: const PrettyPrinter());
  Bloc.observer = GeneralBlocObservable();
  locator.registerLazySingleton(() => AppRouter());
//  final database = await FloorDatabase.databaseBuilder('app_database.db').build();
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _appRouter = locator<AppRouter>();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ScreenUtilInit(builder: ((context, child) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerConfig: _appRouter.config(),
         // routeInformationParser: _appRouter.defaultRouteParser(),
        //  routerDelegate: _appRouter.delegate(
        //     navigatorObservers: () => [RouterObserver()],
        //   ),
          theme: ThemeData(
            colorScheme:
                ThemeData().colorScheme.copyWith(primary: ColorRes.white),
          ),
        );
      })),
    );
  }
}
