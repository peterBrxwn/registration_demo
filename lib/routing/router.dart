// Package imports:
import 'package:auto_route/auto_route.dart';
import 'package:registration_demo/feature/dashboard/view/view.dart';

// Project imports:
import 'package:registration_demo/feature/register/view/view.dart';

// Project imports:

@MaterialAutoRouter(
  preferRelativeImports: false,
  replaceInRouteName: 'Page,Route',
  routes: [
    AutoRoute(
      page: DashboardPage,
      path: DashboardPage.routeName,
    ),
    AutoRoute(
      initial: true,
      page: RegisterPage,
      path: RegisterPage.routeName,
    ),
    RedirectRoute(path: "*", redirectTo: ""),
  ],
)
class $AppRouter {}
