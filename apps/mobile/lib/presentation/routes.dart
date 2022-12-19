import 'package:core/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey();

final GoRouter router = GoRouter(
  navigatorKey: rootNavigatorKey,
  routes: <RouteBase>[
    GoRoute(
      path: "/",
      builder: (context, state) {
        return Container();
      },
    ),
  ],
  observers: [
    MyRouteObserver(),
  ],
);
