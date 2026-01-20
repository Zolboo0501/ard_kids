import 'package:ard_light/core/routes/auth_routes.dart';
import 'package:ard_light/features/auth/presentation/screen/onboard.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GoRouter routes = GoRouter(
  initialLocation: '/auth/reset-password',
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return Onboard();
      },
    ),
    AuthRoutes.routes,
  ],
);
