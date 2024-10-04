import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:grocery_app/src/infrastructure/infrastructure.dart';
import 'package:grocery_app/src/presentation/auth/auth.dart';
import 'package:grocery_app/src/presentation/cart/cart_page.dart';
import 'package:grocery_app/src/presentation/home/home_page.dart';
import 'package:grocery_app/src/presentation/payment/payment_page.dart';
import 'package:grocery_app/src/presentation/product_detail/producet_details_page.dart';

import '../presentation/payment/add_payment_method_page.dart';
import '../presentation/saved/saved_page.dart';

class AppRoute {
  static const String startPage = "/landing_page";
  static const String loginOption = "/landing_page/login_option";
  static const String signUp = "/landing_page/sign_up";
  static const String signIn = "/landing_page/sign_in";
  static const String verification = "/landing_page/verification";
  static const String resetPassword = "/landing_page/reset_password";
  static const String otp = "/landing_page/reset_password/otp";
  static const String newPassword = "/landing_page/reset_password/new_password";

  static const String home = "/";
  static const String saved = "/saved";
  static const String productDetails = "/product_details";
  static const String cart = "/cart";

  static const String payment = "/payment";
  static const String createPayment = "/payment/create";

  static final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();

  ///
  static GoRouter routerConfig() {
    return GoRouter(
      initialLocation: home,
      routes: [
        ShellRoute(
          navigatorKey: _rootNavigatorKey,
          builder: (context, state, child) {
            return child;
          },
          routes: [
            GoRoute(
              parentNavigatorKey: _rootNavigatorKey,
              path: home,
              builder: (context, state) {
                return const HomePage();
              },
              routes: [
                GoRoute(
                  parentNavigatorKey: _rootNavigatorKey,
                  path: "saved",
                  builder: (context, state) => const SavedPage(),
                ),
                GoRoute(
                  path: "product_details",
                  builder: (context, state) {
                    final item = state.extra as ItemModel? ?? ItemModel.ui;
                    return ProductDetailsPage(
                      model: item,
                    );
                  },
                ),
                GoRoute(
                  parentNavigatorKey: _rootNavigatorKey,
                  path: "cart",
                  builder: (context, state) {
                    return const CartPage();
                  },
                )
              ],
            ),
          ],
        ),
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
              path: 'reset_password',
              builder: (context, state) => const ResetPasswordPage(),
              routes: [
                GoRoute(
                  path: 'otp',
                  builder: (context, state) => const OtpPage(),
                ),
                GoRoute(
                  path: 'new_password',
                  builder: (context, state) => const NewPasswordPage(),
                ),
              ],
            ),
          ],
        ),
        GoRoute(
          path: payment,
          builder: (context, state) => PaymentPage(total: state.extra as double? ?? 120),
          routes: [
            GoRoute(
              path: "create",
              builder: (context, state) => AddPaymentMethodPage(
                type: state.extra as PaymentMethodEnum? ?? PaymentMethodEnum.masterCard,
              ),
            )
          ],
        )
      ],
    );
  }
}
