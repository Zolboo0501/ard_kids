import 'package:ard_light/features/auth/presentation/screen/create_pin.dart';
import 'package:ard_light/features/auth/presentation/screen/invitation_code.dart';
import 'package:ard_light/features/auth/presentation/screen/otp.dart';
import 'package:ard_light/features/auth/presentation/screen/register_children.dart';
import 'package:ard_light/features/auth/presentation/screen/register_children_step.dart';
import 'package:ard_light/features/auth/presentation/screen/setup_password.dart';
import 'package:ard_light/features/auth/presentation/screen/sign_in.dart';
import 'package:ard_light/features/auth/presentation/screen/dan_sign_up.dart';
import 'package:ard_light/features/auth/presentation/screen/sign_up.dart';
import 'package:ard_light/features/auth/presentation/screen/success_child_step.dart';
import 'package:ard_light/features/auth/presentation/screen/validate_child_step.dart';
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
      GoRoute(path: '/danSignUp', builder: (context, state) => DanSignUp()),
      GoRoute(
        path: '/register-children',
        builder: (context, state) => RegisterChildren(),
      ),
      GoRoute(
        path: '/register-child-step',
        builder: (context, state) => RegisterChildrenStep(),
      ),
      GoRoute(path: '/question', builder: (context, state) => Question()),
      GoRoute(
        path: '/validate-child',
        builder: (context, state) => ValidateChildStep(),
      ),
      GoRoute(
        path: '/success-child-step',
        builder: (context, state) => SuccessChildStep(),
      ),
      GoRoute(
        path: '/setup-password',
        builder: (context, state) => SetupPassword(),
      ),

      GoRoute(path: '/otp', builder: (context, state) => Otp()),
      GoRoute(
        path: '/invitation-code',
        builder: (context, state) => InvitationCode(),
      ),
      GoRoute(path: '/create-pin', builder: (context, state) => CreatePin()),
      // GoRoute(
      //   path: '/update-information',
      //   builder: (context, state) => UpdateInformation(),
      // ),
    ],
  );
}
