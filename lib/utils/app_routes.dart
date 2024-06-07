import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:portofolio/pages/home_page.dart';

class AppRoutes {
  static const String homeRoute = '/';
  static const String contactRoute = '/contact';
  static const String aboutRoute = '/about';
  static const String portfolioRoute = '/portfolio';

  static GoRouter Function(Function(Locale)) routes =
      (Function(Locale) callback) {
    return GoRouter(
      routes: [
        GoRoute(
          path: homeRoute,
          builder: (context, state) => HomePage(setLocale: callback),
        ),
        GoRoute(
          path: contactRoute,
          builder: (context, state) => Text("Route: " + state.path.toString()),
        ),
        GoRoute(
          path: aboutRoute,
          builder: (context, state) => Text("Route: " + state.path.toString()),
        ),
        GoRoute(
          path: portfolioRoute,
          builder: (context, state) => Text("Route: " + state.path.toString()),
        ),
      ],
      errorBuilder: (context, state) => Text("Route Not found"),
    );
  };
}
