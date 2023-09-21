import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:loggy/loggy.dart';

class RouterObserver extends AutoRouterObserver {
  @override
  void didPush(Route route, Route? previousRoute) {
    logDebug("ROUTE_PUSHED: ${route.settings.name}");
  }

  @override
  void didInitTabRoute(TabPageRoute route, TabPageRoute? previousRoute) {
    logDebug("TAB_ROUTE_VISITED: ${route.name}");
  }

  @override
  void didChangeTabRoute(TabPageRoute route, TabPageRoute previousRoute) {
    logDebug("TAB_ROUTE_RE-VISITED: ${route.name}");
  }
}
