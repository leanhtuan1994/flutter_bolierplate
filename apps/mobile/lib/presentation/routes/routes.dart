import 'package:core/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/presentation/features/home/home_screen.dart';

part 'route_list.dart';

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey();

final GoRouter router = GoRouter(
  navigatorKey: rootNavigatorKey,
  initialLocation: RouteList.root,
  routes: <RouteBase>[
    GoRoute(
      path: RouteList.root,
      builder: (context, state) {
        return const HomeScreen();
      },
    ),
  ],
  observers: [
    MyRouteObserver(),
  ],
);
