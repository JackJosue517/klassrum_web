import 'package:flutter/material.dart';
import 'package:klassrum_web/ui/pages/ressource_page.dart';
import 'package:klassrum_web/ui/pages/cours_page.dart';
import 'package:klassrum_web/ui/screens/call_room.dart';
import 'package:klassrum_web/ui/screens/home.dart';
import 'package:klassrum_web/ui/pages/login.dart';
import 'package:klassrum_web/ui/screens/notifications.dart';
import 'package:klassrum_web/ui/screens/unknown.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case '/login':
        return MaterialPageRoute(builder: (_) => const LoginPage());
      case '/notifications':
        return MaterialPageRoute(builder: (_) => const NotificationScreen());
      case '/call-room':
        return MaterialPageRoute(builder: (_) => const CallRoomScreen());
      case '/course':
        return MaterialPageRoute(builder: (_) => const CoursPage());
      case '/ressourse':
        return MaterialPageRoute(builder: (_) => const RessourcePage());
      default:
        return MaterialPageRoute(builder: (_) => const UnknownScreen());
    }
  }
}
