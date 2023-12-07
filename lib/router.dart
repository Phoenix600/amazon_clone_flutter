import 'package:amazonclone/common/widgets/bottom_bar.dart';
import 'package:amazonclone/errors/screen_does_not_exists.dart';
import 'package:amazonclone/features/auth/screen/auth_screen.dart';
import 'package:amazonclone/features/home/screen/home_screen.dart';
import 'package:flutter/material.dart';

Route<Widget> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case AuthScreen.routeName:
      return MaterialPageRoute(builder: (context) => const AuthScreen());
    case HomeScreen.routeName:
      return MaterialPageRoute(builder: (context) => const HomeScreen());
    case BottomBar.routeName:
      return MaterialPageRoute(builder: (context) => const BottomBar());
    default:
      return MaterialPageRoute(
          builder: (context) => const ScreenDoesNotExists());
  }
}
