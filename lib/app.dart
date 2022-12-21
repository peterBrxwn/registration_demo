// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:auto_route/auto_route.dart';

// Project imports:
import 'package:registration_demo/injection.dart';
import 'package:registration_demo/routing/observer.dart';
import 'package:registration_demo/routing/router.gr.dart';
import 'package:registration_demo/utils/app_theme.dart';

class RegistrationDemo extends StatelessWidget {
  RegistrationDemo({Key? key}) : super(key: key);
  final _appRouter = locator<AppRouter>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
        routeInformationParser: _appRouter.defaultRouteParser(),
        routerDelegate: AutoRouterDelegate(
          _appRouter,
          navigatorObservers: () => [AppRouteObserver()],
        ),
        theme: AppTheme.themeDataLight,
        themeMode: ThemeMode.light,
        debugShowCheckedModeBanner: false,
    );
  }
}
