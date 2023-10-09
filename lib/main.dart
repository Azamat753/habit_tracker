import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:habit_tracker/resources/color_res.dart';
import 'package:habit_tracker/utils/general_bloc_observable.dart';
import 'package:habit_tracker/utils/router.gr.dart';
import 'package:habit_tracker/utils/router_observer.dart';
import 'package:loggy/loggy.dart';
import 'di/di.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();

  await ScreenUtil.ensureScreenSize();
  Loggy.initLoggy(logPrinter: const PrettyPrinter());
  Bloc.observer = GeneralBlocObservable();
  locator.registerLazySingleton(() => AppRouter());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final _appRouter = locator<AppRouter>();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ScreenUtilInit(builder: ((context,child){
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routeInformationParser: _appRouter.defaultRouteParser(),
          routerDelegate: _appRouter.delegate(navigatorObservers: () => [RouterObserver()],),
          theme: ThemeData(
            colorScheme:
            ThemeData().colorScheme.copyWith(primary: ColorRes.white),
          ),
        );
      })),
    );
  }
}

String name(){
  return "";
}
