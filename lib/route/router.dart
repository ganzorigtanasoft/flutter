import 'package:flutter/material.dart';
import 'package:mobile_habido_v2/global/coming_soon_route.dart';
import 'package:mobile_habido_v2/ui/auth/login_intro.dart';
import 'package:mobile_habido_v2/ui/auth/register/create_phone_screen.dart';
import 'package:swipeable_page_route/swipeable_page_route.dart';

import 'route_transitions.dart';

class Routes {
  Routes() : routeObserver = RouteObserver<PageRoute>();

  /// Route Observer
  final RouteObserver<PageRoute> routeObserver;

  /// Route list
  static const comingSoon = 'comingSoon';
  static const splash = 'splash';
  static const intro = 'intro';
  static const loginIntro = '/loginIntro';
  static const createPhone = '/createPhone';

  static const testRoute = 'testRoute';

  /// Routing
  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    Route<dynamic> route;
    Map<dynamic, dynamic>? args;
    if (settings.arguments != null) args = settings.arguments as Map;

    switch (settings.name) {
      // case Routes.splash:
      //   route = NoTransitionRoute(IntroRoute(), settings);
      //   break;

      // case Routes.intro:
      //   route = FadeRouteBuilder(IntroRoute(), settings);
      //   break;

      case Routes.loginIntro:
        route = PageRouteBuilder(
          transitionDuration: Duration(milliseconds: 1600),
          pageBuilder: (_, __, ___) => LoginIntroScreen(),
        );
        break;

      case Routes.createPhone:
        return SwipeablePageRoute(
          builder: (context) {
            return CreatePhoneScreen();
          },
          settings: settings,
          transitionDuration: const Duration(milliseconds: 200),
          canOnlySwipeFromEdge: true,
        );

      default:
        route = NoTransitionRoute(ComingSoonRoute(), settings);
        break;
    }

    return route;
  }

  _getValueByKey(Map<dynamic, dynamic>? args, String key) {
    try {
      return args != null ? args[key] : null;
    } catch (e) {
      print(e);
    }

    return null;
  }
}
