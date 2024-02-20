import 'package:flutter/material.dart';
import 'package:klassrum/ui/screens/call_room.dart';
import 'package:klassrum/ui/screens/course_details.dart';
import 'package:klassrum/ui/screens/home.dart';
import 'package:klassrum/ui/screens/login.dart';
import 'package:klassrum/ui/screens/notification.dart';
import 'package:klassrum/ui/screens/settings.dart';
import 'package:klassrum/ui/screens/splash.dart';
import 'package:klassrum/ui/screens/unknown.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case '/login':
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case '/home':
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case '/notifications':
        return MaterialPageRoute(builder: (_) => const NotificationScreen());
      case '/course-details':
        return MaterialPageRoute(builder: (_) => const CourseDetailsScreen());
      case '/call-room':
        return MaterialPageRoute(
            builder: (_) => const CallRoomScreen(
                  title: 'Session de cours',
                ));
      case '/settings':
        return MaterialPageRoute(builder: (_) => const SettingScreen());
      default:
        return MaterialPageRoute(builder: (_) => const UnknownScreen());
    }
  }
}
