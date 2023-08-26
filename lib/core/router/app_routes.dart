import 'package:abhedy_banking_project/features/data/model/accounts_model.dart';
import 'package:abhedy_banking_project/features/presentation/pages/accounts/subpages/transactions_page.dart';
import 'package:abhedy_banking_project/features/presentation/pages/contacts/contacts_page.dart';
import 'package:abhedy_banking_project/features/presentation/pages/login/login_page.dart';
import 'package:abhedy_banking_project/features/presentation/pages/main/home_page.dart';
import 'package:abhedy_banking_project/features/presentation/pages/splash/splash_page.dart';
import 'package:abhedy_banking_project/features/presentation/pages/statement/statement_page.dart';
import 'package:abhedy_banking_project/features/presentation/pages/statement/subpages/view_pdf_statement.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// The route configuration.
final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const SplashPage();
      },
      routes: <RouteBase>[
        GoRoute(
          path: MainPage.id,
          builder: (BuildContext context, GoRouterState state) {
            return const MainPage();
          },
        ),
        GoRoute(
          path: LoginPage.id,
          builder: (BuildContext context, GoRouterState state) {
            return const LoginPage();
          },
        ),
        GoRoute(
          path: TransactionsPage.id,
          builder: (BuildContext context, GoRouterState state) {
            return TransactionsPage(state.extra as Accounts);
          },
        ),
        GoRoute(
          path: StatementPage.id,
          builder: (BuildContext context, GoRouterState state) {
            return const StatementPage();
          },
        ),
        GoRoute(
          path: ContactsPage.id,
          builder: (BuildContext context, GoRouterState state) {
            return const ContactsPage();
          },
        ),
        GoRoute(
          path: ViewPDFStatement.id,
          builder: (BuildContext context, GoRouterState state) {
            return ViewPDFStatement();
          },
        ),
      ],
    ),
  ],
);