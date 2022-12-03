import 'package:flutter/material.dart';
import 'package:track_apps/view/home.dart';
import 'package:track_apps/view/login.dart';

import 'view/dashboard.dart';

class Router {
  static const home = "/";
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
    }
    return MaterialPageRoute(settings: settings,builder: (_) => widget);
  }
}
