import 'package:go_router/go_router.dart';
import 'package:grocery_app/src/presentation/auth/auth.dart';

class AppRoute {
  static const String startPage = "/landing_page";
  static const String loginOption = "/landing_page/login_option";
  static const String signUp = "/landing_page/sign_up";
  static const String signIn = "/landing_page/sign_in";
  static const String verification = "/landing_page/verification";
  static const String resetPassword = "/landing_page/reset_password";

  ///
  static GoRouter routerConfig() {
    return GoRouter(
      initialLocation: signIn,
      routes: [
        GoRoute(
          path: startPage,
          builder: (context, state) {
            return const LandingPage();
          },
          routes: [
            GoRoute(
              path: 'login_option',
              builder: (context, state) => const LoginOptionSelectionPage(),
            ),
            GoRoute(
              path: 'sign_up',
              builder: (context, state) => const SignUpPage(),
            ),
            GoRoute(
              path: 'sign_in',
              builder: (context, state) => const SignInPage(),
            ),
            GoRoute(
              path: 'login_option',
              builder: (context, state) => const LoginOptionSelectionPage(),
            ),
            GoRoute(
              path: 'verification',
              builder: (context, state) => const VerificationPage(),
            ),
            GoRoute(
              path: 'reset_password',
              builder: (context, state) => const ResetPasswordPage(),
            ),
          ],
        ),
      ],
    );
  }
}
