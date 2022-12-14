import 'package:flutter/material.dart';
import 'package:track_apps/view/home.dart';
import 'package:track_apps/view/launcher.dart';
import 'package:track_apps/view/login.dart';

import 'view/dashboard.dart';

class Router {
  static const launcher = "/";
  static const home = "/home";
  static const login = "/login";
  static const dashboard = "/dashboard";

  static Route<dynamic> generateRouter(RouteSettings settings) {
    Widget widget = Dashboard();
    switch (settings.name) {
      case login:
        widget = Login();
        break;
      case dashboard:
        widget = Dashboard();
        break;
      case home:
        widget = Home();
        break;
      case launcher:
        widget = Launcher();
        break;
    }
    return MaterialPageRoute(settings: settings,builder: (_) => widget);
  }
}
