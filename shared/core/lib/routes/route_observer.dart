part of 'routes.dart';

class MyRouteObserver extends RouteObserver<PageRoute<dynamic>> {
  void _sendScreenView(PageRoute<dynamic> route) {
    //final screenName = route.settings.name;
    //printLog('[ROUTE OBSERVER] screenName $screenName');
    // do something with it, ie. send it to your analytics service collector
  }

  @override
  void didPush(Route route, Route? previousRoute) {
    super.didPush(route, previousRoute);
    if (route is PageRoute) {
      _sendScreenView(route);
      printLog('[ROUTE OBSERVER] didPush screenName ${route.settings.name}');
    }
  }

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    if (newRoute is PageRoute) {
      _sendScreenView(newRoute);
      printLog(
          '[ROUTE OBSERVER] didReplace new screenName ${newRoute.settings.name}');
    }
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    super.didPop(route, previousRoute);
    if (previousRoute is PageRoute && route is PageRoute) {
      _sendScreenView(route);
      printLog('[ROUTE OBSERVER] didPop screenName ${route.settings.name}');
    }
  }
}
