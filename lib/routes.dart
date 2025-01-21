import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:javagem/screens/home_screen.dart';
import 'package:javagem/screens/login_screen.dart';
import 'package:javagem/screens/welcome_screen.dart';
import 'package:javagem/utils/constants.dart';

final GoRouter router = GoRouter(
  initialLocation: Routes.welcome,
  initialExtra: {
    'title': 'Java Gem',
  },
  routes: [
    GoRoute(
        path: Routes.welcome,
        pageBuilder: (context, state) => MaterialPage(child: WelcomePage())),
    GoRoute(
        path: Routes.login,
        pageBuilder: (context, state) => MaterialPage(child: LoginScreen())),
    GoRoute(
        path: Routes.home,
        pageBuilder: (context, state) => MaterialPage(child: HomeScreen()))
  ],
);
