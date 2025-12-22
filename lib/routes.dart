import 'package:ard_light/features/auth/presentation/screen/onboard.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AuthRoutes {
  static GoRoute get routes => GoRoute(
    path: '/auth',
    builder: (context, state) => Container(),
    routes: [
      GoRoute(path: '/login', builder: (context, state) => Container()),
      GoRoute(path: '/register', builder: (context, state) => Container()),
    ],
  );
}

final GoRouter routes = GoRouter(
  initialLocation: '/',
  routes: <RouteBase>[
    // GoRoute(
    //   path: '/theme',
    //   builder: (BuildContext context, GoRouterState state) {
    //     return ThemeSelectorScreen();
    //   },
    // ),
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return Onboard();
      },
    ),
    AuthRoutes.routes,
  ],
);
