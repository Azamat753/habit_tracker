import 'package:get_it/get_it.dart';
import 'package:habit_tracker/db/appdatabase.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../db/dao/habit_dao.dart';
import '../utils/router.dart';
import 'di.config.dart';


final locator = GetIt.instance;

@InjectableInit()
Future<void> configureDependencies() async => $initGetIt(locator);

@module
abstract class AppModule {

  @injectable
  AppRouter get appRouter => AppRouter();

  void setupLocator() {
    GetIt.instance.registerSingletonAsync<AppDatabase>(() async {
      final database = await $FloorAppDatabase.databaseBuilder('app_database.db').build();
      return database;
    });

    GetIt.instance.registerLazySingleton<HabitDao>(() => GetIt.instance<AppDatabase>().dao);
  }
  @injectable
  Future<void> initSharedPreference() async => SharedPreferences.getInstance();

}