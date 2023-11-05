import 'package:auto_route/auto_route.dart';
import 'package:habit_tracker/pages/follow_page.dart';
import 'package:habit_tracker/pages/habit_detail_page.dart';
import 'package:habit_tracker/pages/main/main_page.dart';
import 'package:habit_tracker/pages/settings_page.dart';

import '../pages/bottom_nav_page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: [
    AutoRoute(
      page: BottomNavPage,initial: true,
      children: [
        AutoRoute(page: MainPage, initial: true),
        AutoRoute(page: FollowPage),
        AutoRoute(page: SettingPage),
      ],
    ),
    AutoRoute(page: HabitDetailPage)
  ],
)
class $AppRouter {}
