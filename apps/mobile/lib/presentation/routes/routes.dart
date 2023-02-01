import 'package:core/widgets/errors/page_not_found_widget.dart';
import 'package:flutter/material.dart';
import '../features/home/home_screen.dart';
import '../init.dart';

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey();

class Routes {
  static const String root = '/';
  static const String home = '/home';

  static Map<String, WidgetBuilder?> _getMaterialPage(RouteSettings settings) =>
      {
        root: (context) {
          return const AppInit();
        },
        home: (context) {
          return const HomeScreen();
        }
      };

  static Map<String, RoutePageBuilder?> _getPage(RouteSettings settings) => {
        // root: (context, animation, secondaryAnimation) => Container(),
      };

  static MaterialPageRoute _undefinePage(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (context) {
        return const PageNotFoundScreen();
      },
      settings: settings,
    );
  }

  static Route generateRoute(RouteSettings settings) {
    final slideBuilder = _getPage(settings)[settings.name];

    if (slideBuilder != null) {
      return SlideTransitionRoute(builder: slideBuilder, settings: settings);
    }

    final builder = _getMaterialPage(settings)[settings.name];

    if (builder != null) {
      return MaterialPageRoute(
        builder: builder,
        settings: settings,
      );
    }

    return _undefinePage(settings);
  }
}

class SlideTransitionRoute extends PageRouteBuilder {
  final RoutePageBuilder builder;

  @override
  RouteSettings settings;

  SlideTransitionRoute({required this.builder, required this.settings})
      : super(
          settings: settings,
          pageBuilder: builder,
          transitionDuration: const Duration(milliseconds: 200),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(0.0, 1.0);
            const end = Offset.zero;
            const curve = Curves.ease;

            var tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
        );
}

class FadedTransitionRoute extends PageRouteBuilder {
  final Widget widget;
  @override
  final RouteSettings settings;

  FadedTransitionRoute({required this.widget, required this.settings})
      : super(
          settings: settings,
          pageBuilder: (BuildContext context, Animation<double> animation,
              Animation<double> secondaryAnimation) {
            return widget;
          },
          transitionDuration: const Duration(milliseconds: 100),
          transitionsBuilder: (BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
              Widget child) {
            return FadeTransition(
              opacity: CurvedAnimation(
                parent: animation,
                curve: Curves.easeOut,
              ),
              child: child,
            );
          },
        );
}
