
import 'package:flutter/material.dart';

import '../../features/home_screen/pages/home_screen.dart';
import '../../features/login/pages/login_screen.dart';
import '../../features/settings_screen/setting_screen.dart';

class AppRoute {
  static const loginScreen = '/loginScreen';
  static const homeScreen = '/homeScreen';
  static const settingScreen = '/settingScreen';

  static final AppRoute _instance = AppRoute._private();

  factory AppRoute() {
    return _instance;
  }

  AppRoute._private();

  static AppRoute get instance => _instance;

  Route<Object>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case loginScreen:
        return AppPageRoute(builder: (_) => const LoginScreen());
      case homeScreen:
        return AppPageRoute(builder: (_) => const HomeScreen());
      case settingScreen:
        return AppPageRoute(builder: (_) => const SettingsScreen());
      default:
        return null;
    }
  }
}

class AppPageRoute extends MaterialPageRoute<Object> {
  Duration? appTransitionDuration;

  RouteSettings? appSettings;

  AppPageRoute(
      {required super.builder, this.appSettings, this.appTransitionDuration});

  @override
  Duration get transitionDuration =>
      appTransitionDuration ?? super.transitionDuration;

  @override
  RouteSettings get settings => appSettings ?? super.settings;
}