// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/material.dart' as _i7;

import '../pages/bottom_nav_page.dart' as _i1;
import '../pages/follow_page.dart' as _i4;
import '../pages/habit_detail_page.dart' as _i2;
import '../pages/main_page.dart' as _i3;
import '../pages/settings_page.dart' as _i5;

class AppRouter extends _i6.RootStackRouter {
  AppRouter([_i7.GlobalKey<_i7.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    BottomNavRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.BottomNavPage(),
      );
    },
    HabitDetailRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.HabitDetailPage(),
      );
    },
    MainRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.MainPage(),
      );
    },
    FollowRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.FollowPage(),
      );
    },
    SettingRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.SettingPage(),
      );
    },
  };

  @override
  List<_i6.RouteConfig> get routes => [
        _i6.RouteConfig(
          BottomNavRoute.name,
          path: '/',
          children: [
            _i6.RouteConfig(
              MainRoute.name,
              path: '',
              parent: BottomNavRoute.name,
            ),
            _i6.RouteConfig(
              FollowRoute.name,
              path: 'follow-page',
              parent: BottomNavRoute.name,
            ),
            _i6.RouteConfig(
              SettingRoute.name,
              path: 'setting-page',
              parent: BottomNavRoute.name,
            ),
          ],
        ),
        _i6.RouteConfig(
          HabitDetailRoute.name,
          path: '/habit-detail-page',
        ),
      ];
}

/// generated route for
/// [_i1.BottomNavPage]
class BottomNavRoute extends _i6.PageRouteInfo<void> {
  const BottomNavRoute({List<_i6.PageRouteInfo>? children})
      : super(
          BottomNavRoute.name,
          path: '/',
          initialChildren: children,
        );

  static const String name = 'BottomNavRoute';
}

/// generated route for
/// [_i2.HabitDetailPage]
class HabitDetailRoute extends _i6.PageRouteInfo<void> {
  const HabitDetailRoute()
      : super(
          HabitDetailRoute.name,
          path: '/habit-detail-page',
        );

  static const String name = 'HabitDetailRoute';
}

/// generated route for
/// [_i3.MainPage]
class MainRoute extends _i6.PageRouteInfo<void> {
  const MainRoute()
      : super(
          MainRoute.name,
          path: '',
        );

  static const String name = 'MainRoute';
}

/// generated route for
/// [_i4.FollowPage]
class FollowRoute extends _i6.PageRouteInfo<void> {
  const FollowRoute()
      : super(
          FollowRoute.name,
          path: 'follow-page',
        );

  static const String name = 'FollowRoute';
}

/// generated route for
/// [_i5.SettingPage]
class SettingRoute extends _i6.PageRouteInfo<void> {
  const SettingRoute()
      : super(
          SettingRoute.name,
          path: 'setting-page',
        );

  static const String name = 'SettingRoute';
}
