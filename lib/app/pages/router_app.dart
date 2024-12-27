import 'package:flutter/material.dart';
import 'package:inside_trainning/app/pages/login/login_view.dart';
import 'package:inside_trainning/app/pages/pages.dart';
import 'package:inside_trainning/app/pages/splash/splash_view.dart';

class RouterApp {
  final RouteObserver<PageRoute> routeObserver;

  RouterApp() : routeObserver = RouteObserver<PageRoute>();

  Route<dynamic> getRoute(RouteSettings settings) {
    // final Map args = settings.arguments as Map;

    switch (settings.name) {
      case Pages.splash:
        return _buildRoute(settings, const SplashView());

      default:
        return _buildRoute(settings, const LoginView());
    }
  }

  MaterialPageRoute<dynamic> _buildRoute(RouteSettings settings, Widget builder) {
    return MaterialPageRoute(settings: settings, builder: (BuildContext ctx) => builder);
  }
}
