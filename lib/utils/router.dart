import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:habit_tracker/pages/dialog/dialogHabit.dart';
import 'package:habit_tracker/pages/follow_page.dart';
import 'package:habit_tracker/pages/detail/habit_detail_page.dart';
import 'package:habit_tracker/pages/main/main_page.dart';
import 'package:habit_tracker/pages/settings_page.dart';
import 'package:habit_tracker/pages/bottom_nav_page.dart';

import '../db/model/habit_model.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: BottomNavRoute.page,initial: true,
        children: [
          AutoRoute(page: MainRoute.page, ),
          AutoRoute(page: FollowRoute.page,),
          AutoRoute(page: SettingRoute.page,),
        ]),

        AutoRoute(page: HabitDetailRoute.page),
        AutoRoute(page: ShowBottomSheetRoute.page),
      ];
}

// @MaterialAutoRouter(
//   replaceInRouteName: 'Page,Route',
//   routes: [
//     AutoRoute(
//       page: BottomNavPage,
//       initial: true,
//       children: [
//         AutoRoute(page: MainPage, initial: true),
//         AutoRoute(page: FollowPage),
//         AutoRoute(page: SettingPage),
//       ],
//     ),
//     AutoRoute(page: HabitDetailPage),
//     AutoRoute(page: ShowBottomSheet)
//   ],
// )
// class $AppRouter {}
