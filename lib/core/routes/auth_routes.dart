import 'package:ard_light/features/auth/presentation/screen/register_children.dart';
import 'package:ard_light/features/auth/presentation/screen/register_children_step.dart';
import 'package:ard_light/features/auth/presentation/screen/signIn.dart';
import 'package:ard_light/features/auth/presentation/screen/signUp.dart';
import 'package:go_router/go_router.dart';
import 'package:ard_light/features/auth/presentation/screen/onboard.dart';
import 'package:ard_light/features/auth/presentation/screen/question.dart';

class AuthRoutes {
  static GoRoute get routes => GoRoute(
    path: '/auth',
    builder: (context, state) => Onboard(),
    routes: [
      GoRoute(path: '/signIn', builder: (context, state) => SignIn()),
      GoRoute(path: '/signUp', builder: (context, state) => SignUp()),
      GoRoute(
        path: '/registerChildren',
        builder: (context, state) => RegisterChildren(),
      ),
      GoRoute(
        path: '/registerChildrenStep',
        builder: (context, state) => RegisterChildrenStep(),
      ),
      GoRoute(path: '/question', builder: (context, state) => Question()),
    ],
  );
}
